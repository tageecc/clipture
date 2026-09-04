# Changelog

Release binaries and complete notes are available on the [Releases page](https://github.com/tageecc/clipture/releases).

## 1.2.9 — 2026-09-04

- Improved text annotation dismissal: the first click outside the editor now saves entered text or cancels an empty draft without creating another text box at that location. Click again to add a new text annotation.

### 中文

- 改进文字标注的取消交互：编辑时首次点击其他位置会保存已输入内容，空草稿则直接取消，并且不会在该点击位置再次创建输入框；再次点击才会新建文字标注。

## 1.2.8 — 2026-09-04

- Fixed recorded GIFs pasting as static images in some apps. The clipboard now provides both the original animated GIF and a temporary GIF file reference, which is automatically removed after the clipboard changes.

### 中文

- 修复录制 GIF 复制后在部分应用中只能粘贴为静态图片的问题。剪贴板现在同时提供原始动态 GIF 和临时 GIF 文件引用，并在剪贴板内容变化后自动清理临时文件。

## 1.2.7 — 2026-09-04

- Rebuilt the post-recording HUD with native Liquid Glass on macOS 26, shared button components from Settings, improved action spacing, and consistent light and dark appearances.
- Fixed the HUD becoming empty after copying a GIF. The confirmation keeps the original size, clearly shows the result, and verifies clipboard data before the temporary file is cleaned up.

### 中文

- 重做录屏完成悬浮窗：在 macOS 26 使用系统原生液态玻璃，并与设置页复用同一套按钮组件，改善操作间距与浅色、深色外观的一致性。
- 修复复制 GIF 后悬浮窗内容消失的问题；复制完成态保持原有尺寸并明确显示结果，同时校验剪贴板数据后再清理临时文件。

## 1.2.6 — 2026-09-03

- Refined the post-recording HUD with clearer status and action groups, improved button icons and spacing, and a stable layout after copy or save succeeds.
- Added the structured `agent record` interface so AI agents can directly record a display or pixel region to MP4/GIF with an explicit duration, cursor, resolution, frame-rate, and bitrate controls, strict JSON Schema, stable error codes, and safe no-overwrite output behavior.

### 中文

- 优化录屏完成后的悬浮操作栏，重新整理状态与操作区域、按钮图标和间距；复制或保存成功后不再突然缩小或挤成一团。
- 新增结构化 `agent record` 接口，AI Agent 可直接录制指定显示器或像素区域并输出 MP4/GIF，支持明确时长、光标、分辨率、帧率与码率设置，以及严格 JSON Schema、稳定错误码和不覆盖已有文件的安全行为。

## 1.2.5 — 2026-09-03

- Animated GIF recordings no longer open the save panel automatically after encoding. You can now copy the animation directly, save it to a file, or discard it without leaving a file in your user folders.
- Improved automatic scrolling capture compatibility on macOS 26.5. Clipture now derives the scrolling viewport and end of content from captured frames instead of relying on another app's Accessibility hierarchy, making browsers, Electron apps, and custom scrolling views more reliable.

### 中文

- 动画 GIF 编码完成后不再自动弹出保存窗口；现在可以直接复制动图、另存文件或放弃结果，复制不会在用户目录留下文件。
- 优化 macOS 26.5 的自动滚动长截图兼容性。滚动区域与底部位置改由截图画面判断，不再依赖目标应用的辅助功能界面结构，对浏览器、Electron 应用和自绘滚动区域更稳定。

## 1.2.4 — 2026-08-31

- Fixed the recording HUD moving only partway and appearing stuck behind the capture region after stopping an MP4 recording.
- File finalization now runs alongside the interface transition. The save panel waits until the HUD reaches the lower-left corner and the recording frame has fully faded, giving MP4 and GIF recordings the same smooth finish.

### 中文

- 修复 MP4 录制停止后，控制条移动一小段便卡在录制区域后的问题。
- 录制文件封装与界面收尾现在并行执行；保存面板会在控制条完整移动至左下角、录制边框完整淡出后再出现，MP4 与 GIF 的结束体验保持一致。

## 1.2.3 — 2026-08-31

- Refined the recording HUD into a tighter single-row layout with the format and timer side by side, narrower sizing, and more balanced control spacing.
- Clipboard History can now preview animated GIF recordings directly. Only the active preview animates, avoiding unnecessary decoding while browsing the list.
- MP4 recordings now open in a native macOS player inside Clipboard History, with playback initiated by the user and standard system controls.
- If the original GIF is moved or deleted, Clipboard History falls back to its cached static poster.

### 中文

- 录制控制条改为更紧凑的单行布局，格式与计时器并排显示，并收敛整体宽度、按钮尺寸和间距。
- 剪贴板历史现在可直接动态预览 GIF；只对当前预览项播放，避免列表滚动时产生额外解码开销。
- MP4 录制文件可在剪贴板历史中使用 macOS 原生播放器预览，默认不自动播放，并提供系统播放控制。
- GIF 原文件被移动或删除后，历史仍会回退显示已缓存的静态封面。

## 1.2.2 — 2026-08-31

- Added comprehensive recording settings: MP4 resolution from Original, 4K, 2K, 1080p, or 720p; 24/30/60 fps; automatic or custom bitrate; configurable GIF size and frame rate; and pointer visibility.
- Redesigned the recording controls as a compact floating HUD with a single pause/resume button and a dedicated stop button. Pausing now freezes both the timer and the exported timeline.
- Refined the recording-region frame with a lighter, clearer treatment and an orange paused state. The frame and controls remain excluded from MP4 and GIF output.
- After stopping, the HUD now moves smoothly to the bottom-left and remains visible throughout processing. GIF export shows real encoding progress, while MP4 provides continuous feedback until finalization completes.
- Saved MP4 and GIF files are copied automatically to the system clipboard and enter Clipture Clipboard History when file-list history is enabled, eliminating the extra Finder copy step.

### 中文

- 新增完整的录制设置：MP4 可配置原始、4K、2K、1080p 或 720p 分辨率，24/30/60 帧率与自动或自定义码率；GIF 可配置最大尺寸和帧率，并可选择是否显示鼠标指针。
- 录制控制条重新设计为紧凑悬浮控件，支持同一按钮暂停/继续以及独立停止；暂停时计时和最终文件时间轴都会同步冻结。
- 录制区域边框更轻、更清晰，暂停时会切换为橙色；控制条和边框仍不会进入最终 MP4 或 GIF。
- 停止录制后，控制条会平滑移动到屏幕左下角并持续显示处理进度；GIF 显示真实编码百分比，MP4 在文件封装完成前保持明确反馈。
- 保存后的 MP4 或 GIF 会自动复制到系统剪贴板，并在启用文件列表历史时直接进入 Clipture 剪贴板历史，无需再次前往 Finder 复制。

## 1.2.1 — 2026-08-31

- Screenshots and recordings now share the same selection entry and shortcut. After selecting a region, choose MP4 or GIF directly from the compact Record menu to start recording.
- A visible red region border remains on screen throughout recording, so the captured area is always clear. The border and timer controls are excluded from the final video or GIF.
- Cross-display selections now align with the primary recording display, keeping the visible border consistent with the actual output area.

### 中文

- 截图与录屏现在共用同一个选区入口和快捷键；选区后点击“录制”，可直接从紧凑下拉菜单选择 MP4 或 GIF 并开始录制。
- 录制期间持续显示醒目的红色区域边框，让录制范围始终清晰可见；边框与计时控制条不会进入最终视频或 GIF。
- 跨显示器选区会自动匹配主要录制屏幕，确保可见边框与实际输出范围一致。

## 1.2.0 — 2026-08-31

- Added region screen recording with native MP4 and animated GIF export. A compact timer HUD stays available while Clipture's own windows are excluded from the recording.
- Added editable Capture History. Clipture keeps the original image and annotation layers for the latest 100 edited captures, so each one can be reopened, copied as a composed image, or deleted.
- Screenshot, scrolling capture, and recording continue to use the guided permission setup flow, preventing macOS prompts from interrupting selection or an active recording.

### 中文

- 新增区域屏幕录制，可直接导出 MP4 视频或动画 GIF；录制期间提供紧凑计时控制条，Clipture 自身窗口不会进入画面。
- 新增可编辑截图历史：自动保留最近 100 张编辑截图的原图与标注图层，可随时再次编辑、复制合成结果或删除。
- 截图、滚动截图和录屏继续使用统一的权限准备流程，系统授权不会在选区或录制开始后突然打断操作。

## 1.1.53 — 2026-08-30

- Added a unified capture permission setup window that explains Screen Recording and Accessibility access, shows live status, and provides explicit authorization controls before capture begins.
- macOS permission prompts now appear only after you choose Allow. Regular capture checks Screen Recording first, while scrolling capture checks Accessibility before its controls start, avoiding mid-workflow interruptions.
- Permission controls in Settings now use the same guided flow and refresh their status live.

### 中文

- 新增统一的截图权限准备窗口，在开始操作前集中展示屏幕录制与辅助功能权限的用途、状态和授权入口。
- 系统授权提示现在只会在主动点击“授权”后出现；普通截图会先确认屏幕录制权限，滚动截图会先确认辅助功能权限，不再进入流程后才被弹窗打断。
- 设置中的权限入口已接入同一授权流程，并会实时刷新授权状态。

## 1.1.52 — 2026-08-30

- The checkmark in the editor preview now closes the window after successfully copying the screenshot, matching the completion behavior of regular captures.
- If copying fails, the editor stays open and shows an explicit error so unexported work is not lost.

### 中文

- 编辑预览中的对勾现在会在成功复制截图后关闭窗口，与普通截图的完成交互保持一致。
- 如果复制失败，编辑预览会保留并显示明确错误，避免丢失尚未导出的内容。

## 1.1.51 — 2026-08-28

- The menu bar icon now always opens the complete menu, so Smart Capture, Clipboard History, tools, and settings remain available in every history presentation mode.
- Clipboard History stays as the second menu item; choosing the menu-bar popover mode now changes only where the history window appears.
- Added runtime coverage for the real `NSStatusItem` behavior to prevent future interaction regressions.

### 中文

- 顶部菜单栏图标现在始终打开完整菜单，智能截图、剪贴板历史、工具和设置不会因历史展示方式而消失。
- 剪贴板历史固定为菜单第二项；选择“菜单栏下拉”后，仅历史窗口改为贴近菜单栏显示。
- 增加真实 `NSStatusItem` 行为测试，防止菜单栏交互在后续更新中回退。

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
