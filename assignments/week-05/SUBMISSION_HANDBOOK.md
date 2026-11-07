# Week 05 — Submission Handbook (draft; mentor release required)

**Scenario:** `w05-poisoned-upload` · **Activity:** Operation Poisoned Upload · **Status:** not published until all student access gates pass.

## Repository submission path and branches

Use the existing **RIL_NeoLabs-Intern-Assignments** repository, not the VCC server or a separate student toolkit. Work only under:

```text
submissions/week-05/<track>/<github-username>/
```

`<track>` must be exactly **pentest**, **soc**, or **support**. Suggested branch:

```text
week-05/<track>/<github-username>-poisoned-upload
```

For example, a Support intern with GitHub username `exampleuser` uses `week-05/support/exampleuser-poisoned-upload`. Do **not** write directly to `main` or another student's folder.

## Minimum submission files

| Track | Required Markdown files (inside your own folder) | Starter templates |
|---|---|---|
| Pentesting | `finding.md`, `evidence-register.md` | `assignments/week-05/templates/pentest-finding.md`, `evidence-register.md` |
| SOC | `incident-report.md`, `evidence-register.md` | `soc-incident-report.md`, `evidence-register.md` |
| Support | `ticket-resolution.md`, `evidence-register.md` | `support-ticket-resolution.md`, `evidence-register.md` |

Include only sanitized and relevant screenshots, preferably in a local `evidence/` folder linked from your evidence register. Support interns may attach the Incident Desk-generated Markdown as additional evidence; review/redact it before committing.

### Evidence required from ALL tracks

1. Exact assigned `pod-XX`, current Week 05 scenario, and UTC testing window.
2. Source of authorization: mentor-issued current assignment/Issue and real broker scope (without posting tokens).
3. Exact `event_id`, `request_id` and `upload_id` wherever the runtime provided them; report missing IDs honestly.
4. Evidence of abnormal acceptance, detection, authorized containment, remediation retest, or relevant negative control as appropriate to track.
5. Distinguish central **Wazuh indexed alert** proof from local raw log or broker delivery. Never invent a `rule.id`.
6. Constraints, limitations, escalation, lessons and next steps.

### PR procedure

After the mentor publishes Week 05 and your approved Issue:
1. Pull the latest assignment repository `main` branch and create your **own** correctly named Week 05 branch.
2. Create `submissions/week-05/<track>/<github-username>/`.
3. Copy the correct two starter templates into that folder and fill all required sections using **your own assigned pod evidence**.
4. Check that every relative evidence link resolves and no credentials, cookies, raw Authorization headers, public-key **private material**, handoff URLs or uploaded binaries are committed.
5. Commit the sanitized files. Open a Pull Request **into main**, reference the assigned mentor Issue, and **leave it open** for assessment.
6. The mentor, not the intern, decides whether to merge.

**No student should merge or run release/publisher commands.** The due date, grading weights, incident owner and final approval come from the individual Week 05 mentor Issue; none are assumed here.

## Coordinated scenario and evidence expectations

- **Pentest:** valid 1×1 PNG (201), harmless text masquerading as JPG (201 in vulnerable release, 415 in fixed), unsupported TXT (415). Save exact original event IDs. No code execution, malware or broad scans.
- **SOC:** confirm central-indexed Wazuh rules 100190 (legitimate PNG), 100191 (vulnerable accepted mismatch), 100192 (rejection) and 100193 (approved Support quarantine), in the correct pod. A higher-severity rule may supersede a baseline rule on the same event; report accurately.
- **Support:** verify source mismatch, SHA-256, upload ID, preserve pre-change evidence, obtain mentor approval, quarantine one exact synthetic artifact, record the **new** containment event ID and independently obtain SOC's 100193 index confirmation. The Student Support Desk is authorized only when published by the existing broker.

Do **not** quarantine or restore arbitrary files, attach synthetic upload binaries or claim that existing W04 access codes authorize W05 before official broker publication.

## Minimum local review checklist

Before opening a PR, check:
- Correct `submissions/week-05/<track>/<username>/` path and approved Week 05 Issue.
- Both required Markdown documents present and contain no unfilled placeholders.
- Consistent exact pod, scenario, incident reference and UTC times across documents.
- Distinct original-upload and quarantine event IDs when containment happened.
- Real fixed-release results or an explicit `NOT PERFORMED` explanation.
- No secrets, other students' pod data, raw payload bytes or unapproved live endpoints.

**Stop conditions:** If current broker says W04, no W05 student-ready resource is published, SSH tunnel identity is missing, scope is wrong or central Wazuh event-ID correlation fails, stop and contact the mentor. **Do not** use mentor-preview credentials as a workaround.
