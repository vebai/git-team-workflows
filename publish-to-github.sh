#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$ROOT"
REPO="vebai/git-team-workflows"
command -v git >/dev/null || { echo 'Install Git first.' >&2; exit 1; }
command -v gh >/dev/null || { echo 'Install and authenticate GitHub CLI (gh) first.' >&2; exit 1; }
gh auth status >/dev/null || { echo 'Run gh auth login first.' >&2; exit 1; }
USER_LOGIN="$(gh api user --jq .login)"
if [[ "$USER_LOGIN" != 'vebai' ]]; then
  echo "Authenticated as $USER_LOGIN, expected vebai. Switch GitHub accounts first." >&2
  exit 1
fi
if [[ -e "$ROOT/.git" ]]; then
  echo 'This folder is already a Git repository. Inspect it and publish manually if appropriate.' >&2
  exit 1
fi
if gh repo view "$REPO" >/dev/null 2>&1; then
  echo "Repository already exists: $REPO. Refusing to overwrite or recreate it." >&2
  exit 1
fi
bash tests/validate-files.sh
printf '\nThis will create PUBLIC GitHub repository %s and push the packaged examples.\n' "$REPO"
printf 'No practice lab will be included; practice/ is ignored.\n'
read -r -p 'Type PUBLISH to continue: ' ACK
[[ "$ACK" == 'PUBLISH' ]] || { echo 'Cancelled.'; exit 1; }
git init -b main
git add -A
git diff --cached --check
git commit -m 'Publish Git Team Workflows companion exercises'
gh repo create "$REPO" --public --source=. --remote=origin --push
printf '\nPublished: https://github.com/%s\n' "$REPO"
