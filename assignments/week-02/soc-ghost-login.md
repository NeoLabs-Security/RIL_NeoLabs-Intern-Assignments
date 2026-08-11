# [W02][SOC L1] The Ghost Login — Authentication Investigation

## Business Story
Several synthetic VCC learner/staff accounts have reported unfamiliar login activity. Some events are ordinary user mistakes or expected lab traffic; others belong to a controlled suspicious-login campaign.

## Scope
Use only mentor-approved VCC authentication/application logs, Wazuh/XDR telemetry, synthetic accounts and the assigned exercise time window.

## Objectives
- establish normal authentication behaviour;
- identify anomalous login activity;
- build a chronological authentication timeline;
- classify events as benign, suspicious or confirmed malicious within the lab story;
- identify affected synthetic account(s);
- propose one Wazuh/XDR detection improvement;
- validate the fixed version when released.

## Deliverables
Submit under `submissions/week-02/soc/<github-username>/`:
1. `investigation-report.md`
2. `authentication-timeline.md`
3. `detection-proposal.md`
4. `retest-notes.md`
5. `evidence/`

## Checkpoints
- [ ] Scope confirmed
- [ ] Baseline reviewed
- [ ] Timeline completed
- [ ] Suspicious events supported with evidence
- [ ] Incident classified
- [ ] Detection improvement proposed
- [ ] Fixed version validated
- [ ] Secrets removed
- [ ] PR linked to Issue
