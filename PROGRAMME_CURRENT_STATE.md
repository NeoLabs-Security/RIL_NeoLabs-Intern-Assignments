# NeoLabs × RIL Cybersecurity Internship — Current Programme State

**Operational baseline:** 2026-08-14  
**Current week:** Week 01 — Operation Night Watch  
**Production training topology:** five isolated VCC pods (`pod-01` through `pod-05`)

This file is the cross-repository operational reference for students and mentors. Weekly assignment scope still takes priority for the specific task, but older setup examples must not override the current track-toolkit workflow described here.

## Programme repositories

- `NeoLabs-Security/VCC-Security-Lab` — private lab runtime, replay gateway, pod access, scenarios, telemetry and mentor controls.
- `NeoLabs-Security/RIL_NeoLabs-SOC1-interns-toolkit-` — SOC Analyst Level 1 learning + local Wazuh workstation.
- `NeoLabs-Security/RIL_NeoLabs-GreyPentesting-interns-toolkit-` — Grey-Box Pentesting learning + scoped local target access.
- `NeoLabs-Security/RIL_NeoLabs-ITSEC-Support-Interns-Toolkit` — IT Security Support learning + restricted support access.
- `NeoLabs-Security/RIL_NeoLabs-Intern-Assignments` — official graded work, Issues, submissions, mentor review and revision history.

## Shared access model

Every student uses a private NeoLabs Access Code and the pod/track assigned by the server. Students do not choose another pod by editing local files. Never commit Access Codes, session tokens, signed URLs, certificates, private keys or live cohort evidence.

The VCC uses a cost-aware hybrid runtime. Interactive VCC surfaces are scheduled only when the scenario requires them; approved telemetry/evidence can continue through the Replay Gateway when the main VCC EC2 is stopped.

## Track startup

### SOC Analyst Level 1 — Windows

Use the current SOC toolkit and normally double-click:

```text
START-NEOLABS-SOC.cmd
```

The launcher prepares/reuses WSL2 + the local Wazuh stack, authenticates to NeoLabs, connects the server-assigned pod, verifies that a real VCC event is searchable in `wazuh-alerts-*`, reports telemetry freshness, provisions the Night Watch and Telemetry Health dashboard objects when supported, checks local index retention/disk health, copies the local Wazuh `admin` password to the Windows clipboard without printing it, and opens the dashboard.

For diagnostics use:

```text
CHECK-NEOLABS-SOC.cmd
```

or, from the toolkit root:

```powershell
.\neolabs.cmd doctor
```

The local Wazuh dashboard is normally `https://127.0.0.1:8443`. The human login username is `admin`; the password is locally generated and never belongs in this assignments repository.

### Grey-Box Pentesting — Windows

Run `setup-windows.cmd` once, then use the toolkit-local commands:

```powershell
.\neolabs.cmd login
.\neolabs.cmd status
.\neolabs.cmd pod info
.\neolabs.cmd scope
.\neolabs.cmd targets
.\neolabs.cmd connect
```

During Week 1 the authorised learner surface is exposed through the pod-isolated local tunnel, normally at `http://127.0.0.1:18080`. Use only the exact scope returned by the current server manifest. Do not substitute the EC2 public IP or an old target.

### IT Security Support — Windows

Run `setup-windows.cmd` once, then use the toolkit-local commands:

```powershell
.\neolabs.cmd login
.\neolabs.cmd status
.\neolabs.cmd pod info
.\neolabs.cmd targets
.\neolabs.cmd connect
```

Week 1 support work uses the restricted pod-isolated learner/support surface, normally at `http://localhost:18080`, and remains evidence-first/read-only unless the task explicitly authorises a change.

## Week 1 intent

Operation Night Watch is a baseline week.

- **SOC:** establish normal authentication/application behaviour in Wazuh, save reusable searches, build a timeline and document visibility gaps.
- **Pentest:** map the authorised learner application and normal HTTP/service behaviour without exploitation.
- **Support:** verify normal learner services, work the supplied synthetic support ticket(s), preserve evidence and document diagnosis/validation.

## Twelve-week scenario sequence

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

Later-week material may be staged before release; only the current written assignment and current server state authorise student activity.

## Communications

- **GitHub:** official assignments, evidence, Pull Requests and mentor review.
- **Slack:** working discussion and mentor support.
- **WhatsApp:** urgent reminders/timetable notices only.

## Safety precedence

Written task scope + current server-issued pod/track/resources always win over an older screenshot, cached target, old branch, chat message or copied command. Stop and contact a mentor if another pod, real data, credentials, unexpected infrastructure access or service instability appears.
