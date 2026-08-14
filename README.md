# NeoLabs × Renaissance Innovation Labs Cybersecurity Internship

## Central Assignments Repository

This repository is the **official graded work record** for the NeoLabs × Renaissance Innovation Labs (RIL) Cybersecurity Internship. Student learning/runtime tooling lives in the three track repositories; assignments, evidence, mentor feedback, revisions and final submissions live here.

> ## CURRENT WEEK — WEEK 01
> **Operation Night Watch** is the active assignment. Start at [`assignments/week-01/README.md`](assignments/week-01/README.md), then open only your assigned track brief.

For the current cross-repository setup/runtime model, read [`PROGRAMME_CURRENT_STATE.md`](PROGRAMME_CURRENT_STATE.md).

## Tracks

- **SOC Analyst Level 1** — Wazuh monitoring, log analysis, alert investigation, incident triage, timelines, reporting and detection improvement.
- **Grey-Box Penetration Testing** — authorised application/service mapping, scoped testing, vulnerability validation, reporting and retesting.
- **IT Security Support** — secure support, identity/network/service diagnosis, evidence preservation, containment/recovery and documentation.

## Week 1 start sequence

1. Open [`assignments/week-01/README.md`](assignments/week-01/README.md) and your assigned track brief.
2. Clone/pull the latest version of your track toolkit.
3. Follow the toolkit-local Windows flow instead of installing a global CLI.
4. Authenticate only with your assigned pod number + private NeoLabs Access Code.
5. Confirm the server-issued pod/track/runtime state before collecting evidence.
6. Create the required Week 1 branch and submission folder.
7. Never commit Access Codes, session tokens, signed URLs, certificates, private keys, passwords or unrelated pod data.

### Current Windows entry points

**SOC:** normally double-click `START-NEOLABS-SOC.cmd`. Use `CHECK-NEOLABS-SOC.cmd` / `.\neolabs.cmd doctor` for diagnostics. The launcher does not report READY until assigned-pod VCC telemetry is actually searchable in the local Wazuh indexer.

**Pentest:** run `setup-windows.cmd` once, then `.\neolabs.cmd login`, `status`, `pod info`, `scope`, `targets`, and `connect` from the toolkit folder.

**Support:** run `setup-windows.cmd` once, then `.\neolabs.cmd login`, `status`, `pod info`, `targets`, and `connect` from the toolkit folder.

Do not use old instructions that require `python -m pip install -e .`, a manually entered gateway URL, or bare `neolabs` on Windows.

## Official submission workflow

1. Read the current assignment scope, safety boundaries, deliverables and deadline.
2. Create a branch using the required naming convention.
3. Complete only the authorised practical work and collect only authorised evidence.
4. Redact private information before committing.
5. Push your branch and open a Pull Request.
6. Link the assigned Issue when one has been provided.
7. Respond to mentor feedback on the same branch.
8. Do not merge your own PR unless a mentor explicitly instructs you to do so.

## Branch naming

`week-XX/<track>/<github-username>-<short-task-name>`

Examples:

- `week-01/soc/alex-night-watch`
- `week-01/pentest/alex-night-watch`
- `week-01/support/alex-night-watch`

## Submission path

`submissions/week-XX/<track>/<github-username>/`

## Evidence rules

Acceptable evidence includes redacted screenshots, approved log excerpts, Wazuh event/rule IDs, authorised request/response observations, approved command output, timelines, ticket notes and retest evidence.

Never submit passwords, NeoLabs Access Codes, AWS keys, API/session tokens, signed private URLs, SSH private keys, certificates/private keys, real customer data, production secrets or unrelated third-party information.

## Scope and safety

All testing must remain inside the written assignment scope and the NeoLabs/RIL controlled lab. The production VCC training topology is five isolated pods (`pod-01` through `pod-05`). Students do not receive EC2 shell access, broad AWS credentials, database/container access, mentor ground truth or cross-pod access.

The server-issued pod/track/resources plus the written assignment are authoritative. Never reuse a cached/old IP when the current manifest no longer returns it.

## Programme scenarios

| Week | Scenario | Runtime class |
|---|---|---|
| 01 | Operation Night Watch | HYBRID |
| 02 | The Ghost Login | HYBRID |
| 03 | Credential Storm | LIVE_REQUIRED |
| 04 | The Broken Gate | HYBRID |
| 05 | Operation Poisoned Upload | HYBRID |
| 06 | Web Breach | LIVE_REQUIRED |
| 07 | Cloud Locker | STORAGE_NATIVE |
| 08 | S3 Insider Trail | STORAGE_NATIVE |
| 09 | Data Escape | STORAGE_NATIVE |
| 10 | Hidden Endpoint | HYBRID |
| 11 | Developer Ransomware Drill | ENDPOINT_LIVE |
| 12 | Blackout at VCC | CAPSTONE |

Later-week material may exist in the repositories before release. Presence of a file is not authorisation to run that scenario.

## Communication

- **GitHub:** official assignments, submissions, evidence and mentor review.
- **Slack:** working discussions and mentor support.
- **WhatsApp:** urgent reminders/timetable notices only.
