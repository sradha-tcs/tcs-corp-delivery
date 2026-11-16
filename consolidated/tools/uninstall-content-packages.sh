#!/bin/bash
# Uninstalls and deletes the migration's batch content (page) packages (tcs-corp-ema-B0xx-...-1.2.0.zip / -1.3.0.zip,
# not the -assets- packages) on an AEM author, through the Package Manager HTTP service. macOS (bash 3.2, curl, perl).
# The same model as uninstall-asset-packages.sh, with --installed-on to pick the packages installed on one day.
#
# WARNING: uninstalling a package rolls back what it installed: the pages it added are REMOVED FROM THE AUTHOR (a page
# it replaced is restored to its earlier version). Published pages stay on Edge Delivery (preview and live) until they
# are unpublished. Packages installed later over the same pages (fix packages, renames) no longer match after the
# rollback. Use --delete-only to remove only the package zips from Package Manager and keep the pages.
#
# Nothing is hard-coded: pass the author in the environment; the token is asked for (hidden) when not set.
#   AEM_AUTHOR   the author URL, e.g. https://author-p<program>-e<environment>.adobeaemcloud.com
#   AEM_TOKEN    an access token of a user allowed to manage packages (Developer Console > Integrations > Local token,
#                valid 24 hours). Never commit it or put it in a file.
#
# Usage: bash uninstall-content-packages.sh [--installed-on YYYY-MM-DD] [--batch B0xx] [--match '<regex>'] [--delete-only] [--yes]
#   without --yes:  lists what would be done, changes nothing
#   --yes:          does it, after you type the confirmation it asks for
#   --installed-on: only the packages last installed on that day (your Mac's time zone, as Package Manager shows it)
#   --batch B0xx:   only that batch's content packages
#   --match RE:     only the packages whose file name matches the extended regular expression RE
#                   (e.g. '1\.3\.0\.zip$' or 'B0(0[1-9]|[1-5][0-9]|60)-'); it narrows, never widens
#   --delete-only:  delete the packages from Package Manager without uninstalling them (the pages stay)
# Order: newest-installed first (the reverse of the installation, by date and time), so overlapping pages are restored
# in order. Resumable: every package done is recorded in uninstall-content-progress-<fingerprint>.log next to this
# script; a rerun skips them.
set -uo pipefail
DAY="" BATCH="" MATCH="" DELETE_ONLY=0 YES=0
while [ $# -gt 0 ]; do
  case $1 in
    --installed-on) DAY=${2:?missing date}; shift ;;
    --batch) BATCH=${2:?missing batch}; shift ;;
    --match) MATCH=${2:?missing regular expression}; shift ;;
    --delete-only) DELETE_ONLY=1 ;;
    --yes) YES=1 ;;
    -h|--help) sed -n '2,28p' "$0"; exit 0 ;;
    *) echo "unknown option $1"; exit 2 ;;
  esac
  shift
done
if [ -n "$DAY" ] && ! printf '%s' "$DAY" | grep -Eq '^[0-9]{4}-[0-9]{2}-[0-9]{2}$'; then
  echo "--installed-on takes a date as YYYY-MM-DD, e.g. 2026-11-08"; exit 2
fi
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
LOG="$DIR/uninstall-content-progress-$fp.log"
touch "$LOG"

