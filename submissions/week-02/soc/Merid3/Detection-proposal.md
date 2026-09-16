# Detection Proposal:

## 1. High-Frequency Authentication Failure Followed by Success
* **Signal:** Multiple failed login attempts from a single source IP targeting one or more accounts, immediately followed by a successful authentication within a short timeframe.
* **Correlation:**

    event_type: 'authentication'
    outcome: 'failure'
reason: 'invalid credentials'
 
    event_type: 'authentication'
    outcome: 'success'
* **Timeframe/window:** 5minutes
  condition: selection_fail count(event_id) >= 5 BY source_ip THEN selection_success BY source_ip
* **Severity:** High (Level 8) 
* **False positives** A real user who forgot their password and tried multiple times before getting it right/ an automated script using old credentials
* **Analyst Verification Step:** 
1. Check if the source IP belongs to a trusted corporate network or VPN.
2. Inspect actions taken immediately after the successful login under that session ID.
 
## 2. Unauthorised Cross-Pod Scope 
* **Signal:** A user or service account gets explicitly denied when trying to access resources outside their assigned environment or pod.
* **Correlation:**
  event_type: 'authorization'
  outcome: 'denied'
  reason: 'cross_pod_scope'
* **Time Window:** Immediate/2seconds
* **Severity:** High (Level 8)
* **False Positives:** Software misconfigurations or broken API routes trying to access the wrong environment after an update,or user's curiosity.
* **Analyst Verification Step:** 
1. Identify whether the account making the request is a human or a service account.
2. Confirm if the requested pod ID matches the account's asssigned boundary.

## 3. Account Modification
* **Signal:* An `account_change` event (`evt-account-0001`) with `action: email_change` where `actor_user` (`svc-backup`) differs from the targeted `dstuser` (`student17`).
* **Correlation:* 
  event_type: 'account change'
  outcome: 'success'
* **Time Window:* 1 minute 34 seconds (spanning from the initial successful login at 09:18:07 UTC to account modification execution at 09:19:41 UTC).
* **Severity:* High / Critical — Account modifications initiated by a service account indicate potential account takeover or privilege escalation. Noting session was revoked initiated by scenario controller by 09:20:19 with a time window of 38 seconds. 
* **False Positives:* Legitimate automated administrative job or legitimate user change.
* **Analyst Verification Steps:*
1. Verify whether `actor_user` had an approved administrative change ticket for modifying account.
2. Confirm if `source_ip` aligns with authorized management subnets or jump hosts.
3. Check if user reported losing account access or received unexpected notification emails.

## 4. Telemetry Disconnection
* **Signal:** A log feed shows telemetry health status as "Disconnected"
* **Correlation**
  event_type: 'telemetry_health'
  status: 'disconnected'
  source_component: 'endpoint-process-feed'
* ** Time Window:** 1 minute
* ** Severity:** High (Level 9)
* ** False Positives:** Scheduled server reboots,network falure or routine maintenance.
* ** Analyst Verification Step:**
1. Check if there was scheduled maintenance on the telemetry pipeline at that time.
2. Check if high-severity security alerts occurred right before the disconnection.
