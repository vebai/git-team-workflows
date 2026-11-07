#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
NAME="${1:-}"
if [[ ! "$NAME" =~ ^[a-z0-9][a-z0-9-]{0,50}$ ]]; then
  echo "Usage: bash scripts/new-practice-repo.sh <lowercase-lab-name>" >&2
  exit 2
fi
command -v git >/dev/null || { echo "Git is not installed." >&2; exit 1; }
git config user.name >/dev/null 2>&1 || { echo "Configure Git user.name first." >&2; exit 1; }
git config user.email >/dev/null 2>&1 || { echo "Configure Git user.email first." >&2; exit 1; }
TARGET="$ROOT/practice/$NAME"
if [[ -e "$TARGET" ]]; then
  echo "Refusing to overwrite: $TARGET" >&2
  exit 1
fi
mkdir -p "$TARGET"
cp -R "$ROOT/examples/starter-project/." "$TARGET/"
git -C "$TARGET" init -b main >/dev/null
git -C "$TARGET" add -A
git -C "$TARGET" commit -m "Initial practice files" >/dev/null
printf 'Created: %s\n' "$TARGET"
printf 'Inspect with: git -C practice/%s status\n' "$NAME"
