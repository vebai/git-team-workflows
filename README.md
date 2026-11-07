# Git Team Workflows — Companion Repository

**Supporting code and hands-on exercises for _Git Team Workflows_ by Victor Ebai.**

This repository accompanies the book. The book explains the concepts, engineering decisions, safety precautions and troubleshooting approach; this repository gives you **copyable Git commands, small example files and chapter-by-chapter practice instructions**. Use the relevant chapter guide alongside the corresponding chapter in the book.

The examples are designed for practice. **Do not run history-changing exercises inside this cloned companion repository.** Use the separate local practice folders described in each guide, and your own disposable GitHub or GitLab repository when a chapter requires a hosted remote.

## How to use this repository

**1. Prepare Git.** Follow [Setup and prerequisites](docs/SETUP.md) to install Git, configure your commit identity and check your tools.

**2. Get the example files.** In your terminal, run:

```bash
git clone https://github.com/vebai/git-team-workflows.git
cd git-team-workflows
```

**3. Choose your chapter.** Open the matching guide under [`chapters/`](chapters/). Read its **starting state** and **where to run commands** before copying a code block. Some exercises continue work from an earlier chapter; others start in a fresh directory.

**4. Run and verify.** Copy commands into your terminal, replace clearly marked placeholders (such as `YOUR-USERNAME` or `YOUR_PRACTICE_REMOTE_URL`) with your own values, and compare the result with the guide's expected evidence. Stop and inspect unexpected Git errors rather than forcing the next command.

**5. Clean up only your practice work.** See [Cleanup](docs/CLEANUP.md) when finished. Keep the downloaded companion materials separate from experiments involving commits, reset, rebase, recovery, tags or remote pushes.

> **Where to type commands:** `git clone` above downloads this resource repository. A chapter command beginning with `cd ~` starts the exercise in your home directory; commands that refer to a project file must be run inside that project's directory. Use `git status` and `git remote -v` to confirm your location and destination before changing shared history.

## Chapter exercises

| Chapter | Copyable code and practice guide |
| --- | --- |
| 01 — First repository | [Create and inspect a Git repository](chapters/chapter-01-first-repository/README.md) |
| 02 — Branches and history | [Create a feature branch and inspect commits](chapters/chapter-02-branches-and-history/README.md) |
| 03 — Remote repositories | [Fetch, pull and push](chapters/chapter-03-remotes/README.md) |
| 04 — Pull requests | [Propose, review and integrate a change](chapters/chapter-04-pull-requests/README.md) |
| 05 — Merge, rebase and conflicts | [Compare histories and resolve a conflict](chapters/chapter-05-merge-rebase-conflicts/README.md) |
| 06 — Recovery | [Restore, reset, revert and recover safely](chapters/chapter-06-recovery/README.md) |
| 07 — Tags and releases | [Create and inspect annotated release tags](chapters/chapter-07-tags-and-releases/README.md) |
| 08 — Branch protection | [Understand hosted review and merge rules](chapters/chapter-08-branch-protection/README.md) |
| 09 — CI/CD | [Inspect CI evidence and optional checks](chapters/chapter-09-cicd/README.md) |
| 10 — Final workflow | [Complete a branch-to-release exercise](chapters/chapter-10-final-project/README.md) |

## Repository structure

```text
git-team-workflows/
├── README.md                 # Start here
├── chapters/                 # One practice guide per chapter (01–10)
├── examples/
│   ├── starter-project/      # Small files for independent practice
│   ├── review/               # Contribution and pull-request examples
│   └── ci/                   # Optional GitHub Actions example
├── scripts/
│   ├── new-practice-repo.sh  # Creates a separate starter repository
│   └── inspect-practice.sh   # Shows the state of a practice repository
└── docs/
    ├── SETUP.md              # Install and prepare Git
    ├── TROUBLESHOOTING.md    # Diagnose common problems
    └── CLEANUP.md            # Safely finish practice exercises
```

The starter-project helper is **optional**: it creates a repository with an initial commit, whereas some chapter exercises deliberately begin with an empty repository. Follow the chapter's required starting state first.

## Help and safe practice

Use [Troubleshooting](docs/TROUBLESHOOTING.md) when a command produces a different result. Keep credentials, tokens and private keys out of Git history. For hosted exercises, use a repository that you own or are authorised to modify—**not this public companion repository**.
