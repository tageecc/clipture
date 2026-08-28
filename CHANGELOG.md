# Changelog

Release binaries and complete notes are available on the [Releases page](https://github.com/tageecc/clipture/releases).

## 1.1.50 — 2026-08-28

- Upgraded the capture-only skill to the complete `$clipture` app skill for capture, annotation, clipboard, and interactive app workflows.
- Added structured current-clipboard reads, writes, and explicitly confirmed clearing for text, images, and file lists.
- Added searchable, paginated local clipboard-history commands for retrieval, restore, statistics, single-item deletion, and explicitly confirmed clearing.
- `agent doctor` now reports separate readiness for capture, annotation, clipboard, clipboard history, and automatic scrolling.

### 中文

- 将截图专用 Skill 升级为完整的 `$clipture` 应用级 Skill，覆盖截图、标注、剪贴板和交互式应用能力。
- 新增结构化当前剪贴板接口，支持文字、图片和文件列表的读取、写入与明确确认后的清空。
- 新增可搜索、可分页的本地剪贴板历史接口，支持读取、恢复、统计、单项删除和明确确认后的全部清空。
- `agent doctor` 现在分别报告截图、标注、剪贴板、剪贴板历史和自动滚动能力状态。

## 1.1.49 — 2026-08-28

- Expanded the `clipture-capture` Codex skill with an approval-gated official installer that verifies SHA-256, Developer ID, Gatekeeper, and notarization.
- Added `agent doctor`, `agent displays`, and standalone `agent annotate`, so agents can inspect a raw capture before applying precise rectangles, highlights, arrows, numbered markers, and text through Clipture's existing renderer.
- Improved the installer's compatibility with the macOS system JSON tools; schemas, paths, dimensions, results, and errors remain stable JSON without silent fallback.

### 中文

- 完善 `clipture-capture` Codex skill：可在用户确认后自动下载官网版本，并严格校验 SHA-256、Developer ID、Gatekeeper 与公证状态。
- 新增 `agent doctor`、`agent displays` 与独立 `agent annotate`，支持 Agent 先读取原始截图，再用同一套 Clipture 标注实现精确添加矩形、高亮、箭头、编号和文字。
- 改进自动安装器对 macOS 系统 JSON 工具的兼容性；截图与标注 schema、路径、尺寸、结果及错误继续使用稳定 JSON 接口，不进行静默兜底。

## 1.1.47 — 2026-08-28

- Added a structured screenshot interface for Codex and other local AI agents, covering full displays, specific windows, and interactive regions.
- One request can combine rectangles, highlights, arrows, numbered markers, and text using pixel or normalized coordinates.
- The direct-download app now bundles an installable `clipture-capture` Codex skill, with explicit JSON results and errors.

### 中文

- 新增面向 Codex 和其他本地 AI Agent 的结构化截图接口，支持全屏、指定窗口和交互选区。
- 一次请求可组合矩形、高亮、箭头、编号和文字标注，并支持像素或归一化坐标。
- 官网版内置可安装的 `clipture-capture` Codex skill；结果和错误均返回明确 JSON。

## 1.1.46 — 2026-08-27

- Menu bar mode now uses a native popover anchored to the menu bar icon instead of a repositioned regular window.
- The popover now places Clipboard History on the left and a compact preview on the right for faster browsing and selection.
- The centered Spotlight-style panel remains the default, and both presentation modes can still be selected in Settings.

### 中文

- 菜单栏下拉模式现在使用真正锚定菜单栏图标的原生浮层，不再只是移动普通窗口。
- 下拉浮层调整为左侧剪贴板历史列表、右侧紧凑预览，更适合快速浏览和连续选择。
- 默认的 Spotlight 风格居中面板保持不变，可继续在设置中切换两种显示方式。

## 1.1.45 — 2026-08-27

- Clipboard History now opens as a centered floating panel by default and can be switched to a menu bar popover in Settings. In popover mode, left-clicking the menu bar icon opens history while right-clicking keeps the full menu.
- Fixed the preview remaining pinned to the hovered item after keyboard navigation moved the selection.
- Added on-device recognition and quick actions for URLs, JSON, colors, Markdown, and code, including opening links, copying QR codes, formatting JSON, and copying color values.
- Added `Option + Return` continuous paste so several items can be pasted while keeping the panel open.

### 中文

- 剪贴板历史默认以居中悬浮面板打开，也可在设置中切换为菜单栏下拉模式；下拉模式支持左键菜单栏图标快速打开，右键仍显示完整菜单。
- 修复鼠标悬停条目后使用键盘上下键时，预览仍停留在鼠标条目的问题。
- 新增 URL、JSON、颜色、Markdown 与代码的本地识别和快捷操作，包括打开链接、复制二维码、格式化 JSON 与复制颜色值。
- 新增 `Option + Return` 连续粘贴，可在面板保持打开时依次粘贴多条内容。

## Windows 0.1.3 — 2026-08-26

- Published Clipture through Microsoft Store for both x64 and ARM64, with Store-managed signing, installation, and updates.
- Added centered and notification-area Clipboard History modes, consistent pointer and keyboard previews, and continuous paste.
- Added on-device recognition and quick actions for URLs, JSON, colors, Markdown, and code.

### 中文

- 通过 Microsoft Store 正式发布 x64 与 ARM64 版本，由商店完成签名验证、安装和自动更新。
- 剪贴板历史新增居中与托盘下拉两种面板模式，统一鼠标与键盘预览，并支持连续粘贴。
- 新增 URL、JSON、颜色、Markdown 与代码的本地识别和快捷操作。

## 1.1.44 — 2026-08-14

- Fixed Finder Quick Look previews that could still be selected together with the Finder window when the preview surface was smaller than expected.
- Smart window capture now treats substantial Quick Look previews as standalone windows while keeping small menus and popovers attached to their source window.

### 中文

- 修正 Finder 按空格打开快速查看后，部分较小的预览窗口仍会被并入 Finder 主窗口选择的问题。
- 智能窗口截图现在会把足够大的快速查看预览作为独立窗口处理；普通小菜单和弹出层仍会随原窗口一起处理。

## 1.1.43 — 2026-08-13

- Clipboard History now opens from a clean state every time, resetting search, filters, selection, and scroll position to the newest item.
- Clipboard History preserves every representation supplied by the source app and restores rich text, HTML, images, and file metadata without reformatting.
- Replaying an item no longer adds internal marker types or converts the original clipboard payload, while duplicate history entries remain suppressed.
- Added resilient fallback for legacy entries and damaged format sidecars so existing history remains usable.

### 中文

- 每次打开剪贴板历史时，搜索、筛选、选中项和滚动位置都会回到初始状态，并从最新一条开始。
- 剪贴板历史会保存原内容的全部格式表示；复制或粘贴历史条目时，富文本、HTML、图片和文件信息会按原样写回。
- 从历史记录复制内容时不再额外添加内部标记或转换格式，同时继续避免生成重复记录。
- 增加格式侧车数据的完整性回退，旧记录与异常记录仍可正常复制。

## 1.1.42 — 2026-08-13

- Hovering a clipboard history item now previews it immediately without changing the current selection or pasting it.
- Fixed missing previews for PNG and JPEG files copied by WeChat and similar apps.
- Cached lightweight previews for temporary image files so history thumbnails remain available after the source app removes its temporary file.
- Improved image decoding and preview size limits to reduce memory and interface pressure from large images.

### 中文

- 鼠标悬停剪贴板历史条目时，右侧会立即预览对应内容，不会改变当前选择或直接粘贴。
- 修复微信等应用复制的 PNG/JPEG 文件在右侧预览区不显示的问题。
- 为临时图片文件保存轻量预览，源应用清理临时文件后仍可查看历史缩略图。
- 优化图片解码与预览尺寸控制，减少大图带来的内存和界面压力。

## 1.1.41 — 2026-08-13

- Fixed text being repeatedly selected and replaced when searching clipboard history with a Chinese input method.
- Clipboard entries now show a clear hover highlight.
- Reduced flicker by updating only changed list rows and reusing the current preview while results refresh.

### 中文

- 修复剪贴板历史搜索框使用中文输入法时，文字被反复选中并覆盖的问题。
- 剪贴板条目现在会在鼠标悬停时清晰高亮。
- 优化历史列表与预览区的刷新方式，减少查询和内容更新时的闪烁。

## 1.1.40 — 2026-08-13

- Reusing text, images, or files from clipboard history no longer creates a duplicate history entry.
- Regular copy operations and newly captured screenshots continue to appear in clipboard history normally.

### 中文

- 从剪贴板历史重新选择文本、图片或文件后，不再生成一条重复记录。
- 普通复制和新生成的截图仍会照常进入剪贴板历史。

## 1.1.39 — 2026-08-12

- Quick Look previews opened from Finder can now be selected and captured independently.
- Menus, dropdowns, and small transient panels remain attached to their owning window, preserving the existing smart-window workflow.

### 中文

- Finder 按空格打开“快速查看”后，预览窗口现在可以单独选中截图。
- 菜单、下拉框和小型浮层仍会和所属窗口一起显示，不改变原有智能选窗体验。

## 1.1.37 — 2026-08-12

- Fixes Esc cancellation immediately after starting capture from a shortcut, before a region is selected.
- Pinned image windows can now close with Esc whenever they have keyboard focus.
- Adds regression coverage for capture cancellation and pinned-image Esc closing behavior.

### 中文

- 修复通过快捷键开始截图后、尚未选择区域时 Esc 不能立即取消的问题。
- 贴图窗口现在获得键盘焦点时可直接按 Esc 关闭。
- 补充覆盖截图取消和贴图 Esc 关闭行为的回归检查。

## Windows 0.1.2 — 2026-08-03

- Replaced the primary portable ZIP download with conventional x64 and ARM64 setup EXEs.
- Added per-user installation, Start menu shortcuts, Windows Installed apps registration, silent install and uninstall, and a standard uninstaller.
- Added deterministic installer lifecycle tests, version metadata, SHA-256 checksums, and a fail-closed Authenticode signing pipeline for trusted production certificates.
- Retained portable ZIPs as secondary artifacts for managed deployment and troubleshooting.

### 中文

- Windows 默认下载从便携 ZIP 调整为常规 x64 与 ARM64 EXE 安装程序。
- 增加当前用户安装、开始菜单入口、Windows“已安装的应用”注册、静默安装与卸载，以及标准卸载程序。
- 增加安装生命周期测试、版本元数据、SHA-256 校验和，以及面向受信任生产证书的严格 Authenticode 签名流程。
- 便携 ZIP 继续作为集中部署和排查问题时使用的补充产物。

## Windows 0.1.1 — 2026-08-03

- Added production x64 and ARM64 downloads for Windows 10 and 11.
- Matched the Mac information architecture, visual language, capture toolbar, annotation tools, OCR, pins, clipboard history, settings, and global-shortcut workflows.
- Added deterministic release archives and SHA-256 checksums.

### 中文

- 发布适用于 Windows 10 和 11 的 x64 与 ARM64 正式下载包。
- 对齐 Mac 版的信息架构、视觉语言、截图工具条、标注、文字识别、贴图、剪贴板历史、设置与全局快捷键操作。
- 增加可复现的发布压缩包和 SHA-256 校验文件。


## 1.1.36 — 2026-08-01

- Simplifies scrolling capture by removing the viewport highlight and confirmation step.
- Scrolling capture always preserves the user's selection and starts directly when it is contained by one scrollable area.
- Removes redundant viewport-selection state and window-management code for a leaner capture path.

### 中文

- 简化滚动截图流程，移除滚动区域高亮与二次确认步骤。
- 滚动截图始终保留用户选区；选区位于单一可滚动区域内时直接开始采集。
- 精简滚动区域检测、控制条状态与窗口管理代码，降低交互复杂度和运行开销。

## 1.1.35 — 2026-08-01

- Scrolling capture now preserves the original selection and highlights the scrollable area detected under the pointer with a translucent overlay.
- Scrolling starts only after you confirm the highlighted area by clicking it, using the toolbar checkmark, or pressing Enter.
- When no scrollable content is detected, Clipture keeps waiting for a valid area instead of changing the selection or starting an unreliable capture.

### 中文

- 进入滚动截图后，Clipture 会保留原选区，并用半透明色块标出鼠标所在位置检测到的可滚动区域。
- 点击高亮区域、工具栏对号或按 Enter 确认后才会开始滚动，避免全屏或复杂窗口中误选错误的内容区域。
- 没有检测到可滚动内容时会继续等待选择，不再直接改变选区或启动一次容易失败的滚动采集。

## 1.1.34 — 2026-08-01

- Hiding the blue selection border now also hides the four visual resize corners for a consistent borderless appearance.
- Invisible corner hit targets remain active, so the selection can still be resized in borderless mode.

### 中文

- 关闭“显示蓝色选区边框”后，同时隐藏四角缩放标记，保持完整、干净的无边框效果。
- 四角透明拖拽区域仍然有效，无边框模式下依然可以调整选区大小。

## 1.1.33 — 2026-08-01

- Scrolling capture now detects the real scrollable viewport below the pointer before continuous sampling and stitching begin. Full-screen or oversized selections no longer mix fixed headers, footers, or background into the long image.
- Browser, Electron, and custom-rendered interfaces use a short motion calibration to resolve the viewport. The outline, preview, and controls then follow the detected area automatically.
- Improved target resolution and recovery so oversized selections no longer pause after one or two scroll movements when global overlap registration fails.

### 中文

- 滚动截图改为先识别鼠标所在位置的真实滚动区域，再开始持续采样和拼接。全屏或跨出内容区域的选区不会再把固定页头、页脚和背景混入长图。
- 浏览器、Electron 和自绘界面会通过短距离滚动校准实际视口；识别完成后，选区边框、预览和控制条会自动收敛到该区域。
- 优化滚动目标定位与恢复流程，解决超大选区滚动一两次后因重叠匹配失败而暂停的问题。

## 1.1.32 — 2026-08-01

- Scrolling capture now detects the actual scrollable content below the pointer. Oversized or full-screen selections are narrowed to the page or scroll view so static surroundings no longer disrupt stitching.
- Scroll targeting now follows the application and Accessibility scroll container below the pointer, reducing early pauses after only a few scroll pulses.
- The selection outline, size readout, preview, and controls now follow the detected scrolling viewport.

### 中文

- 滚动截图现在会根据鼠标所在位置识别实际可滚动内容。即使选中了全屏，也会自动收敛到网页或滚动视图，避免静止区域干扰拼接。
- 滚动目标改为按鼠标所在应用和辅助功能滚动容器定位，减少全屏或跨窗口选区只滚动一两次后暂停的问题。
- 选区边框、尺寸提示、预览和控制条会同步到识别后的滚动区域。

## 1.1.31 — 2026-08-01

- Added WebP screenshot export under Settings > Capture > Export.
- WebP export preserves transparency and runs natively on Apple Silicon and Intel Macs.
- Clipture now recommends PNG when an extra-long screenshot exceeds WebP's dimension limit, avoiding a failed export.

### 中文

- 截图导出新增 WebP 格式，可在“设置 > 截图 > 导出”中选择。
- WebP 导出会保留透明区域，并在 Apple 芯片与 Intel Mac 上原生运行。
- 超长截图若超过 WebP 的尺寸范围，Clipture 会提示改用 PNG，避免导出失败。

## 1.1.30 — 2026-07-31

- Double-click a selected region to finish the capture; Return also confirms a finalized selection.
- Refined Escape behavior: leave annotation text editing or Live Text selection first, then press Escape again to cancel the capture.
- Added standalone F1–F20 shortcuts with correct display in menus and Settings.
- Turning off clipboard history now also disables its menu command, global shortcut, and any open history window.
- Kept the initial capture overlay non-activating to reduce interference with transient menus and popovers in the source app.

### 中文

- 按两次选区可直接完成截图；选区完成后按 Return 也可确认。
- 改进 Esc 行为：编辑标注文字或选择识别文字时先退出当前状态，再按一次取消截图。
- 支持将 F1–F20 功能键单独设为快捷键，并改善功能键在菜单和设置中的显示。
- 关闭剪贴板历史后，会同步停用对应菜单、快捷键和已打开的历史面板。
- 保持截图浮层为非激活窗口，减少触发截图时对原应用临时菜单和下拉框的影响。

## 1.1.29 — 2026-07-30

- Improved editing, saving, previewing, and sharing performance for large and scrolling captures by moving expensive image work off the interface thread.
- Made clipboard history search, pagination, and image previews more responsive at large history sizes while bounding background memory during rapid copying.
- Bounded annotation undo history and scrolling-capture edit caches to prevent memory growth during long sessions.
- Added automatic cleanup for temporary exports and further improved immediate paste reliability after capture.

### 中文

- 优化大型截图和长图的编辑、保存、预览与分享性能，耗时的图片处理不会再阻塞界面。
- 提升大量剪贴板历史下的搜索、翻页和图片预览速度，并限制连续复制时的后台内存占用。
- 限制标注撤销记录和长图编辑缓存，避免长时间使用后内存持续增长。
- 自动清理过期的临时导出文件，并继续改善截图后立即粘贴的稳定性。
