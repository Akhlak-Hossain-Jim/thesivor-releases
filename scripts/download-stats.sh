#!/usr/bin/env bash
# Print the download_count of every release asset in this repo.
# Uses the GitHub CLI's own sign-in (`gh auth status`) or GH_TOKEN from the environment; no token is stored here.
# Usage: scripts/download-stats.sh [owner/repo]   (default: the repo of the current directory)
# Counts are totals: they include repeat downloads and bots, not unique users.
set -euo pipefail
repo="${1:-$(gh repo view --json nameWithOwner --jq .nameWithOwner)}"
gh api "repos/${repo}/releases" --paginate \
  --jq '.[] | .tag_name as $t | .assets[] | [$t, .name, .download_count] | @tsv' \
  | awk -F'\t' 'BEGIN { printf "%-10s %-45s %s\n", "release", "asset", "downloads" } { printf "%-10s %-45s %s\n", $1, $2, $3 }'
