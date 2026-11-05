# Publishing a release from this repo

Owner: `Akhlak-Hossain-Jim`, repo: `Akhlak-Hossain-Jim/thesivor-releases`. The installers are built in `thesivor-app` (`dist/release-<version>/`) and go ONLY into the GitHub Release as assets, never into git (see `.gitignore`).

## 0.1.2 (pre-release)

```sh
cd ../thesivor-app/dist/release-0.1.2 && shasum -a 256 -c SHA256SUMS.txt && cd -   # every line OK

gh release create v0.1.2 \
  ../thesivor-app/dist/release-0.1.2/Thesivor-0.1.2-mac-arm64.dmg \
  ../thesivor-app/dist/release-0.1.2/Thesivor-0.1.2-mac-x64.dmg \
  ../thesivor-app/dist/release-0.1.2/Thesivor-0.1.2-win-x64.exe \
  ../thesivor-app/dist/release-0.1.2/Thesivor-0.1.2-linux-x86_64.AppImage \
  ../thesivor-app/dist/release-0.1.2/Thesivor-0.1.2-linux-amd64.deb \
  releases/0.1.2/SHA256SUMS.txt \
  --repo Akhlak-Hossain-Jim/thesivor-releases \
  --title "Thesivor 0.1.2 (preview, being tested)" \
  --notes-file releases/0.1.2/RELEASE_NOTES.md \
  --prerelease
```

## Check it

```sh
gh release view v0.1.2 --repo Akhlak-Hossain-Jim/thesivor-releases --json assets,isPrerelease --jq '.isPrerelease, (.assets[] | "\(.name)  \(.size)")'
curl -sIL https://github.com/Akhlak-Hossain-Jim/thesivor-releases/releases/download/v0.1.2/Thesivor-0.1.2-mac-arm64.dmg | grep -i '^HTTP\|content-length'
```

## When testers pass

```sh
gh release edit v0.1.2 --repo Akhlak-Hossain-Jim/thesivor-releases --prerelease=false --latest
```
Then change the landing page's "0.1.2 preview" label.

## Download counts

`scripts/download-stats.sh` prints them; `.github/workflows/download-stats.yml` appends a weekly row per asset to `stats/downloads.csv` (built-in `GITHUB_TOKEN` only). Totals include repeats and bots.
