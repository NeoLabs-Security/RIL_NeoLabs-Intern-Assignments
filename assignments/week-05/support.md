# Week 05 — IT Security & Support: Operation Poisoned Upload

**Status:** published 9 November 2026; a broker-issued Support `STUDENT_READY` assignment for your exact pod remains required. **Scenario:** `w05-poisoned-upload`. One assigned pod only.

## Mission

Investigate a harmless suspicious upload identified by Pentest/SOC, preserve pre-change evidence, obtain incident-owner approval, quarantine the exact synthetic artifact, verify SOC's containment alert, and document recovery/retest.

## Student onboarding — approved Week 05 access

From your **current IT Security Support toolkit** root, use exactly the
original two NeoLabs broker commands:

```bash
bash neolabs login --pod XX
bash neolabs connect
```

Replace `XX` with the pod number assigned by the mentor. Enter only your
existing NeoLabs Access Code when asked. **Do not generate a key manually,
paste or send a public key, use scp, or create any SSH account yourself.**

`connect` automatically creates/reuses an Ed25519 identity on your own device,
registers its **public key only** with the authenticated central broker,
waits for the server's restricted SSH enrollment service, verifies the broker
published SSH host-key pin and opens the scoped localhost tunnel. The private
key never leaves your laptop. Keep the tunnel terminal open.

From another terminal on the **same device**, run:

```bash
bash neolabs incident dashboard
```

The authorized Support desk opens at
`http://127.0.0.1:18080/support`. The broker must publish the assigned
Support pod and current Week 05 scenario. Wrong pod/track, expired session or
missing authorization fail closed; contact the mentor rather than bypassing.

**Mentor preview only:** `bash neolabs incident dashboard --mentor-preview`
is not part of the student workflow. A private Support Pod 01 code has been distributed by track email; it does not authorize a different pod. No mentor-preview code is distributed to interns.

## Authorized incident workflow

1. Receive a mentor-approved `INC-W05-...` incident ID, source Pentest `upload_id`, `event_id`, assigned pod and SOC's central-indexed rule `100191` evidence.
2. In the Incident Desk review the suspect file's name, SHA-256, declared MIME, detected MIME, current state and same-pod audit IDs. Confirm it is an active mismatched **synthetic** upload.
3. **Before containment**, document approval and original evidence. Select the exact upload. Enter the approved incident ID, tick the explicit confirmation checkbox and confirm the irreversible student action.
4. Verify the response is `state=quarantined` with a **new** `event_id` and `request_id`. Refresh the inventory and confirm the state.
5. Give the new containment event ID to SOC, who checks the **central Wazuh index** for rule `100193` and the same pod/incident.
6. After the mentor authorizes a fixed-release retest, record Pentest confirmation that the mismatched JPG returns HTTP 415 and a legitimate PNG still returns HTTP 201.
7. Export the Incident Desk's sanitized `.md` record, add SOC proof, recovery notes, a concise user-facing summary and a prevention knowledge-base entry.

**Scope boundary:** No host SSH shell, no raw file download, no SQL updates, no direct volume edits, no other pod and no student-controlled restore. Quarantine does not need file execution. An incident ID matching the string format is not by itself permission; obtain mentor/incident-owner approval.

## Submission

Use branch `week-05/support/<github-username>-poisoned-upload` and folder `submissions/week-05/support/<github-username>/`. Include:
- `ticket-resolution.md` based on `assignments/week-05/templates/support-ticket-resolution.md`.
- `evidence-register.md` based on the shared template.

Report the approved change record, source and containment event IDs, observed state, indexed SOC rule `100193` (or honestly mark not verified), fixed-release business-continuity checks, limitations, communications and escalation. Leave the PR open for mentor review.

**Official assignment: [IT Security & Support Issue #37](https://github.com/NeoLabs-Security/RIL_NeoLabs-Intern-Assignments/issues/37).** Mentor will announce the due date there. `SUBMISSION_HANDBOOK.md` governs submissions.
