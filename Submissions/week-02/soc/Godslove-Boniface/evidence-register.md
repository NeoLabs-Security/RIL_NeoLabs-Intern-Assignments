&#x20;Week 05 — Sanitized evidence register



Scenario: w05-poisoned-upload · Pod: pod-01 · Authorized window UTC: 2026-11-11T20:41:22.262Z – 2026-11-14T11:55:22.730Z

Evidence ID | UTC event time | Pod | Source | Event ID | Request ID | Upload ID (if applicable) | Wazuh Rule (if indexed) | Sanitized file/link | What it establishes

EV-001 | 2026-11-11T20:41:22.262Z | pod-01 | W05 dashboard / central Wazuh | 333c8d0b-4c14-4e50-9607-187f0889e55a | cb4440c394fa43e8b1e66dc3cea062cf | cc79eb3c1fbf4f39ba26c0ae21be6095 | 100190 | valid\_1x1.png | Normal PNG accepted correctly. Declared image/png = Detected image/png. SHA-256 ca9b3f6a5185b96230396dca88491d802b92f983593f1c02f1c483ac67cca1ba. Baseline.





EV-002 | 2026-11-14T11:55:22.730Z | pod-01 | Support quarantine response / central Wazuh | b6e9b468-a161-43fa-bf23-76d273218737 | 2c357bfb94834666b234c78b0d16ec77 | 730e92169d23473fa61310bcb591c7ef | 100193 | http://images-removebg-preview.png | Support containment quarantined. Incident INC-W05-002. SHA-256 d7183f1efa6effe00b927738885bcc70a54d588138490c46af2b43f7d108640b.



EV-003 | 2026-11-14T11:55:30.077Z | pod-01 | Support quarantine response | b6e9b468-a161-43fa-bf23-76d273218737 | 2c357bfb94834666b234c78b0d16ec77 | 730e92169d23473fa61310bcb591c7ef | Not a Wazuh rule — support record | http://images-removebg-preview.png | Support record confirms same quarantine, same IDs. States Mismatch observed: NO. Correlates EV-002 to earlier accept 894f1827-6107-47b5-a44e-0b538c7b08e8.





\*Provenance notes:\* EV-001 and EV-002 obtained from Wazuh dashboard / central Wazuh index `wazuh-alerts-4.x-2026.11.11` and `wazuh-alerts-4.x-2026.11.14`, location `/var/ossec/logs/vcc/vcc-events.ndjson`. EV-003 obtained from Support incident record generated 2026-11-14T11:55:30.077Z. Observer: analyst via approved Wazuh dashboard + Support record.











