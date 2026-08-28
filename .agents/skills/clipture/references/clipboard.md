# Clipboard interface

Clipture supports the current macOS clipboard and its private, on-device searchable history. Clipboard history stays under the user's Clipture Application Support directory.

The runtime schemas are authoritative:

```bash
/Applications/Clipture.app/Contents/MacOS/Clipture agent schema clipboard-read
/Applications/Clipture.app/Contents/MacOS/Clipture agent schema clipboard-write
/Applications/Clipture.app/Contents/MacOS/Clipture agent schema clipboard-history-list
/Applications/Clipture.app/Contents/MacOS/Clipture agent schema clipboard-history-item
/Applications/Clipture.app/Contents/MacOS/Clipture agent schema clipboard-clear
```

## Current clipboard

Read text or file lists inline. Provide an absolute PNG output path in case the clipboard contains an image:

```bash
printf '%s' '{"output":"/tmp/clipboard.png"}' | /Applications/Clipture.app/Contents/MacOS/Clipture agent clipboard read --request -
```

Write exactly one content type:

```bash
printf '%s' '{"type":"text","text":"Hello"}' | /Applications/Clipture.app/Contents/MacOS/Clipture agent clipboard write --request -
printf '%s' '{"type":"image","input":"/absolute/input.png"}' | /Applications/Clipture.app/Contents/MacOS/Clipture agent clipboard write --request -
printf '%s' '{"type":"files","files":["/absolute/a.txt","/absolute/b.pdf"]}' | /Applications/Clipture.app/Contents/MacOS/Clipture agent clipboard write --request -
```

Clear only after the user explicitly requests clearing the current clipboard:

```bash
printf '%s' '{"confirm":true}' | /Applications/Clipture.app/Contents/MacOS/Clipture agent clipboard clear --request -
```

## Clipboard history

Search and page through history. `kind` is `text`, `image`, or `files`; `limit` is 1 through 1000. Pass `nextCursor` unchanged in the next request.

```bash
printf '%s' '{"query":"invoice","kind":"files","limit":50}' | /Applications/Clipture.app/Contents/MacOS/Clipture agent clipboard history list --request -
/Applications/Clipture.app/Contents/MacOS/Clipture agent clipboard history stats
```

Use an item ID returned by `list`. `get` returns text or files inline and requires `output` for an image. `copy` restores the original pasteboard representations when available.

```bash
printf '%s' '{"id":"ITEM-UUID","output":"/tmp/history-image.png"}' | /Applications/Clipture.app/Contents/MacOS/Clipture agent clipboard history get --request -
printf '%s' '{"id":"ITEM-UUID"}' | /Applications/Clipture.app/Contents/MacOS/Clipture agent clipboard history copy --request -
```

`delete` and `clear` are destructive. Run them only for the exact item or full-history deletion the user requested:

```bash
printf '%s' '{"id":"ITEM-UUID"}' | /Applications/Clipture.app/Contents/MacOS/Clipture agent clipboard history delete --request -
printf '%s' '{"confirm":true}' | /Applications/Clipture.app/Contents/MacOS/Clipture agent clipboard history clear --request -
```

Successful results identify the operation and content type and return applicable text, file paths, PNG path and dimensions, item counts, byte counts, or pagination cursor. Empty, unsupported, unreadable, unwritable, and missing-history states are explicit nonzero errors.

