# 09 — CI/CD evidence

Use an existing CI-enabled practice project, or the [optional GitHub Actions example](../../examples/ci/git-checks.example.yml). The example checks whitespace and required files; it **does not deploy** anything.

## Inspect a Git revision

```bash
git rev-parse --show-toplevel
git status
git branch --show-current
git remote -v
git log -1 --format='%H %s'
```

**Hosted step:** Open the repository's Actions / CI page. Record the triggering event, tested commit SHA, job, step commands, actual output and final conclusion. Also inspect branch settings to see whether the check was **required**, rather than merely run.

## Optional: run the example in your own practice remote

The example expects these files at the **root** of your disposable repository:

```text
README.md
config/app.yaml
.github/workflows/git-checks.yml
```

Copy the files from [starter-project](../../examples/starter-project/README.md), then copy [git-checks.example.yml](../../examples/ci/git-checks.example.yml) to `.github/workflows/git-checks.yml` in that disposable repository. Commit and open a PR to trigger the check.

To practise diagnosis, remove a required file on a feature branch, commit and inspect the failed job. Restore the file and confirm the next run passes. Do not use the public examples repository for these experiments.

**Expected:** a green workflow confirms its configured checks only; it does not demonstrate an approval, a required branch rule or a deployment.
