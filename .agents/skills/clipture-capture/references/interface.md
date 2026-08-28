# Clipture agent capture interface

## Commands

```bash
/Applications/Clipture.app/Contents/MacOS/Clipture agent version
/Applications/Clipture.app/Contents/MacOS/Clipture agent schema
/Applications/Clipture.app/Contents/MacOS/Clipture agent windows
/Applications/Clipture.app/Contents/MacOS/Clipture agent capture --request /absolute/request.json
/Applications/Clipture.app/Contents/MacOS/Clipture agent capture --request -
```

`agent schema` prints the machine-readable JSON Schema. `agent windows` prints current capturable window IDs, owner names, titles, process IDs, and AppKit bounds.

## Request

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

- `displayID` is optional for `display`; omission selects the main display.
- `windowID` is required for `window` and must come from a fresh `agent windows` result.
- `includeShadow` defaults to `true` for window capture.
- `displayID` and `windowID` are forbidden for `interactive`.
- `coordinateSpace` defaults to `pixels`.
- Coordinates always have a top-left origin.

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

Colors accept `#RRGGBB` or `#RRGGBBAA`. Rectangle widths, point coordinates, and text rectangles must remain fully inside the captured image. Normalized coordinates must remain within `0...1`; a normalized rectangle's `x + width` and `y + height` must not exceed `1`.

## Combined example

```json
{
  "source": {"type":"display"},
  "output": "/tmp/clipture-combined.png",
  "coordinateSpace": "normalized",
  "annotations": [
    {"type":"rectangle","rect":{"x":0.05,"y":0.08,"width":0.34,"height":0.24}},
    {"type":"highlight","rect":{"x":0.12,"y":0.42,"width":0.50,"height":0.10},"opacity":0.30},
    {"type":"arrow","start":{"x":0.80,"y":0.75},"end":{"x":0.42,"y":0.32}},
    {"type":"step","point":{"x":0.40,"y":0.30},"number":1},
    {"type":"text","text":"Target","rect":{"x":0.44,"y":0.25,"width":0.18,"height":0.08}}
  ]
}
```

Success is one JSON object on stdout:

```json
{"annotationsApplied":5,"height":1800,"ok":true,"operation":"capture","path":"/tmp/clipture-combined.png","width":2880}
```

Errors are one JSON object on stderr and a nonzero exit code:

```json
{"error":{"code":"invalid_request","message":"'output' must be an absolute path."},"ok":false}
```

Stable error codes include `usage_error`, `invalid_request`, `screen_recording_permission_denied`, `capture_failed`, `output_failed`, `capture_cancelled`, and `skill_install_failed`.
