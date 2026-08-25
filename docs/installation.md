# Installation and permissions / 安装与权限

## macOS

### Requirements

- macOS 13 or later
- Apple Silicon or Intel Mac

The direct build is Universal 2. Apple Silicon and Intel Macs run their native executable slice and do not require Rosetta.

### Install

1. Download `Clipture-<version>.dmg` from the official website or GitHub Releases.
2. Open the DMG and drag Clipture to **Applications**.
3. Start Clipture from Applications.

The DMG is signed with TalkApe's Developer ID and notarized by Apple. SHA-256 checksums are attached to each GitHub Release.

### Permissions

- **Screen Recording**: required to capture the screen and application windows.
- **Accessibility**: required only for automatic scrolling and for pasting a clipboard-history item directly into the previous application.

Clipture checks the existing macOS permission state before requesting access. Updating a signed build with the same bundle identity normally preserves an existing grant.

## Windows

### Requirements

- Windows 10 version 1903 or later, including Windows 11
- x64 or ARM64 processor

### Install

1. Open [Clipture in Microsoft Store](https://apps.microsoft.com/detail/9NVGQ229KL1S).
2. Select **Install**. Microsoft Store chooses the correct x64 or ARM64 package and verifies it.
3. Start Clipture from the Start menu. Microsoft Store handles updates automatically; uninstall from Windows Settings > Apps > Installed apps.

---

## 中文

### macOS

- 要求 macOS 13 或更高版本，支持 Apple 芯片与 Intel Mac。
- 官网版是 Universal 2 应用，两类芯片都会运行对应的原生程序。
- 下载 DMG 后，把 Clipture 拖入“应用程序”，再从“应用程序”启动。
- 屏幕录制权限用于截图；辅助功能权限只用于自动滚动和剪贴板历史直接粘贴。

### Windows

- 要求 Windows 10 1903 或更高版本，也支持 Windows 11。
- 打开 [Microsoft Store 中的 Clipture](https://apps.microsoft.com/detail/9NVGQ229KL1S)，点击“安装”。
- Microsoft Store 会自动选择适合当前电脑的 x64 或 ARM64 版本，完成应用验证，并负责后续更新。
- 安装后可以从开始菜单启动，也可以在 Windows“已安装的应用”中卸载。
