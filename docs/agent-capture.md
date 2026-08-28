# Clipture Agent Capture / AI Agent 截图接口

Clipture 1.1.47 and later exposes a structured macOS screenshot interface from
the signed application executable. It uses the same capture and annotation
implementation as the Clipture UI.

Clipture 1.1.47 起在签名应用可执行文件中提供结构化 macOS 截图接口，并与
Clipture 图形界面共用截图和标注实现。

## Install the Codex skill / 安装 Codex skill

Install Clipture in `/Applications`, open it once, grant Screen Recording, then
run:

先把 Clipture 安装到“应用程序”，打开一次并授予屏幕录制权限，然后运行：

```bash
/Applications/Clipture.app/Contents/MacOS/Clipture agent install-skill
```

This creates `~/.agents/skills/clipture-capture` as a link to the skill bundled
inside the installed app. Codex discovers it across local projects as
`$clipture-capture`. The public repository also stores the release-matched skill
at `.agents/skills/clipture-capture`.

该命令会创建 `~/.agents/skills/clipture-capture`，并链接到已安装应用内的 skill。
Codex 随后可在所有本地项目中以 `$clipture-capture` 发现并调用它。公开仓库的
`.agents/skills/clipture-capture` 也保存与当前版本一致的 skill。

## Capture / 截图

Requests are JSON. The output must be an absolute `.png` path and its parent
directory must already exist. Coordinates use a top-left origin. Use `pixels`
for image pixels or `normalized` for values from `0` to `1`.

请求使用 JSON。输出必须是绝对 `.png` 路径，且父目录必须已经存在。坐标原点在
左上角；`pixels` 表示图片像素，`normalized` 表示 `0` 到 `1` 的归一化坐标。

```bash
printf '%s' '{"source":{"type":"display"},"output":"/tmp/clipture-agent.png","coordinateSpace":"normalized","annotations":[{"type":"rectangle","rect":{"x":0.05,"y":0.08,"width":0.34,"height":0.24}},{"type":"highlight","rect":{"x":0.12,"y":0.42,"width":0.50,"height":0.10},"opacity":0.30},{"type":"arrow","start":{"x":0.80,"y":0.75},"end":{"x":0.42,"y":0.32}},{"type":"step","point":{"x":0.40,"y":0.30},"number":1},{"type":"text","text":"Target","rect":{"x":0.44,"y":0.25,"width":0.18,"height":0.08}}]}' | /Applications/Clipture.app/Contents/MacOS/Clipture agent capture --request -
```

Use `source.type` values `display`, `window`, or `interactive`. Before a window
capture, list current window IDs:

`source.type` 可使用 `display`、`window` 或 `interactive`。指定窗口截图前先读取
当前窗口 ID：

```bash
/Applications/Clipture.app/Contents/MacOS/Clipture agent windows
```

Then pass the selected ID as `source.windowID`. Window IDs are ephemeral and
must not be guessed. `interactive` opens Clipture's selection UI.

然后把选中的 ID 写入 `source.windowID`。窗口 ID 会变化，不应猜测或复用旧值。
`interactive` 会打开 Clipture 的交互选区界面。

Inspect the authoritative JSON Schema at any time:

可随时读取正式 JSON Schema：

```bash
/Applications/Clipture.app/Contents/MacOS/Clipture agent schema
```

Success returns JSON containing `ok`, `path`, `width`, `height`, and
`annotationsApplied`. Failure returns a nonzero exit code and a JSON error on
stderr. Clipture does not switch paths, windows, coordinate systems, or capture
modes automatically.

成功时返回包含 `ok`、`path`、`width`、`height` 和 `annotationsApplied` 的 JSON。
失败时返回非零退出码，并在 stderr 输出 JSON 错误；Clipture 不会自动改用其他
路径、窗口、坐标系或截图模式。
