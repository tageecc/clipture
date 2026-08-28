---
name: clipture
description: Use the Clipture macOS app for structured screen capture and annotation, current clipboard reads or writes, searchable clipboard history, or interactive Clipture workflows such as scrolling capture, pinning, Live Text, and color picking. Returns explicit JSON results and errors. Do not use for unrelated image generation or remote clipboard services.
---

# Clipture

Use the signed executable at `/Applications/Clipture.app/Contents/MacOS/Clipture`. Prefer its `agent` commands over recreating Clipture behavior with shell screenshot commands, pasteboard utilities, or separate image-processing code.

Requires macOS 13 or later. Clipboard commands need no macOS privacy grant. Capture and color picking require Screen Recording; automatic scrolling and paste automation require Accessibility.

## Prepare

Run `agent doctor` before the first Clipture operation in a task. If Clipture is absent, explain that this skill can download the official notarized release and ask for approval immediately before installation. After approval, run the adjacent `scripts/install-clipture.sh --yes`. Never bypass a failed signature, notarization, identity, manifest, or checksum check.

## Route the task

- For display, window, or interactive capture and reusable annotations, read [references/capture.md](references/capture.md).
- For the current clipboard or searchable local clipboard history, read [references/clipboard.md](references/clipboard.md). Only inspect clipboard content relevant to the user's request. Deleting an item or clearing the current clipboard/history requires explicit user intent for that exact mutation.
- For scrolling capture, pinned images, Live Text selection, color picking, settings, or other UI-led workflows, read [references/interactive.md](references/interactive.md). Keep the user informed when Clipture requires an on-screen selection or confirmation.

Use JSON requests through `--request -` or an absolute request-file path. Treat only exit status zero plus JSON `ok: true` as success. Surface error codes and messages exactly; do not silently change paths, source IDs, content types, coordinates, or tools.

```bash
printf '%s' '{"type":"text","text":"Copied by Clipture"}' | /Applications/Clipture.app/Contents/MacOS/Clipture agent clipboard write --request -
```

