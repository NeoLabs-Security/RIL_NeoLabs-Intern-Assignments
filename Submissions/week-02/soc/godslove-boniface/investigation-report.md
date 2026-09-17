# SOC Investigation Report - Week 02 - Wazuh Telemetry
# Analyst: Godslove Boniface | Pod: pod-02 | Date: 2026-08-01
# Source: wazuh-alerts-4.x-2026.09.10 /var/ossec/logs/telemetry.ndjson

## Executive Summary
On 2026-08-01 between 09:14:21Z and 09:20:19Z, external IP 203.0.113.44 performed brute-force (T1110) against svc-backup on pod-02, achieved success at 09:18:07Z with session sess-suspect-902 during a telemetry visibility gap (endpoint-process-feed disconnected at 09:16:55Z). Attacker attempted cross-pod evidence read (denied) but succeeded in account takeover by changing student17 email at 09:19:41Z, then revoked sessions for anti-forensics.

## Timeline of Compromise
- 08:55:02Z Baseline: student03 success from 198.51.100.10 sess-normal-001 corr-normal-001
- 09:14:21Z - 09:16:13Z 5x Failure svc-backup from 203.0.113.44 rule.id 100110 T1110
- 09:16:38Z User enum student17 failure
- 09:16:55Z VISIBILITY GAP: evt-health-0001 status disconnected source_component endpoint-process-feed corr-health-301 level 9 rule.id 100150
- 09:17:06Z student22 failure
- 09:18:07Z COMPROMISE: evt-auth-0009 success svc-backup sess-suspect-902 corr-auth-708 rule.id 100120
- 09:18:33Z Recon: evt-app-0001 view_profile GET success sess-suspect-902
- 09:19:02Z AuthZ: evt-authz-0001 read_pod_evidence denied cross_pod_scope sess-suspect-902
- 09:19:41Z CRITICAL ATO: evt-account-0001 email_change actor svc-backup dstuser student17 success sess-suspect-902
- 09:20:19Z Anti-forensics: evt-session-0001 revoke success sess-suspect-902
- 09:21:04Z Attacker blocked: session_revoked failure
- 09:25:00Z Visibility restored: evt-health-0002 connected corr-health-302
- 10:02:38Z Recovery: student03 success from 198.51.100.10

## Impact
- Confidentiality: student17 PII email changed
- Integrity: Account manipulation T1098
- Availability: Session revoke caused victim lock (evt-auth-0011)

## MITRE ATT&CK
T1110 Brute Force, T1083 User Enum, T1078 Valid Accounts (svc-backup), T1083 Recon, T1098 Account Manipulation, T1529 Resource Hijacking (session revoke)

## Recommendations
1. Block 203.0.113.44 at WAF
2. Disable and rotate svc-backup, enforce IP allowlist 198.51.100.0/24 + MFA
3. Fix authz: deny write if read denied in same session
4. Fix telemetry: HA for endpoint-process-feed on pod-02, alert on health disconnected + auth burst
5. Revert student17 email, force password reset
