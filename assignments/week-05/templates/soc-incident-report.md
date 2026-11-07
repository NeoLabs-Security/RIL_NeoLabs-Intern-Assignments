# Week 05 — SOC incident investigation / <GitHub username>
**Scenario:** w05-poisoned-upload · **Assigned pod:** pod-0X  
**Authorized time window UTC:** <start–end> · **Issue / incident:** <INC-W05-...>

## Alert intake / source confidence
**Wazuh dashboard/index:** <authorized central view>  
**Evidence confirmed INDEXED (not merely broker accepted):** <yes/no>  
**Analyst severity / rationale:** <justification>

## Correlated timeline
| UTC event_time | event_type | reason_code | rule.id | event_id | request_id | upload_id | SOC verification |
|---|---|---|---|---|---|---|---|
| | file.upload_accepted | extension_only_validation | 100191 | | | | |
| | file.upload_quarantined | support_containment | 100193 | | | | |
| | file.upload_rejected | content_type_mismatch | 100192 | | | | |
| | file.upload_accepted | accepted | 100190 | | | | |

Only enter rule IDs actually observed in the index. Rule 100191 may supersede the base 100190 on one event.

## Analysis and case decisions
**Original suspicious proof:** <what genuinely matched; fingerprint/MIME mismatch>  
**Benign baseline and false positives:** <how distinguished>  
**Pod/track scope validation:** <how cross-pod correlation was excluded>

## Pentest -> SOC -> Support handoff
**Approved incident reference:** <INC-W05-...>  
**Original suspicious event ID:** <uuid>  
**Exact upload ID:** <opaque 32-char>  
**Support containment returned event ID:** <uuid>  
**Wazuh indexed quarantine rule 100193:** <yes / not verified>

## Remediation validation
**Fixed-state suspicious rejection rule 100192:** <actual event ID/status or not verified>  
**Normal PNG acceptance rule 100190:** <actual event ID/status or not verified>

## Suggested rule tuning, escalation and lessons
<Detection thresholds, noise, false positives, residual risks, follow-up.>

## Limitations
Never substitute a raw VCC log, local triage file or broker HTTP 202 for a verified Wazuh index match.
