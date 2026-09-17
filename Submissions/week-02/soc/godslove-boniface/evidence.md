# Evidence - Redacted - Pod-02 - Week 02
# Source file: week_02_Raw_telemetry.docx
# Index: wazuh-alerts-4.x-2026.09.10 Location: /var/ossec/logs/telemetry.ndjson Agent: wazuh.manager

## Ev-01 Baseline
agent.name:wazuh.manager pod_id:pod-02 event_id:evt-auth-0001 event_time:2026-08-01T08:55:02Z ingest_time:2026-08-01T08:55:03Z event_type:authentication action:login dstuser:student03 outcome:success source_ip:198.51.100.10 session_id:sess-normal-001 correlation_id:corr-normal-001 full_log {user:student03 destination_service:learner-web}

## Ev-02 to Ev-06 Brute Force T1110
evt-auth-0002 2026-08-01T09:14:21Z pod-02 svc-backup failure invalid_credentials 203.0.113.44 corr-auth-701 rule.id 100110 level 5 MITRE T1110
evt-auth-0003 2026-08-01T09:14:49Z pod-02 svc-backup failure 203.0.113.44 corr-auth-702
evt-auth-0004 2026-08-01T09:15:17Z pod-02 svc-backup failure 203.0.113.44 corr-auth-703
evt-auth-0005 2026-08-01T09:15:45Z pod-02 svc-backup failure 203.0.113.44 corr-auth-704 firedtimes 5
evt-auth-0006 2026-08-01T09:16:13Z pod-02 svc-backup failure 203.0.113.44 corr-auth-705 firedtimes 4

## Ev-07 Ev-09 Enum
evt-auth-0007 2026-08-01T09:16:38Z student17 failure 203.0.113.44 corr-auth-706
evt-auth-0008 2026-08-01T09:17:06Z student22 failure 203.0.113.44 corr-auth-707

## Ev-08 Visibility Gap - KEY
evt-health-0001 2026-08-01T09:16:55Z pod-02 telemetry_health status disconnected source_component endpoint-process-feed last_event_time 2026-08-01T09:16:10Z corr-health-301 rule.id 100150 level 9 description: Telemetry quality problem

## Ev-10 Compromise
evt-auth-0009 2026-08-01T09:18:07Z pod-02 authentication login svc-backup success 203.0.113.44 sess-suspect-902 corr-auth-708 rule.id 100120

## Ev-11 Recon
evt-app-0001 2026-08-01T09:18:33Z pod-02 application_access view_profile GET svc-backup success sess-suspect-902 corr-app-901

## Ev-12 Denied
evt-authz-0001 2026-08-01T09:19:02Z pod-02 authorization read_pod_evidence svc-backup denied cross_pod_scope 203.0.113.44 sess-suspect-902 corr-authz-901

## Ev-13 Critical ATO
evt-account-0001 2026-08-01T09:19:41Z pod-02 account_change email_change actor_user svc-backup dstuser student17 success 203.0.113.44 sess-suspect-902 corr-account-901

## Ev-14 Anti-forensics
evt-session-0001 2026-08-01T09:20:19Z pod-02 session revoke svc-backup success sess-suspect-902 corr-session-901

## Ev-15 to Ev-18 Recovery
evt-auth-0010 2026-08-01T09:21:04Z failure session_revoked svc-backup 203.0.113.44 corr-auth-709
evt-health-0002 2026-08-01T09:25:00Z pod-02 telemetry_health connected corr-health-302
evt-auth-0011 2026-08-01T10:02:11Z student03 failure 198.51.100.10 corr-normal-002
evt-auth-0012 2026-08-01T10:02:38Z student03 success 198.51.100.10 sess-normal-002 corr-normal-003
