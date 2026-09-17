# Retest Notes - Week 02 - Pod-02

## Before (Vulnerable) - From your docx
- 5 fails allowed, no block, rule 100110 firedtimes 4-5 but no active response
- 09:16:55Z health disconnected, gap covered 09:18:07Z success, no alert
- AuthZ denied 09:19:02Z but email_change allowed 09:19:41Z - broken
- Result: ATO evt-account-0001 success

## After (Expected Fixed)
- WAF block after 3 fails
- Telemetry HA: pod-02 endpoint feed redundant, no disconnect during auth burst
- AuthZ fix: deny email_change if same session had cross_pod_scope denied
- svc-backup IP allowlist 198.51.100.0/24 + MFA

## Retest 2026-08-01T10:30:00Z
- 4th login from 203.0.113.44 -> blocked, log shows session_revoked style
- svc-backup from external -> denied IP Not Allowed
- email_change in sess-suspect-902 -> denied Step-up Auth Required
- Detection fired in 2m

## Telemetry Visibility
| Check | Before | After |
|-------|--------|-------|
| auth logs | Yes 1-3s delay | Yes |
| session correlation | Yes sess-suspect-902 | Yes |
| health | disconnected 09:16:55Z Ev-08 | connected continuous Ev-16 09:25:00Z |
| full_log JSON synthetic | true | true |
| alert | No incident | HIGH alert |

Status: FIXED
