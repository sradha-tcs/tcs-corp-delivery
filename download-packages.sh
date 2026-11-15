#!/bin/bash
# Downloads content packages from this repository's Releases into the folders the other scripts use
# (consolidated/packages/, packages/<batch>/, packages-earlier-run-assets/, ...), as listed in packages.tsv.
# Every file is checked against its SHA-256; files already there with the right checksum are skipped, so
# the command can run again after an interruption.
#
#   bash download-packages.sh --batch B001        # the packages of one batch (all its folders)
#   bash download-packages.sh --release <tag>     # one release (see PACKAGES.md), e.g. earlier-run-assets
#   bash download-packages.sh --all               # every current package (about 23 GB)
#   bash download-packages.sh --archive           # the archived packages, below archive/ (about 28 GB: they repeat most current ones)
#   add --dry-run to list what would be downloaded
set -euo pipefail
cd "$(dirname "$0")"
MODE=""; VALUE=""; DRY=0
while [ $# -gt 0 ]; do
  case "$1" in
    --batch|--release) MODE=$1; VALUE=${2:?missing value for $1}; shift 2 ;;
    --all|--archive) MODE=$1; shift ;;
    --dry-run) DRY=1; shift ;;
    *) echo "unknown option $1"; exit 2 ;;
  esac
done
[ -n "$MODE" ] || { sed -n '2,12p' "$0"; exit 2; }
if command -v sha256sum > /dev/null; then sha() { sha256sum "$1" | cut -d' ' -f1; }; else sha() { shasum -a 256 "$1" | cut -d' ' -f1; }; fi
CURRENT=migrated-page-content-edam
n=0; skipped=0; bytes=0
# files downloaded in this run (sha256 and path; macOS bash 3.2 has no associative arrays)
SEEN=$(mktemp); trap 'rm -f "$SEEN"' EXIT
# columns: source, path, release, asset, size, sha256, url
while IFS=$'\t' read -r source path release asset size sum url; do
  [ "$source" = source ] && continue
  case "$MODE" in
    --batch) [ "$source" = "$CURRENT" ] && [[ "$path" == *"$VALUE"* ]] || continue ;;
    --release) [ "$release" = "$VALUE" ] || continue ;;
    --all) [ "$source" = "$CURRENT" ] || continue ;;
    --archive) [ "$source" != "$CURRENT" ] || continue ;;
  esac
  dest=$path
  [ "$source" = "$CURRENT" ] || dest="archive/${source//\//-}/$path"
  if [ -f "$dest" ] && [ "$(sha "$dest")" = "$sum" ]; then skipped=$((skipped + 1)); continue; fi
  n=$((n + 1)); bytes=$((bytes + size))
  if [ $DRY = 1 ]; then echo "$dest ($((size / 1048576)) MB)"; continue; fi
  mkdir -p "$(dirname "$dest")"
  # the same file at another path in this run: copied, not downloaded again
  prev=$(grep -m1 "^$sum " "$SEEN" | cut -d' ' -f2- || true)
  if [ -n "$prev" ] && [ -f "$prev" ]; then cp "$prev" "$dest"; echo "copied $dest"; bytes=$((bytes - size)); continue; fi
  for t in 1 2 3; do
    curl -fsSL --retry 3 -o "$dest.part" "$url" && [ "$(sha "$dest.part")" = "$sum" ] && break
    echo "retry $t: $dest"; sleep 5
  done
  [ "$(sha "$dest.part")" = "$sum" ] || { echo "checksum mismatch: $dest"; exit 1; }
  mv "$dest.part" "$dest"
  echo "$sum $dest" >> "$SEEN"
  echo "downloaded $dest ($((size / 1048576)) MB)"
done < packages.tsv
echo "$n file(s) $([ $DRY = 1 ] && echo to download || echo downloaded), $((bytes / 1048576)) MB; $skipped already there"
