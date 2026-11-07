# Week 05 — SOC Level 1: Operation Poisoned Upload

**Status:** draft until mentor publishes the correct Week 05 SOC scope. **Scenario:** `w05-poisoned-upload`. Use the existing **central Wazuh dashboard** for authorized events; no separate student SOC test code is required.

## Mission

Correlate the original Pentest upload evidence, determine whether a mismatched file was accepted, issue a documented incident handoff, verify Support containment, and distinguish the fixed-state rejection from normal business activity.

## Access and scope

Continue using the existing SOC toolkit entry point:

```bash
# Linux / Ubuntu: from the SOC toolkit root
bash start-neolabs-soc.sh
```

On Windows use the existing `START-NEOLABS-SOC.cmd` launcher as taught by the mentor. Confirm your *current* assigned pod and Week 05 authorization from the mentor and central broker before starting the case. The currently authorized central Wazuh dashboard is the alert source. Do not use W05 mentor-only `tools/week05_client.py` codes as substitute student authorization.

A W04-only manifest does not grant Week 05 testing permission. Stop if your broker still publishes only Week 4 or the Wazuh view includes other pods outside your authorized scope.

## Required Wazuh correlations

Filter by `scenario_id=w05-poisoned-upload`, exact `pod_id`, approved UTC range and exact `event_id`.

| Event | Reason code | Expected rule | Meaning |
|---|---|---:|---|
| Accepted valid PNG | accepted | 100190 | Normal control |
| Accepted inert text masquerading as JPG | extension_only_validation | 100191 | Suspicious acceptance / alert |
| Rejected unsupported TXT / fixed-state mismatch | unsupported_extension / content_type_mismatch | 100192 | Validation works |
| Support-approved quarantine | support_containment | 100193 | Containment audit |

Rule `100191` can supersede a lower-level accepted-upload baseline; confirm the actual alert IDs rather than inventing both. Compare `event_time` (UTC) to ingest/index time and record `metadata.upload_id`, `request_id`, `metadata.sha256`, `metadata.incident_id` as available.

The `wazuh-stack/scripts/verify-week05-rule-engine.sh --index` utility is **mentor/operator only** and requires authorized Wazuh indexer credentials on the correct host. Students can rely on their approved central Wazuh dashboard and sanitized screenshots/alert IDs.

## Incident workflow

1. Validate the original Pentest suspicious upload's exact `event_id` and pod with Wazuh `100191`.
2. Create or obtain a mentor-approved `INC-W05-...` incident reference and communicate the upload ID and alert evidence to Support.
3. After Support quarantines, verify the **new** event ID in the Wazuh index with rule `100193`, same pod and incident reference.
4. During mentor-approved fixed retest, correlate rejected mismatch `100192` and legitimate accepted PNG `100190`.
5. Escalate missing evidence, wrong pod or rule mismatch; do not infer indexing from exporter HTTP 202 or broker database rows alone.

## Submission

Use branch `week-05/soc/<github-username>-poisoned-upload` and folder `submissions/week-05/soc/<github-username>/`. Include `incident-report.md` and `evidence-register.md` based on the templates in `assignments/week-05/templates/`. Document original/upload/quarantine event IDs, indexed rule proof, timeline, severity, detection tuning, false positives and remediation comparison.

PR into main, leave open for mentor review. Due date/rubric supplied in mentor Issue. No credentials, raw tokens or cross-pod data in any submission.
