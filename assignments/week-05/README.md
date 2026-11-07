# Week 05 — Operation Poisoned Upload

**Scenario:** `w05-poisoned-upload` · **Runtime:** separate W05 VCC gateway, five isolated upload pods, existing central Wazuh SOC · **Status:** **DRAFT — no student authorization until the existing broker publishes Week 05**.

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

Each guide gives the **actual available student-toolkit commands**, expected harmless fixture behavior and precise file submission paths. These instructions are **conditional on official publication**, not permission to begin testing.

## Mentor must approve before publication

1. Existing Week 4 access, five pods and indexed Wazuh telemetry remain operational; do not overwrite its current release pointer without approved weekly transition/additive capability.
2. The central NeoLabs broker must publish the correct Week 5 **student-ready** scenario, pod, track, allowed window and exact restricted SSH resources for all affected students. **Week 4-only credentials/manifests are insufficient**.
3. Student Pentest and Support SSH public keys must be enrolled on the **separate** Week 5 server, with no shell and forwarding limited to its loopback gateway. Student keys are not the mentor-only host-to-host SOC tunnel key.
4. Pentest/Support client access must fail closed when scope, pod, role, time window or gateway target is wrong; SOC must validate the assigned Wazuh view and original event-ID indexing.
5. Fixed/vulnerable tests (201/201/415 vs 201/415/415) must pass, and the approved Support quarantine must generate a centrally indexed rule 100193 event.
6. Mentor supplies a Week 05 assignment Issue, incident reference, cohort **due date**, grading rubric and student announcements. No due date or release is invented by this draft.

The complete mentor gateway/checklist is in the VCC runtime branch's `docs/operator/W05_STUDENT_RELEASE_GATE.md`.

## Scope and safety

Only test a server-assigned pod, active approved window and harmless fixture. No malware, executables, personal data, arbitrary uploads, browser takeover, cross-pod access, broad scans, denial of service, direct host/DB modification, secret sharing or shell access to containers.

Don't confuse the current **mentor-only preview** at localhost 18600 with the official **student** localhost tunnel at 18080. No student should receive the standalone preview code or central SOC exporter secret.

Submissions go to `submissions/week-05/<pentest|soc|support>/<github-username>/` in this assignments repo, using the existing per-student PR review workflow. Leave PRs open for the mentor.
