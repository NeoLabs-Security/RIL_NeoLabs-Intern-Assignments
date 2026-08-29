# NeoLabs SOC Query Journal Template

> Record searches as they are performed so another analyst can reproduce the investigation. Replace secrets and private endpoints with approved references; never paste enrolment tokens or private keys.

## Case information

| Field | Entry |
|---|---|
| Case / assignment ID | Operation Night Watch — Week 1 Baseline |
| Analyst | Bakor Barilee Owen |
| Assigned pod | pod-01 |
| Investigation date | 09:00:00Z–09:03:00Z baseline window |
| Primary alert | N/A — baseline establishment exercise (no alert; synthetic `quiet-learning` traffic profile used as fallback due to Wazuh access issues) |

## Query register

| Query ID | Time run (UTC) | Platform / source | Exact query or filter | Event-time range | Result count | Important result or negative finding | Evidence IDs | Next pivot |
|---|---|---|---|---|---|---|---|---|
| Q-001 | 09:00:12Z–09:02:35Z | Synthetic telemetry (`quiet-learning` dataset) | `event_category = "authentication"` | 09:00:00Z–09:03:00Z | 3 | One mistyped-password failure followed by a successful login (Ada Learner, IP 192.0.2.21); second successful login by a different identity (Tobi Learner) from the same IP — consistent with shared lab network, not brute-force | EV-AUTH-01, EV-AUTH-02, EV-AUTH-03 | Confirm session created immediately after Ada's successful login |
| Q-002 | 09:00:26Z–09:02:05Z | Synthetic telemetry (`quiet-learning` dataset) | `event_category = "session"` | 09:00:00Z–09:03:00Z | 1 | Session created 09:00:26Z, closed 09:02:05Z (~1m39s) with reason `user_logout`; credential material properly redacted | EV-SESS-01 | Check what resources were accessed during the session lifetime |
| Q-003 | 09:00:40Z–09:01:40Z | Synthetic telemetry (`quiet-learning` dataset) | `event_category = "authorization"` | 09:00:00Z–09:03:00Z | 5 | All 5 access events "allowed" (HTTP 200) from Ada Learner / 192.0.2.21; sequential profile → catalogue → section → lesson assets → progress-update pattern, no denied requests | EV-AUTHZ-01 to EV-AUTHZ-05 | Confirm scenario-control events bookend the observed window |
| Q-004 | 09:00:00Z, 09:03:00Z | Synthetic telemetry (`quiet-learning` dataset) | `event_category = "scenario-control"` | 09:00:00Z–09:03:00Z | 2 | `start` event confirms scenario "Operation Night Watch", profile `quiet-learning`, seed 42; `verification` event confirms all required event families present and redaction applied | EV-SCTL-01, EV-SCTL-02 | None — baseline confirmed complete; use as reference for anomaly detection in later scenarios |

## Detailed query record

### Query-001

**Question being tested:** What does normal authentication behavior look like in the pod-01 baseline?

**Data source and index/view:** Synthetic telemetry, `quiet-learning` traffic profile

**Exact query/filter/command:**

```text
event_category = "authentication"
```

**Time field used:** Event time
**Time range:** 09:00:12Z–09:02:35Z (within 09:00:00Z–09:03:00Z baseline window)
**Fields displayed or exported:** timestamp, identity, source IP, credential result, flag/tag
**Result summary:** Three authentication events: one failed login at 09:00:12Z (Ada Learner, invalid credentials, flagged `ordinary_baseline_mistype`), followed by a successful login at 09:00:25Z (same identity, IP 192.0.2.21), and a second successful login at 09:02:35Z (Tobi Learner, different identity, same IP).
**Relevant evidence IDs:** EV-AUTH-01, EV-AUTH-02, EV-AUTH-03
**Limitations:** Synthetic dataset only; no live Wazuh telemetry due to access issues.
**Decision / next query:** The mistype-then-success pattern is normal, expected behavior, not a brute-force attempt. Second learner logging in from the same IP is consistent with a shared lab/training network. Pivot to session events to confirm the successful login led to a proper session.

### Query-002

**Question being tested:** Do sessions in the baseline follow the expected create → use → close pattern?

**Data source and index/view:** Synthetic telemetry, `quiet-learning` traffic profile

**Exact query/filter/command:**

```text
event_category = "session"
```

