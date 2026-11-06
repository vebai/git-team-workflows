#!/usr/bin/env bash
set -euo pipefail

# Structural/manuscript-continuity audit.
# This is NOT a substitute for running Git labs or inspecting real hosted evidence.
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

failures=0
checks=0
expect() {
  local path="$1" needle="$2"
  checks=$((checks + 1))
  if [[ ! -f "$path" ]]; then
    printf 'FAIL | missing guide: %s\n' "$path" >&2
    failures=$((failures + 1))
    return
  fi
  if ! grep -Fq -- "$needle" "$path"; then
    printf 'FAIL | %s missing manuscript anchor: %s\n' "$path" "$needle" >&2
    failures=$((failures + 1))
  fi
}
c1="chapters/chapter-01-first-repository/README.md"
c2="chapters/chapter-02-branches-and-history/README.md"
c3="chapters/chapter-03-remotes/README.md"
c4="chapters/chapter-04-pull-requests/README.md"
c5="chapters/chapter-05-merge-rebase-conflicts/README.md"
c6="chapters/chapter-06-recovery/README.md"
c7="chapters/chapter-07-tags-and-releases/README.md"
c8="chapters/chapter-08-branch-protection/README.md"
c9="chapters/chapter-09-cicd/README.md"
c10="chapters/chapter-10-final-project/README.md"

expect "$c1" "git-practice"
expect "$c1" "Initial project setup"
expect "$c1" "example.log"
expect "$c2" "Continue the git-practice repository from Chapter 1"
expect "$c2" "feature/add-team-notes"
expect "$c2" "main...feature/add-team-notes"
expect "$c3" "remote-practice"
expect "$c3" "feature/add-note"
expect "$c3" "git fetch origin"
expect "$c3" "git pull --ff-only origin main"
expect "$c4" "Continue directly from Chapter 3"
expect "$c4" "feature/add-note"
expect "$c4" "git merge --ff-only origin/main"
expect "$c5" "merge-rebase-lab"
expect "$c5" "feature/merge-test"
expect "$c5" "feature/rebase-test"
expect "$c5" "conflict-lab"
expect "$c5" "Main branch content"
expect "$c5" "Feature branch content"
expect "$c6" "recovery-lab"
expect "$c6" "git reset --soft HEAD~1"
expect "$c6" "git reflog"
expect "$c6" "recovered-work"
expect "$c7" "v0.1.0"
expect "$c7" "v1.0.0"
expect "$c7" "v1.0.1"
expect "$c7" "maintenance/1.0"
expect "$c7" "v0.9.0"
expect "$c8" "server-side policy"
expect "$c8" "feature/protected-work"
expect "$c8" "not evidence of required approvals"
expect "$c9" ".github/workflows/validation.yml"
expect "$c9" "does not deploy software"
expect "$c9" "not a requirement to build a pipeline"
expect "$c10" "feature/add-contributing-guide"
expect "$c10" "## Reporting Issues"
expect "$c10" "git ls-remote --tags origin v1.0.0"
expect "$c10" "simulated feedback"

# Assert existing examples and validation checks were retained.
for path in \
  scripts/new-practice-repo.sh \
  scripts/inspect-practice.sh \
  tests/validate-files.sh \
  examples/ci/git-checks.example.yml \
  examples/review/CONTRIBUTING.example.md \
  .github/workflows/validation.yml; do
  checks=$((checks + 1))
  if [[ ! -f "$path" ]]; then
    printf 'FAIL | existing supporting file missing: %s\n' "$path" >&2
    failures=$((failures + 1))
  fi
done

# Verify the active workflow invokes this structural audit.
expect ".github/workflows/validation.yml" "bash tests/validate-chapter-alignment.sh"

if (( failures != 0 )); then
  printf 'FAIL | manuscript alignment audit: %s failures in %s checks\n' "$failures" "$checks" >&2
  exit 1
fi
printf 'PASS | manuscript v7 guide alignment: %s checks; 10 chapters; supporting files retained\n' "$checks"
