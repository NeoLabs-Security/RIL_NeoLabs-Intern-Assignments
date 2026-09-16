Evidence/EV-01
[REDACTED LOG EXCERPT - BRUTE FORCE ATTEMPTS]
{
  "event_id": "evt-auth-0002",
  "event_time": "2026-08-01T09:14:21Z",
  "event_type": "authentication",
  "action": "login",
  "outcome": "failure",
  "reason": "invalid_credentials",
  "user": "svc-backup",
  "source_ip": "203.0.113.44",
  "destination_service": "learner-api",
  "pod_id": "pod-03"
}
... [4 similar failed entries omitted for brevity] ...
{
  "event_id": "evt-auth-0007",
  "event_time": "2026-08-01T09:16:38Z",
  "event_type": "authentication",
  "action": "login",
  "outcome": "failure",
  "reason": "invalid_credentials",
  "user": "[REDACTED_USER_17]",
  "source_ip": "203.0.113.44",
  "destination_service": "learner-api"
}
Evidence/EV-02
[REDACTED LOG EXCERPT - SUCCESSFUL LOGIN/COMPROMISE]
{
  "event_id": "evt-auth-0009",
  "event_time": "2026-08-01T09:18:07Z",
  "event_type": "authentication",
  "action": "login",
  "outcome": "success",
  "user": "svc-backup",
  "source_ip": "203.0.113.44",
  "destination_service": "learner-api",
  "session_id": "sess-suspect-902",
  "authentication_method": "password"
}
Evidence/EV-03
[REDACTED LOG EXCERPT - CROSS-POD ACCESS DENIED]
{
  "event_id": "evt-authz-0001",
  "event_time": "2026-08-01T09:19:02Z",
  "event_type": "authorization",
  "action": "read_pod_evidence",
  "outcome": "denied",
  "reason": "cross_pod_scope",
  "user": "svc-backup",
  "source_ip": "203.0.113.44",
  "requested_pod_id": "pod-04",
  "session_id": "sess-suspect-902"
}
Evidence/EV-04
[REDACTED LOG EXCERPT - ACCOUNT CHANGE]
{
  "event_id": "evt-account-0001",
  "event_time": "2026-08-01T09:19:41Z",
  "event_type": "account_change",
  "action": "email_change",
  "outcome": "success",
  "user": "[REDACTED_USER_17]",
  "actor_user": "svc-backup",
  "source_ip": "203.0.113.44",
  "session_id": "sess-suspect-902"
}
Evidence/EV-05
[REDACTED LOG EXCEERPT - SESSION REVOKED]
{
  "event_id": "evt-session-0001"
  "event_time": "2026-08-01T09:20:19Z"
  "event_type": "session"
  "action": "revoke"
  "outcome": "success"
  "user": "svc-bav=ckup"
  "source_ip": "203.0.113.44",
}
Evidence/EV-06
[REDACTED LOG EXCERPT - TELEMETRY FEED DISCONNECTION]
{
  "event_id": "evt-health-0001",
  "event_time": "2026-08-01T09:16:55Z",
  "event_type": "telemetry_health",
  "status": "disconnected",
  "source_component": "endpoint-process-feed",
  "last_event_time": "2026-08-01T09:16:10Z"
}
