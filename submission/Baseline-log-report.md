# Week 1 SOC Baseline Report
## Operation Night Watch

### 1. Scope
**Assigned Pod:** pod-01
**Scenario:** w01-night-watch-baseline (scenario_release: launch/2026-08-11-integrated)
**Telemetry Source:** vcc-security-lab (synthetic API telemetry, component: api)
**Analysis Period:** 2026-08-13T09:00:00Z -- 2026-08-13T09:03:00Z

### 2. Telemetry Observed
**Authentication:** login attempts (success and failure)
**Session:** session creation and closure
**Authorization/API:** resource access requests (profile, course catalogue, lessons, lesson assets, progress updates)
**Scenario-control:** scenario start and baseline verification markers

### 3. Normal Authentication Pattern
The baseline shows one ordinary failed login followed by a successful login, and one clean successful login for a second identity:

- At 09:00:12Z, Ada Learner (learner.pod-01.01) failed to log in due to invalid credentials. This event's metadata explicitly tags it as an "ordinary_baseline_mistype", a routine password typo, not a sign of malicious activity.
- At 09:00:25Z, just 13 seconds later, Ada Learner successfully authenticated from the same source IP (192.0.2.21), with reason code "active_account" confirming a valid, expected user.
- At 09:02:35Z, a second identity, Tobi Learner (learner.pod-01.02), logged in successfully on the first attempt, also from source IP 192.0.2.21.

**Normal pattern:** zero or one failed attempt (typically a mistype) immediately followed by a successful login, from a consistent source IP, with no repeated or rapid-fire failures that would indicate brute-forcing or credential stuffing.

### 4. Normal Application/API Pattern
After authenticating, a learner follows a predictable, linear navigation path through the platform. For Ada Learner's session (09:00:40Z--09:01:40Z), the sequence was:

1. GET /api/me, view own profile (09:00:40Z)
2. GET /api/core/sections, browse course catalogue (09:00:55Z)
3. GET /api/core/sections/sec-baseline-01/lessons, open a section's lesson list (09:01:10Z)
4. GET /api/core/lessons/lesson-baseline-01/assets, open lesson assets/materials (09:01:25Z)
5. PUT /api/progress/lessons/lesson-baseline-01, save lesson progress (09:01:40Z), recording partial completion (video 9/18 seconds, notes 40%, summary 30%, not completed)

**Normal pattern:** all requests are "allowed" with status 200, access is scoped only to the learner's own profile and course content (no attempts to reach other users' data or administrative endpoints), and the sequence moves logically from a broad view (catalogue) to progressively narrower detail (section -> lesson -> assets -> progress).

### 5. Normal Session Pattern

- A session is created immediately (within 1 second) after a successful login, e.g., session created at 09:00:26Z, one second after Ada's 09:00:25Z login.
- The session remains active while the learner performs authorization/API actions.
- The session is closed with reason "user_logout", e.g., Ada's session closed at 09:02:05Z, roughly 1 minute 39 seconds after it was created.
- Sensitive fields (credential material) are redacted in session-related telemetry.

**Normal pattern:** a tight create-immediately-after-login timing, session activity aligned with the user's API requests, and a clean, user-initiated closure rather than a timeout, forced termination, or unexplained gap.

### 6. Baseline Queries
**Query 1:** event_category = "authentication"
**Purpose:** Identify all login attempts (successful and failed) to establish the normal authentication pattern and confirm no brute-force or credential-stuffing behavior is present.

**Query 2:** event_category = "session"
**Purpose:** Confirm that sessions follow the expected create -> active -> close lifecycle, with no forced terminations, unexplained gaps, or exposed credential material.

**Query 3:** event_category = "authorization"
**Purpose:** Establish the normal sequence and scope of resource access for a learner (profile -> catalogue -> lessons -> assets -> progress) and confirm no denied requests or access to out-of-scope resources.

*(A fourth query, event_category = "scenario-control", was also run to confirm the baseline dataset was complete and correctly bounded.)*

### 7. Normal Activity Timeline
Reference timeline.md for the full minute-by-minute breakdown. In summary, the baseline window runs from the scenario-control.start event at 09:00:00Z to the scenario-control.verification event at 09:03:00Z, and contains 12 events across two learner identities: one failed login, two successful logins, one session created and closed, five authorization/API accesses, and the two scenario-control boundary markers.

### 8. Visibility Gaps

- No network-layer or host-based telemetry (e.g., firewall, DNS, endpoint/EDR logs) is included in this dataset, only application-layer API events are visible.
- The dataset does not indicate whether 192.0.2.21 represents a single shared lab/VM address or a NAT'd range used by multiple learners, so source-IP-based correlation across learners has limited reliability.
- No geolocation, device, or user-agent information is present, so it is not currently possible to confirm the physical or device context of each login.
- Only a 3-minute window (09:00:00Z--09:03:00Z) was captured; it is not yet known whether this pattern holds consistently across a full day or week of normal activity.

### 9. Baseline Conclusion
The Week 1 telemetry for pod-01 represents normal, expected "quiet-learning" activity: a single ordinary password mistype followed by a successful login, a session that opens immediately after login and closes cleanly on logout, and a logical, in-scope sequence of course-navigation requests, all confirmed complete by the scenario-control verification event. This pattern, one-or-zero failed logins before success, tight session/login timing, in-scope resource access only, and clean logouts establishes the reference baseline for pod-01.

When investigating a future security incident, this baseline is what deviations should be measured against: multiple rapid failed logins before success (possible brute-force), logins or session activity without a matching prior authentication event, access to resources outside a learner's own scope or to administrative endpoints, sessions that end abruptly without a "user_logout" reason, or activity from source IPs inconsistent with the shared lab range would all represent departures from this established normal pattern.
