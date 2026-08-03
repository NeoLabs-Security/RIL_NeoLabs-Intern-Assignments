# VCC Assigned-Pod Integration Design

## Objective

A grey-box intern must receive access only to the VCC application pod assigned by the programme operator. Editing a local environment variable, hostname or Burp scope must not grant access to another pod.

## Trust model

The VCC control plane remains authoritative for:

- intern identity;
- assigned testing pod;
- approved role accounts;
- testing window;
- permitted application surface;
- credential expiry and revocation.

The public toolkit contains configuration templates only. It never contains live hostnames, credentials or cohort assignments.

## Recommended enrolment flow

1. The operator creates the intern-to-pod assignment in the VCC control plane.
2. The operator issues a short-lived, single-use pentest enrolment token.
3. The learner runs a local enrolment helper that creates a private key and sends only a certificate signing request.
4. The control plane returns a client certificate bound to the intern, track, assignment and pod.
5. The control plane returns an approved target manifest containing the exact hostname, allowed ports, testing window and permitted role labels.
6. Local helpers validate the signed manifest before launching Burp or the fixed discovery profile.
7. Nginx or the VCC API derives pod scope from the active certificate rather than a learner-supplied `pod_id`.
8. Revocation or reassignment invalidates the old certificate and manifest.

## Target manifest

A future signed manifest should contain values similar to:

```json
{
  "schema_version": "1.0",
  "assignment_id": "synthetic-example",
  "track": "grey-box-pentest",
  "target_host": "pod-03.lab.example.invalid",
  "allowed_ports": [443],
  "valid_from": "2026-08-03T09:00:00Z",
  "valid_until": "2026-08-03T12:00:00Z",
  "allowed_roles": ["standard-user", "support-user"],
  "prohibited_actions": ["availability-testing", "credential-stuffing", "data-destruction"]
}
```

The example is documentation only and must not be accepted as a real assignment.

## Enforcement layers

### Server-side

- Mutual TLS or another operator-issued client credential.
- Certificate-to-assignment lookup.
- Server-derived pod routing.
- Expiry and revocation checks on every protected request.
- Rate and concurrency limits appropriate to the exercise.
- Audit logs containing assignment, intern, target and request metadata.
- Denial of client-supplied pod selectors.

### Workstation-side defence in depth

- Burp scope generated from the signed target manifest.
- Fixed Nmap wrapper accepting one exact hostname and no arbitrary flags.
- Browser profile dedicated to the assigned lab.
- No persistent storage of bootstrap tokens.
- Credential directory excluded from Git and protected by local permissions.

Workstation checks improve safety but are not the primary security boundary.

## Cross-track workflow

The same assignment identifier should connect:

- pentest findings and retest reports;
- SOC alerts and investigation records;
- IT Security Support change and remediation records;
- scenario version and pod telemetry.

This allows the programme to demonstrate a complete lifecycle without exposing mentor ground truth in student repositories.

## Required VCC repository changes

The VCC Security Lab implementation will need:

- a `track` field supporting `grey-box-pentest` assignments;
- pentest-specific enrolment tokens and certificate policy;
- a signed target-manifest endpoint;
- an exact-target gateway route;
- role-account issuance or reset workflow;
- revocation and reassignment controls;
- audit events for enrolment, manifest retrieval and access denial;
- CI tests proving that two pentesters cannot cross pods.

No live VCC infrastructure change should be deployed until the design is reviewed alongside the existing SOC control plane.
