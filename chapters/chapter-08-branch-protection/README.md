# 08 — Branch protection

**Starting state:** a **disposable hosted** repository in an account where you may inspect or configure branch protection. Do not change rules on a shared production project.

## Inspect first

```bash
git rev-parse --show-toplevel
git status
git remote -v
git switch main
git fetch origin
git merge --ff-only origin/main
git log -1 --oneline
```

**Hosted step:** In your practice repository's Settings, inspect rulesets or branch protection for main. If supported, enable one appropriate requirement, such as a PR before merging or a required check. Observe what GitHub/GitLab actually enforces; simply running a check does not make it required.

## Test through a feature branch

```bash
git switch -c feature/protection-test
echo "Protection test" > protection-test.txt
git status
git add protection-test.txt
git diff --cached
git commit -m "Test protected branch workflow"
git push -u origin feature/protection-test
```

**Hosted step:** Open a PR/MR targeting main. Inspect the mergeability message, unmet requirements, checks and approvals. If a rule blocks integration, satisfy it through the normal workflow rather than bypassing it.

## Preserve a commit after a rejected push

If a disposable practice remote rejects a commit you made locally on main, the commit remains in your clone. From that specific rejected commit, create a feature branch:

```bash
git switch -c feature/protected-work
git log -1 --oneline
git remote -v
git push -u origin feature/protected-work
```

Do this **only** in a disposable repository where that is the intended branch and you have permission to push it. Resetting main is a separate decision.

**Expected:** record which rule the server actually enforced and which observations were only simulations. If your account cannot configure protection, inspecting the available rules is sufficient; do not claim an absent rule was enforced.
