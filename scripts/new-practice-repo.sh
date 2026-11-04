#!/usr/bin/env bash
set -euo pipefail
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
NAME="${1:-}"
if [[ ! "$NAME" =~ ^[a-z0-9][a-z0-9-]{0,50}$ ]]; then
  echo "Usage: bash scripts/new-practice-repo.sh <lowercase-lab-name>" >&2
  echo "Example: bash scripts/new-practice-repo.sh ch02-branches" >&2
  exit 2
fi
command -v git >/dev/null || { echo "Install Git first." >&2; exit 1; }
git config --global user.name >/dev/null 2>&1 || { echo "Configure git user.name first (see docs/SETUP.md)." >&2; exit 1; }
git config --global user.email >/dev/null 2>&1 || { echo "Configure git user.email first (see docs/SETUP.md)." >&2; exit 1; }
TARGET="$HERE/practice/$NAME"
if [[ -e "$TARGET" ]]; then
  echo "Refusing to overwrite existing folder: $TARGET" >&2
  exit 1
fi
mkdir -p "$TARGET"
cp -R "$HERE/examples/starter-project/." "$TARGET/"
git -C "$TARGET" init -b main >/dev/null
git -C "$TARGET" add -A
git -C "$TARGET" commit -m "Create isolated Git practice project" >/dev/null
printf 'Created isolated practice repository: %s\n' "$TARGET"
printf 'Next: cd practice/%s && git status && git log --oneline -3\n' "$NAME"
