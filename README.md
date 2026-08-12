# NeoLabs × Renaissance Innovation Labs Cybersecurity Internship

## Central Assignments Repository

This repository is the **official work-record and graded-submission repository** for the NeoLabs × Renaissance Innovation Labs (RIL) Cybersecurity Internship.

> ## 🚀 CURRENT WEEK — WEEK 01
> **Operation Night Watch** is now live. Start at [`assignments/week-01/README.md`](assignments/week-01/README.md), then open only your assigned track brief.

Use the track toolkit repositories for shared learning materials and safe practice resources. **All graded assignments, evidence, mentor feedback, revisions and final submissions belong here.**

## Tracks

- **SOC Analyst Level 1** — monitoring, log analysis, alert investigation, incident triage, reporting and detection improvement.
- **Grey-Box Penetration Testing** — authorised reconnaissance, web/application testing, vulnerability validation, reporting and retesting within written scope.
- **IT Security Support** — endpoint, identity, networking, access, ticketing, containment, recovery and security-support documentation.

## Week 1 start sequence

1. Open [`assignments/week-01/README.md`](assignments/week-01/README.md).
2. Open the brief for your assigned track.
3. Clone your track toolkit and read its Week 1 launch pack.
4. Install the NeoLabs CLI: `python -m pip install -e .`.
5. Authenticate with your private pod number + NeoLabs Access Code.
6. Verify `neolabs status` and `neolabs pod info` before collecting evidence.
7. Create your Week 1 branch and submission folder.
8. Never commit your Access Code, tokens, private keys or unredacted secrets.

Pentest and Support interns must perform live-target work only when `neolabs targets` returns a current authorised resource. SOC interns may continue authorised pod-scoped replay analysis outside the main VCC live window.

## Official Workflow

1. Read your current assignment scope, safety boundaries, deliverables and deadline.
2. Create a branch using the required naming convention.
3. Complete the practical work and collect only authorised evidence.
4. Remove secrets/private information before committing.
5. Push your branch and open a Pull Request.
6. Link the assigned Issue when one has been provided.
7. Respond to mentor feedback on the same branch.
8. Do not merge your own PR unless a mentor explicitly instructs you to do so.

## Branch Naming

`week-XX/<track>/<github-username>-<short-task-name>`

Examples:
- `week-01/soc/alex-night-watch`
- `week-01/pentest/alex-night-watch`
- `week-01/support/alex-night-watch`

## Submission Path

`submissions/week-XX/<track>/<github-username>/`

## Evidence Rules

Acceptable evidence includes redacted screenshots, approved log excerpts, Wazuh/XDR event IDs, authorised request/response observations, approved command output, timelines, ticket notes and retest evidence.

Never submit passwords, NeoLabs Access Codes, AWS keys, API tokens, SSH private keys, real customer data, production secrets or unrelated third-party information.

## Scope and Safety

All testing must remain inside the written assignment scope and NeoLabs/RIL controlled lab environment. Do not test production systems, third-party systems, unrelated public IP addresses or any asset not expressly authorised in the current NeoLabs manifest and assignment.

## Programme Scenarios

| Week | Scenario |
|---|---|
| 01 | Operation Night Watch |
| 02 | The Ghost Login |
| 03 | Red vs Blue 1 — Credential Storm |
| 04 | The Broken Gate |
| 05 | Operation Poisoned Upload |
| 06 | Red vs Blue 2 — Web Breach |
| 07 | The Cloud Locker Mistake |
| 08 | The S3 Insider Trail |
| 09 | Red vs Blue 3 — Data Escape |
| 10 | The Hidden Endpoint |
| 11 | Developer Ransomware Drill |
| 12 | Blackout at VCC — Final Capstone |

## Communication

- **GitHub:** official assignments, submissions, evidence and mentor review.
- **Slack:** working discussions and mentor support.
- **WhatsApp:** urgent reminders/timetable notices only.
