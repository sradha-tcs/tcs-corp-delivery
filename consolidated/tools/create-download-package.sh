#!/bin/bash
# Creates a content package on an AEM author with Package Manager, builds it and downloads the zip to your
# Mac. Only reads content: building a package copies the content into the zip and changes nothing in it (the
# package itself is stored in Package Manager, /etc/packages/<group>/). macOS (bash 3.2, curl, perl, shasum).
#
# Nothing is hard-coded: pass the author in the environment; the token is asked for (hidden) when not set.
#   AEM_AUTHOR   the author URL, e.g. https://author-p<program>-e<environment>.adobeaemcloud.com
#   AEM_TOKEN    an access token of a user allowed to create packages (Developer Console > Integrations > Local
#                token, valid 24 hours). Never commit it or put it in a file.
#
# Usage: bash create-download-package.sh --path <content path> [--path ...] [options]
#   --path P        a filter root, e.g. /content/tcs-corp/language-masters/en/who-we-are (repeat for more)
#   --paths-file F  filter roots from a file, one a line (# comments and empty lines are skipped)
#   --exclude RE    leaves out the paths matching the regular expression in every filter root, e.g.
#                   '/content/tcs-corp/language-masters/en/block-library(/.*)?' (repeat for more)
#   --name N        package name (default: tcs-corp-export)
#   --group G       package group (default: tcs-corp-exports)
#   --version V     package version (default: today and time, e.g. 2026.11.26-1030)
#   --out DIR       download folder (default: the current folder)
#   --rebuild       if the package (name, group, version) exists already: update its filters and build it again
#                   (without it the script stops)
#   --dry-run       checks the author and the paths and shows the package it would create; changes nothing
# Example:
#   export AEM_AUTHOR=https://author-p<program>-e<environment>.adobeaemcloud.com
#   bash create-download-package.sh --path /content/tcs-corp/language-masters/en/who-we-are \
#     --path /content/dam/tcs-corp/images/who-we-are --name who-we-are --version 1.0.0
set -uo pipefail
PATHS=() EXCLUDES=() NAME=tcs-corp-export GROUP=tcs-corp-exports VERSION="" OUT=. REBUILD=0 DRY=0
while [ $# -gt 0 ]; do
  case $1 in
    --path) PATHS+=("${2:?missing path}"); shift ;;
    --paths-file)
      [ -f "${2:-}" ] || { echo "no such file: ${2:-}"; exit 2; }
      while IFS= read -r line || [ -n "$line" ]; do
        line=$(printf '%s' "$line" | sed 's/#.*//; s/^[[:space:]]*//; s/[[:space:]]*$//')
        [ -n "$line" ] && PATHS+=("$line")
      done < "$2"
      shift ;;
    --exclude) EXCLUDES+=("${2:?missing regular expression}"); shift ;;
    --name) NAME=${2:?missing name}; shift ;;
    --group) GROUP=${2:?missing group}; shift ;;
    --version) VERSION=${2:?missing version}; shift ;;
    --out) OUT=${2:?missing folder}; shift ;;
    --rebuild) REBUILD=1 ;;
    --dry-run) DRY=1 ;;
    -h|--help) sed -n '2,26p' "$0"; exit 0 ;;
    *) echo "unknown option $1 (see --help)"; exit 2 ;;
  esac
  shift
