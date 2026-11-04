# Diagnose Git problems using evidence

When an action fails, first locate the correct directory and inspect the repository:

```bash
pwd
git status
git branch --show-current
git log --oneline --decorate -5
git remote -v
```

| Symptom | Inspect first | Safe next action |
| --- | --- | --- |
| `fatal: not a git repository` | `pwd`, `ls -la` | Change to the intended practice directory. |
| Identity unknown | `git config user.name`, `git config user.email` | Configure the intended author identity. |
| Authentication failed on HTTPS | `git remote -v` and credential-helper settings | Reauthenticate using your host's approved method; never embed tokens in remote URLs committed to a repository. |
| `Permission denied (publickey)` | `ssh -T git@github.com` (for GitHub) and loaded SSH keys | Verify the registered **public** key and correct account. |
| Push rejected (non-fast-forward) | `git fetch origin`, `git log --oneline --left-right --graph HEAD...origin/main` | Understand remote changes before selecting a merge/rebase integration. |
| Local changes would be overwritten | `git status`, `git diff`, `git diff --staged` | Commit, save or consciously discard changes after review; do not automatically reset. |
| Merge conflict | `git status`, conflict markers in the affected file | Construct the desired result, stage it and complete the merge; or `git merge --abort` where safe. |
| Rebase conflict | `git status` | Resolve then `git rebase --continue`, or use `git rebase --abort` if you need to return to the original state. |
| Detached HEAD | `git status`, `git log -1` | Create a branch to retain work before switching away. |
| Missing upstream branch | `git branch -vv`, `git remote -v` | If the branch and remote are correct, `git push -u origin HEAD`. |

## Recovery boundary

The scripts in this repository never run `git reset --hard`, `git clean -fd` or `git push --force`. Such operations can lose uncommitted or shared work. Use Chapter 6 in a disposable practice repository to understand their consequences before considering them elsewhere.
