# Handoff — thesivor-releases

Session 2026-11-06 — R4: v0.1.3 published.

- `releases/0.1.3/` holds the notes and SHA256SUMS.txt (checksums of the installers, update metadata, blockmap and notes). The installers and update metadata are Release assets only.
- Release https://github.com/Akhlak-Hossain-Jim/thesivor-releases/releases/tag/v0.1.3 is a PRE-release with nine assets (five installers, `latest.yml`, `latest-linux.yml`, the Windows blockmap, SHA256SUMS.txt); every asset answered 302 then 200 with the local file's size. v0.1.2 is unchanged; v0.1.0 is still "Latest".
- `latest.yml` (Windows NSIS) and `latest-linux.yml` (AppImage) are what electron-updater reads; their sha512 and size were checked against the downloaded assets.
- Next: when testers pass, `gh release edit v0.1.3 --repo Akhlak-Hossain-Jim/thesivor-releases --prerelease=false --latest` (see PUBLISH.md).
- UNVERIFIED: a real in-app update on Windows/Linux (first possible when 0.1.4 exists).
