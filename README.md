# Git Team Workflows

**The practical companion repository for _Git Team Workflows: A Practical Weekend Guide to Branches, Pull Requests, Merge, Rebase, Recovery, Releases, and CI/CD_ by Victor Ebai.**

## Work confidently with Git when other people depend on your changes

Knowing `git add`, `git commit` and `git push` is a start. Team engineering requires more: working on a feature branch without disturbing shared work, proposing a reviewable change, choosing merge or rebase appropriately, recovering from mistakes, and knowing which commit actually represents a release.

**Git Team Workflows** teaches these everyday decisions through a structured, hands-on weekend. It helps developers, DevOps and cloud engineers, system administrators and technical learners move from individual commands to **safe, repeatable collaboration**.

By completing the book, you will practise how to:

- Inspect a repository's current state before changing it.
- Work with commits and focused feature branches.
- Connect to remotes using HTTPS or SSH, fetch, pull and push deliberately.
- Propose changes through pull requests (PRs) or merge requests (MRs) and respond to feedback.
- Choose merge or rebase and resolve conflicts with evidence.
- Undo mistakes and recover commits using appropriate Git recovery tools.
- Identify a release with an annotated tag and verify what was published.
- Understand how branch protection, approvals and CI checks control shared changes.
- Complete an end-to-end team change: **Prepare → Branch → Change → Inspect → Share → Review → Verify → Integrate → Confirm → Tag → Verify → Clean up**.

The objective is not just learning Git syntax. It is learning when an action is safe, what it changes and how to verify the result.

### Discover the book

**_Git Team Workflows_ — Victor Ebai** is the full guided learning path: explanations, mental models, real teamwork decisions, safeguards and practice labs. The repository provides reusable starter files and exercise directions, but **the book can be followed independently**.

[Search for Git Team Workflows by Victor Ebai on Amazon UK](https://www.amazon.co.uk/s?k=Git+Team+Workflows+Victor+Ebai) · [Amazon US search](https://www.amazon.com/s?k=Git+Team+Workflows+Victor+Ebai)

These links open retailer searches, not a claim that a particular edition is currently listed.

## Use the companion repository

This repository contains small practice-project files, ten chapter guides, reference examples, and safe local setup scripts. **Do not use this public companion repository as the target for your Git experiments.** Create independent practice repositories.

### Prerequisites

- Git installed and configured with your own author name and email.
- A Bash-compatible terminal: macOS Terminal, Linux terminal or Git Bash on Windows.
- Optional: a GitHub or GitLab account for hosted remotes, PRs, branch protection and CI exercises.

Read [Setup and prerequisites](docs/SETUP.md) first.

### Quick start — isolated local practice

From the **cloned companion repository root**:

```bash
git --version
git config --global user.name
git config --global user.email
bash scripts/new-practice-repo.sh weekend-lab
cd practice/weekend-lab
git status
git log --oneline -3
```

The script creates a **new, separate Git repository** under `practice/weekend-lab`. It refuses to overwrite a folder that already exists. `practice/` is excluded from this companion repository's Git tracking.

Return to the companion repository when you need a new chapter guide:

```bash
cd ../..
```

Every chapter gives a suggested starting state, copyable commands, what to inspect and a safe stopping point. Some labs use a *fresh* practice repository; do not assume every chapter continues the same directory.

## Weekend learning path

| When | Chapters | What you'll practise |
| --- | --- | --- |
| Friday | [1](chapters/chapter-01-first-repository/README.md), [2](chapters/chapter-02-branches-and-history/README.md), [3](chapters/chapter-03-remotes/README.md) | Local Git, branches and remotes |
| Saturday | [4](chapters/chapter-04-pull-requests/README.md), [5](chapters/chapter-05-merge-rebase-conflicts/README.md), [6](chapters/chapter-06-recovery/README.md) | Review, integration and recovery |
| Sunday | [7](chapters/chapter-07-tags-and-releases/README.md), [8](chapters/chapter-08-branch-protection/README.md), [9](chapters/chapter-09-cicd/README.md), [10](chapters/chapter-10-final-project/README.md) | Releases, policy, CI and integrated teamwork |

The weekend schedule is a guide, not a deadline. Verify each step before continuing.

## Repository layout

```text
chapters/                 Ten reader-focused lab guides
examples/starter-project/ A tiny project copied into new practice repos
examples/ci/              Optional CI example (not automatically active)
examples/review/          PR description and contribution-guide examples
scripts/                  Local practice-repo setup and read-only inspection
docs/                     Setup, troubleshooting, command safety and cleanup
tests/                    Local, non-deploying repository file checks
practice/                 Your disposable Git labs (created locally, ignored)
```

## Verify before changing anything

```bash
git status
git branch --show-current
git log --oneline -5
```

When collaborating, also check `git remote -v` and `git fetch` deliberately before integrating shared changes. Follow **Status → Branch → History → Decide**, then inspect the result after every operation.

## Safety and cleanup

- Never try a destructive recovery command in a repository containing irreplaceable work.
- Do not run `git reset --hard`, `git clean -fd` or force pushes as general-purpose repair shortcuts.
- Use a **separate practice remote you own** for published branches, tags, pull requests and ruleset experiments.
- Read [Troubleshooting](docs/TROUBLESHOOTING.md) and [Safe cleanup](docs/CLEANUP.md) before deleting practice files or branches.

### Verification scope

The included file checks do not modify hosted repositories. Exercises involving hosted pull requests, protection and CI require your own separate practice repository and must be completed deliberately. No example in this companion repository automatically force pushes, deploys or rewrites shared Git history.
