#!/bin/zsh
set -eu

readonly manifest_url="https://clipture.talkape.net/updates/latest.json"
readonly applications_dir="/Applications"
readonly app_path="${applications_dir}/Clipture.app"
readonly executable_path="${app_path}/Contents/MacOS/Clipture"
readonly expected_bundle_id="net.talkape.clipture.direct"
readonly expected_team_id="MQPMGFMDAK"

json_escape() {
  printf '%s' "$1" | sed 's/\\/\\\\/g; s/"/\\"/g; s/	/\\t/g'
}

fail() {
  local message
  message="$(json_escape "$2")"
  printf '{"ok":false,"error":{"code":"%s","message":"%s"}}\n' "$1" "$message" >&2
  exit 1
}

plist_value() {
  /usr/bin/plutil -extract "$2" raw -o - "$1" 2>/dev/null
}

verify_app() {
  local candidate="$1"
  [[ -d "$candidate" ]] || return 1
  [[ "$(plist_value "$candidate/Contents/Info.plist" CFBundleIdentifier)" == "$expected_bundle_id" ]] || return 1
  /usr/bin/codesign --verify --deep --strict --verbose=2 "$candidate" >/dev/null 2>&1 || return 1
  local team_id
  team_id="$(/usr/bin/codesign -d --verbose=4 "$candidate" 2>&1 | /usr/bin/sed -n 's/^TeamIdentifier=//p')"
  [[ "$team_id" == "$expected_team_id" ]] || return 1
  /usr/sbin/spctl --assess --type execute --verbose=2 "$candidate" >/dev/null 2>&1 || return 1
}

emit_existing() {
  local version build
  version="$(plist_value "$app_path/Contents/Info.plist" CFBundleShortVersionString)"
  build="$(plist_value "$app_path/Contents/Info.plist" CFBundleVersion)"
  printf '{"ok":true,"operation":"check","installed":true,"path":"%s","version":"%s","build":"%s"}\n' \
    "$app_path" "$version" "$build"
}

case "${1:-}" in
  --check)
    verify_app "$app_path" || fail "clipture_not_ready" "A valid notarized Clipture installation was not found at /Applications/Clipture.app."
    emit_existing
    exit 0
    ;;
  --yes)
    ;;
  *)
    fail "approval_required" "Installing or updating Clipture changes /Applications. Ask the user for approval, then run this script with --yes."
    ;;
esac

readonly work_dir="$(/usr/bin/mktemp -d -t clipture-agent-install.XXXXXX)"
readonly manifest_path="$work_dir/latest.json"
readonly dmg_path="$work_dir/Clipture.dmg"
readonly mount_path="$work_dir/mount"
readonly backup_path="$work_dir/Clipture.backup.app"
mounted=false

cleanup() {
  if [[ "$mounted" == true ]]; then
    /usr/bin/hdiutil detach "$mount_path" -quiet >/dev/null 2>&1 || true
  fi
  /bin/rm -rf "$work_dir"
}
trap cleanup EXIT INT TERM

/usr/bin/curl --fail --location --silent --show-error --proto '=https' --tlsv1.2 \
  --output "$manifest_path" "$manifest_url" \
  || fail "manifest_download_failed" "Could not download the official Clipture release manifest."
version="$(plist_value "$manifest_path" version)" \
  || fail "invalid_manifest" "The release manifest is missing 'version'."
build="$(plist_value "$manifest_path" build)" \
  || fail "invalid_manifest" "The release manifest is missing 'build'."
download_url="$(plist_value "$manifest_path" url)" \
  || fail "invalid_manifest" "The release manifest is missing 'url'."
expected_sha="$(plist_value "$manifest_path" sha256)" \
  || fail "invalid_manifest" "The release manifest is missing 'sha256'."

[[ "$version" == <->.<->.<-> ]] || fail "invalid_manifest" "The release manifest contains an invalid version."
[[ "$build" == <-> ]] || fail "invalid_manifest" "The release manifest contains an invalid build."
[[ "$expected_sha" =~ '^[0-9a-f]{64}$' ]] \
  || fail "invalid_manifest" "The release manifest contains an invalid SHA-256."
