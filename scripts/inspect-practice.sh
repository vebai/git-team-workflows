#!/usr/bin/env bash
set -euo pipefail
TARGET="${1:-.}"
echo "Repository: $TARGET"
git -C "$TARGET" rev-parse --show-toplevel
git -C "$TARGET" status
git -C "$TARGET" branch -vv
git -C "$TARGET" remote -v
git -C "$TARGET" log --oneline --graph --decorate --all -10
