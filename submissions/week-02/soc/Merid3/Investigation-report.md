# Incident Investigation Report:

*Target Scope:* NeoLabs VCC — pod-03
*Incident Reference:* corr-auth-701 through corr-session-901 
*Date of Incident:* August 1, 2026 (08:55:02 UTC – 09:25:00 UTC)

---
## Executive Summary
On August 1, 2026, between 09:14:21 UTC and 09:21:04 UTC, an external actor/a user operating from IP `203.0.113.44` conducted a brute-force credential attack against the `learner-api` service on `pod-03`. The actor successfully logged in/compromised the `svc-backup` service account, established session `sess-suspect-902`, performed unauthorized reconnaissance on user profiles, attempted unauthorized cross-pod evidence access, and modified the email address for target user `student17`. Automated containment initiated by the scenario controller successfully revoked the session at 09:20:19 UTC.

## Baseline (Normal Activity)
Standard baseline telemetry shows normal user authentications originating from known IP ranges (`198.51.100.10`) targeting the `learner-web` service. Typical logins complete without prior failure chains and operate within assigned pod scopes without attempting cross-pod data reads or administrative account modifications.

## Key Evidence Summary
* **EV-01 (Authentication Brute Force):** 6 failed authentication attempts from `203.0.113.44` targeting `svc-backup` and `student22` within 3 minutes.
* **EV-02 (Successful Login/Compromise):** Successful login to `svc-backup` from `203.0.113.44` creating session `sess-suspect-902`.
* **EV-03 (Unauthorized Authorization Attempt):** Cross-pod authorization request (`read_pod_evidence` for `pod-04`) explicitly denied (`reason: cross_pod_scope`).
* **EV-04 (Account Modified):** Email change executed by `svc-backup` on account `student17`.
* **EV-05 (Telemetry Blindspot):** Disconnection of `endpoint-process-feed` between 09:16:10 UTC and 09:24:58 UTC.

## Assessment
The incident represents a high-severity credential compromise and suspicious account modification. The attacker/user leveraged brute-force methods against a service account (`svc-backup`) that lacked adequate rate limiting or MFA protection. While cross-pod access controls successfully blocked lateral movement to `pod-04`, there was a successfully alteration of user account metadata (`student17`). The concurrent loss of endpoint process logs creates a potential visibility blindspot for local host execution during the intrusion window.

## Confidence & Limitations
* **Confidence Level:** High. Telemetry coverage across authentication, authorization, and application access logs provides end-to-end trace capability of the attacker's actions.
* **Limitations:** Host-level process execution details are missing during the 8-minute window (09:16:10–09:24:58 UTC) due to the `endpoint-process-feed` disconnection (`evt-health-0001`).

## Recommended Next Actions
1. **Immediate Containment:** Confirm complete termination of session `sess-suspect-902` and block IP `203.0.113.44` at the edge firewall/WAF.
2. **Credential Rotation:** Rotate credentials for `svc-backup` and issue a password reset for `student17`.
3. **Account Remediation:** Revert the unauthorized email change on `student17` to its verified baseline value.
4. **Visibility Remediation:** Inspect system health logs for `endpoint-process-feed` to address cause of stream disconnection.

