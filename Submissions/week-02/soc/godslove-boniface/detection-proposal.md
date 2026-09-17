# Detection Proposal - Pod-02 - Week 02

## Signal
Rule Name: VCC-BRUTEFORCE-GAP-ATO-POD02
- Signal A: 5x rule.id 100110 outcome failure data.dstuser svc-backup source_ip 203.0.113.44 within 5m on pod-02
- Signal B: rule.id 100150 telemetry_health disconnected corr-health-301 within same window
- Signal C: rule.id 100120 success same IP same user with session_id sess-suspect-*
- Signal D: account_change email_change actor svc-backup dstuser student* in same session

## Correlation
Keys: data.source_ip + data.session_id + pod_id pod-02
Window: 15m sliding (attack 5m 58s + gap 8m)
Logic: (A >=5) AND B AND C AND (D OR authz denied cross_pod_scope)

## Severity
HIGH P2 - Service account takeover during visibility gap leads to student ATO

## False Positives
- Internal svc-backup from 198.51.100.0/24 sess-normal-* -> INFO
- Legit health disconnect without brute-force -> LOW, no correlation
- Student forgot password -> exclude dstuser student* without svc-backup success

## Analyst Verification
1. Search wazuh: pod_id:pod-02 AND session_id:sess-suspect-902
2. Check health: data.source_component:endpoint-process-feed status disconnected
3. Verify email change: evt-account-0001 actor svc-backup dstuser student17 at 09:19:41Z
4. Check VirusTotal 203.0.113.44
5. Block, rotate, revert