done
[ ${#PATHS[@]} -gt 0 ] || { echo "give at least one --path or --paths-file (see --help)"; exit 2; }
for p in "${PATHS[@]}"; do
  case $p in
    /content/*|/conf/*|/etc/*|/var/*) ;;
    *) echo "not a repository path: $p (it must start with /content, /conf, /etc or /var)"; exit 2 ;;
  esac
done
for v in "$NAME" "$GROUP"; do
  printf '%s' "$v" | grep -Eq '^[A-Za-z0-9._-]+$' || { echo "name and group: letters, digits, . _ - only ($v)"; exit 2; }
done
[ -n "$VERSION" ] || VERSION=$(date +%Y.%m.%d-%H%M)
printf '%s' "$VERSION" | grep -Eq '^[A-Za-z0-9._-]+$' || { echo "version: letters, digits, . _ - only"; exit 2; }
mkdir -p "$OUT" || exit 1

[ -n "${AEM_AUTHOR:-}" ] || { echo "set AEM_AUTHOR (the author URL)"; exit 2; }
AUTHOR=${AEM_AUTHOR%/}
if [ -z "${AEM_TOKEN:-}" ]; then
  read -r -s -p "Access token: " AEM_TOKEN; echo
fi
[ -n "$AEM_TOKEN" ] || { echo "no token"; exit 2; }
# the token goes to curl in a config file readable only by you (not on the command line, not in ps)
AUTH=$(mktemp)
chmod 600 "$AUTH"
printf 'header = "Authorization: Bearer %s"\n' "$AEM_TOKEN" > "$AUTH"
trap 'rm -f "$AUTH"' EXIT
api() { curl -sS -K "$AUTH" "$@"; }

code=$(api -o /dev/null -w '%{http_code}' "$AUTHOR/crx/packmgr/service.jsp?cmd=ls")
[ "$code" = 200 ] || { echo "Package Manager answers $code: check AEM_AUTHOR, the token and the user's permissions"; exit 1; }

# every filter root must exist (a typo would build an empty package)
missing=0
for p in "${PATHS[@]}"; do
  c=$(api -o /dev/null -w '%{http_code}' "$AUTHOR$(printf '%s' "$p" | sed 's/ /%20/g').json")
  if [ "$c" != 200 ]; then echo "  not found on the author ($c): $p"; missing=1; fi
done
[ $missing -eq 0 ] || { echo "fix the paths above: nothing was created"; exit 1; }

# the filter as Package Manager's JSON: one root per path, the excludes as rules of each root
FILTER=$(perl -e '
  my ($paths, $excl) = @ARGV;
  my @p = split /\n/, $paths; my @e = grep { length } split /\n/, $excl;
  my $q = sub { my $s = shift; $s =~ s/\\/\\\\/g; $s =~ s/"/\\"/g; "\"$s\"" };
  my $rules = join ",", map { "{\"modifier\":\"exclude\",\"pattern\":" . $q->($_) . "}" } @e;
  print "[", join(",", map { "{\"root\":" . $q->($_) . ",\"rules\":[$rules]}" } @p), "]";
' "$(printf '%s\n' "${PATHS[@]}")" "$(printf '%s\n' "${EXCLUDES[@]+"${EXCLUDES[@]}"}")")
FILE="$NAME-$VERSION.zip"
PKG="/etc/packages/$GROUP/$FILE"

echo "author:  $AUTHOR"
echo "package: $PKG"
printf 'filter:  %s\n' "${PATHS[@]}"
[ ${#EXCLUDES[@]} -eq 0 ] || printf 'exclude: %s\n' "${EXCLUDES[@]}"

exists=$(api "$AUTHOR/crx/packmgr/service.jsp?cmd=ls" | perl -0777 -ne '
  my ($g, $f) = @ARGV; my $n = 0;
  while (/<package>(.*?)<\/package>/gs) { my $x = $1; $n = 1 if $x =~ /<group>\Q'"$GROUP"'\E<\/group>/ && $x =~ /<downloadName>\Q'"$FILE"'\E<\/downloadName>/ }
  print $n')
if [ "$exists" = 1 ] && [ $REBUILD -eq 0 ]; then
  echo "this package exists already: use another --version, or --rebuild to update and build it again"; exit 1
fi
if [ $DRY -eq 1 ]; then
  echo "dry run: nothing created. Run again without --dry-run to create, build and download it."; exit 0
fi

ok() { grep -q '"success" *: *true' <<< "$1"; }
if [ "$exists" != 1 ]; then
  out=$(api -X POST -F cmd=create -F "packageName=$NAME" -F "groupName=$GROUP" -F "packageVersion=$VERSION" \
    "$AUTHOR/crx/packmgr/service/exec.json")
  ok "$out" || { echo "create failed: $(echo "$out" | tr -d '\n' | cut -c1-300)"; exit 1; }
  echo "created"
fi
out=$(api -X POST -F "path=$PKG" -F "packageName=$NAME" -F "groupName=$GROUP" -F "version=$VERSION" \
  -F "filter=$FILTER" -F "_charset_=UTF-8" "$AUTHOR/crx/packmgr/update.jsp")
ok "$out" || { echo "filter update failed: $(echo "$out" | tr -d '\n' | cut -c1-300)"; exit 1; }
echo "filter set"

# the build (synchronous; large packages take minutes): if the request ends first, the build carries on in
# AEM and the package's lastWrapped date tells when it is done
built_at() { api "$AUTHOR/crx/packmgr/service.jsp?cmd=ls" | perl -0777 -ne '
  while (/<package>(.*?)<\/package>/gs) { my $x = $1;
    if ($x =~ /<group>\Q'"$GROUP"'\E<\/group>/ && $x =~ /<downloadName>\Q'"$FILE"'\E<\/downloadName>/) {
      print(($x =~ /<lastWrapped>([^<]*)<\/lastWrapped>/) ? $1 : "") } }'; }
before=$(built_at)
echo "$(date +%H:%M:%S) building (this can take minutes for many pages or assets)"
out=$(api --max-time 1800 -X POST "$AUTHOR/crx/packmgr/service/.json$PKG?cmd=build" 2>&1)
if ! ok "$out"; then
  echo "  the build request ended without a result ($(echo "$out" | tr -d '\n' | cut -c1-120)); waiting for the build"
  for i in $(seq 1 120); do
    sleep 30
    now=$(built_at)
    if [ -n "$now" ] && [ "$now" != "$before" ]; then out='"success":true'; break; fi
    echo "  $(date +%H:%M:%S) still building"
  done
  ok "$out" || { echo "the build didn't finish in 60 minutes: check the package in Package Manager"; exit 1; }
fi
echo "$(date +%H:%M:%S) built"

DEST="$OUT/$FILE"
code=$(api --max-time 7200 -o "$DEST.part" -w '%{http_code}' "$AUTHOR$PKG")
[ "$code" = 200 ] || { rm -f "$DEST.part"; echo "download failed: HTTP $code"; exit 1; }
unzip -tq "$DEST.part" > /dev/null 2>&1 || { echo "the download isn't a valid zip: kept as $DEST.part"; exit 1; }
mv "$DEST.part" "$DEST"
entries=$(unzip -l "$DEST" | grep -c '/\.content\.xml$' || true)
size=$(wc -c < "$DEST" | tr -d ' ')
echo "downloaded: $DEST ($((size / 1048576)) MB, $entries .content.xml nodes)"
echo "sha256: $(shasum -a 256 "$DEST" | cut -d' ' -f1)"
echo "The package also stays in Package Manager ($PKG); delete it there when it is no longer needed."
