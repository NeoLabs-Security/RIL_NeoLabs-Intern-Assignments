# Week 05 — Operation Poisoned Upload

**Scenario:** `w05-poisoned-upload` · **Runtime:** separate W05 VCC gateway, five isolated upload pods, existing central Wazuh SOC · **Status:** **LIVE since 9 November 2026.** The broker reports `STUDENT_READY`/`INTERACTIVE_TEST`; each intern still requires an authorized scenario, track, pod and valid access code.

## Scenario

The synthetic VCC coursework-evidence upload feature has an intentionally vulnerable release that trusts an approved extension and declared MIME type without checking the actual file signature. A harmless plain-text file labeled JPG may be incorrectly accepted; the fixed release rejects it. There is **no malware execution, code upload, public file retrieval or cross-pod target**.

The exercise is collaborative, **not competitive**:

**Pentesting** demonstrates the controlled upload-validation mismatch and conducts fixed-state retesting; **SOC** correlates the exact original event IDs on the central Wazuh dashboard and creates an incident; **IT Security & Support** reviews the approved artifact and quarantines it through the protected Support Incident Desk; **SOC** confirms the new quarantine event ID (rule 100193).

## Start here — assigned track

- [Pentesting instructions](pentest.md)
- [SOC investigation instructions](soc.md)
- [IT Security & Support instructions](support.md)
- [Submission Handbook](SUBMISSION_HANDBOOK.md)
- [Evidence-ready templates](templates/)

Each guide gives the **actual available student-toolkit commands**, expected harmless fixture behavior and precise file submission paths. Week 05 is published. Only the individually authorized track, pod and current broker window are in scope.

## Published assignment Issues

- [Pentesting Issue #35](https://github.com/NeoLabs-Security/RIL_NeoLabs-Intern-Assignments/issues/35)
- [SOC Level 1 Issue #36](https://github.com/NeoLabs-Security/RIL_NeoLabs-Intern-Assignments/issues/36)
- [IT Security & Support Issue #37](https://github.com/NeoLabs-Security/RIL_NeoLabs-Intern-Assignments/issues/37)

The Week 05 lab has been deployed and tested, and the NeoLabs broker's restricted automatic SSH enrollment for Pentesting and Support is active. The SOC local Wazuh and Week 05 telemetry validation are also tested. The three tracks were notified privately on 9 November 2026.

**Access codes:** The codes supplied in the launch emails authorize **Pod 01 for the corresponding track only**. They do not grant other pods or tracks. The distributed Pod 01 codes expire **16 November 2026, 06:00 UTC (7:00 AM WAT)**. This is a **credential expiry, not the assignment due date**. Students assigned to a different pod must obtain their own authorized credential privately; no secrets belong in public Issues or GitHub commits.

**Pending mentor decisions:** Post the exact assignment due date in each Issue, approve each specific Support quarantine incident (format `INC-W05-...`) and authorize the fixed-release retest window. Do not assume a fixed release or a valid-looking incident reference is approved. Testing is limited to the broker-issued pod and active window.

Pentesting and Support use the restricted local SSH forward on `127.0.0.1:18080`, with no manual SSH key enrollment. SOC uses its own local Wazuh workstation and may additionally use a separately authorized central Wazuh dashboard. Preserve other lab services; do not change the VCC release or another pod.

## Scope and safety

Only test a server-assigned pod, active approved window and harmless fixture. No malware, executables, personal data, arbitrary uploads, browser takeover, cross-pod access, broad scans, denial of service, direct host/DB modification, secret sharing or shell access to containers.

Don't confuse the current **mentor-only preview** at localhost 18600 with the official **student** localhost tunnel at 18080. No student should receive the standalone preview code or central SOC exporter secret.

Submissions go to `submissions/week-05/<pentest|soc|support>/<github-username>/` in this assignments repo, using the existing per-student PR review workflow. Leave PRs open for the mentor.
