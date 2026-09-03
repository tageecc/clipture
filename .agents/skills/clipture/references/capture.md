# Capture and annotation interface

The runtime schemas are authoritative:

```bash
/Applications/Clipture.app/Contents/MacOS/Clipture agent schema capture
/Applications/Clipture.app/Contents/MacOS/Clipture agent schema record
/Applications/Clipture.app/Contents/MacOS/Clipture agent schema annotate
```

## Discovery and health

```bash
/Applications/Clipture.app/Contents/MacOS/Clipture agent version
/Applications/Clipture.app/Contents/MacOS/Clipture agent doctor
/Applications/Clipture.app/Contents/MacOS/Clipture agent displays
/Applications/Clipture.app/Contents/MacOS/Clipture agent windows
```

`displays` returns display IDs, main-display status, AppKit frames, pixel dimensions, and scale factors. `windows` returns current window IDs, owner names, process IDs, titles, and AppKit bounds; it requires Screen Recording permission.

## Capture request

```json
{
  "source": {
    "type": "display | window | interactive",
    "displayID": 1,
    "windowID": 1234,
    "includeShadow": true
  },
  "output": "/absolute/path/result.png",
  "coordinateSpace": "pixels | normalized",
  "annotations": []
}
```

- Omit `displayID` to capture the main display.
- A window request requires a fresh `windowID`; `includeShadow` defaults to `true`.
- An interactive request forbids `displayID` and `windowID`.
- `coordinateSpace` defaults to `pixels`.

## Timed screen recording

`record` captures a display or an explicit region for a required duration, then
returns exactly one JSON result after encoding finishes. This makes it safe to
start the command in an asynchronous shell session, perform the UI actions to
demonstrate, and wait for the command to complete.

MP4 display recording:

```bash
printf '%s' '{"source":{"type":"display"},"format":"mp4","durationSeconds":5,"output":"/tmp/demo.mp4","showsCursor":true,"resolution":"fullHD","frameRate":30}' | /Applications/Clipture.app/Contents/MacOS/Clipture agent record --request -
```

GIF region recording:

```bash
printf '%s' '{"source":{"type":"region","displayID":1,"rect":{"x":100,"y":120,"width":1280,"height":720}},"format":"gif","durationSeconds":4,"output":"/tmp/demo.gif","gifMaximumSize":960,"gifFrameRate":10}' | /Applications/Clipture.app/Contents/MacOS/Clipture agent record --request -
```

- Omit `displayID` to use the main display.
- Region coordinates are pixels relative to the selected display's top-left corner.
- `durationSeconds` must be between 0.25 and 3600.
- The output path must be absolute, use the matching `.mp4` or `.gif` extension,
  have an existing parent directory, and must not already exist.
- MP4 accepts `resolution`, `frameRate`, and `bitRateMbps`. GIF accepts
  `gifMaximumSize` and `gifFrameRate`. Do not mix the two groups.
- `showsCursor` defaults to `true`.
- Window isolation is not exposed as a region approximation.

Success includes the exact output path, dimensions, requested duration, format,
and byte count. Stable recording errors are `screen_recording_permission_denied`,
`recording_failed`, `output_failed`, and `invalid_request`.

## Annotate an existing capture

Use this after inspecting a raw capture and choosing exact coordinates. It requires at least one annotation and never overwrites the input.

```bash
printf '%s' '{"input":"/tmp/raw.png","output":"/tmp/annotated.png","coordinateSpace":"normalized","annotations":[{"type":"highlight","rect":{"x":0.10,"y":0.15,"width":0.40,"height":0.12},"opacity":0.35},{"type":"step","point":{"x":0.52,"y":0.21},"number":1}]}' | /Applications/Clipture.app/Contents/MacOS/Clipture agent annotate --request -
```

## Annotations

Rectangle:

```json
{"type":"rectangle","rect":{"x":40,"y":30,"width":300,"height":180},"color":"#F53342","lineWidth":4}
```

Translucent highlight:

```json
{"type":"highlight","rect":{"x":0.10,"y":0.15,"width":0.40,"height":0.12},"color":"#FFD60A","opacity":0.35}
```

Arrow:

```json
{"type":"arrow","start":{"x":720,"y":520},"end":{"x":430,"y":260},"color":"#F53342","lineWidth":5}
```

Numbered marker:

```json
{"type":"step","point":{"x":420,"y":250},"number":1,"color":"#F53342"}
```

If `number` is omitted, Clipture assigns increasing numbers in request order.

Text:

```json
{"type":"text","text":"Open settings","rect":{"x":450,"y":190,"width":260,"height":70},"color":"#F53342","fontSize":28}
```

Colors accept `#RRGGBB` or `#RRGGBBAA`. All coordinates must be finite and fully inside the image. A normalized rectangle's `x + width` and `y + height` must not exceed `1`.

## Results and errors

Capture and annotate return one JSON object on stdout:

```json
{"annotationsApplied":5,"height":1800,"ok":true,"operation":"annotate","path":"/tmp/annotated.png","width":2880}
```

Errors return one JSON object on stderr and a nonzero exit code:

```json
{"error":{"code":"invalid_request","message":"'output' must be an absolute path."},"ok":false}
```

Capture-specific stable codes are `screen_recording_permission_denied`, `capture_failed`, `output_failed`, and `capture_cancelled`; shared request errors use `usage_error` or `invalid_request`. There is no silent fallback.
