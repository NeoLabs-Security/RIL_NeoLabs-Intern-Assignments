# Retest Notes

## Retest Summary and Results

## Test Case 1: Rapid Brute Force

* **The Attacker's Original Action (Pre-Fix):** The attacker made 6 failed login attempts in ~3 minutes from `203.0.113.44`, was never blocked, and successfully logged in on attempt #7 (`evt-auth-0009`).
* **The Retest Action (Post-Fix):** The security team ran a script sending 6 rapid login requests using invalid credentials from a test IP.
* **The Result:** On the 4th attempt, the API Gateway immediately returned `HTTP 429 Too Many Requests` and dropped further connections. The login succeeded nowhere.
* **Conclusion:** **PASSED** (Rate limiting effectively prevents brute-force compromise).

---

## Test Case 2: Cross-Pod Resource Request

* **The Attacker's Original Action (Pre-Fix):** At `09:19:02 UTC`, `svc-backup` requested `read_pod_evidence` on `pod-04`. Access was denied (`cross_pod_scope`), but session `sess-suspect-902` remained active until revoked manually minutes later.
* **The Retest Action (Post-Fix):** The test team authenticated successfully, obtained an active session, and submitted an authorized API request across pod boundaries.
* **The Result:** The request returned `HTTP 403 Forbidden`, and the middleware immediately revoked the session token. Subsequent requests with that session token failed instantly.
* **Conclusion:** **PASSED** (Automated containment works at the application layer).

---

## Test Case 3: Account Modifications

* **The Attacker's Original Action (Pre-Fix):** At `09:19:41 UTC`, `svc-backup` successfully modified the email address for user `student17`.
* **The Retest Action (Post-Fix):** A test script using the `svc-backup` token attempted to update a student account email address.
* **The Result:** The API returned `HTTP 403 Forbidden` (`reason: insufficient_rbac_privileges`), preventing the modification.
* **Conclusion:** **PASSED** (RBAC boundaries are properly enforced).

---

## Test Case 4: Telemetry & Visibility Check

* **The Original Issue:** `endpoint-process-feed` disconnected from `09:16:10` to `09:24:58 UTC`, leaving an 8-minute blindspot.
* **The Retest Action:** The team generated synthetic event bursts while forcing high CPU load on the host.
* **The Result:** The log pipeline maintained a stable connection with 0% dropped packets, and all security alerts (`Rule 100112` and `Rule 100140`) fired in real time.
* **Conclusion:** **VERIFIED** (No telemetry gaps detected).


