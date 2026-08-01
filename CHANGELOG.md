# Changelog

Release binaries and complete notes are available on the [Releases page](https://github.com/tageecc/clipture/releases).

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
