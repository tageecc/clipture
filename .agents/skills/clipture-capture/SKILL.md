---
name: clipture-capture
description: Capture and annotate macOS screenshots with Clipture when a task needs a full display, a specific window, or an interactively selected region saved to an exact absolute PNG path. Supports rectangles, translucent highlights, arrows, numbered markers, text, and combined pixel or normalized coordinates. Do not use for image generation or editing an existing image unrelated to screen capture.
---

# Clipture Capture

Use Clipture's signed local executable. Do not substitute macOS `screencapture`, another screenshot app, or a separate image-processing script when this skill is active.

Executable:

```text
/Applications/Clipture.app/Contents/MacOS/Clipture
```

Run `agent capture` with one JSON request. Pass `--request -` to read JSON from stdin or pass an absolute JSON file path. The `output` value must be an absolute `.png` path whose parent directory already exists.

```bash
printf '%s' '{"source":{"type":"display"},"output":"/tmp/clipture.png","coordinateSpace":"normalized","annotations":[{"type":"rectangle","rect":{"x":0.08,"y":0.10,"width":0.35,"height":0.25}},{"type":"arrow","start":{"x":0.70,"y":0.70},"end":{"x":0.44,"y":0.34}},{"type":"text","text":"Review this","rect":{"x":0.45,"y":0.20,"width":0.25,"height":0.10}}]}' | /Applications/Clipture.app/Contents/MacOS/Clipture agent capture --request -
```

For a specific window, first run `agent windows`, select the intended current window ID from the structured result, then use `source.type = "window"` with `windowID`. Window IDs are ephemeral; never guess or reuse one from an earlier session.

For an interactive region, use `source.type = "interactive"`; wait for the user to drag or select a window and confirm in Clipture. Cancellation is an error, not a successful empty result.

Coordinates use a top-left origin. `pixels` means final image pixels. `normalized` means values from `0` to `1` relative to the captured image and is preferable when dimensions are not known in advance. Put all requested annotations in one `annotations` array so Clipture renders them in order in a single call.

Treat a zero exit status and JSON `ok: true` as success. Return the reported `path`, `width`, `height`, and `annotationsApplied` to the caller. On a nonzero exit, surface the JSON error code and message exactly; do not silently retry with a different capture mode, path, window, coordinate system, or tool.

Read [references/interface.md](references/interface.md) when constructing anything beyond the basic example, choosing a window, or interpreting errors.
