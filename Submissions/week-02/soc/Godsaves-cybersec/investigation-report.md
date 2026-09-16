# Case File 02 — Suspicious Service Account Activity

## Executive Summary

This investigation examines suspicious activity involving the
`svc-backup` service account in `pod-04`.

The activity was associated with source IP `203.0.113.44` and session
` sess-suspect-902`.

At 09:18:33 UTC, `svc-backup` successfully accessed the `student17`
profile through the `learner-api`.

At 09:19:02 UTC, the same session attempted to read evidence from
`pod-04`. The authorization request was denied because of
`cross_pod_scope`.

At 09:19:41 UTC, `svc-backup` successfully performed an email change
against the `student17` account.

At 09:20:19 UTC, the suspicious session was successfully revoked.

The investigation also identified an endpoint-process telemetry
visibility gap between 09:16:10 UTC and 09:24:58 UTC.

## Baseline

The available telemetry is synthetic NeoLabs VCC training telemetry
associated with `pod-04`.

The baseline events were identified by the following characteristics:

- Pod: `pod-04`
- Synthetic telemetry: `true`
- Source component: `endpoint-process-feed`
- Wazuh manager: `wazuh.manager`

The application-access event was classified by the platform as a
validated synthetic pod telemetry event.

The session activity should therefore be assessed against the
authorized behavior expected for the `svc-backup` account rather than
automatically classified as malicious.

## Key Evidence

### EV-01 — Application Access

At 09:18:33 UTC, `svc-backup` successfully performed
`view_profile` against `profile-student17` through `learner-api`.

Source IP:
`203.0.113.44`

Session:
`sess-suspect-902`

HTTP status:
`200`

Outcome:
`success`

### EV-02 — Authorization Violation

At 09:19:02 UTC, `svc-backup` attempted the
`read_pod_evidence` action against `pod-04`.

The request was denied because of `cross_pod_scope`.

Source IP:
`203.0.113.44`

Session:
`sess-suspect-902`

Outcome:
`denied`

### EV-03 — Sensitive Account Change

At 09:19:41 UTC, `svc-backup` successfully performed an
`email_change` action against the `student17` account.

Source IP:
`203.0.113.44`

Session:
`sess-suspect-902`

Outcome:
`success`

### EV-04 — Session Revocation

At 09:20:19 UTC, session `sess-suspect-902` was successfully revoked
by the scenario controller.

### EV-05 — Telemetry Visibility Gap

The endpoint-process feed reported a disconnected state.

The last observed event time was 09:16:10 UTC.

The telemetry gap ended at 09:24:58 UTC and the feed reported a
connected state at 09:25:00 UTC.

## Key Assessment

The strongest investigation signal is the combination of:

1. Successful access to the `student17` profile.
2. A denied cross-pod evidence-access request.
3. A successful email change against `student17`.
4. All three activities being associated with the same source IP
   `203.0.113.44`.
5. The same suspicious session ID `sess-suspect-902`.

The activity is suspicious and requires investigation because a
service account performed multiple actions involving another user's
profile and attempted an access operation outside its permitted pod
scope.

The available evidence does not establish the reason why
`svc-backup` performed these actions or whether the account itself was
compromised.

## Confidence

Confidence: Medium

The investigation has strong correlation between the application,
authorization, account-change and session events through the source
IP and session ID.

However, the evidence does not provide sufficient information to
determine the legitimate business purpose of the activity or confirm
account compromise.

## Limitations

- The telemetry is explicitly marked as synthetic training data.
- Endpoint-process telemetry was unavailable during a visibility gap.
- The available evidence does not identify the original authentication
  event for `svc-backup`.
- The available evidence does not establish whether `203.0.113.44`
  was an authorized source.
- No evidence was provided proving credential theft or malware.
- No evidence was provided showing what happened during the telemetry
  visibility gap.

## Recommended Next Action

1. Verify whether `svc-backup` is authorized to access `student17`
   profile information.
2. Verify whether `svc-backup` is authorized to modify account email
   information.
3. Investigate source IP `203.0.113.44`.
4. Review all activity associated with session
   `sess-suspect-902`.
5. Review other activity performed by `svc-backup`.
6. Confirm that the `student17` email change was authorized.
7. Investigate the endpoint-process telemetry gap.
8. Continue monitoring the `svc-backup` account for similar activity.