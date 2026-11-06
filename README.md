# Thesivor — releases

Installers, checksums and release notes for **Thesivor**, a local-first desktop app that takes a researcher from a raw idea to a defensible first draft.

This repository holds the README, release notes and checksums, with no source code. The installers are attached to each GitHub Release as assets and are never committed to git.

- Website: https://thesivor.akhlak.dev
- Documentation and install help: https://docs.thesivor.akhlak.dev
- Releases: see **Releases** on the right. **v0.1.3 is a pre-release** that testers are checking now (it fixes 0.1.2 starting with an empty data folder and adds in-app updates; 0.1.2 users install 0.1.3 by hand once). v0.1.0 remains the latest stable release until 0.1.3 passes.
- Per-version notes and checksums are kept in this repo under `releases/<version>/`.

## Which file?

| You have | Download |
|---|---|
| Mac with Apple silicon (M1 or later) | `Thesivor-<version>-mac-arm64.dmg` |
| Mac with an Intel chip | `Thesivor-<version>-mac-x64.dmg` |
| Windows 10/11, 64-bit | `Thesivor-<version>-win-x64.exe` |
| Linux, any distribution | `Thesivor-<version>-linux-x86_64.AppImage` |
| Debian or Ubuntu | `Thesivor-<version>-linux-amd64.deb` |

The builds are **unsigned**, so your OS warns you on first open. On a Mac: click Done (not Move to Bin) in the “Not Opened” dialog, then System Settings → Privacy & Security → Open Anyway (Apple: https://support.apple.com/en-us/102445); it repeats for each new unsigned version. The install page above has every system.

## Check your download

Each release has a `SHA256SUMS.txt`. Compare the hash of your file with its line in that file.

macOS:
```sh
shasum -a 256 Thesivor-<version>-mac-arm64.dmg
```
Windows (PowerShell):
```powershell
Get-FileHash .\Thesivor-<version>-win-x64.exe -Algorithm SHA256
```
Linux:
```sh
sha256sum Thesivor-<version>-linux-x86_64.AppImage
```
To check every file you downloaded at once, put them and `SHA256SUMS.txt` in one folder and run `shasum -a 256 -c SHA256SUMS.txt` (macOS) or `sha256sum -c SHA256SUMS.txt` (Linux). Files you did not download are reported as missing; look at the lines for the ones you did.

A matching hash shows the file arrived intact. It does not replace code signing.

## Download counts

`scripts/download-stats.sh` prints each release asset's `download_count` (needs `gh` signed in). A weekly GitHub Actions workflow appends a dated row per asset to `stats/downloads.csv`. These are **totals** as GitHub counts them: they include repeat downloads and bots, so they are not unique users.

## Problems

In the app: Settings → Help → Export diagnostics, then email akhlak@thesivor.akhlak.dev.
