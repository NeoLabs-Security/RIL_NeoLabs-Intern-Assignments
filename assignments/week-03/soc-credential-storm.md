# [W03][SOC L1] Red vs Blue 1 — Credential Storm

> **Staged material:** This brief may exist before Week 3 is released. Do not begin the scenario until the programme publishes the Week 3 Issue/window and the server reports `w03-credential-storm` for your assigned pod.

## Business story

During an authorised VCC red-vs-blue exercise, the authentication service experiences a controlled high-volume credential attack against synthetic learner/staff accounts. The live window may be short; SOC investigation can continue from authorised replay afterward.

Your job is to determine what happened in your assigned pod, identify affected synthetic account(s), distinguish attack traffic from normal authentication noise, document the incident timeline and propose a defensible detection improvement.

## Before you begin

Use the **current SOC Level 1 toolkit** for learning material, Wazuh and NeoLabs access. Never place Access Codes, session tokens, signed URLs, Wazuh credentials/certificates, private pod endpoints or other secrets in this public assignments repository.

1. Pull the latest SOC toolkit.
2. Read `labs/02-credential-storm-replay/README.md` when Week 3 is released.
3. Open your assigned Week 3 Issue and confirm the authorised exercise/replay window and deadline.
4. Start the workstation with the current platform root launcher and wait for **SOC WORKSTATION READY**:
   - Windows: `START-NEOLABS-SOC.cmd`
   - Linux/Ubuntu: `bash start-neolabs-soc.sh` (later runs: `./start-neolabs-soc.sh`)
5. If necessary, run the same launcher in Doctor mode:
   - Windows: `START-NEOLABS-SOC.cmd doctor`
   - Linux: `./start-neolabs-soc.sh doctor`
6. Confirm the current server state before investigating:
   - Windows: `START-NEOLABS-SOC.cmd status`
   - Linux: `./start-neolabs-soc.sh status`
   The scenario must be `w03-credential-storm` and the pod must match your assignment.

The toolkit automatically uses the official NeoLabs gateway. Do not replace it with a copied/private URL. If the live exercise has ended, continue from the authorised pod-scoped replay. Do not reproduce credential attacks outside an explicit mentor-controlled live window.

## Scope

Use only synthetic authentication/application/security telemetry exposed to your **server-assigned pod** for `w03-credential-storm`.

Do not test production or third-party systems, access another pod, enumerate the lab AWS account/bucket, brute-force/credential-stuff any system outside the authorised exercise, or commit private runtime information.

## Objectives

- establish the pre-attack authentication baseline;
- identify the abnormal authentication burst and its time boundaries;
- distinguish credential stuffing from password spraying/ordinary brute force using evidence;
- identify suspicious successful authentication(s) and affected synthetic account(s);
- pivot from suspicious successes into session/application activity;
- build a complete original-event-time incident timeline;
- assess telemetry health, evidence gaps and confidence;
- propose one Wazuh/SIEM detection improvement;
- write an appropriate SOC L1 containment/escalation recommendation.

## Investigation questions

Answer with evidence IDs and reproducible queries:

1. What did normal authentication activity look like immediately before the exercise?
2. When did abnormal activity begin and end?
3. How many accounts and distinct sources were involved?
4. What observable pattern supports credential stuffing, password spraying or another brute-force subtype?
5. Which authentication successes require deeper investigation?
6. What session/application activity follows those successes?
7. Which synthetic accounts are confirmed or potentially affected?
8. What containment/recovery events are visible?
9. Were there telemetry gaps, stale collection or delayed replay records that reduce confidence?
10. What detection improvement would have surfaced the activity earlier or with better fidelity?

Before treating zero results as evidence, use the toolkit telemetry freshness/health checks and the **NeoLabs — Telemetry Health** view where available.

## Deliverables

Submit under `submissions/week-03/soc/<github-username>/`:

1. `investigation-report.md`
2. `incident-timeline.md`
3. `evidence-log.md`
4. `query-journal.md`
5. `detection-proposal.md`
6. `escalation-recommendation.md`
7. `retest-notes.md` — complete only after the fixed/retest window is released
8. `evidence/README.md` — describe any redacted screenshots in the same folder

## Minimum report content

Include executive summary; scope/data sources; baseline; attack-pattern analysis; affected/potentially affected synthetic accounts; suspicious-success/session analysis; containment observations; telemetry/evidence limitations; classification/confidence; and recommended next actions. Separate observed fact from inference.

## Detection proposal requirements

Define telemetry source(s), important fields, grouping keys, time window, threshold/behavioural condition, likely false positives, analyst validation pivot and how normal user mistakes are reduced.

## Submission workflow

Create `week-03/soc/<github-username>-credential-storm`, open a Pull Request, link the assigned Issue and keep the PR open for mentor review. Do not merge your own PR unless instructed.

## Assessment rubric — 100 points

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
- [ ] Assigned pod/scenario confirmed from the current server state
- [ ] Authorised live/replay window confirmed
- [ ] Wazuh telemetry health/freshness checked
- [ ] Baseline established
- [ ] Attack pattern classified with evidence
- [ ] Suspicious success/session pivots completed
- [ ] Original-event-time timeline completed
- [ ] Telemetry limitations documented
- [ ] Detection improvement proposed
- [ ] Escalation recommendation written
- [ ] Fixed/retest notes completed when released
- [ ] Secrets/private information removed
- [ ] PR linked to assigned Issue

## Reference classification

MITRE ATT&CK identifies Credential Stuffing as **T1110.004** under Brute Force and Password Spraying as **T1110.003**. Use the behaviour in your evidence—not the scenario title alone—to justify classification.
