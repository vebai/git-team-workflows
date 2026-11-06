# Chapter 4 — Review and merge the existing feature branch

**Manuscript alignment:** Sections 4.9–4.10. **Continue directly from Chapter 3** using the same hosted remote-practice repository and the already-pushed **feature/add-note** branch. A new docs/contribution-guide repository is not the book's primary Chapter 4 lab.

## Confirm the actual starting state

~~~bash
cd ~/remote-practice
git status
git branch -vv
git remote -v
git fetch origin
git branch -r
~~~

Use the alternative directory from Chapter 3 if you chose one. Verify that origin points to your **disposable** remote and that origin/feature/add-note exists. Do not continue with unrelated work or an unexpected remote.

## Open and inspect a real PR/MR

On your hosting platform, open a pull request or merge request with:

- **Source:** feature/add-note
- **Target:** main
- **Title:** Update README with remote connection note
- **Summary:** Updated README.md with a note about the remote connection
- **Why:** Readers should understand that the repository is connected to a remote
- **Testing:** Reviewed the intended Markdown locally
- **Risk:** Low; documentation-only change

Inspect the Files Changed tab, commits, source/target, review state and configured checks **before** integrating. If the repository has no automated checks or enforced approvals, say so; do not present absent controls as passing ones.

## Update the same PR after practice feedback

For independent practice, make one clarification on the **existing source branch**:

~~~bash
git switch feature/add-note
git status
echo "Changes are reviewed before merging into main." >> README.md
git diff
git add README.md
git diff --cached
git commit -m "Clarify remote connection note"
git push
~~~

Return to the **same** PR/MR in the browser. Confirm it displays the new commit and the README clarification. This demonstrates **change → inspect → commit → push → existing PR updates**. A solo update or self-review is not independent approval.

## Check readiness, integrate and verify locally

Inspect any requested reviews, mergeability, configured required checks and permitted merge methods. If GitHub/GitLab blocks integration, diagnose the displayed reason rather than bypassing a rule. Merge in the browser only when the platform and your policy permit it; confirm it reports a **merged** PR/MR and remote main contains the changes.

Then verify the integration in your local clone:

~~~bash
git switch main
git fetch origin
git log --oneline --graph --decorate --all
git merge --ff-only origin/main
cat README.md
git status
git branch -vv
~~~

The README should contain both the remote-connection note and the review clarification. If fast-forward fails, stop and inspect divergent history; do not force-reset main.

**Evidence chain:** Feature branch → hosted PR → review/update → merge → origin/main → local fast-forward → verified main.

**Optional standalone exercise:** The [example contribution guide](../../examples/review/CONTRIBUTING.example.md) can support a separate docs/contribution-guide PR for additional practice, but it does not replace the book's Chapter 3 → 4 branch continuity.
