---
name: clipture-capture
description: Capture and annotate macOS screenshots with Clipture when a task needs a full display, specific window, interactive region, or a captured PNG marked with rectangles, highlights, arrows, numbered markers, or text. Saves to exact absolute paths and returns structured results. Do not use for image generation or general-purpose editing of unrelated images.
---

# Clipture Capture

Use Clipture's signed executable at `/Applications/Clipture.app/Contents/MacOS/Clipture`. Respect an explicitly chosen alternative capture tool; otherwise do not silently substitute `screencapture`, another app, or separate image-processing code.

Requires macOS 13 or later. Screen Recording permission is required for capture; internet access is required only to install Clipture.

## Prepare

Run `agent doctor` before the first capture in a task. It reports the app version, permission state, bundled and installed skill paths, and readiness as JSON.

If Clipture is absent, explain that this skill can download the official notarized release and ask for approval immediately before installation. After approval, run the `scripts/install-clipture.sh --yes` adjacent to this file. The installer verifies the official manifest, SHA-256, bundle ID, Developer ID team, Gatekeeper assessment, and notarization; never bypass a failed check. Without approval, stop and provide `https://clipture.talkape.net` for manual installation.

## Choose a workflow

- Use `agent capture` to capture a display, a current window, or an interactive selection. It may apply all annotations in the same request.
- When coordinates depend on visible content, first capture without annotations, inspect the returned PNG, then use `agent annotate` with a different output path. This preserves the exact captured pixels and reuses Clipture's annotation renderer.
- Run `agent displays` before selecting a non-main display. Run `agent windows` immediately before selecting a window; IDs are ephemeral and must not be guessed or reused.
- For interactive capture, wait for the user to select a region or window in Clipture. Cancellation is an error.

Use one JSON request passed through `--request -` or an absolute request-file path. Every input and output path must be absolute, PNG outputs need an existing parent directory, and annotate input/output paths must differ. Coordinates use a top-left origin. Prefer `normalized` (`0...1`) before dimensions are known; use `pixels` for exact final-image placement.

```bash
printf '%s' '{"source":{"type":"display"},"output":"/tmp/clipture.png","coordinateSpace":"normalized","annotations":[{"type":"rectangle","rect":{"x":0.08,"y":0.10,"width":0.35,"height":0.25}},{"type":"arrow","start":{"x":0.70,"y":0.70},"end":{"x":0.44,"y":0.34}},{"type":"text","text":"Review this","rect":{"x":0.45,"y":0.20,"width":0.25,"height":0.10}}]}' | /Applications/Clipture.app/Contents/MacOS/Clipture agent capture --request -
```

Treat only exit status zero plus JSON `ok: true` as success. Return `path`, `width`, `height`, and `annotationsApplied` to the caller. On failure, surface the JSON error code and message exactly; do not change the path, source, coordinates, or tool and retry silently.

Read [references/interface.md](references/interface.md) for request fields, annotation options, schemas, two-phase examples, discovery commands, and stable error codes.
