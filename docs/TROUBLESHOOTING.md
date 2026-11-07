# Troubleshooting

Inspect the evidence before applying a fix:

```bash
pwd
git rev-parse --show-toplevel
git status
git branch -vv
git remote -v
git log --oneline --graph --decorate --all -12
```

- **Not a Git repository:** inspect the path and `cd` to the correct practice directory.
- **Identity unknown:** set `user.name` and `user.email` with the intended identity.
- **Non-fast-forward push:** fetch and inspect divergent history. Do not force-push to clear the message.
- **Merge conflict:** inspect `git status`, open the conflicted file, resolve, stage and commit; use `git merge --abort` only when that is the intended rollback.
- **Permission denied on push:** verify the remote owner, URL and permitted authentication method. Do not paste credentials into a remote URL saved in an example.
- **Rejected by branch policy:** preserve your local commit on a feature branch, inspect the server's actual requirements and open a PR/MR.
- **Untracked files:** use `git status --short`, inspect each file and only then choose what to stage or remove.

Never use `git reset --hard`, `git clean -fd` or `git push --force` as a general-purpose repair command. Recovery drills belong in a disposable directory only.
