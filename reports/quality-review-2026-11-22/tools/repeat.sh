#!/bin/bash
# Lighthouse mobile performance of one page, 3 runs per host (main vs feature preview), for noise.
# Usage: bash repeat.sh <path>
export CHROME_PATH=/ms-playwright/chromium-1254/chrome-linux64/chrome
OUT=/backups/sradha-tcs/tcs-corp/repo/.home-work/audit-2026-11-22/repeat
mkdir -p "$OUT"
for host in main feature-quality-audit; do
  for i in 1 2 3; do
    f="$OUT/$host-$i.json"
    timeout 200 /tmp/audit-tools/node_modules/.bin/lighthouse "https://$host--tcs-corp--sradha-tcs.aem.page$1" --quiet --output=json --output-path="$f" \
      --only-categories=performance --chrome-flags="--headless=new --no-sandbox --disable-dev-shm-usage" > /dev/null 2>&1
    python3 -I -c "
import json,sys; d=json.load(open('$f')); a=d['audits']
print('$host', $i, round(d['categories']['performance']['score']*100), 'LCP', round(a['largest-contentful-paint']['numericValue']), 'TBT', round(a['total-blocking-time']['numericValue']), 'CLS', round(a['cumulative-layout-shift']['numericValue'],3))"
  done
done
