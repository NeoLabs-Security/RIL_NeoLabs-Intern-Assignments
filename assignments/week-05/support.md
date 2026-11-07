# Week 05 — IT Security & Support: Operation Poisoned Upload

**Status:** draft until the NeoLabs broker publishes Support `STUDENT_READY` Week 05 resources. **Scenario:** `w05-poisoned-upload`. One assigned pod only.

## Mission

Investigate a harmless suspicious upload identified by Pentest/SOC, preserve pre-change evidence, obtain incident-owner approval, quarantine the exact synthetic artifact, verify SOC's containment alert, and document recovery/retest.

## Student onboarding (AFTER mentor publishes W05 Support access)

The mentor must authorize and enroll your separate Week 05 **public** SSH key on the new W05 host. From your IT Security Support toolkit root, on the device that will own the SSH localhost tunnel:

```bash
bash neolabs incident keygen
```

Provide the displayed **public** key only to the mentor privately. Keep the private key, NeoLabs Access Code and session tokens secret. Key generation by itself does NOT authorize access.

When the existing broker publishes your Week 05 assigned pod, Support role, restricted W05 SSH username and approved window:

```bash
bash neolabs login
bash neolabs status
bash neolabs targets
bash neolabs connect
```

Keep the `connect` terminal open. On the machine owning the tunnel, run:

```bash
bash neolabs incident dashboard
```

The official Support desk opens at `http://127.0.0.1:18080/support` via the existing-broker one-time handoff. Wrong pod, Week 4-only broker manifest, an unregistered W05 Support SSH key or missing official approval must fail closed.

**Mentor preview only:** `bash neolabs incident dashboard --mentor-preview` uses the separate approved 18600 tunnel and private mentor test code; it is **not** for student distribution.

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

No due date, grading weight or access authorization is implied by this draft. Mentor Issue and `SUBMISSION_HANDBOOK.md` are authoritative.
