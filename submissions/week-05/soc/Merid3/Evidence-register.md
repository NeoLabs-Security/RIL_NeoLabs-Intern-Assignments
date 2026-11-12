**Week 05 — Sanitized Evidence Register**

Scenario: "w05-poisoned-upload"
Pod: "pod-01"
Authorized window UTC: "2026-11-09T22:47:13.928Z – 2026-11-12T14:29:26.515Z"
Incident: "INC-W05-001"

Evidence ID| UTC event time| Pod| Source| Event ID| Request ID| Upload ID (if applicable)| Wazuh Rule (if indexed)| Sanitized file/link| What it establishes
INC-W05-001-E01| 2026-11-09T22:47:13.928Z| pod-01| Wazuh alerts / VCC telemetry| "90d28fea-921d-4de9-9058-123594363471"| "0423124bc78f496caeffea9fec32750f"| "12661b7c13bf48538cb75c2e471eed2e"| 100191| Sanitized Wazuh alert: original suspicious upload| Confirms a mismatched file was accepted despite declared MIME "image/jpeg" and detected MIME "application/octet-stream".
INC-W05-001-E02| 2026-11-12T14:29:26.515Z| pod-01| Wazuh alerts / VCC telemetry| "903d3fc4-59ee-4d69-839a-624a38e51202"| "a7b95da264c94e3f8aa996551527de4d"| "12661b7c13bf48538cb75c2e471eed2e"| 100193| Sanitized Wazuh alert: support quarantine| Confirms successful quarantine, incident reference "INC-W05-001", and correlation with the original upload.

Evidence handling notes

- Both records were confirmed indexed in central Wazuh.
- Both events belong to "pod-01" and scenario "w05-poisoned-upload".
- The upload ID and SHA-256 fingerprint match across both events.
- SHA-256: "6f79d71f91f8d6c8adb096afede629f3bf4f98145a06e02fa85a469c70c92cfb"
- No raw uploaded file or sensitive payload is included.
- Fixed-release rejection (Rule 100192) and legitimate PNG acceptance (Rule 100190) have not yet been verified and are therefore excluded.

Evidence assessment: Original suspicious acceptance and subsequent quarantine are confirmed in central Wazuh. Remediation evidence remains outstanding.




**Week 05 — Sanitized Evidence Register**

Scenario: w05-poisoned-upload
Pod: pod-01
Authorized window UTC: 2026-11-11T20:48:04.349Z – 2026-11-12T14:37:29.948Z
Incident: INC-W05-003

Evidence ID| UTC event time| Pod| Source| Event ID| Request ID| Upload ID (if applicable)| Wazuh Rule (if indexed)| Sanitized file/link| What it establishes
INC-W05-003-E01| 2026-11-11T20:48:04.349Z| pod-01| Central Wazuh / VCC telemetry| d60d513f-3940-4824-a0e7-d542bf914563| f1c23f766f49463cbd705fb3ce322d27| 8beaeb03f5cc4f4a887d504a49f553b6| 100191| Sanitized Wazuh alert| Confirms suspicious file upload was accepted despite declared/detected MIME mismatch.
INC-W05-003-E02| 2026-11-12T14:37:29.948Z| pod-01| Central Wazuh / Support containment| fdad56ac-5814-4a6b-b0a2-f7c546b02896| 0718475409da4ad49248914e2636b1bf| 8beaeb03f5cc4f4a887d504a49f553b6| 100193| Sanitized Wazuh alert| Confirms successful quarantine of the same upload under INC-W05-003.
INC-W05-003-E03| Not supplied| pod-01| Central Wazuh / Fixed-release retest| Not verified| Not verified| Not verified| Not verified| Pending| Fixed-state rejection of MIME-mismatched upload; expected rule 100192.
INC-W05-003-E04| Not supplied| pod-01| Central Wazuh / Fixed-release retest| Not verified| Not verified| Not verified| Not verified| Pending| Legitimate PNG acceptance baseline; expected rule 100190.

Evidence integrity

- Filename: inert_mime_mismatch.jpg
- Declared MIME: image/jpeg
- Detected MIME: application/octet-stream
- File size: 53 bytes
- SHA-256: 6f79d71f91f8d6c8adb096afede629f3bf4f98145a06e02fa85a469c70c92cfb
- Incident reference: INC-W05-003

Verification summary

- E01: Centrally indexed — confirmed.
- E02: Centrally indexed — confirmed.
- E03: Pending fixed-release rejection evidence.
- E04: Pending legitimate PNG acceptance evidence.

Current status: Suspicious upload detected and quarantine verified. Final remediation validation pending.
