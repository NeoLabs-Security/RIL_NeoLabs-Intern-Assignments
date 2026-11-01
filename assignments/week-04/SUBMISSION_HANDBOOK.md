# Week 4 — Submission Handbook (All Three Tracks)

**Scenario:** `w04-broken-gate` · **Official repository:** `NeoLabs-Security/RIL_NeoLabs-Intern-Assignments`

This handbook provides the actual submission procedure. Read the [Week 4 assignment](README.md), the relevant [Pentest](pentest.md), [SOC](soc.md) or [Support](support.md) brief, and [CONTRIBUTING](../../CONTRIBUTING.md). Deadlines and final grading are set by the mentor's assigned GitHub Issue; this document does not invent them.

## Common requirements

- Confirm your server-issued track, `pod-XX`, `w04-broken-gate`, authorized time window and Issue **before** testing. No another-pod access, public VCC scanning or destructive actions.
- Preserve UTC event times separately from local collection/indexing times.
- Record the synthetic identity alias, safe relative target or ticket ID, request/event IDs, response outcomes, the intended policy and the evidence that supports each conclusion.
- Remove Access Codes, the shared student-profile password, private tunnel keys, Wazuh/dashboard logins, bearer tokens, cookies, URLs containing credentials, and real data from **every** committed file (including screenshots and command transcript).
- Keep original evidence on your authorized machine; commit only sanitized minimal proof. Do not commit private runtime files.
- Individual submission; a completed finding/incident/triage report can legitimately conclude **no violation observed** or **verification pending** if evidence supports that outcome. Never invent a vulnerable result.

## Track paths and files

| Track | Branch name | Submission directory | Required files |
|---|---|---|---|
| Grey-Box Pentest | `week-04/pentest/<github-username>-broken-gate` | `submissions/week-04/pentest/<github-username>/` | `finding.md`, `baseline-and-retest.md`, `evidence-register.md`, sanitized `evidence/` |
| SOC Analyst | `week-04/soc/<github-username>-broken-gate` | `submissions/week-04/soc/<github-username>/` | `incident-report.md`, `timeline.md`, `queries.md`, `detection-note.md`, `evidence-register.md` |
| IT Security Support | `week-04/support/<github-username>-broken-gate` | `submissions/week-04/support/<github-username>/` | `ticket-resolution.md`, `chronology.md`, `evidence-register.md`, `kb-note.md` |

Templates live in `assignments/week-04/templates/`: `finding.md` for Pentest, `incident-report.md` for SOC, `ticket-resolution.md` for Support. The additional journals can be concise Markdown files with dated entries. Only attach evidence you are allowed to share with the assigned Issue reviewers.

## Exact Git workflow on Linux

**Run these commands in the separate Assignments repository**, not the SOC/Pentest/Support toolkit. If you do not have write permission on the organization repository, use your own fork and open the PR against the organization `main`; do not request a token from another student.

```bash
git clone https://github.com/NeoLabs-Security/RIL_NeoLabs-Intern-Assignments.git
cd RIL_NeoLabs-Intern-Assignments
git switch main
git pull --ff-only origin main

# Replace BOTH placeholders with your own track and GitHub username.
TRACK="<pentest-or-soc-or-support>"
USERNAME="<your-github-username>"

git switch -c "week-04/$TRACK/$USERNAME-broken-gate"
mkdir -p "submissions/week-04/$TRACK/$USERNAME/evidence"
```

Choose **only one** corresponding template command:

```bash
# Pentest students:
cp assignments/week-04/templates/finding.md \
  "submissions/week-04/pentest/$USERNAME/finding.md"

# SOC students:
cp assignments/week-04/templates/incident-report.md \
  "submissions/week-04/soc/$USERNAME/incident-report.md"

# IT Security Support students:
cp assignments/week-04/templates/ticket-resolution.md \
  "submissions/week-04/support/$USERNAME/ticket-resolution.md"
```

Fill your report with the *real observations and evidence*. Add the additional files for your track and sanitize them. Then:

```bash
git status --short
git add "submissions/week-04/$TRACK/$USERNAME"
git diff --cached --stat
git diff --cached --check

# Inspect the staged file names AND contents for exposed secrets before committing.
git diff --cached

git commit -m "docs: submit Week 4 $TRACK investigation"
git push -u origin "week-04/$TRACK/$USERNAME-broken-gate"
```

Open a GitHub pull request from `week-04/$TRACK/$USERNAME-broken-gate` into `main` in the **Assignments** repository. Include your assigned Issue link and a 2–4 sentence summary, exact pod/scenario, key evidence IDs, observed/pending outcome and any help needed. **Do not merge your own PR.** Do not put passwords or private session material in the PR description.

Windows PowerShell students may use the same `git` commands; replace shell variable syntax and POSIX `cp/mkdir` as appropriate, or create the files using the editor.

## Pentest evidence checklist

Use the [Pentest toolkit Week 4 student runbook](https://github.com/NeoLabs-Security/RIL_NeoLabs-GreyPentesting-interns-toolkit-/blob/main/docs/week-04/STUDENT_RUNBOOK.md).

- One known valid login, own-course successful baseline and expected protected denial where available; exact authorized relative paths; no guessing or scanning.
- `event_id` and `request_id` correlation to VCC/SOC, UTC timestamp, synthetic alias, resource ID, HTTP status and sanitizer notes.
- `100141` is a normal authorization check. Only report `100142` when **independent intended policy**, actual allow, expected deny, HTTP 200 and `policy_violation` agree for an authorized fixture; a 200 alone proves no vulnerability.
- Server-side remediation, severity reasoning, test limitations and a separately approved fixed retest or `PENDING`.

## SOC evidence checklist

Use the [SOC toolkit Week 4 student runbook](https://github.com/NeoLabs-Security/RIL_NeoLabs-SOC1-interns-toolkit-/blob/main/docs/week-04/STUDENT_RUNBOOK.md).

- Central Wazuh dashboard access is **mentor-issued**; a local `bash neolabs doctor` pass alone does not prove the central index has data.
- Search `wazuh-alerts-*` with pod, scenario, original time and exact request/event filters; document how rule `100141` or `100142` correlated to authorized activity.
- UTC timeline, queries, event and request IDs, expected and actual decisions, source IP provenance limitation, false positives/detection gaps, response proposal and pending retest as applicable.

## IT Security Support evidence checklist

Use the [Support toolkit Week 4 student runbook](https://github.com/NeoLabs-Security/RIL_NeoLabs-ITSEC-Support-Interns-Toolkit/blob/main/docs/week-04/STUDENT_RUNBOOK.md).

- Record only server-issued ticket IDs and `entitlements --ticket` read-only snapshots; separate platform access, course enrolment, resource ownership and scoped instructor authority.
- Document correct denial vs suspected violation vs access correction requiring operator approval.
- SOC handoff should cite safe ticket/pod/actor/resource/time/evidence IDs without transferring passwords or dictating SOC conclusions.
- Submit an actual validation result only when observed; otherwise label `PENDING` and state who must approve/execute the next action.

## Before opening the PR

Review the report and evidence directory for confidentiality, consistent pod/scenario, original UTC timestamps, correct track folder, filename/template completeness, reproducible authorized steps, and separation of fact/inference. If the assignment Issue specifies a different deadline or additional rubric, follow that Issue. Keep the PR open for mentor feedback.
