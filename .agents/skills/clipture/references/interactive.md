# Interactive workflows

Use Clipture's app UI for workflows that require human visual judgment or ongoing interaction instead of pretending they are unattended CLI operations.

- Smart Capture: run an interactive `agent capture` request. The user can select a region or isolated window; cancellation is an error.
- Scrolling capture: start Smart Capture, select the scrolling area, then choose the scrolling action. Automatic scrolling requires Accessibility permission and exposes pause, resume, finish, and cancel controls.
- Pinning: capture a region, then choose Pin in the capture toolbar. The pinned image remains a user-controlled floating window with zoom, opacity, resize, clipboard, and export actions.
- Live Text: capture a region, choose Recognize Text, wait for local analysis, then select and copy text in the overlay.
- Color picker: open Clipture's menu-bar Color Picker; the user selects the pixel on screen.
- Clipboard History UI: open it from Clipture's menu bar for visual browsing and direct paste. Prefer structured `agent clipboard history` commands when the task does not need visual browsing.
- Settings: use the app's Settings window for language, save format and location, annotation defaults, shortcuts, retention, launch-at-login, and permission status.

Do not claim an interactive workflow completed until its observable result is available. If the requested result needs a stable file or JSON response, prefer the structured capture or clipboard commands where available.
