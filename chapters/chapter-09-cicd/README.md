# Chapter 9 — Trace Git activity to CI/CD evidence

**Manuscript alignment:** Section 9.7, Evidence Lab. This is an **observation and reasoning** exercise, not a requirement to build a pipeline. Focus on **repository event → configured response → run → job evidence → policy consequence**.

## Worked example — configuration determines what should happen

| Event | Hypothetical configured response | Evidence to seek |
| --- | --- | --- |
| Feature-branch push | Tests | Job result and logs |
| PR/MR updated | Tests and lint | New run for updated commit, result and logs |
| Integration into main | Integrated build | Build result and any configured artefact |
| Matching v* tag published | Release workflow | Actual tag-triggered run and artefact, if configured |

These are **example policies**, not universal GitHub defaults. The event does not prove that a workflow was configured, triggered or completed. A green check proves only its explicitly configured conditions.

## Primary practical — inspect this companion's real workflow

This companion **now has an active GitHub Actions workflow** at [validation.yml](../../.github/workflows/validation.yml). It runs on PRs targeting main and pushes to main. It checks the repository structure, Markdown links, tracked-source whitespace and required files. It **does not deploy software**.

Inspect the [repository's Actions page](https://github.com/vebai/git-team-workflows/actions) and an actual run. Record:

1. Trigger event (pull_request or push), branch and head SHA.
2. Workflow name and job name.
3. Commands run and observed passing/failing steps.
4. Whether the result was required by the repository's protection policy (inspect the actual policy, do not infer).
5. Whether a build artefact, versioned release or deployment occurred (**none is defined in this validation workflow**).

Read the [active workflow](../../.github/workflows/validation.yml) and the separate [optional practice workflow](../../examples/ci/git-checks.example.yml). They serve different purposes. The optional example is inert while it remains outside a practice repository's .github/workflows directory.

## Optional Path A — inspect another CI-enabled repository

Where you have permission, verify the starting state before claiming evidence:

~~~bash
git rev-parse --show-toplevel
git remote -v
git status
git branch --show-current
git log -1 --oneline
~~~

Find its configured triggers, checkout action, tests and required checks. Compare one **actual run** with the exact commit the server says it tested. Separate **test passed** from **merge allowed** and **deployment verified**.

## Optional Path B — exercise the safe example in your own lab

The [starter project](../../examples/starter-project) contains the required README.md and config/app.yaml files. In your **own disposable hosted practice repository**, place the contents at the repository root and copy [git-checks.example.yml](../../examples/ci/git-checks.example.yml) to .github/workflows/git-checks.yml there.

Observe an actual PR run. To practise diagnosis, deliberately remove one required practice file on a feature branch, inspect the failed job, restore the file, commit and verify a passing rerun. Keep the published companion unmodified by this optional lab.

**Evidence boundary:** Workflow success ≠ required merge gate; required gate satisfied ≠ application correctness; tag published ≠ deployed release.
