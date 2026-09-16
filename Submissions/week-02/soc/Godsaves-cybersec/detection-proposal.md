# Detection Proposal

## Detection Objective

Detect suspicious service-account activity involving unauthorized
cross-pod access attempts followed by sensitive account changes.

## Signal

Primary detection signals:

- Authorization request denied because of `cross_pod_scope`.
- Sensitive account change performed by the same service account.
- Same source IP associated with both events.
- Same session ID associated with both events.

## Correlation

Correlate the following fields:
- `data.dstuser`
- `data.actor_user`
- `data.source_ip`
- `data.session_id`
- `data.pod_id`
- `data.event_type`
- `data.action`
- `data.outcome`

A high-confidence correlation should occur when:

1. A service account generates a denied authorization event.
2. The denial involves `cross_pod_scope`.
3. The same account/session subsequently performs a sensitive account
   change.
4. The same source IP is associated with the activity.

## Detection Window

5 minutes.

## Severity

High.

Reason:

A denied cross-pod access attempt followed by a successful sensitive
account modification within the same session represents a potentially
serious access-control and account-integrity concern.

## False Positives

Potential false positives include:

- Authorized administrative activity.
- Approved service-account maintenance.
- Automated training or testing scenarios.
- Legitimate account-management workflows.
- Security testing performed by authorized personnel.

## Analyst Verification Step

The analyst must verify:

1. Is `svc-backup` authorized to access the target account?
2. Is `svc-backup` authorized to modify account information?
3. Is `203.0.113.44` an approved source?
4. Is `sess-suspect-902` associated with an authorized activity?
5. Why was the cross-pod request attempted?
6. Was the email change authorized?
7. Were other accounts affected?
8. Was there activity during the endpoint telemetry visibility gap?
