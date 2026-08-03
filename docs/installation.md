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

1. Download the [x64 setup EXE](https://clipture.talkape.net/downloads/Clipture-Windows-x64-Setup.exe) for most PCs, or the [ARM64 setup EXE](https://clipture.talkape.net/downloads/Clipture-Windows-arm64-Setup.exe) for Windows on ARM.
2. Run the installer. It installs Clipture for the current user without an administrator prompt.
3. Start Clipture from the Start menu. Uninstall it later from Windows Settings > Apps > Installed apps.

Portable ZIP builds are attached to GitHub Releases for managed deployment and troubleshooting. They are not the primary download.

---

## 中文

### macOS

- 要求 macOS 13 或更高版本，支持 Apple 芯片与 Intel Mac。
- 官网版是 Universal 2 应用，两类芯片都会运行对应的原生程序。
- 下载 DMG 后，把 Clipture 拖入“应用程序”，再从“应用程序”启动。
- 屏幕录制权限用于截图；辅助功能权限只用于自动滚动和剪贴板历史直接粘贴。

### Windows

- 要求 Windows 10 1903 或更高版本，也支持 Windows 11。
- 大多数电脑选择 [x64 安装程序](https://clipture.talkape.net/downloads/Clipture-Windows-x64-Setup.exe)，Windows on ARM 设备选择 [ARM64 安装程序](https://clipture.talkape.net/downloads/Clipture-Windows-arm64-Setup.exe)。
- 运行 EXE 后会为当前用户安装，无需管理员权限；可以从开始菜单启动，也可以在 Windows“已安装的应用”中卸载。
- GitHub Releases 仍附带便携 ZIP，供集中部署和排查问题时使用，不再作为默认下载。
