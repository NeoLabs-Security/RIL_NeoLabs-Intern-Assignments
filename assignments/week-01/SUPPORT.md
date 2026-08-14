# IT Security Support — Week 01

## Operation Night Watch: Normal Service Validation

### Objective

Establish what normal learner services look like and practise safe, evidence-preserving support.

## Phase A — prepare and authenticate

1. Pull the latest IT Security Support toolkit.
2. Read its Week 1 launch pack and `SUPPORT_BOUNDARIES.md`.
3. Review secure support foundations and Windows/Linux/network diagnostic material.
4. Prepare the support ticket, handover and escalation templates.
5. On Windows, run `setup-windows.cmd` once, then use the toolkit-local launcher:

```powershell
.\neolabs.cmd login
.\neolabs.cmd status
.\neolabs.cmd pod info
.\neolabs.cmd targets
.\neolabs.cmd connect
```

The server controls your pod and support-resource scope. For Week 1, `connect` exposes the authorised learner/support surface through a pod-isolated local connection, normally at:

```text
http://localhost:18080
```

Keep the connection terminal open while working. The internship learner app uses its normal email/password form; Google sign-in is intentionally disabled in internship pods.

## Phase B — only while the current manifest publishes a support resource

1. Confirm the current server-issued target/resource immediately before work.
2. Use only the local endpoint/resource authorised by the current manifest.
3. Verify normal learner workflow and approved service functions.
4. Work through the supplied synthetic support/onboarding ticket(s).
5. Separate browser/application symptoms from device, DNS, network and account symptoms.
6. Preserve non-sensitive evidence before proposing changes.
7. Record symptom, evidence, diagnosis, action/recommendation, validation and escalation status.
8. Write one short knowledge-base article for a common Week 1 issue.

If the manifest does not expose a current support endpoint, wait for the approved live window. Do not reuse an earlier IP/endpoint.

### Required files

Place these under `submissions/week-01/support/<github-username>/`:

- `setup-readiness-checklist.md`
- `support-ticket.md` (or multiple numbered tickets)
- `normal-service-check.md`
- `knowledge-base-article.md`
- `evidence/` where useful and redacted

### Change boundary

Do not change accounts, permissions, firewall rules, services, packages or security controls unless the current task explicitly authorises it. Prefer read-only diagnosis, preserve original state and record rollback information.

### Stop/escalate

Escalate suspected compromise, another pod becoming visible, real personal/production data or credentials, unapproved privilege/configuration changes, unexpected infrastructure access or service instability.
