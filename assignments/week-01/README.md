# Week 01 — Operation Night Watch

This is the official Week 1 assignment hub for the NeoLabs × Renaissance Innovation Labs Cybersecurity Internship.

## Purpose
Week 1 establishes the **normal operating baseline** of the VCC training environment. Later incident weeks will compare suspicious behaviour against the evidence you build now.

## Choose only your assigned track
- [SOC Level 1](SOC.md)
- [Grey-Box Pentesting](PENTEST.md)
- [IT Security Support](SUPPORT.md)

Your pod and track are server-managed through your private NeoLabs Access Code. Do not swap pods or tracks with another intern.

## Before you begin
1. Clone your track toolkit.
2. Read its Week 1 launch pack.
3. Install the toolkit CLI with `python -m pip install -e .`.
4. Set the NeoLabs lab gateway URL supplied in your onboarding message.
5. Run `neolabs login` using your assigned pod and private Access Code.
6. Verify with `neolabs status` and `neolabs pod info`.

## Submission workflow
Create a branch:

```text
week-01/<track>/<github-username>-night-watch
```

Use one of:
- `soc`
- `pentest`
- `support`

Put your work under:

```text
submissions/week-01/<track>/<github-username>/
```

Open a Pull Request when your submission is ready for mentor review. Do not merge your own PR unless instructed.

## Evidence rules
- Redact NeoLabs Access Codes, session tokens, private keys and credentials.
- Use only synthetic VCC data.
- Do not submit unrelated third-party or real personal information.
- State the time range and assigned pod in each investigation/test/support record.
- Separate observed facts from assumptions.

## Universal stop conditions
Stop immediately and contact a mentor if:
- another pod becomes reachable or visible;
- real personal information appears;
- a credential/private key is exposed;
- a request affects an unassigned target;
- service instability or unexpected state change occurs.

## Live-window rule
SOC can continue from authorised pod-scoped replay telemetry outside the main VCC live window. Pentest and Support must perform live-target activity **only when `neolabs targets` returns a current authorised resource**. Never substitute an old or guessed IP/hostname.

## Deadline
Use the deadline communicated by the internship team for Week 1. If there is a conflict between chat/WhatsApp and an updated GitHub assignment notice, ask a mentor before assuming an extension.
