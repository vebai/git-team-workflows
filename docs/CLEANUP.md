# Cleanup

First confirm the intended repository and working state:

```bash
pwd
git rev-parse --show-toplevel
git status
git branch -avv
git remote -v
```

To remove an **already-integrated local feature branch**:

```bash
git branch --merged main
git branch -d FEATURE_BRANCH
```

Replace `FEATURE_BRANCH` with an actual branch name. If a squash merge means the branch isn't recognised as merged, inspect its commits before deciding what to do. Remote branch deletion and release-tag deletion are separate decisions; do not automate either.

To remove a disposable **local practice directory**, first leave it and inspect its path and contents. Remove it using your normal file manager only after confirming there is no work to preserve. Do not delete this repository as part of exercise cleanup.
