# Changelog

Release binaries and complete notes are available on the [Releases page](https://github.com/tageecc/clipture/releases).

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
