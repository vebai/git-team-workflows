# Chapter 8 — Evaluate branch protection as an evidence gate

**Manuscript alignment:** Section 8.10, Practice Lab. A Git branch name does not enforce a server-side policy. The **required** book work is the decision model and recovery reasoning; observing actual GitHub/GitLab enforcement is **optional** and needs an authorised, disposable hosted repository.

## Worked example — what permits integration?

Assume a server requires both an approved review and a passing required check, with sufficient permissions and all other conditions satisfied.

| Observed evidence | Is integration eligible? | Reason |
| --- | --- | --- |
| Approval missing; required check PASS | **No** | Required review is absent |
| Approval present; required check FAIL | **No** | Required automated evidence is unsatisfied |
| Approval present; required check PASS | **Potentially yes** | Other configured requirements and permissions must still be satisfied |

**Decision rule:** passing one requirement does not cancel another failing or missing requirement. A successful workflow run does **not** by itself prove that a check was configured as **required**.

## Recovery scenario — rejected direct main push

This is a conceptual exercise unless you have a disposable remote configured to reject direct pushes. Suppose a locally committed change on main is rejected by the server:

~~~bash
git push origin main
~~~

A rejected push **does not delete the local commit**. In an explicitly disposable repository where the rejected commit is still HEAD, preserve it on a feature branch:

~~~bash
git switch -c feature/protected-work
git branch --show-current
git log -1 --oneline
git push -u origin feature/protected-work
~~~

Only execute the final push when you have verified the correct disposable remote and have feature-branch permissions. Local main may still reference the commit; resetting main is a separate decision **not required** by this recovery exercise.

## Optional Path A — inspect and test real protection

Use a disposable hosted repo whose settings you may administer. **Do not enable/disable restrictions on an important shared repository.** First establish the intended starting state:

~~~bash
git rev-parse --show-toplevel
git remote -v
git status
git switch main
git fetch origin
git merge --ff-only origin/main
git log -1 --oneline
~~~

In GitHub or GitLab, inspect the current repository settings for branch protection or rulesets. If available, enable **one** suitable requirement for main, such as integration through a PR or a required check. Then create a normal feature branch and open a PR:

~~~bash
git switch -c feature/protection-test
echo "Protection test" > protection-test.txt
git status
git add protection-test.txt
git diff --cached
git commit -m "Test protected branch workflow"
git push -u origin feature/protection-test
~~~

In the hosting interface, record **which actual rule** applies, the displayed merge eligibility and whether the requirement was satisfied. Do not assume that a blocked merge or rejected push proves a particular rule without inspecting the evidence.

## Optional Path B — inspect existing rules without changing them

If you cannot administer branch protection, inspect the policy and PR/MR state of a repository you are permitted to view. Record observed requirements and unresolved conditions. If rules are unavailable, explicitly record **not enforced / not verified**, rather than treating a local simulation as hosted protection.

**Companion note:** The public book repository has been used to demonstrate a real PR and CI checks. Those observations are **not evidence of required approvals or enforced branch protection** unless the server's actual rules and integration decisions demonstrate it.
