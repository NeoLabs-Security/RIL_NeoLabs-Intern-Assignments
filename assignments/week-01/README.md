# Week 01 — Operation Night Watch

This is the official Week 1 assignment hub for the NeoLabs × Renaissance Innovation Labs Cybersecurity Internship.

## Purpose

Week 1 establishes the **normal operating baseline** of the VCC training environment. Later incident weeks compare suspicious behaviour against the evidence you build now.

## Choose only your assigned track

- [SOC Level 1](SOC.md)
- [Grey-Box Pentesting](PENTEST.md)
- [IT Security Support](SUPPORT.md)

Your pod and track are server-managed through your private NeoLabs Access Code. The active lab topology is five isolated pods (`pod-01` through `pod-05`). Do not swap pods/tracks or reuse another intern's access details.

## Before you begin

1. Pull the latest version of your assigned track toolkit.
2. Read the toolkit Week 1 launch pack and its root README/START_HERE guide.
3. Use the current toolkit-local startup path; do **not** install a global CLI just to start Week 1.
4. Authenticate with your assigned pod number + private NeoLabs Access Code when prompted.
5. Confirm the server-issued pod/track/runtime state before collecting evidence.

### Windows quick start

- **SOC:** double-click `START-NEOLABS-SOC.cmd`. Use `CHECK-NEOLABS-SOC.cmd` or `.\neolabs.cmd doctor` if any telemetry/dashboard stage fails.
- **Pentest:** run `setup-windows.cmd` once, then use `.\neolabs.cmd ...` from the toolkit folder.
- **Support:** run `setup-windows.cmd` once, then use `.\neolabs.cmd ...` from the toolkit folder.

Old examples that require `python -m pip install -e .`, a manually entered gateway URL or bare `neolabs` on Windows are superseded.

## Submission workflow

Create a branch:

```text
week-01/<track>/<github-username>-night-watch
```

Use one of `soc`, `pentest`, or `support`.

Put your work under:

```text
submissions/week-01/<track>/<github-username>/
```

Open a Pull Request when your submission is ready for mentor review. Do not merge your own PR unless instructed.

## Evidence rules

- Redact NeoLabs Access Codes, passwords, session tokens, signed URLs, certificates/private keys and credentials.
- Use only synthetic VCC data.
- Do not submit unrelated third-party or real personal information.
- State the time range and assigned pod in each investigation/test/support record.
- Separate observed facts from assumptions/inference.

## Universal stop conditions

Stop immediately and contact a mentor if another pod becomes reachable/visible, real personal/production information appears, a credential/private key is exposed, a request affects an unassigned target, or service instability/unexpected state change occurs.

## Runtime rule

Week 1 is HYBRID. SOC can continue from authorised pod-scoped replay telemetry outside the main VCC live window. Pentest and Support perform live-target work only while the current server manifest exposes an authorised resource. Never substitute an old or guessed IP/hostname.

## Deadline

Use the deadline communicated through the official assignment/Issue. Slack is for support; WhatsApp is for urgent reminders/timetable notices. If messages conflict, ask a mentor rather than assuming an extension.
