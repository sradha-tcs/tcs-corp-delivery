#!/bin/bash
# Lighthouse (mobile + desktop) of the representative pages, one Chrome at a time.
# Usage: bash measure.sh <label> <base URL>   -> <label>/lh-<page>-<mode>.json
HERE=/backups/sradha-tcs/tcs-corp/repo/.home-work/audit-2026-11-22
OUT="$HERE/$1"
BASE=$2
mkdir -p "$OUT"
export CHROME_PATH=/ms-playwright/chromium-1254/chrome-linux64/chrome
PAGES="home=/design-block-master/en/curated-design-pages/home press=/design-block-master/en/block-library/templates/press-release-template hero=/design-block-master/en/block-library/hero/hero-overview teaser=/design-block-master/en/block-library/teaser"
for p in $PAGES; do
  name=${p%%=*}
  path=${p#*=}
  for mode in mobile desktop; do
    f="$OUT/lh-$name-$mode.json"
    [ -s "$f" ] && continue
    extra=""
    [ "$mode" = desktop ] && extra="--preset=desktop"
    timeout 240 /tmp/audit-tools/node_modules/.bin/lighthouse "$BASE$path" $extra --quiet --output=json --output-path="$f" \
      --only-categories=performance,accessibility,best-practices,seo \
      --chrome-flags="--headless=new --no-sandbox --disable-dev-shm-usage" > /dev/null 2>&1 || echo "failed $name $mode"
  done
done
python3 -I "$HERE/summary.py" "$OUT"
