# Installation and permissions / 安装与权限

## Requirements

- macOS 13 or later
- Apple Silicon or Intel Mac

The direct Clipture build is a Universal 2 application. Apple Silicon and Intel Macs both run a native executable slice; Intel users do not need Rosetta.

## Install the direct version

1. Download `Clipture-<version>.dmg` from the official website or GitHub Releases.
2. Open the DMG and drag Clipture to **Applications**.
3. Start Clipture from Applications.

The DMG is signed with TalkApe's Developer ID and notarized by Apple. SHA-256 checksums are attached to each GitHub Release.

## Permissions

- **Screen Recording**: required to capture the screen and application windows.
- **Accessibility**: required only for automatic scrolling and for pasting a clipboard-history item directly into the previous application.

Clipture checks the existing macOS permission state before requesting access. Updating a properly signed build with the same bundle identity normally preserves an existing grant.

---

## 中文

### 系统要求

- macOS 13 或更高版本
- Apple 芯片或 Intel Mac

官网版 Clipture 是 Universal 2 应用。Apple 芯片和 Intel Mac 都会运行对应的原生程序，不需要 Rosetta。

### 安装官网版

1. 从官网或 GitHub Releases 下载 `Clipture-<版本>.dmg`。
2. 打开 DMG，把 Clipture 拖入“应用程序”。
3. 从“应用程序”中启动 Clipture。

安装包使用对话猿的 Developer ID 签名并通过 Apple 公证。每个 GitHub Release 都附带 SHA-256 校验值。

### 权限

- **屏幕录制**：用于截取屏幕和应用窗口。
- **辅助功能**：只用于自动滚动，以及把剪贴板历史条目直接粘贴回之前的应用。
