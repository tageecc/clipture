# Changelog

Release binaries and complete notes are available on the [Releases page](https://github.com/tageecc/clipture/releases).

## 1.1.29 — 2026-07-30

- Improved editing, saving, previewing, and sharing performance for large and scrolling captures by moving expensive image work off the interface thread.
- Made clipboard history search, pagination, and image previews more responsive at large history sizes while bounding background memory during rapid copying.
- Bounded annotation undo history and scrolling-capture edit caches to prevent memory growth during long sessions.
- Added automatic cleanup for temporary exports and further improved immediate paste reliability after capture.

### 中文

- 优化大型截图和长图的编辑、保存、预览与分享性能，耗时的图片处理不再阻塞界面。
- 提升大量剪贴板历史下的搜索、翻页和图片预览速度，并限制连续复制时的后台内存占用。
- 限制标注撤销记录和长图编辑缓存，避免长时间使用后内存持续增长。
- 自动清理过期的临时导出文件，并继续改善截图后立即粘贴的稳定性。
