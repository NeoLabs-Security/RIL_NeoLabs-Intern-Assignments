# Authentication Timeline - Week 02 - Pod-02 - UTC
# Source: week_02_Raw_telemetry.docx

| UTC Time | Event ID | Type | Action | User | Outcome | Reason | Source IP | Session | Corr ID | Rule | Evidence |
|----------|----------|------|--------|------|---------|--------|-----------|---------|---------|------|----------|
| 2026-08-01T08:55:02Z | evt-auth-0001 | authentication | login | student03 | success | - | 198.51.100.10 | sess-normal-001 | corr-normal-001 | 100120 | Ev-01 |
| 2026-08-01T09:14:21Z | evt-auth-0002 | authentication | login | svc-backup | failure | invalid_credentials | 203.0.113.44 | - | corr-auth-701 | 100110 T1110 | Ev-02 |
| 2026-08-01T09:14:49Z | evt-auth-0003 | authentication | login | svc-backup | failure | invalid_credentials | 203.0.113.44 | - | corr-auth-702 | 100110 | Ev-03 |
| 2026-08-01T09:15:17Z | evt-auth-0004 | authentication | login | svc-backup | failure | invalid_credentials | 203.0.113.44 | - | corr-auth-703 | 100110 | Ev-04 |
| 2026-08-01T09:15:45Z | evt-auth-0005 | authentication | login | svc-backup | failure | invalid_credentials | 203.0.113.44 | - | corr-auth-704 | 100110 | Ev-05 |
| 2026-08-01T09:16:13Z | evt-auth-0006 | authentication | login | svc-backup | failure | invalid_credentials | 203.0.113.44 | - | corr-auth-705 | 100110 | Ev-06 |
| 2026-08-01T09:16:38Z | evt-auth-0007 | authentication | login | student17 | failure | invalid_credentials | 203.0.113.44 | - | corr-auth-706 | 100110 | Ev-07 |
| 2026-08-01T09:16:55Z | evt-health-0001 | telemetry_health | disconnected | - | - | endpoint-process-feed | - | - | corr-health-301 | 100150 L9 | Ev-08 GAP |
| 2026-08-01T09:17:06Z | evt-auth-0008 | authentication | login | student22 | failure | invalid_credentials | 203.0.113.44 | - | corr-auth-707 | 100110 | Ev-09 |
| 2026-08-01T09:18:07Z | evt-auth-0009 | authentication | login | svc-backup | success | - | 203.0.113.44 | sess-suspect-902 | corr-auth-708 | 100120 | Ev-10 COMPROMISE |
| 2026-08-01T09:18:33Z | evt-app-0001 | application_access | view_profile | svc-backup | success | - | 203.0.113.44 | sess-suspect-902 | corr-app-901 | - | Ev-11 |
| 2026-08-01T09:19:02Z | evt-authz-0001 | authorization | read_pod_evidence | svc-backup | denied | cross_pod_scope | 203.0.113.44 | sess-suspect-902 | corr-authz-901 | - | Ev-12 |
| 2026-08-01T09:19:41Z | evt-account-0001 | account_change | email_change | student17 | success | actor svc-backup | 203.0.113.44 | sess-suspect-902 | corr-account-901 | - | Ev-13 ATO |
| 2026-08-01T09:20:19Z | evt-session-0001 | session | revoke | svc-backup | success | - | - | sess-suspect-902 | corr-session-901 | - | Ev-14 |
| 2026-08-01T09:21:04Z | evt-auth-0010 | authentication | login | svc-backup | failure | session_revoked | 203.0.113.44 | - | corr-auth-709 | - | Ev-15 |
| 2026-08-01T09:25:00Z | evt-health-0002 | telemetry_health | connected | - | - | restored | - | - | corr-health-302 | - | Ev-16 |
| 2026-08-01T10:02:11Z | evt-auth-0011 | authentication | login | student03 | failure | invalid_credentials | 198.51.100.10 | - | corr-normal-002 | 100110 | Ev-17 |
| 2026-08-01T10:02:38Z | evt-auth-0012 | authentication | login | student03 | success | - | 198.51.100.10 | sess-normal-002 | corr-normal-003 | 100120 | Ev-18 |

Pod: pod-02 | Ingest delay: 1-3s | Total window: 08:55:02Z to 10:02:38Z
Attacker session pivot: sess-suspect-902 used for 5 actions
