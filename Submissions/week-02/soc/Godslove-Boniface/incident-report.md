&#x20;Week 05 — SOC incident investigation



Scenario: w05-poisoned-upload · Assigned pod: pod-01

Authorized time window UTC: 2026-11-11T20:41:22.262Z – 2026-11-14T11:55:22.730Z · Issue / incident: INC-W05-002



\*Alert intake / source confidence\*

Wazuh dashboard/index: `wazuh-alerts-4.x-2026.11.11` and `wazuh-alerts-4.x-2026.11.14`

Evidence confirmed INDEXED (not merely broker accepted): \*yes — for EV-001 (100190) and EV-002 (100193) only\*

Analyst severity / rationale: \*Medium — Containment confirmed in index, but containment target was a benign PNG with no MIME mismatch. No suspicious MIME-mismatch accept or rejection verified in this batch, so remediation for poisoned upload remains unproven.\*



\*Correlated timeline\*

UTC event\_time | event\_type | reason\_code | http://rule.id | event\_id | request\_id | upload\_id | SOC verification

2026-11-11T20:41:22.262Z | http://file.upload\_accepted | accepted | 100190 | 333c8d0b-4c14-4e50-9607-187f0889e55a | cb4440c394fa43e8b1e66dc3cea062cf | cc79eb3c1fbf4f39ba26c0ae21be6095 | INDEXED — Wazuh dashboard confirmed, firedtimes: 1, level: 3

2026-11-11T18:50:19.776Z | http://file.upload\_accepted | accepted | 100190 | 894f1827-6107-47b5-a44e-0b538c7b08e8 | fe8425c99a6d4cca9ac47e47b05df240 | 730e92169d23473fa61310bcb591c7ef | REFERENCED in Support record only — not in Wazuh JSON in this batch

2026-11-14T11:55:22.730Z | http://file.upload\_quarantined | support\_containment | 100193 | b6e9b468-a161-43fa-bf23-76d273218737 | 2c357bfb94834666b234c78b0d16ec77 | 730e92169d23473fa61310bcb591c7ef | INDEXED — Wazuh dashboard confirmed, firedtimes: 1, level: 5

Not verified in this batch | http://file.upload\_accepted | extension\_only\_validation | 100191 | Not verified | Not verified | Not verified | NOT VERIFIED — No JSON in this batch

Not verified in this batch | http://file.upload\_rejected | content\_type\_mismatch | 100192 | Not verified | Not verified | Not verified | NOT VERIFIED — No JSON in this batch

Only enter rule IDs actually observed in the index. Rule 100191 may supersede the base 100190 on one event.



\*Analysis and case decisions\*

Original suspicious proof: \*Not established in this batch.\* No file with declared MIME != detected type was provided in this docx. The only quarantined file, `images-removebg-preview.png`, shows Declared: `image/png` / Detected: `image/png` / Mismatch observed: NO.

Benign baseline and false positives: 

\- `valid\_1x1.png` — Declared: `image/png` / Detected: `image/png` / 69 bytes — Accepted correctly under 100190.

\- `images-removebg-preview.png` — Also Declared = Detected = `image/png` — Accepted correctly under 100190, then later quarantined under 100193. This looks like containment applied to a benign baseline file, possible false positive / wrong target, or test containment. Needs clarification from Support.

Pod/track scope validation: All indexed events na `pod-01`, `cohort\_id: w05-local-mentor`, `scenario\_id: w05-poisoned-upload`, `scenario\_release: vulnerable`, `synthetic: true`, `component: w05-upload-api`, `environment: vcc-security-lab`. In scope.



\*Pentest -> SOC -> Support handoff\*

Approved incident reference: \*INC-W05-002\*

Original suspicious event ID: Not verified in this batch — the original accept for the quarantined upload is `894f1827-6107-47b5-a44e-0b538c7b08e8` per Support record, but that is a benign PNG accept, not a MIME-mismatch accept.

Exact upload ID: `730e92169d23473fa61310bcb591c7ef` — opaque 32-char, quarantined upload

Support containment returned event ID: `b6e9b468-a161-43fa-bf23-76d273218737`

Wazuh indexed quarantine rule 100193: \*yes\*



\*Remediation validation\*

Fixed-state suspicious rejection rule 100192: \*not verified — no indexed event ID in this batch\*

Normal PNG acceptance rule 100190: \*verified — Event ID `333c8d0b-4c14-4e50-9607-187f0889e55a` / status: success / accepted. Second accept `894f1827-6107-47b5-a44e-0b538c7b08e8` referenced in Support record only.\*



\*Suggested rule tuning, escalation and lessons\*

\- Detection thresholds: Do not treat quarantine alone as proof of fix. Quarantine must be tied to the exact suspicious upload ID with MIME mismatch.

\- Noise: 100193 firing on a benign PNG suggests containment scope / targeting needs review, or this was an intentional test quarantine. Clarify with Support why `730e...` was chosen.

\- False positives: One possible false-positive containment in this batch. No false positive on accept — valid PNGs accepted correctly.

\- Residual risks: Poisoned-upload path (100191 accept -> 100192 reject) remains unproven. No evidence that a MIME-mismatch file would now be rejected.