[[ "$download_url" == "https://clipture.talkape.net/downloads/Clipture-${version}.dmg" ]] \
  || fail "invalid_manifest" "The release manifest contains an untrusted download URL."

if verify_app "$app_path"; then
  installed_version="$(plist_value "$app_path/Contents/Info.plist" CFBundleShortVersionString)"
  installed_build="$(plist_value "$app_path/Contents/Info.plist" CFBundleVersion)"
  if [[ "$installed_build" == <-> ]] \
    && (( installed_build >= build )); then
    "$executable_path" agent install-skill >/dev/null \
      || fail "skill_install_failed" "Clipture is installed, but its Codex skill could not be installed."
    printf '{"ok":true,"operation":"install","installed":false,"path":"%s","version":"%s","build":"%s","skillInstalled":true}\n' \
      "$app_path" "$installed_version" "$installed_build"
    exit 0
  fi
fi

[[ -w "$applications_dir" ]] \
  || fail "applications_not_writable" "/Applications is not writable by the current user. Install Clipture manually from https://clipture.talkape.net."

/usr/bin/curl --fail --location --silent --show-error --proto '=https' --tlsv1.2 \
  --output "$dmg_path" "$download_url" \
  || fail "download_failed" "Could not download Clipture ${version} from the official website."
actual_sha="$(/usr/bin/shasum -a 256 "$dmg_path" | /usr/bin/awk '{print $1}')"
[[ "$actual_sha" == "$expected_sha" ]] \
  || fail "checksum_mismatch" "The downloaded Clipture DMG does not match the official SHA-256."
/usr/bin/hdiutil verify "$dmg_path" >/dev/null \
  || fail "invalid_dmg" "The downloaded Clipture DMG failed integrity verification."
/usr/sbin/spctl --assess --type open --context context:primary-signature --verbose=2 "$dmg_path" >/dev/null 2>&1 \
  || fail "notarization_failed" "The downloaded Clipture DMG failed Apple's Gatekeeper and notarization assessment."

/bin/mkdir "$mount_path"
/usr/bin/hdiutil attach "$dmg_path" -mountpoint "$mount_path" -nobrowse -readonly -quiet \
  || fail "mount_failed" "The verified Clipture DMG could not be mounted."
mounted=true
readonly candidate_path="$mount_path/Clipture.app"
verify_app "$candidate_path" \
  || fail "signature_verification_failed" "The downloaded app failed bundle ID, Developer ID, or Gatekeeper verification."
[[ "$(plist_value "$candidate_path/Contents/Info.plist" CFBundleShortVersionString)" == "$version" ]] \
  || fail "version_mismatch" "The downloaded app version does not match the official manifest."
[[ "$(plist_value "$candidate_path/Contents/Info.plist" CFBundleVersion)" == "$build" ]] \
  || fail "version_mismatch" "The downloaded app build does not match the official manifest."

/usr/bin/pkill -x Clipture >/dev/null 2>&1 || true
if [[ -e "$app_path" ]]; then
  /bin/mv "$app_path" "$backup_path" \
    || fail "install_failed" "The existing Clipture app could not be moved for replacement."
fi
if ! /usr/bin/ditto "$candidate_path" "$app_path"; then
  /bin/rm -rf "$app_path"
  [[ ! -e "$backup_path" ]] || /bin/mv "$backup_path" "$app_path"
  fail "install_failed" "Clipture could not be copied to /Applications."
fi
if ! verify_app "$app_path"; then
  /bin/rm -rf "$app_path"
  [[ ! -e "$backup_path" ]] || /bin/mv "$backup_path" "$app_path"
  fail "install_verification_failed" "The installed app failed verification; the previous installation was restored."
fi
"$executable_path" agent install-skill >/dev/null \
  || fail "skill_install_failed" "Clipture was installed, but its Codex skill could not be installed."

printf '{"ok":true,"operation":"install","installed":true,"path":"%s","version":"%s","build":"%s","sha256":"%s","skillInstalled":true}\n' \
  "$app_path" "$version" "$build" "$actual_sha"
