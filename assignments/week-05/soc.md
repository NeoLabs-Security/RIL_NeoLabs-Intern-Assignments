# Week 05 — SOC Level 1

## Objective
Use the central Wazuh environment to investigate upload events, reconstruct an evidence-based incident timeline, identify a useful detection and verify the fixed release without inventing telemetry.

## Authorized workflow
1. Verify the assigned scenario and pod, and check that actual W05 events are searchable in Wazuh.
2. Filter by `scenario_id=w05-poisoned-upload`, assigned `pod_id` and approved UTC time range.
3. Correlate event time (not ingestion time), `request_id`, `upload_id`, `incident_id`, source IP when trusted, file hash, result and reason code.
4. Explain valid uploads versus suspicious MIME/content mismatches, extension rejections and quarantine events.
5. Document one detection rule or tuning proposal, including expected false positives and the observed event IDs.
6. Verify Wazuh still logs the fixed-state retest and that legitimate uploads remain visible.

## Deliverables
- Wazuh evidence references and UTC incident timeline.
- Triage findings, severity reasoning, affected assigned pod and appropriate handoff.
- Detection/rule recommendation and fixed-retest comparison.
- Short incident report with limitations and uncertainty clearly labeled.

Never report an alert solely because the collector is healthy. Show an indexed event from the correct assigned pod.
