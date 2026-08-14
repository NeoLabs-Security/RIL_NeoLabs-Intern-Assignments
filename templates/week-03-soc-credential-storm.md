# Week 3 SOC — Credential Storm Investigation Report Template

> Copy the relevant sections into your submission files. Remove instructional comments before final review.

## 1. Executive Summary

- **Scenario:** `w03-credential-storm`
- **Assigned pod:**
- **Investigation window:**
- **Classification:**
- **Confidence:** Low / Medium / High
- **Potential severity:**
- **Telemetry freshness/health checked:** Yes / No

### Summary

Write 4–8 sentences explaining what happened, what was affected, what evidence supports the conclusion and the most important next action.

## 2. Scope and Data Sources

| Data source | Time range reviewed | What it can prove | Important limitation |
|---|---|---|---|
| Authentication telemetry | | | |
| Application/session telemetry | | | |
| Security/control events | | | |
| Telemetry-health events | | | |

## 3. Baseline

Describe normal authentication behaviour before the abnormal burst: normal volume; typical success/failure pattern; normal synthetic users/service accounts; typical source/client characteristics; and known benign automation.

## 4. Attack-Pattern Analysis

- First abnormal event time:
- Last abnormal event time:
- Accounts targeted:
- Distinct sources:
- Source rotation observed: Yes / No / Unclear
- Authentication successes during/after burst:

**Most consistent technique:** Credential stuffing / Password spraying / Other brute force / Insufficient evidence

**Why:** State the observable pattern. Do not rely only on the scenario title.

## 5. Suspicious Success and Session Pivots

| Evidence ID | Account | Success time | Source/client | Session/correlation ID | Important later activity | Analyst interpretation |
|---|---|---|---|---|---|---|
| | | | | | | |

## 6. Affected Accounts

### Confirmed affected

For each account, explain the evidence standard used.

### Potentially affected / requires review

Explain uncertainty and what additional evidence would resolve it.

## 7. Incident Timeline

Use original **event_time** for ordering. Record replay/ingest/index delay separately when relevant.

| Event time | Evidence ID | Source | Event | Analyst significance |
|---|---|---|---|---|
| | | | | |

## 8. Telemetry and Evidence Limitations

Document missing sources, telemetry-health alerts, freshness problems, collection gaps, delayed ingestion/replay, ambiguous identifiers, and queries that returned zero results. State whether `CHECK-NEOLABS-SOC.cmd` / `neolabs doctor` or the Telemetry Health view was used before interpreting a zero result.

Explain how limitations affect confidence.

## 9. Detection Proposal

- **Goal:**
- **Data source(s):**
- **Fields:**
- **Grouping key(s):**
- **Time window:**
- **Threshold/behavioural condition:**
- **Enrichment/pivot before escalation:**
- **Likely false positives:**
- **How normal user mistakes are reduced:**

### Pseudologic / query sketch

```text
Write human-readable rule logic or an approved Wazuh/SIEM query here.
```

## 10. Escalation and Containment Recommendation

### Immediate recommendation

State the SOC L1 action/recommendation.

### Senior-analyst follow-up

List additional checks/actions that exceed Level 1 authority.

### Control improvements

Consider MFA, session revocation, credential reset, risk-based authentication, rate controls and detection/monitoring. Do not present source-IP blocking as the only control.

## 11. Retest Notes

Complete only when the mentor releases the fixed/retest window.

- Fixed-version window:
- What was retested:
- Expected security behaviour:
- Observed result:
- Evidence ID(s):
- Residual concern:

## 12. Evidence Hygiene Check

- [ ] No NeoLabs Access Code or password
- [ ] No session token/private signed URL
- [ ] No certificate/private key
- [ ] No AWS credentials/private lab identifiers beyond explicitly approved assignment context
- [ ] No other pod's data
- [ ] Screenshots redacted where necessary