# the packages on the author: one line per package, "epoch|local time|group|downloadName" (epoch 0 and time empty when
# the package was never installed); lastUnpacked is RFC 822 ("Sat, 08 Nov 2026 10:12:34 +0000") or ISO 8601
LIST=$(curl -sS --max-time 300 -H "Authorization: Bearer $AEM_TOKEN" "$AUTHOR/crx/packmgr/service.jsp?cmd=ls" | perl -0777 -MTime::Local -MPOSIX -ne '
  my %mon; @mon{qw(Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec)} = (0..11);
  sub epoch {
    my $s = shift; my ($d, $m, $y, $H, $M, $S, $z);
    if ($s =~ /(\d{1,2}) (\w{3}) (\d{4}) (\d\d):(\d\d):(\d\d) ?([+-]\d\d:?\d\d|Z|GMT|UTC)?/) {
      ($d, $m, $y, $H, $M, $S, $z) = ($1, $mon{$2}, $3, $4, $5, $6, $7);
    } elsif ($s =~ /(\d{4})-(\d\d)-(\d\d)T(\d\d):(\d\d):(\d\d)(?:\.\d+)?([+-]\d\d:?\d\d|Z)?/) {
      ($y, $m, $d, $H, $M, $S, $z) = ($1, $2 - 1, $3, $4, $5, $6, $7);
    } else { return 0 }
    return 0 unless defined $m;
    my $t = timegm($S, $M, $H, $d, $m, $y);
    if (defined $z && $z =~ /([+-])(\d\d):?(\d\d)/) { $t -= ($1 eq "-" ? -1 : 1) * ($2 * 3600 + $3 * 60) }
    return $t;
  }
  while (/<package>(.*?)<\/package>/gs) {
    my $p = $1; my %v;
    for my $k (qw(group downloadName lastUnpacked)) { $v{$k} = ($p =~ /<$k>([^<]*)<\/$k>/) ? $1 : "" }
    my ($t, $local) = (0, "");
    if ($v{lastUnpacked} ne "") {
      # installed; a date that cannot be read is kept as written (sorted last, never matches --installed-on)
      $t = epoch($v{lastUnpacked});
      ($t, $local) = $t ? ($t, strftime("%Y-%m-%d %H:%M:%S", localtime $t)) : (1, $v{lastUnpacked});
    }
    print "$t|$local|$v{group}|$v{downloadName}\n";
  }' | grep -E '\|tcs-corp-ema-B[0-9]{3}-[^|]*-[0-9]+\.[0-9]+\.[0-9]+\.zip$' | grep -v -- '-assets-' | sort -t'|' -k1,1nr)
if [ -n "$DAY" ]; then
  LIST=$(printf '%s\n' "$LIST" | awk -F'|' -v day="$DAY" 'substr($2, 1, 10) == day')
fi
if [ -n "$BATCH" ]; then
  LIST=$(printf '%s\n' "$LIST" | grep -E "\|tcs-corp-ema-$BATCH-" || true)
fi
if [ -n "$MATCH" ]; then
  # the regular expression on the file name only (the fourth field)
  LIST=$(printf '%s\n' "$LIST" | awk -F'|' -v re="$MATCH" '$4 ~ re') || { echo "invalid regular expression: $MATCH"; exit 2; }
fi
LIST=$(printf '%s\n' "$LIST" | grep -v '^$' || true)
total=$(printf '%s\n' "$LIST" | grep -c . || true)
installed=$(printf '%s\n' "$LIST" | grep -vc '^0|' || true)
action=$([ $DELETE_ONLY -eq 1 ] && echo "delete (pages kept)" || echo "uninstall (pages removed from the author) and delete")
echo "progress log: $(basename "$LOG")"
echo "content packages found: $total ($installed installed)${DAY:+ installed on $DAY}${BATCH:+ in batch $BATCH}${MATCH:+ matching $MATCH}; action: $action"
[ "$total" -gt 0 ] || exit 0

if [ $YES -eq 0 ]; then
  printf '%s\n' "$LIST" | while IFS='|' read -r t when group name; do
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
  echo "This removes the pages of $installed installed packages from $AUTHOR."
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
printf '%s\n' "$LIST" | while IFS='|' read -r t when group name; do
  n=$((n + 1))
  grep -qx "done $name" "$LOG" && continue
  echo "$(date -u +%FT%TZ) #$n of $total $name"
  if [ $DELETE_ONLY -eq 0 ] && [ "$t" != 0 ] && ! grep -qx "uninstalled $name" "$LOG"; then
    packmgr uninstall "$group" "$name" || { echo "#$n $name not uninstalled: stopped (rerun to continue from here)"; exit 1; }
    echo "uninstalled $name" >> "$LOG"
  fi
  packmgr delete "$group" "$name" || { echo "#$n $name not deleted: stopped (rerun to continue from here)"; exit 1; }
  echo "done $name" >> "$LOG"
done || exit 1
echo "finished: see $(basename "$LOG")"
