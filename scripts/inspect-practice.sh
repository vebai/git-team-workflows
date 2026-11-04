#!/usr/bin/env bash
set -euo pipefail
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
NAME="${1:-}"
if [[ ! "$NAME" =~ ^[a-z0-9][a-z0-9-]{0,50}$ ]]; then
  echo "Usage: bash scripts/inspect-practice.sh <lab-name>" >&2; exit 2
fi
REPO="$HERE/practice/$NAME"
if [[ ! -d "$REPO/.git" ]]; then echo "No local practice repo: $REPO" >&2; exit 1; fi
printf '\n== Working tree ==\n'
git -C "$REPO" status --short --branch
printf '\n== Branches ==\n'
git -C "$REPO" branch -avv
printf '\n== Recent commits ==\n'
git -C "$REPO" log --oneline --decorate -8
printf '\n== Remotes ==\n'
git -C "$REPO" remote -v
