#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"
for f in README.md docs/SETUP.md docs/TROUBLESHOOTING.md docs/CLEANUP.md \
  scripts/new-practice-repo.sh scripts/inspect-practice.sh \
  examples/starter-project/README.md examples/ci/git-checks.example.yml; do
  test -f "$f" || { echo "Missing $f" >&2; exit 1; }
done
[[ $(find chapters -name README.md | wc -l | tr -d ' ') == 10 ]] || { echo "Expected ten chapter guides" >&2; exit 1; }
for f in scripts/*.sh tests/*.sh publish-to-github.sh; do bash -n "$f"; done
python3 - "$ROOT" <<'PYLINK'
from pathlib import Path
import re,sys
root=Path(sys.argv[1]); missing=[]
for md in root.rglob('*.md'):
    if 'practice' in md.parts: continue
    text=md.read_text()
    # Links in markdown outside inline code and fenced examples (all authored links are regular)
    for target in re.findall(r'(?<!!)\[[^\]]+\]\(([^)]+)\)',text):
        if target.startswith(('https://','http://','#','mailto:')):continue
        target=target.split('#',1)[0]
        if target and not (md.parent/target).resolve().exists(): missing.append((str(md.relative_to(root)),target))
if missing:
    for m in missing: print('Broken link:',*m)
    raise SystemExit(1)
print('Static shell, file and Markdown link checks: passed')
PYLINK
