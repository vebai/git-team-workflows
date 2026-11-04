# Chapter 4 — Review changes with a pull request

**Goal:** Propose a focused change, explain it, observe feedback and integrate only when appropriate.

**Starting state:** A disposable GitHub/GitLab repository in **your own account**, initialised with `README.md`, with `main` as its default branch. You need permission to create branches and open PRs/MRs. The companion repo is not the PR destination.

From a directory outside this companion repository, clone your practice remote:

```bash
git clone YOUR_PRACTICE_REMOTE_URL git-review-lab
cd git-review-lab
git status
git switch -c docs/contribution-guide
```

Replace `YOUR_PRACTICE_REMOTE_URL` with the URL of **your** repository. Add a short contribution guide, using `examples/review/CONTRIBUTING.example.md` as an optional reference. You can copy it from the companion repository or write a shorter version yourself.

```bash
printf '# Contribution guide\n\nCreate a focused branch and request review.\n' > CONTRIBUTING.md
git add CONTRIBUTING.md
git diff --staged
git commit -m "Add contribution guide"
git push -u origin docs/contribution-guide
```

On your hosting platform, open a PR/MR **from `docs/contribution-guide` into `main`**. Use the description prompts from `examples/review/PULL_REQUEST.example.md`. Inspect the Files Changed tab before approving anything.

For solo practice, edit `CONTRIBUTING.md` once more on the branch, commit and push; observe the PR update. A self-review or simulated comment is **practice**, not an independently enforced team approval.

**Verify:** review the branch, PR target, diff, checks and actual merge state. Only merge the disposable practice PR when it is appropriate and permitted by the repository policy.
