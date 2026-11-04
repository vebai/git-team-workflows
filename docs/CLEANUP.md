# Clean up practice work safely

All exercise repositories created by `scripts/new-practice-repo.sh` live under this companion repository's **ignored** `practice/` directory. The publishing script does not send these repositories to GitHub.

## 1. Inspect before deletion

From the companion repository root:

```bash
ls -la practice
git status --short
```

Inspect any individual practice repository you intend to remove:

```bash
git -C practice/ch01-first-repo status
git -C practice/ch01-first-repo log --oneline -5
```

If you published the exercise to your own GitHub/GitLab account, confirm the relevant work and tag have been preserved before considering local cleanup. Deleting a **local** directory does not remove a **hosted** repository.

## 2. Remove only a disposable repository you have inspected

Use your file manager, or remove the specifically identified practice folder after confirming it contains nothing you need. Do **not** delete the companion repository's root, `.git` directory or unrelated work.

## 3. Hosted practice repositories

For an optional remote practice repository, open its Settings page and use the platform's delete process only when you are certain no valuable shared work depends on it. Check branch protection and required permissions first. The companion publishing script never deletes hosted repositories.

## 4. Do not clean up with a broad Git command

Avoid global `git clean -fdx`, `git reset --hard` and force-pushing as shortcuts. These commands have a much wider effect than deleting one known disposable exercise directory.
