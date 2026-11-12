**SOC L1 Incident Report — Week 05**

Scenario: "w05-poisoned-upload"
Assigned pod: "pod-01"
Authorized time window UTC: "2026-11-09T22:47:13.928Z – 2026-11-12T14:29:26.515Z"
Issue / incident: "INC-W05-001"

1. Alert Intake / Source Confidence

- Wazuh dashboard/index: "wazuh-alerts-4.x-2026.11.10" and "wazuh-alerts-4.x-2026.11.12"
- Evidence confirmed INDEXED: Yes.
- Analyst severity / rationale: High (Rule 100191, Level 10). A file was accepted despite a mismatch between its declared MIME type and detected content type.

2. Correlated Timeline

UTC event_time| event_type| reason_code| rule.id| event_id| request_id| upload_id| SOC verification
2026-11-09T22:47:13.928Z| file.upload_accepted| extension_only_validation| 100191| "90d28fea-921d-4de9-9058-123594363471"| "0423124bc78f496caeffea9fec32750f"| "12661b7c13bf48538cb75c2e471eed2e"| Indexed; confirmed
2026-11-12T14:29:26.515Z| file.upload_quarantined| support_containment| 100193| "903d3fc4-59ee-4d69-839a-624a38e51202"| "a7b95da264c94e3f8aa996551527de4d"| "12661b7c13bf48538cb75c2e471eed2e"| Indexed; confirmed
—| file.upload_rejected| content_type_mismatch| —| —| —| —| Not verified
—| file.upload_accepted| accepted| —| —| —| —| Not verified

Only rule IDs actually observed in the Wazuh index are recorded.

3. Analysis and Case Decisions

Original suspicious proof:

- Filename: "inert_mime_mismatch.jpg"
- Declared MIME: "image/jpeg"
- Detected MIME: "application/octet-stream"
- File size: 53 bytes
- Validation reason: "extension_only_validation"
- SHA-256: "6f79d71f91f8d6c8adb096afede629f3bf4f98145a06e02fa85a469c70c92cfb"

The upload was accepted despite the MIME mismatch, confirming the validation weakness.

Benign baseline and false positives:

A legitimate PNG acceptance has not yet been verified under Rule 100190. No false-positive conclusion can be established yet.

Pod/track scope validation:

Both indexed events match:

- Scenario: "w05-poisoned-upload"
- Pod: "pod-01"
- Cohort: "w05-local-mentor"
- Environment: "vcc-security-lab"
- Synthetic: "true"

4. Pentest → SOC → Support Handoff

- Approved incident reference: "INC-W05-001"
- Original suspicious event ID: "90d28fea-921d-4de9-9058-123594363471"
- Exact upload ID: "12661b7c13bf48538cb75c2e471eed2e"
- Support containment returned event ID: "903d3fc4-59ee-4d69-839a-624a38e51202"
- Wazuh indexed quarantine Rule 100193: Yes.

The original suspicious event and subsequent containment event are correlated through the same upload ID, SHA-256 fingerprint and pod.

5. Remediation Validation

Validation| Result
Fixed-state suspicious rejection — Rule 100192| Not verified
Normal PNG acceptance — Rule 100190| Not verified

Fixed-release retesting remains outstanding. Both events must be confirmed in the central Wazuh index before remediation can be declared successful.

6. Suggested Rule Tuning, Escalation and Lessons

- Maintain detection for extension and actual-content MIME mismatches.
- Correlate suspicious acceptance and quarantine events using upload ID, SHA-256 and incident reference.
- Monitor repeated validation failures and unexpected upload acceptance.
- Escalate missing events, incorrect pod IDs or rule mismatches.
- Ensure legitimate PNG uploads remain accepted after remediation.
- Require central Wazuh indexing as evidence of successful detection and containment verification.

7. Limitations

- Local VCC audit records alone do not establish central indexing.
- Broker HTTP 202 responses do not prove Wazuh ingestion.
- Fixed-release rejection and legitimate PNG acceptance remain unverified.
- Incident closure should wait until both remediation tests are confirmed.

8. Final SOC L1 Assessment

Status: Detected, correlated and quarantined. Remediation validation pending.

The suspicious upload was successfully detected and quarantined. Central Wazuh confirms Rules 100191 and 100193.

The incident remains open pending verification of:

