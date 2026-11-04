# Chapter 8 — Understand branch protection and review gates

**Goal:** Distinguish local Git operations from rules enforced by a hosted repository.

**Starting state:** A disposable hosted repository in your own GitHub/GitLab account, with a default `main` branch and a feature branch. Use the host's web interface.

## Inspect the policy first

1. Open your practice repository's **Settings** page.
2. Find branch protection or repository rules/rulesets (availability and labels depend on your provider and plan).
3. Check whether changes to `main` require a PR/MR, approvals, passing checks and up-to-date target-branch state.
4. Check which identities, if any, may bypass the rules.
5. **Do not change restrictions on an important shared or production repository.**

In your local **practice** clone, collect evidence:

```bash
git status
git branch --show-current
git remote -v
git fetch origin
git branch -avv
```

## Optional policy test

If your account and host settings permit it, enable a modest rule **only on your disposable repository**, then propose a change through a PR rather than directly pushing to `main`. Examine the actual review/check requirements. Record which requirement is enforced and which you have merely simulated.

**Troubleshooting:** if a push or merge is rejected, inspect the message and repository rules. Preserve your feature branch and submit the intended change through the approved path; do not bypass the protection or force push.

**Verify:** Describe what the platform enforces, whether a required check ran, and why a merge did or did not proceed. A local branch name alone does not enforce protection.
