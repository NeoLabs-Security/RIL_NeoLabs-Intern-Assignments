# Week 4 — Broken Gate: Authorization and Entitlements

Scenario: `w04-broken-gate`. Version 1.0.0; reviewed 2026-10-23.
Status: draft assignment pack; not a release announcement. Begin only when the mentor publishes this scenario for your assigned track/pod. Deadline and final rubric: programme lead / assigned Issue; not set by this pack.

## Operation Cross-Course

VCC introduced separate course areas. Some synthetic learners report missing expected access; others report seeing material outside their enrolment. Investigate what each identity should access, what actually happened and what evidence supports the conclusion. All accounts, courses and data are synthetic. This is individual, noncompetitive work; tracks can complete asynchronously.

## Shared policy and boundaries

- Authentication identifies an account; successful login does not grant every course.
- Active course enrolment permits course material. Another student's private assignment requires explicit authority; enrolment alone is insufficient.
- An instructor's teaching authority is scoped to assigned courses. Support uses approved tickets and read-only investigation, with any correction requiring server-side approval.
- Platform access and course enrolment are distinct. Local role/pod edits grant nothing.
- Use the current server-issued five-pod assignment, track, target and window. No public EC2 targets, other pods, production, direct database/shell access or broad scanning. No password guessing, destructive changes or automatic IP blocking.
- When no live target is published, stop live request testing. SOC may use authorized replay; Support may use authorized archived tickets. Do not infer a live target from an old URL.

Stop and contact a mentor if other-pod resources, real data, secrets, unexpected infrastructure access, unapproved state changes or instability appear. Stop once a minimal approved proof establishes the finding. The only permitted write is a bounded synthetic announcement update explicitly published by the server, with the required confirmation; otherwise remain read-only.

## Track briefs and submission

Use [SOC](soc.md), [Pentest](pentest.md) or [Support](support.md). Follow `CONTRIBUTING.md`: branch `week-04/<track>/<github-username>-broken-gate`, work under `submissions/week-04/<track>/<github-username>/`, open a PR linking the assigned Issue and leave it open for mentor review.

Every report must state scenario, assigned pod, synthetic account alias, UTC investigation window and safe evidence IDs. Redact passwords, bearer tokens, cookies, Set-Cookie, Access Codes, signed URLs, private keys and real personal data. Use relative target paths in portable evidence; do not commit private connection/session files. Preserve original event time separately from replay/ingestion time.

## Proposed rubric, subject to instructor approval

| Track | Assessment weights |
|---|---|
| Pentest | Baseline 20%; bounded evidence 35%; policy failure/impact 25%; remediation/retest 20% |
| SOC | Indexed-event validation 20%; timeline/objects 35%; actual versus expected decision 30%; response/detection note 15% |
| Support | Identity/entitlement verification 25%; chronology 25%; escalation/approval decision 30%; validation/documentation 20% |

Do not use a proposed weight as an official grading decision until confirmed in the assignment Issue.

References: current track ROE and VCC policy table; [OWASP Authorization Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Authorization_Cheat_Sheet.html); [OWASP API object authorization](https://owasp.org/API-Security/editions/2023/en/0xa1-broken-object-level-authorization/).