**Time field used:** Event time
**Time range:** 09:00:26Z–09:02:05Z
**Fields displayed or exported:** timestamp, session ID, creation/close reason, credential material field
**Result summary:** One session created at 09:00:26Z (immediately after Ada's successful login) and closed at 09:02:05Z with reason `user_logout`. Credential material in the session-created event was properly redacted.
**Relevant evidence IDs:** EV-SESS-01
**Limitations:** Synthetic dataset only.
**Decision / next query:** Session lasted ~1 minute 39 seconds and ended in a clean, user-initiated logout — normal behavior with no signs of forced termination, timeout, or hijacking. Pivot to authorization events to see what the user accessed during the session.

### Query-003

**Question being tested:** What resources did the authenticated user access during their session?

**Data source and index/view:** Synthetic telemetry, `quiet-learning` traffic profile

**Exact query/filter/command:**

```text
event_category = "authorization"
```

**Time field used:** Event time
**Time range:** 09:00:40Z–09:01:40Z
**Fields displayed or exported:** timestamp, HTTP method/endpoint, status code, identity, source IP
**Result summary:** Five access events, all "allowed" with status 200, all from Ada Learner / 192.0.2.21, in order: 09:00:40Z GET /api/me (profile); 09:00:55Z GET /api/core/sections (course catalogue); 09:01:10Z GET /api/core/sections/sec-baseline-01/lessons (lesson list); 09:01:25Z GET /api/core/lessons/lesson-baseline-01/assets (lesson assets); 09:01:40Z PUT /api/progress/lessons/lesson-baseline-01 (progress update: video 9/18s, notes 40%, summary 30%, not completed).
**Relevant evidence IDs:** EV-AUTHZ-01, EV-AUTHZ-02, EV-AUTHZ-03, EV-AUTHZ-04, EV-AUTHZ-05
**Limitations:** Synthetic dataset only.
**Decision / next query:** Logical, step-by-step navigation (profile → catalogue → section → lesson → progress save), no skipped steps, no access outside the learner's own data, no denied requests. Represents the expected "normal" browsing pattern. Pivot to scenario-control events to confirm the exercise window and dataset completeness.

### Query-004

**Question being tested:** Did the training scenario run as intended and capture all expected event types?

**Data source and index/view:** Synthetic telemetry, `quiet-learning` traffic profile

**Exact query/filter/command:**

```text
event_category = "scenario-control"
```

**Time field used:** Event time
**Time range:** 09:00:00Z, 09:03:00Z
**Fields displayed or exported:** timestamp, event type (start/verification), scenario title, traffic profile, seed, verification checklist
**Result summary:** Two events: a "start" event at 09:00:00Z (title "Operation Night Watch," traffic profile "quiet-learning," deterministic seed 42) and a "verification" event at 09:03:00Z confirming all required event families (login, session, authorization, scenario-control) were present and redaction was applied.
**Relevant evidence IDs:** EV-SCTL-01, EV-SCTL-02
**Limitations:** Synthetic dataset only.
**Decision / next query:** These two events bookend the baseline window (09:00:00Z–09:03:00Z). Successful verification confirms the dataset is complete and reliable as the "normal" reference point for spotting anomalies in later scenarios. No further pivots needed for this baseline.

## Query-quality checks

- [x] The query uses the intended field rather than only free-text search.
- [x] Exact and analysed fields are distinguished where applicable.
- [x] The event-time field and time zone are recorded (UTC / "Z").
- [ ] A zero-result search was checked against source health and retention. *(No zero-result searches occurred in this baseline pass.)*
- [x] Filters inherited from a dashboard or saved view are recorded. *(None used — direct `event_category` filters only.)*
- [x] Wildcards and broad searches are narrowed before drawing conclusions.
- [x] Commands were run only against synthetic data or explicitly authorised systems.
- [x] Output containing sensitive values was redacted before submission.

## Investigation summary

**Most useful query:** Q-004 (`event_category = "scenario-control"`) — it confirmed the exercise boundaries and validated that all expected event families were captured, anchoring the rest of the baseline analysis.

**Most important negative finding:** No denied authorization requests, no forced session terminations, and no brute-force pattern despite an initial failed login — the entire 09:00:00Z–09:03:00Z window is consistent with ordinary, expected learner behavior.

**Visibility gap discovered:** Live Wazuh telemetry was unavailable, requiring reliance on the synthetic `quiet-learning` dataset as a fallback; this baseline should be re-validated against live SIEM data once access is restored.

**Queries recommended for higher-tier review:** None required at this stage — all four queries returned expected, non-anomalous baseline behavior appropriate for use as the normal-activity reference point.

