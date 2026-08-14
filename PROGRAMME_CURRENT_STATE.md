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

### SOC Analyst Level 1 — physical Windows 10/11

Use the current SOC toolkit and double-click:

```text
START-NEOLABS-SOC.cmd
```

This is the sole normal Windows SOC entry point. Before WSL/Docker setup it now checks the host type; Windows Server and detected Windows VM/VPS guests are rejected with instructions to use an Ubuntu/Debian VPS instead.

On a supported physical Windows workstation, first run owns the WSL2/Docker Desktop/Linux-prerequisite/Wazuh preparation path; subsequent runs reuse the existing local Wazuh installation. It authenticates/reuses the NeoLabs session, connects the server-assigned pod, starts Wazuh, verifies a real VCC event is searchable in `wazuh-alerts-*`, reports telemetry freshness, provisions the Night Watch/Telemetry Health objects when supported, checks local index retention/disk health, copies the local Wazuh `admin` password to the Windows clipboard without printing it and opens the dashboard.

Use the same file for diagnostics/status/login:

```text
START-NEOLABS-SOC.cmd doctor
START-NEOLABS-SOC.cmd status
START-NEOLABS-SOC.cmd login
```

Students should not manually choose among internal Docker/Wazuh/PowerShell setup scripts.

### SOC Analyst Level 1 — Linux / Ubuntu / VPS

From the SOC toolkit root:

```bash
bash start-neolabs-soc.sh
```

After first-run permission normalisation, later runs may use:

```bash
./start-neolabs-soc.sh
```

On Ubuntu/Debian the launcher can install missing base packages and Docker Engine + Compose v2, configure the Wazuh indexer kernel prerequisite, prepare/reuse the Wazuh stack and perform the same assigned-pod telemetry verification. Run it as the normal Linux user; the script invokes `sudo` itself only for OS-level installation/kernel/group changes.

**SOC VPS policy:** interns using a VPS or remote server must provision Ubuntu or Debian Linux. Recommended images are Ubuntu 22.04/24.04 LTS or a current Debian release. Do not use Windows Server or a Windows VM/VPS guest for the SOC workstation. This avoids WSL2/nested-virtualisation dependence on the VPS provider.

Diagnostics use `./start-neolabs-soc.sh doctor`. On headless Linux, the launcher keeps Wazuh loopback-only and prints an SSH local-port-forward example instead of exposing the dashboard publicly.

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
