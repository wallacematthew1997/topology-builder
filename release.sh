#!/usr/bin/env bash
# Cut a new release. Bumps the version in every place that holds one,
# writes the changelog entry, and commits.
#
#   ./release.sh 1.2.0 "First note" "Second note" "Third note"
#
# Then: git push
set -euo pipefail

VER="${1:-}"
if [[ -z "$VER" ]]; then
  echo "usage: ./release.sh <version> <note> [note...]" >&2
  exit 1
fi
if ! [[ "$VER" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "version must look like 1.2.0" >&2
  exit 1
fi
shift
if [[ $# -eq 0 ]]; then
  echo "give at least one changelog note" >&2
  exit 1
fi

DATE="$(date +%Y-%m-%d)"
export VER DATE
NOTES_FILE="$(mktemp)"
printf '%s\n' "$@" > "$NOTES_FILE"
export NOTES_FILE

python3 - <<'PY'
import json, os, re, io

ver   = os.environ['VER']
date  = os.environ['DATE']
notes = [n for n in open(os.environ['NOTES_FILE']).read().split('\n') if n.strip()]

# version.json
json.dump({'version': ver, 'date': date, 'file': 'index.html', 'notes': notes},
          open('version.json', 'w'), indent=2)
open('version.json', 'a').write('\n')

# sw.js cache bust
sw = open('sw.js').read()
sw = re.sub(r"const VERSION = '[^']+'", "const VERSION = '%s'" % ver, sw, count=1)
open('sw.js', 'w').write(sw)

# index.html: APP_VERSION plus a new CHANGELOG entry at the top
h = open('index.html').read()
h = re.sub(r"const APP_VERSION='[^']+'", "const APP_VERSION='%s'" % ver, h, count=1)
entry = ("  {v:'%s', d:'%s', notes:[\n" % (ver, date)
         + ''.join("    %s,\n" % json.dumps(n) for n in notes).rstrip(',\n') + '\n  ]},\n')
h = h.replace('const CHANGELOG=[\n', 'const CHANGELOG=[\n' + entry, 1)
open('index.html', 'w').write(h)

# CHANGELOG.md
c = open('CHANGELOG.md').read()
block = '## v%s\n\n%s\n\n' % (ver, date) + ''.join('* %s\n' % n for n in notes) + '\n'
i = c.index('## v')
open('CHANGELOG.md', 'w').write(c[:i] + block + c[i:])
print('bumped to', ver)
PY

rm -f "$NOTES_FILE"
git add -A
git commit -m "Release v$VER"
git tag "v$VER"
echo
echo "Done. Now run:  git push && git push --tags"
