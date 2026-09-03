# Clipture Agent Interface / AI Agent 接口

Clipture exposes its macOS capture, timed recording, annotation, current clipboard, and local
clipboard-history capabilities through the signed app executable. The CLI uses
the same implementation as the app UI and returns strict JSON results or errors.

Clipture 通过签名应用可执行文件向 AI Agent 提供截图、定时录屏、标注、当前剪贴板和本地
剪贴板历史能力。CLI 与图形界面复用同一套实现，并严格返回 JSON 结果或错误。

## Install and discover the skill / 安装与发现 Skill

```bash
/Applications/Clipture.app/Contents/MacOS/Clipture agent install-skill
```

This links the bundled skill to `~/.agents/skills/clipture`, where Codex can
discover it as `$clipture` from any local project. The public repository stores
the release-matched source at `.agents/skills/clipture`.

该命令把应用内置 Skill 链接到 `~/.agents/skills/clipture`，Codex 可在任意本地
项目中以 `$clipture` 发现它。公开仓库中的对应路径为 `.agents/skills/clipture`。

If the skill is installed separately, its verified installer can download the
official notarized release only after explicit approval:

如果先单独安装了 Skill，可在用户明确同意后运行可信安装器下载官网公证版本：

```bash
$HOME/.agents/skills/clipture/scripts/install-clipture.sh --yes
```

Without `--yes`, it returns `approval_required` and changes nothing. The script
verifies release metadata, SHA-256, bundle ID, Developer ID team, Gatekeeper,
and notarization before modifying `/Applications`.

未传 `--yes` 时仅返回 `approval_required`，不会修改系统。安装前会校验发布清单、
SHA-256、Bundle ID、Developer ID 团队、Gatekeeper 与 Apple 公证。

## Health and schemas / 预检与 Schema

```bash
/Applications/Clipture.app/Contents/MacOS/Clipture agent doctor
/Applications/Clipture.app/Contents/MacOS/Clipture agent version
/Applications/Clipture.app/Contents/MacOS/Clipture agent schema capture
/Applications/Clipture.app/Contents/MacOS/Clipture agent schema record
/Applications/Clipture.app/Contents/MacOS/Clipture agent schema clipboard-write
```

Use `agent displays` and `agent windows` to discover current capture targets.
Window IDs are ephemeral and require Screen Recording permission.

使用 `agent displays` 和 `agent windows` 获取当前截图目标。窗口 ID 临时有效，且
读取窗口需要屏幕录制权限。

## Capture and annotation / 截图与标注

Capture a display, current window ID, or interactive selection to an absolute
PNG path. A single request may combine rectangle, highlight, arrow, numbered
marker, and text annotations in pixel or normalized coordinates:

可把显示器、当前窗口或交互选区保存到指定绝对 PNG 路径，并在一次请求中组合
矩形、高亮、箭头、编号圆点和文字；坐标支持像素或归一化值：

```bash
printf '%s' '{"source":{"type":"display"},"output":"/tmp/clipture.png","coordinateSpace":"normalized","annotations":[{"type":"rectangle","rect":{"x":0.05,"y":0.08,"width":0.34,"height":0.24}},{"type":"text","text":"Target","rect":{"x":0.44,"y":0.25,"width":0.18,"height":0.08}}]}' | /Applications/Clipture.app/Contents/MacOS/Clipture agent capture --request -
```

For content-aware placement, capture first and annotate the exact PNG to a
different output path with `agent annotate`. Inspect the runtime `capture` and
`annotate` schemas for all fields.

如需根据画面内容放置标注，先截图并读取图片，再用 `agent annotate` 输出到不同
路径。完整字段以运行时 `capture` 与 `annotate` schema 为准。

## Timed recording / 定时录屏

Record a display or an explicit pixel region for a required duration. The
command stays alive until capture and encoding finish, so an Agent can start it
asynchronously, perform UI actions, then wait for one final JSON result:

录制指定显示器或像素区域，并要求明确时长。命令会持续运行到录制和编码结束，
Agent 可异步启动它、执行界面操作，再等待唯一的最终 JSON 结果：

