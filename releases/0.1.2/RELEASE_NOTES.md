# Thesivor 0.1.2 — first public release

Thesivor is a desktop app that takes a researcher from a raw idea to a first draft they can defend. A recurring "boardroom" of AI roles argues with your idea, checks it against real papers, helps you analyse your data in a notebook, and writes a LaTeX draft whose claims trace back to sources. Everything is stored in a folder on your own computer, and you bring your own AI models.

This is an early **pre-release** from one developer. 0.1.2 is being tested by testers now; it has not been tested by many people. Please read the sections on platforms and limitations before you rely on it.

## What is in it

Since the first unsigned builds (0.1.0, 2026-10-22):

**Boardroom and literature**
- The literature review now ends. The board sorts each open question into "literature", "your data" or "yours to answer". Only literature questions keep the review going, for at most 3 rounds. What is still open afterwards is recorded as a known gap and shown in the paper checklist. From round 2 you can press **Decide now (open questions noted)** to pick the paper type yourself.
- A question the board did not classify is asked about once and, if still unclear, handed to you with three choices. It is never guessed.
- A model that gets an id slightly wrong is read as the id it meant, and you are told. An id that matches nothing is left out with a visible note; an invented id is never accepted.
- A reply with "verdict scores must be a non-empty array" is retried once with a firmer instruction, then shown with Retry and Switch model.
- Intake and chat questions come one at a time ("Question N of M").

**Data and notebook**
- Excel `.xlsx` files open natively. Files saved as "Strict Open XML" (which pandas reads as having no sheets) are converted to a standard copy in `data/processed/`. The original is never changed, and the conversion is recorded. This now also works for a Strict workbook that arrives inside a zip, or a zip inside a zip. A notebook cell that names the original file is told which converted file to read.
- Old `.xls` files open once the Excel readers are installed (the app offers the install).
- ARFF files are read as tables. Rows that cannot be read are counted and named by file line, never silently dropped.
- A zip inside a zip is unpacked one level deep. The data pane lists what was unpacked and what was left out, and why.

**Writing**
- A stray underscore in model-written text (for example `pandas.read_excel`) no longer stops the paper compiling.
- An empty draft section gets one automatic retry, then an inline error with Retry and Switch model.
- Sentences that state finished work with only a plan behind them are marked "planned" in the traceability check.

**Engines, support and reliability**
- A setting per AI engine to let it use the web (off by default); the app log records the web access of each engine call.
- A local, redacted log and **Settings → Help → Export diagnostics**. If the window is lost, the app reopens at the same stage.
- Rate limits are announced with a wait and retry instead of stalling silently.

## Platforms

| Platform | File | Status |
|---|---|---|
| macOS, Apple silicon | `Thesivor-0.1.2-mac-arm64.dmg` | Preview. 0.1.2 checksums verified and first launch checked; full testing in progress |
| macOS, Intel | `Thesivor-0.1.2-mac-x64.dmg` | Preview. 0.1.2 checksums verified; built and checked for contents; not launched yet; full testing in progress |
| Windows 10/11, x64 | `Thesivor-0.1.2-win-x64.exe` | Preview. Version 0.1.0 was tested by the developer on one Windows PC; 0.1.2 is being tested by testers now |
| Linux x86_64, any distribution | `Thesivor-0.1.2-linux-x86_64.AppImage` | Preview. Version 0.1.0 was tested by the developer on one Ubuntu machine; 0.1.2 is being tested by testers now |
| Debian / Ubuntu | `Thesivor-0.1.2-linux-amd64.deb` | Preview. Version 0.1.0 was tested by the developer on one Ubuntu machine; 0.1.2 is being tested by testers now |

Windows and Linux are previews: version 0.1.0 was tested by the developer on one Windows PC and one Ubuntu machine; 0.1.2 has not been run on them yet and is being tested by testers now. "Preview" means it should work but has had little real-world use. Report anything that does not.

## These builds are unsigned

There is no Apple or Windows certificate yet, so your operating system will warn you the first time you open the app. Full instructions: https://docs.thesivor.akhlak.dev. The key steps:

- **macOS:** open the `.dmg`, drag Thesivor to Applications, then right-click it → Open → Open. If macOS refuses to open it, run `xattr -dr com.apple.quarantine /Applications/Thesivor.app` once and open it again. On recent macOS you may need System Settings → Privacy & Security → Open Anyway.
- **Windows:** run the `.exe`. If Windows SmartScreen blocks it, click More info → Run anyway.
- **Linux AppImage:** `chmod +x Thesivor-0.1.2-linux-x86_64.AppImage`, then run it. If it will not start, install FUSE 2 (`sudo apt install libfuse2`) or run it with `--appimage-extract-and-run`.
- **Linux .deb:** `sudo apt install ./Thesivor-0.1.2-linux-amd64.deb`.

Check your download against `SHA256SUMS.txt` before opening it (see the README for the commands).

On first use the app downloads Python (notebook), Tectonic (LaTeX), the table-detection model and local speech-to-text, each checked against a pinned SHA-256. Local speech-to-text is not available on Intel Macs.

## Known limitations

- **No automatic updates yet.** Download the new version when one is released.
- Old `.xls`: first sheet only, values only (no formulas or formatting); needs the Excel readers download.
- Strict Excel: formulas, macros and charts are not interpreted, only cell values. A workbook over 64 MB, or with more than 2000 parts, cannot be converted; the app tells you to re-save it as `.xlsx` or `.csv`.
- ARFF: a data line without one value per attribute is left out (and counted); sparse ARFF rows are not read.
- Archives: only `.zip` is unpacked, and only two levels deep. `.rar`, `.7z`, `.tar` and `.gz` are refused with a message.
- Not covered by any test here: a real full paper run with a paid model on Windows or Linux, and the Intel Mac build running at all.
- AI models make mistakes. Check every claim and citation against its source; Thesivor shows where a claim comes from but cannot make it true.

## Reporting a problem

In the app: **Settings → Help → Export diagnostics**, then email the file and a short description to akhlak@thesivor.akhlak.dev. The diagnostics are redacted (no API keys), but look at the file before you send it.