1. Rule 100192 — Fixed-state suspicious upload rejection.
2. Rule 100190 — Legitimate PNG acceptance.

Incident reference: "INC-W05-001"



**Week 05 — SOC L1 Incident Report**

Scenario: w05-poisoned-upload
Assigned pod: pod-01
Authorized time window UTC: 2026-11-11T20:48:04.349Z – 2026-11-12T14:37:29.948Z
Issue / incident: INC-W05-003

Alert intake / source confidence

- Wazuh dashboard/index: wazuh-alerts-4.x-2026.11.11 and wazuh-alerts-4.x-2026.11.12
- Evidence confirmed INDEXED: Yes. Original suspicious upload and quarantine events both confirmed in the central Wazuh index.
- Analyst severity: High.
- Rationale: A MIME-mismatched file was accepted because validation relied on its extension. Successful quarantine was subsequently verified.

Correlated timeline

UTC event_time| event_type| reason_code| rule.id| event_id| request_id| upload_id| SOC verification
2026-11-11T20:48:04.349Z| file.upload_accepted| extension_only_validation| 100191| d60d513f-3940-4824-a0e7-d542bf914563| f1c23f766f49463cbd705fb3ce322d27| 8beaeb03f5cc4f4a887d504a49f553b6| Indexed; suspicious acceptance confirmed
2026-11-12T14:37:29.948Z| file.upload_quarantined| support_containment| 100193| fdad56ac-5814-4a6b-b0a2-f7c546b02896| 0718475409da4ad49248914e2636b1bf| 8beaeb03f5cc4f4a887d504a49f553b6| Indexed; quarantine confirmed
Not supplied| file.upload_rejected| content_type_mismatch| Not verified| Not verified| Not verified| Not verified| Fixed-state rejection pending
Not supplied| file.upload_accepted| accepted| Not verified| Not verified| Not verified| Not verified| Legitimate PNG baseline pending

Analysis and case decisions

Original suspicious proof:

- Filename: inert_mime_mismatch.jpg
- Declared MIME: image/jpeg
- Detected type: application/octet-stream
- Reason: extension_only_validation
- File size: 53 bytes
- SHA-256: 6f79d71f91f8d6c8adb096afede629f3bf4f98145a06e02fa85a469c70c92cfb
- Upload ID matched across suspicious acceptance and quarantine records.

Benign baseline and false positives:

The legitimate PNG acceptance baseline has not yet been verified using Wazuh rule 100190. False-positive assessment therefore remains pending.

Pod/track scope validation:

Both indexed events belong to pod-01, scenario w05-poisoned-upload, cohort w05-local-mentor, and environment vcc-security-lab. Events are marked synthetic=true. Evidence is within the assigned SOC L1 exercise scope.

Pentest → SOC → Support handoff

- Approved incident reference: INC-W05-003
- Original suspicious event ID: d60d513f-3940-4824-a0e7-d542bf914563
- Exact upload ID: 8beaeb03f5cc4f4a887d504a49f553b6
- Support containment event ID: fdad56ac-5814-4a6b-b0a2-f7c546b02896
- Wazuh indexed quarantine rule 100193: Yes.
- Containment status: Successfully verified.

Remediation validation

- Fixed-state suspicious rejection rule 100192: Not verified. Actual event ID and status not supplied.
- Normal PNG acceptance rule 100190: Not verified. Actual event ID and status not supplied.

Suggested rule tuning, escalation and lessons

- Maintain detection for accepted extension/content mismatches using rule 100191.
- Ensure file validation checks actual content, not filename extension alone.
- Retain quarantine detection through rule 100193.
- Verify fixed-release rejection using rule 100192.
- Confirm legitimate PNG uploads using rule 100190.
- Correlate alerts using event ID, request ID, upload ID, pod and incident reference.
- Escalate missing or mismatched evidence to the mentor or responsible team.


Limitations

This report uses two confirmed central Wazuh index records: the original suspicious acceptance and subsequent quarantine.

The corrected-release rejection and legitimate PNG acceptance have not been supplied or verified. No rule IDs or event IDs have been assumed for these events.

A raw VCC log, local triage record or broker HTTP 202 response is not accepted as proof of central Wazuh indexing.

Current incident status: CONTAINED. Final exercise closure pending remediation retest verification.
