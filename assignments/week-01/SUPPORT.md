# IT Security Support — Week 01

## Operation Night Watch: Normal Service Validation

### Objective
Establish what normal learner services look like and practise safe, evidence-preserving support.

## Phase A — start immediately
1. Read the toolkit Week 1 launch pack and `SUPPORT_BOUNDARIES.md`.
2. Review secure support foundations and Windows/Linux/network diagnostic material.
3. Prepare the support ticket, handover and escalation templates.
4. Rehearse read-only baseline collection on an authorised local/test machine if needed.
5. Authenticate with NeoLabs and verify your assignment:

```bash
neolabs login
neolabs status
neolabs pod info
neolabs scope
neolabs targets
```

If `neolabs targets` does not return a current support endpoint, wait for the approved live window before Phase B.

## Phase B — only when a live support resource is published
1. Use only the endpoint/resource returned by `neolabs targets`.
2. Verify normal learner workflow and approved service functions.
3. Work through the supplied support/onboarding ticket(s).
4. Separate browser/application symptoms from device, DNS, network and account symptoms.
5. Preserve non-sensitive evidence before proposing changes.
6. Record symptom, evidence, diagnosis, action/recommendation, validation and escalation status.
7. Write one short knowledge-base article for a common Week 1 issue.

### Required files
Place these under `submissions/week-01/support/<github-username>/`:

- `setup-readiness-checklist.md`
- `support-ticket.md` (or multiple numbered tickets)
- `normal-service-check.md`
- `knowledge-base-article.md`
- `evidence/` where useful and redacted

### Change boundary
Do not change accounts, permissions, firewall rules, services, packages or security controls unless the task explicitly authorises it. Prefer read-only diagnosis and preserve rollback information.

### Stop/escalate
Escalate suspected compromise, another pod becoming visible, real personal data/credentials, unapproved privilege/configuration changes or service instability.
