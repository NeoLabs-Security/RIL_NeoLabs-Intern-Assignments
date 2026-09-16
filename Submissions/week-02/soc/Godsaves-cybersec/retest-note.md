# Retest Notes

## Objective

Validate detection visibility and correlation for suspicious
service-account activity involving authorization denial and sensitive
account changes.

## Fixed-Release Before/After Result

### Before

The available telemetry successfully contained the required event
types:

- Application access
- Authorization
- Account change 
- Session activity
- Telemetry health

The activity was correlated using:

- `svc-backup`
- `203.0.113.44`
- `sess-suspect-902`

However, a formal before/after detection test was not captured in the
available evidence.

Status: NOT TESTED

## Detection Change

The proposed detection correlates:

- Authorization denial
- `cross_pod_scope`
- Sensitive account change
- Common session ID
- Common source IP

## After

A formal post-change execution of the detection query has not yet
been captured.

Status: PENDING

## Telemetry Visibility Check

The endpoint-process feed reported:

- Last event before disconnect: 09:16:10 UTC
- Feed disconnected: 09:16:55 UTC
- Gap ended: 09:24:58 UTC
- Feed connected: 09:25:00 UTC

This confirms that there was an endpoint-process telemetry visibility
gap during the investigation period.

## Final Result

Detection status: PARTIAL / PENDING

Reason:

The underlying telemetry required for investigation is present, and
the suspicious events can be correlated using the available fields.
However, a formal before/after validation of the proposed detection
rule has not yet been demonstrated in the supplied evidence.

## Next Retest Action

Run the proposed detection against the NeoLabs telemetry and confirm
that it identifies the correlated session:

`sess-suspect-902`

and source:

`203.0.113.44`

without incorrectly treating unrelated baseline events as the same
incident.