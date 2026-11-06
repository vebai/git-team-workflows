# Chapter 10 — Complete the end-to-end Git team workflow

**Manuscript alignment:** Sections 10.3–10.4. Use a **new disposable hosted** repo with initial README.md and main branch. It is a learner practice environment, **not** the published book companion. The exact book branch is **feature/add-contributing-guide** and the final CONTRIBUTING.md includes **Reporting Issues**.

**Engineering path:** Prepare → Branch → Change → Inspect → Share → Review → Verify → Integrate → Confirm → Tag → Verify → Clean up.

## Preconditions — create and inspect the practice remote

Create a separate hosted project in an account you own, with an initial README and default main. If the local name ~/git-team-final already exists, choose another directory. Replace YOUR_PRACTICE_REMOTE_URL with its real URL.

~~~bash
cd ~
git clone YOUR_PRACTICE_REMOTE_URL git-team-final
cd git-team-final
git remote -v
git status
git branch --show-current
git switch main
git fetch origin
git merge --ff-only origin/main
git log -1 --oneline
~~~

If the fast-forward fails, diagnose divergence; never reset or force-push just to continue.

## Build — create the book's feature branch and contribution guide

~~~bash
git switch -c feature/add-contributing-guide
git branch --show-current
cat > CONTRIBUTING.md <<'EOF'
# Contributing to This Project

Thank you for considering contributing to this project.

## How to Contribute
1. Create a feature branch.
2. Make your changes.
3. Inspect and commit the intended changes.
4. Push the feature branch.
5. Open a pull request or merge request.
6. Respond to review feedback.
7. Integrate after the applicable requirements are satisfied.
EOF
git status
git add CONTRIBUTING.md
git diff --cached --check
git diff --cached
git commit -m "Add contribution guidelines"
git status
git log --oneline -3
git diff main...HEAD
git push -u origin feature/add-contributing-guide
~~~

**Verify:** the feature branch is published, main has not changed, the PR diff contains only the contribution guide.

## Review — update the **same** real PR

In GitHub/GitLab open a PR/MR from **feature/add-contributing-guide → main**. Describe summary, why, verification and risk. Inspect commits, changed files, applicable checks and approvals before merging.

Simulate this specific feedback: *Add a short issue-reporting section*. This is practice feedback, **not independent reviewer approval**. Update the same branch:

~~~bash
git switch feature/add-contributing-guide
cat >> CONTRIBUTING.md <<'EOF'

## Reporting Issues
If you find a bug, include:
- a clear description of the problem;
- steps to reproduce the issue; and
- the expected and actual behaviour.
EOF
git status
git diff
git add CONTRIBUTING.md
git diff --cached
git commit -m "Add issue reporting guidance"
git push
~~~

Return to the same PR. Verify the new commit and both sections appear. Add the manuscript's simulated feedback response as a PR comment if useful, but do not claim it is an independent approval. Satisfy actual required checks, approvals and permissions before clicking merge.

## Integrate, fetch, verify and tag only the intended release commit

Once the hosting platform reports the PR **merged**:

~~~bash
git switch main
git fetch origin
git log --oneline --graph --decorate --all
git merge --ff-only origin/main
git status
cat CONTRIBUTING.md
git log -1 --oneline
~~~

**Verify:** main contains both 'How to Contribute' and 'Reporting Issues'. Only after verifying the selected main commit, create and inspect the **annotated** tag:

~~~bash
git tag -a v1.0.0 -m "Release version 1.0.0"
git show v1.0.0
git remote -v
git push origin v1.0.0
git ls-remote --tags origin v1.0.0
~~~

The remote must be **your disposable project**, not vebai/git-team-workflows. A published tag proves source identity, not a successful build or deployment.

## CI/CD evidence and cautious clean-up

If that practice remote has CI/CD, inspect **actual** runs: event, commit, jobs, check results, enforced requirements and any release/deployment evidence. If none is configured, explicitly record that absence.

~~~bash
git branch --show-current
git status
git branch --merged main
git branch -d feature/add-contributing-guide
~~~

Only delete the branch if it has no unique work to preserve. A squash-merged PR may leave the local branch not considered merged; investigate the history before any optional forced removal. Do not automatically delete the remote branch.

**Final verification:** intended changes integrated on remote and local main; PR actually merged; selected annotated tag points to the intended commit and appears on the right remote; no unintended files or branches were lost; recorded CI evidence is not overstated.
