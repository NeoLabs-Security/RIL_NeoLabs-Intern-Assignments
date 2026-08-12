# [W03][SOC L1] Red vs Blue 1 — Credential Storm

## Business Story

During an authorised VCC red-vs-blue exercise, the authentication service experienced a controlled high-volume credential attack against synthetic learner/staff accounts. The live window may be short, but the SOC investigation continues from replay after the exercise.

Your job is to determine what happened in your assigned pod, identify the affected synthetic account(s), distinguish attack traffic from normal authentication noise, document the incident timeline and propose a defensible detection improvement.

## Before You Begin

Use the **SOC Level 1 toolkit repository** for the Week 3 learning material and NeoLabs connection tools. Do not place Access Codes, broker sessions, private signed URLs, Wazuh certificates, AWS identifiers or private pod endpoints in this public assignments repository.

1. Read `labs/02-credential-storm-replay/README.md` in the SOC toolkit.
2. Open your assigned Week 3 GitHub Issue and confirm the authorised pod, exercise/replay window and deadline.
3. Set the programme-provided `NEOLABS_LAB_BASE_URL` privately on your workstation.
4. Use the NeoLabs Access Code delivered to you through the approved private channel.
5. From the SOC toolkit root run:

```bash
python3 tools/neolabs.py login
python3 tools/neolabs.py connect
python3 tools/neolabs.py status
```

6. Confirm that the scenario is `w03-credential-storm` and that your pod is server-assigned.

If the live exercise has ended, continue from the authorised replay. Do not attempt to reproduce credential attacks against the VCC service outside an explicit mentor-controlled live window.

## Scope

Use only the synthetic authentication/application/security telemetry exposed to your **server-assigned pod** for `w03-credential-storm`.

Do not:

- test production or third-party systems;
- access another pod;
- attempt AWS console/bucket enumeration;
- brute force or credential-stuff any system outside an explicit authorised red-team window;
- commit private URLs, Access Codes, tokens, certificates or other secrets.

## Objectives

- establish the pre-attack authentication baseline;
- identify the abnormal authentication burst and its time boundaries;
- distinguish credential stuffing from password spraying/ordinary brute force using evidence;
- identify suspicious successful authentication(s) and affected synthetic account(s);
- pivot from suspicious successes into session/application activity;
- build a complete event-time incident timeline;
- assess evidence gaps and confidence;
- propose one Wazuh/SIEM detection improvement;
- write an appropriate SOC L1 containment/escalation recommendation.

## Investigation Questions

Your submission should answer, with evidence IDs and reproducible queries:

1. What did normal authentication activity look like immediately before the exercise?
2. When did the abnormal activity begin and end?
3. How many accounts and distinct sources were involved?
4. What observed pattern supports your classification as credential stuffing, password spraying or another brute-force subtype?
5. Which authentication successes, if any, require deeper investigation?
6. What session/application activity follows those successes?
7. Which synthetic accounts should be considered affected or potentially affected?
8. What containment/recovery events are visible?
9. Were there telemetry gaps or delayed records that reduce confidence?
10. What detection improvement would have surfaced the activity earlier or with better fidelity?

## Deliverables

Submit under:

`submissions/week-03/soc/<github-username>/`

Required files:

1. `investigation-report.md`
2. `incident-timeline.md`
3. `evidence-log.md`
4. `query-journal.md`
5. `detection-proposal.md`
6. `escalation-recommendation.md`
7. `retest-notes.md` — complete this only after the fixed/retest window is released
8. `evidence/README.md` — describe any redacted screenshots included in the same folder

## Minimum Report Content

Your `investigation-report.md` must include:

- executive summary;
- scope and data sources;
- baseline observations;
- attack-pattern analysis;
- affected/potentially affected synthetic accounts;
- suspicious-success/session analysis;
- containment observations;
- evidence limitations;
- incident classification and confidence;
- recommended next actions.

Facts and inference must be clearly separated.

## Detection Proposal Requirements

Your proposed detection must define:

- telemetry source(s);
- important fields;
- grouping key(s);
- time window;
- threshold/behavioural condition;
- likely false positives;
- analyst validation pivot;
- how the proposal avoids treating ordinary user mistakes as an incident where possible.

## Submission Workflow

Create a branch named:

`week-03/soc/<github-username>-credential-storm`

Open a Pull Request, link your assigned Issue, keep the PR open for mentor review and respond to feedback on the same branch. Do not merge your own PR unless instructed.

## Assessment Rubric — 100 points

| Area | Points |
|---|---:|
| Scope, safety and evidence hygiene | 10 |
| Baseline and attack-pattern analysis | 20 |
| Suspicious-success/session correlation | 20 |
| Timeline quality and evidence traceability | 15 |
| Classification, confidence and limitations | 10 |
| Detection proposal | 15 |
| Escalation/containment recommendation | 5 |
| Reproducibility and professional presentation | 5 |

## Checkpoints

- [ ] Week 3 SOC learning material reviewed
- [ ] Assigned pod and scenario confirmed
- [ ] Authorised live/replay window confirmed
- [ ] Baseline established
- [ ] Attack pattern classified with supporting evidence
- [ ] Suspicious success/session pivots completed
- [ ] Event-time timeline completed
- [ ] Telemetry limitations documented
- [ ] Detection improvement proposed
- [ ] Escalation recommendation written
- [ ] Fixed/retest notes completed when released
- [ ] Secrets/private information removed
- [ ] PR linked to assigned Issue

## Reference Classification

MITRE ATT&CK identifies Credential Stuffing as **T1110.004** under the Brute Force technique. Password Spraying is **T1110.003**. Use the behaviour in your evidence—not the scenario title alone—to justify your final classification.
