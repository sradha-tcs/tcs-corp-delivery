#!/bin/bash
# Uninstalls and deletes the migration's asset packages (tcs-corp-ema-*-assets-*, the batch asset packages 1.2.0 and the
# earlier-run asset packages) on an AEM author, through the Package Manager HTTP service. macOS (bash 3.2, curl, perl).
#
# WARNING: uninstalling a package rolls back what it installed: the assets it added are REMOVED FROM THE DAM (and an
# asset it replaced is restored to its earlier version). Pages that show those assets lose their images. Use
# --delete-only to remove only the package zips from Package Manager and keep the assets.
#
# Nothing is hard-coded: pass the author in the environment; the token is asked for (hidden) when not set.
#   AEM_AUTHOR   the author URL, e.g. https://author-p<program>-e<environment>.adobeaemcloud.com
#   AEM_TOKEN    an access token of a user allowed to manage packages (Developer Console > Integrations > Local token,
#                valid 24 hours). Never commit it or put it in a file.
#
# Usage: bash uninstall-asset-packages.sh [--batch B0xx] [--delete-only] [--yes]
#   without --yes: lists what would be done, changes nothing
#   --yes:         does it, after you type the confirmation it asks for
#   --batch B0xx:  only that batch's asset packages
#   --delete-only: delete the packages from Package Manager without uninstalling them (the assets stay)
# Order: newest-installed first (the reverse of the installation), so overlapping assets are restored in order.
# Resumable: every package done is recorded in uninstall-progress-<fingerprint>.log next to this script; a rerun
# skips them.
set -uo pipefail
BATCH="" DELETE_ONLY=0 YES=0
while [ $# -gt 0 ]; do
  case $1 in
    --batch) BATCH=${2:?missing batch}; shift ;;
    --delete-only) DELETE_ONLY=1 ;;
    --yes) YES=1 ;;
    -h|--help) sed -n '2,22p' "$0"; exit 0 ;;
    *) echo "unknown option $1"; exit 2 ;;
  esac
  shift
done
[ -n "${AEM_AUTHOR:-}" ] || { echo "set AEM_AUTHOR (the author URL)"; exit 2; }
AUTHOR=${AEM_AUTHOR%/}
if [ -z "${AEM_TOKEN:-}" ]; then
  read -r -s -p "Access token: " AEM_TOKEN; echo
fi
[ -n "$AEM_TOKEN" ] || { echo "no token"; exit 2; }
code=$(curl -s -o /dev/null -w '%{http_code}' -H "Authorization: Bearer $AEM_TOKEN" "$AUTHOR/crx/packmgr/service.jsp?cmd=ls")
[ "$code" = 200 ] || { echo "Package Manager answers $code: check AEM_AUTHOR, the token and the user's permissions"; exit 1; }

DIR=$(cd "$(dirname "$0")" && pwd)
fp=$(printf '%s' "$AUTHOR" | shasum | cut -c1-8)
LOG="$DIR/uninstall-progress-$fp.log"
touch "$LOG"

# the packages on the author: one line per package, "lastUnpacked|group|downloadName" (lastUnpacked empty when the
# package was never installed); only the migration's asset packages
LIST=$(curl -sS --max-time 300 -H "Authorization: Bearer $AEM_TOKEN" "$AUTHOR/crx/packmgr/service.jsp?cmd=ls" | perl -0777 -ne '
  while (/<package>(.*?)<\/package>/gs) {
    my $p = $1; my %v;
    for my $k (qw(group downloadName lastUnpacked)) { $v{$k} = ($p =~ /<$k>([^<]*)<\/$k>/) ? $1 : "" }
    print "$v{lastUnpacked}|$v{group}|$v{downloadName}\n";
  }' | grep -E '\|tcs-corp-ema-[^|]*-assets-[^|]*\.zip$' | sort -r)
if [ -n "$BATCH" ]; then
  LIST=$(printf '%s\n' "$LIST" | grep -E "\|tcs-corp-ema-$BATCH-" || true)
fi
LIST=$(printf '%s\n' "$LIST" | grep -v '^$' || true)
total=$(printf '%s\n' "$LIST" | grep -c . || true)
installed=$(printf '%s\n' "$LIST" | grep -c '^[^|]' || true)
action=$([ $DELETE_ONLY -eq 1 ] && echo "delete (assets kept)" || echo "uninstall (assets removed from the DAM) and delete")
echo "progress log: $(basename "$LOG")"
echo "asset packages found: $total ($installed installed)${BATCH:+ in batch $BATCH}; action: $action"
[ "$total" -gt 0 ] || exit 0

if [ $YES -eq 0 ]; then
  printf '%s\n' "$LIST" | while IFS='|' read -r when group name; do
    grep -qx "done $name" "$LOG" && { echo "  done before: $name"; continue; }
    echo "  $name (group $group, installed: ${when:-no})"
  done
  echo "Nothing changed. Run again with --yes to $action these packages."
  exit 0
fi

if [ $DELETE_ONLY -eq 1 ]; then
  word="DELETE $total"
else
  word="UNINSTALL $total"
  echo "This removes the assets of $installed installed packages from the DAM of $AUTHOR."
fi
read -r -p "Type \"$word\" to continue: " answer < /dev/tty
[ "$answer" = "$word" ] || { echo "not confirmed: nothing changed"; exit 1; }

# a Package Manager command on one package; prints its message and returns 0 on success
packmgr() {
  local cmd=$1 group=$2 name=$3 out
  for try in 1 2 3; do
    out=$(curl -sS --max-time 3600 -X POST -H "Authorization: Bearer $AEM_TOKEN" \
      "$AUTHOR/crx/packmgr/service/.json/etc/packages/$group/$name?cmd=$cmd" 2>&1)
    if grep -q '"success" *: *true' <<< "$out"; then return 0; fi
    echo "    $cmd failed (try $try): $(echo "$out" | tr -d '\n' | cut -c1-300)"
    sleep 15
  done
  return 1
}

n=0
printf '%s\n' "$LIST" | while IFS='|' read -r when group name; do
  n=$((n + 1))
  grep -qx "done $name" "$LOG" && continue
  echo "$(date -u +%FT%TZ) #$n of $total $name"
  if [ $DELETE_ONLY -eq 0 ] && [ -n "$when" ] && ! grep -qx "uninstalled $name" "$LOG"; then
    packmgr uninstall "$group" "$name" || { echo "#$n $name not uninstalled: stopped (rerun to continue from here)"; exit 1; }
    echo "uninstalled $name" >> "$LOG"
  fi
  packmgr delete "$group" "$name" || { echo "#$n $name not deleted: stopped (rerun to continue from here)"; exit 1; }
  echo "done $name" >> "$LOG"
done || exit 1
echo "finished: see $(basename "$LOG")"