```bash
printf '%s' '{"source":{"type":"display"},"format":"mp4","durationSeconds":5,"output":"/tmp/demo.mp4","resolution":"fullHD","frameRate":30}' | /Applications/Clipture.app/Contents/MacOS/Clipture agent record --request -
printf '%s' '{"source":{"type":"region","rect":{"x":100,"y":120,"width":1280,"height":720}},"format":"gif","durationSeconds":4,"output":"/tmp/demo.gif","gifMaximumSize":960,"gifFrameRate":10}' | /Applications/Clipture.app/Contents/MacOS/Clipture agent record --request -
```

Region coordinates use pixels from the selected display's top-left corner.
Outputs must be absolute `.mp4` or `.gif` paths and are never overwritten.
Read `agent schema record` for authoritative fields and limits.

区域坐标从所选显示器左上角起算，单位为像素。输出必须是绝对 `.mp4` 或 `.gif`
路径，且不会覆盖已有文件。正式字段和边界以 `agent schema record` 为准。

## Current clipboard / 当前剪贴板

Read text and file lists inline. An image is written to the requested absolute
PNG path:

文字和文件列表直接随 JSON 返回；图片写入请求指定的绝对 PNG 路径：

```bash
printf '%s' '{"output":"/tmp/clipboard.png"}' | /Applications/Clipture.app/Contents/MacOS/Clipture agent clipboard read --request -
```

Write text, one image, or a file list:

写入文字、单张图片或文件列表：

```bash
printf '%s' '{"type":"text","text":"Hello from Clipture"}' | /Applications/Clipture.app/Contents/MacOS/Clipture agent clipboard write --request -
printf '%s' '{"type":"image","input":"/absolute/image.png"}' | /Applications/Clipture.app/Contents/MacOS/Clipture agent clipboard write --request -
printf '%s' '{"type":"files","files":["/absolute/a.txt","/absolute/b.pdf"]}' | /Applications/Clipture.app/Contents/MacOS/Clipture agent clipboard write --request -
```

Clearing requires `{"confirm":true}` and should only follow an explicit user
request. Inspect `clipboard-read`, `clipboard-write`, and `clipboard-clear`
schemas for authoritative fields.

清空操作必须传 `{"confirm":true}`，且仅应在用户明确要求时执行。正式字段请读取
`clipboard-read`、`clipboard-write` 与 `clipboard-clear` schema。

## Clipboard history / 剪贴板历史

Search by text, kind, or source application with cursor pagination:

可按文字、类型或来源应用搜索，并用游标分页：

```bash
printf '%s' '{"query":"invoice","kind":"files","limit":50}' | /Applications/Clipture.app/Contents/MacOS/Clipture agent clipboard history list --request -
/Applications/Clipture.app/Contents/MacOS/Clipture agent clipboard history stats
```

Use a returned item UUID to retrieve its payload or restore it to the current
clipboard. Image retrieval requires an absolute PNG output path.

使用返回的 UUID 读取内容或恢复到当前剪贴板；读取图片时必须提供绝对 PNG 路径。

```bash
printf '%s' '{"id":"ITEM-UUID","output":"/tmp/history.png"}' | /Applications/Clipture.app/Contents/MacOS/Clipture agent clipboard history get --request -
printf '%s' '{"id":"ITEM-UUID"}' | /Applications/Clipture.app/Contents/MacOS/Clipture agent clipboard history copy --request -
```

`history delete` removes one exact ID. `history clear` requires
`{"confirm":true}`. Both are destructive and must reflect explicit user intent.

`history delete` 删除指定 ID；`history clear` 必须传 `{"confirm":true}`。两者均为
破坏性操作，必须对应用户的明确意图。

## Interactive app workflows / 交互式应用能力

Scrolling capture, pinned images, Live Text selection, color picking, direct
paste, and settings remain user-visible app workflows. The `$clipture` skill
routes Agents to these UI flows and requires them to wait for observable user
completion instead of reporting unattended success.

滚动截图、贴图、Live Text、取色、直接粘贴与设置仍是可见的应用交互流程。
`$clipture` Skill 会引导 Agent 使用这些界面，并要求等待用户完成后再报告结果。

All commands use nonzero exit status plus a JSON error on stderr for failure.
There is no silent fallback to another path, content type, capture source, or
tool.

所有失败均返回非零退出码，并在 stderr 输出 JSON 错误；不会静默更换路径、内容
类型、截图来源或其他工具。
