# Chapter 9 — Connect Git activity to CI/CD evidence

**Goal:** Trace events through a CI run and understand why a passing job is only one piece of delivery evidence.

## Read the optional example

[`examples/ci/git-checks.example.yml`](../../examples/ci/git-checks.example.yml) demonstrates a minimal GitHub Actions check. It stays **outside** `.github/workflows/` in this companion repository, so publishing this repository does not activate it.

The example triggers on pull requests and pushes to `main`, checks out the source and verifies whitespace plus two expected project files. It has **no deployment step**.

## Optional hosted exercise

Use a **separate disposable** GitHub practice repository containing the files from `examples/starter-project`.

1. In that practice repository, create `.github/workflows/git-checks.yml` using the example as a starting point.
2. Commit the workflow to an authorised practice branch and open a PR.
3. Open the **Actions** tab and identify the event, workflow, job and step that ran.
4. Inspect actual logs and the final job conclusion.
5. Compare the CI result with the protection rules you configured in Chapter 8.

If you want an intentionally failing check, temporarily remove or rename one *required practice-project file* on a feature branch and observe the error. Restore the file, commit and verify a successful run before completing the PR.

## Read-only evidence checklist

- Which Git event triggered the workflow?
- Which commit SHA did it test?
- Which commands ran and what was their result?
- Did a protected branch require this check?
- Was anything published or deployed? (For this example, **no**.)

**Verify:** a successful push does not prove that a workflow ran; a green workflow does not prove a production deployment occurred.
