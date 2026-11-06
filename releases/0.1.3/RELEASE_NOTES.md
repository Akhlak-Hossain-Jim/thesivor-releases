# Thesivor 0.1.3 — fixes the empty start in 0.1.2, and adds in-app updates

Thesivor is a desktop app that takes a researcher from a raw idea to a first draft they can defend. A recurring "boardroom" of AI roles argues with your idea, checks it against real papers, helps you analyse your data in a notebook, and writes a LaTeX draft whose claims trace back to sources. Everything is stored in a folder on your own computer, and you bring your own AI models.

This is an early **pre-release** from one developer. It is being tested by testers; it has not been tested by many people.

## If 0.1.2 started empty for you

**0.1.2 had a bug: after you installed it over an earlier version, it opened with no projects and default settings.** Your earlier work was not deleted. 0.1.2 looked in the wrong data folder (`~/Library/Application Support/thesivor-app` on a Mac) instead of the one earlier versions used (`thesivor`).

**0.1.3 brings your earlier projects and settings back automatically.** On first launch it copies what it finds in the other folder into the right one. It copies; it never moves or deletes, so the originals stay where they were. If a settings file or the project list cannot be read, it keeps the unreadable file beside the new one (named `…unreadable-<time>`) and rebuilds the list from your project folders; nothing is reset silently. The data folder is now fixed and will not change between versions.

- **Find my projects** (on the home screen): pick a folder and Thesivor adds the Thesivor projects it finds there to your list.
- **Saved API keys:** a new build may not be allowed to read keys that an earlier build saved. If so, Settings → AI engines says "This version couldn't unlock your saved keys; please enter them again". Only the keys are affected; your projects and every other setting stay.

## What else is new

- **Updates inside the app, from 0.1.3 on.** Thesivor checks for a newer version when it opens (Settings → About: "Check for updates when Thesivor opens", on by default; "Check now"; "Include preview versions", off by default). A quiet banner shows the release notes and an **Update** button. Nothing installs without your click. A failed check shows only in Settings → About.
  - **0.1.2 cannot update itself:** install 0.1.3 by hand once, as below. After that, updates come from inside the app.
  - Windows and Linux AppImage: one click, then "Restart to update". macOS: the app downloads and checks the right `.dmg`, opens it and shows the steps (quit, drag to Applications, Replace, Open Anyway); one-click updates on a Mac need Apple signing, which is not done yet. Linux `.deb`: downloaded, checked and opened in the system's package installer. A download that fails its checksum is refused and deleted.
- **Local gateway:** the address field starts empty, with an example and a link to a step-by-step guide (it used to start at `localhost:8080`).
- **One app, clearly named:** the developer test build is now a separate app called "Thesivor Verify" with its own data folder.

## Platforms

| Platform | File | Status |
|---|---|---|
| macOS, Apple silicon | `Thesivor-0.1.3-mac-arm64.dmg` | Preview. Checked by the developer: checksum, contents, and the app starts and shows its first screen |
| macOS, Intel | `Thesivor-0.1.3-mac-x64.dmg` | Preview. Checksum and contents checked; not launched; testing in progress |
| Windows 10/11, x64 | `Thesivor-0.1.3-win-x64.exe` | Preview. Being tested by testers; 0.1.3 has not been run on Windows by the developer |
| Linux x86_64, any distribution | `Thesivor-0.1.3-linux-x86_64.AppImage` | Preview. Being tested by testers; 0.1.3 has not been run on Linux by the developer |
| Debian / Ubuntu | `Thesivor-0.1.3-linux-amd64.deb` | Preview. Being tested by testers; 0.1.3 has not been run on Linux by the developer |

Windows and Linux are previews, being tested by testers now. "Preview" means it should work but has had little real-world use. Report anything that does not.

## These builds are unsigned

There is no Apple or Windows certificate yet, so your operating system will warn you the first time you open the app. Full instructions: https://docs.thesivor.akhlak.dev. The key steps:

- **macOS:** open the `.dmg`, drag Thesivor to Applications (choose **Replace** if you already have it), then open it. macOS says “Thesivor” Not Opened (“Apple could not verify “Thesivor” is free of malware that may harm your Mac or compromise your privacy.”): **click Done, not Move to Bin.** Then System Settings → Privacy & Security → scroll to Security → “Thesivor” was blocked → **Open Anyway** → your password → open Thesivor again → **Open Anyway**. This is Apple's own route (https://support.apple.com/en-us/102445). Or, once, in Terminal: `xattr -dr com.apple.quarantine /Applications/Thesivor.app`. **It repeats for each new unsigned version**, including this one. Your projects and settings are not in the app, so replacing it keeps them.
- **Windows:** run the `.exe`. If Windows SmartScreen blocks it, click More info → Run anyway.
- **Linux AppImage:** `chmod +x Thesivor-0.1.3-linux-x86_64.AppImage`, then run it. If it will not start, install FUSE 2 (`sudo apt install libfuse2`) or run it with `--appimage-extract-and-run`.
- **Linux .deb:** `sudo apt install ./Thesivor-0.1.3-linux-amd64.deb`.

Check your download against `SHA256SUMS.txt` before opening it (see the README for the commands).

## Known limitations

- Updating inside the app has been tested against a local test server only. Updating on a real Windows or Linux machine is not verified yet; the first real test is the update from 0.1.3 to the next version.
- Old `.xls`: first sheet only, values only; needs the Excel readers download. Strict Excel: only cell values; a workbook over 64 MB cannot be converted. Archives: only `.zip`, two levels deep.
- AI models make mistakes. Check every claim and citation against its source.

## Reporting a problem

In the app: **Settings → Help → Export diagnostics**, then email the file and a short description to akhlak@thesivor.akhlak.dev. The diagnostics are redacted (no API keys), but look at the file before you send it.
