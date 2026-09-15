# [W02][SOC L1] The Ghost Login — Authentication Investigation

## Business Story
Several synthetic VCC learner/staff accounts have reported unfamiliar login activity. Some events are ordinary user mistakes or expected lab traffic; others belong to a controlled suspicious-login campaign.

## Before You Begin

Use the **SOC Level 1 toolkit repository** for learning material and pod connection. Do not place your NeoLabs Access Code, broker session, Wazuh certificate or private URLs in this assignment repository.

1. Read the branded Week 2 learning pack: `publications/NeoLabs_SOC_L1_Week_02_Ghost_Login.pdf` in the SOC toolkit.
2. Set the programme-provided `NEOLABS_LAB_BASE_URL` on your workstation.
3. Use the pod number and private NeoLabs Access Code delivered to you through the approved private channel.
4. From the SOC toolkit root run:

```bash
python3 tools/neolabs.py login
python3 tools/neolabs.py connect
python3 tools/neolabs.py status
```

5. Confirm your local Wazuh stack is receiving telemetry for the **server-assigned pod** before beginning the investigation.

The student client does not let you select another telemetry pod. Pod scope is derived from the server-side assignment and the SOC certificate enrolment.

## Scope
Use only the authentication/application telemetry, synthetic accounts and exercise time window identified by this Issue and delivered through your authorised pod connection.

Do not attempt to access production systems, another pod, cloud consoles, databases, container hosts or mentor-only systems.

## Objectives
- establish normal authentication behaviour;
- identify anomalous login activity;
- build a chronological authentication timeline;
- classify events as benign, suspicious or confirmed within the controlled lab story;
- identify affected synthetic account(s);
- propose one Wazuh detection improvement;
- validate the fixed version when released.

## Deliverables
Submit under `submissions/week-02/soc/<github-username>/`:
1. `investigation-report.md`
2. `authentication-timeline.md`
3. `detection-proposal.md`
4. `retest-notes.md`
5. `evidence/`

## Submission Workflow
Create a branch named:

`week-02/soc/<github-username>-ghost-login`

Open a Pull Request, link the assigned Issue and respond to mentor review on the same branch. Do not merge your own PR unless instructed by a mentor.

## Checkpoints
- [ ] Week 2 learning pack reviewed
- [ ] NeoLabs pod authentication successful
- [ ] Wazuh receives assigned-pod telemetry
- [ ] Scope and time window confirmed
- [ ] Baseline reviewed
- [ ] Timeline completed
- [ ] Suspicious events supported with evidence
- [ ] Incident classified with confidence/limitations stated
- [ ] Detection improvement proposed
- [ ] Fixed version validated
- [ ] Secrets/private information removed
- [ ] PR linked to Issue
