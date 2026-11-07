# Git Team Workflows — Practice Code

Copy and run the examples in an isolated practice directory. Each chapter lists its starting state and the commands to use. Commands that modify Git history should **never** be run in this repository.

## Quick start

```bash
git clone https://github.com/vebai/git-team-workflows.git
cd git-team-workflows
```

Read [Setup](docs/SETUP.md) before starting. Use your own local directories and, where indicated, a separate hosted practice repository under your control.

## Exercises

| Exercise | Code and steps |
| --- | --- |
| 01 · First repository | [Open](chapters/chapter-01-first-repository/README.md) |
| 02 · Branches and history | [Open](chapters/chapter-02-branches-and-history/README.md) |
| 03 · Remotes | [Open](chapters/chapter-03-remotes/README.md) |
| 04 · Pull requests | [Open](chapters/chapter-04-pull-requests/README.md) |
| 05 · Merge, rebase, conflicts | [Open](chapters/chapter-05-merge-rebase-conflicts/README.md) |
| 06 · Recovery | [Open](chapters/chapter-06-recovery/README.md) |
| 07 · Tags and releases | [Open](chapters/chapter-07-tags-and-releases/README.md) |
| 08 · Branch protection | [Open](chapters/chapter-08-branch-protection/README.md) |
| 09 · CI/CD | [Open](chapters/chapter-09-cicd/README.md) |
| 10 · Final workflow | [Open](chapters/chapter-10-final-project/README.md) |

## Reusable files

- [Starter project](examples/starter-project/README.md) — independent practice files.
- [Practice-repo helper](scripts/new-practice-repo.sh) — sets up a separate, pre-committed repository.
- [Repository inspection helper](scripts/inspect-practice.sh) — prints branch and worktree state.
- [Pull request description](examples/review/PULL_REQUEST.example.md) and [contribution guide example](examples/review/CONTRIBUTING.example.md).
- [Optional CI configuration](examples/ci/git-checks.example.yml) — copy into a disposable project when practising workflows.
- [Troubleshooting](docs/TROUBLESHOOTING.md) and [Cleanup](docs/CLEANUP.md).

The helper creates a project with an initial commit; it is **not** a substitute for an exercise that explicitly starts from an empty repository. Use a separate remote for hosted exercises. Do not push experiment branches or release tags to this repository.
