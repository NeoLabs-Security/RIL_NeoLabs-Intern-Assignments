# NeoLabs SOC Evidence Log Template

> Record evidence used in an authorised investigation. This template is for training and case discipline; it does not replace organisational forensic procedures or legal chain-of-custody requirements.

## Case information

| Field | Entry |
|---|---|
| Case / assignment ID | w01-night-watch-baseline |
| Analyst | Bakor Barilee Owen |
| Assigned pod | pod-01 |
| Investigation start | 2026-08-13 09:00 UTC |
| Report path / link | Baseline-log-report.md |

## Evidence register

| Evidence ID | Date/time collected (UTC) | Event time range | Source system | Evidence type | Collection method / query | Original location | File or record hash, when applicable | Handling / redaction note | Relevance |
|---|---|---|---|---|---|---|---|---|---|
| EV-001 | 2026-08-13 09:00:25 UTC | 2026-08-13T09:00:25Z | vcc-security-lab (synthetic API telemetry) | Raw event | event_category = "authentication" | Request ID: synthetic-pod-01-vu1-it03-login | Event ID 4116d750-e5d0-512f-bdb0-9f35fe547c2c | None required; no credentials present | Confirms normal, expected login by Ada Learner |
| EV-002 | 2026-08-13 09:00:12 UTC | 2026-08-13T09:00:12Z | vcc-security-lab (synthetic API telemetry) | Raw event | event_category = "authentication" | Request ID: synthetic-pod-01-vu1-it02-ordinary-password-mistype | Event ID bdafbac9-ef37-5e72-aad5-e8c5d5dc52f6 | None required; no credentials present | Establishes baseline failed-login pattern (routine mistype) |
| EV-003 | 2026-08-13 09:00:40 -- 09:01:40 UTC | 2026-08-13T09:00:40Z -- 09:01:40Z | vcc-security-lab (synthetic API telemetry) | Raw event (export, 5 events) | event_category = "authorization" | Request IDs: synthetic-pod-01-vu1-it05-profile through -it09-lesson-progress | Event IDs a9d21b4f-e86f-5433-820e-8465ea8a9195; 2cedb747-da26-5adf-8183-6849d9039e33; 96bb1721-418c-578a-b950-55b66c3ce579; 48d42b8c-992c-5781-9c5d-a3d442e6a60d; 8b2ea0d7-2f2e-51bd-ae55-4bee614e526c | None required; no credentials present | Establishes normal in-scope navigation pattern |
| EV-004 | 2026-08-13 09:00:26 (created) -- 09:02:05 (closed) UTC | 2026-08-13T09:00:26Z -- 09:02:05Z | vcc-security-lab (synthetic API telemetry) | Raw event | event_category = "session" | Event IDs 73d993a4-34ed-5823-8f7a-fbaeb83c2756 (created); 41cd9646-8512-5daa-81bd-1601b6f46a0a (closed) | n/a | Credential material redacted in session-created event, confirmed present in source | Confirms normal session lifecycle and clean logout |
| EV-005 | 2026-08-13 09:03:00 UTC | 2026-08-13T09:03:00Z | vcc-security-lab (synthetic API telemetry) | Raw event | event_category = "scenario-control" | Event ID 903facca-449c-596f-98da-8c0507021310 | n/a | None required; no credentials present | Confirms baseline dataset complete and correctly bounded |

## Evidence-quality checks

For each important item, consider:

- Was the source operating during the event period?
- Is the timestamp event time, ingest time or alert time?
- Is the time zone known?
- Could the record be duplicated, delayed or truncated?
- Did a decoder or parser alter the displayed fields?
- Is the value source-generated, user-controlled or enrichment data?
- Is the evidence complete enough for the conclusion?
- Was sensitive data redacted without removing necessary meaning?

## Evidence statements

Use one statement per important claim.

### EV-001

**Observed fact:** Ada Learner (learner.pod-01.01) successfully authenticated from source IP 192.0.2.21 at 09:00:25Z, 13 seconds after an earlier failed attempt, with reason code "active_account."

**Source and time:** vcc-security-lab synthetic API telemetry, event time 2026-08-13T09:00:25Z UTC.

**What this evidence supports:** That the failed login immediately preceding it was a routine mistype rather than malicious activity, since it was quickly followed by a legitimate, successful login from the same source.

**What this evidence does not prove:** Whether 192.0.2.21 is a single-user address or a shared/NAT'd range; device or physical context of the login is not captured.

**Quality or visibility limitation:** No network-layer, device, or geolocation telemetry accompanies this event.

**Related evidence:** EV-002, EV-004

### EV-002

**Observed fact:** Ada Learner (learner.pod-01.01) failed to log in at 09:00:12Z due to invalid credentials, with metadata explicitly tagging the event as "ordinary_baseline_mistype."

**Source and time:** vcc-security-lab synthetic API telemetry, event time 2026-08-13T09:00:12Z UTC.

**What this evidence supports:** That a single failed login followed shortly by success is the expected baseline pattern, not an indicator of brute-force or credential-stuffing behavior.

**What this evidence does not prove:** That all future single-failure events are automatically benign; each still needs its own timing and context check.

**Quality or visibility limitation:** Relies on the source system's own "ordinary_baseline_mistype" tag rather than independent corroboration.

**Related evidence:** EV-001

### EV-003

**Observed fact:** Five sequential, successful (status 200, decision "allowed") resource-access requests by Ada Learner between 09:00:40Z and 09:01:40Z, moving from profile check to catalogue browse to lesson list to lesson assets to a progress update.

**Source and time:** vcc-security-lab synthetic API telemetry, event time range 2026-08-13T09:00:40Z -- 09:01:40Z UTC.

**What this evidence supports:** That normal learner activity follows a logical, in-scope navigation path with no access to other users' data or administrative endpoints.

**What this evidence does not prove:** Behavior of other learners or pods; this is a single session for a single identity.

**Quality or visibility limitation:** Only application-layer API events are visible; no host or network-layer telemetry to cross-check.

**Related evidence:** EV-001, EV-004

### EV-004

**Observed fact:** A session was created at 09:00:26Z, immediately after Ada Learner's successful login, and closed at 09:02:05Z with reason "user_logout."

**Source and time:** vcc-security-lab synthetic API telemetry, event time range 2026-08-13T09:00:26Z -- 09:02:05Z UTC.

**What this evidence supports:** That session timing and closure followed the normal, expected create-active-close lifecycle with no forced termination or hijacking indicators.

**What this evidence does not prove:** Continuous session integrity between creation and closure beyond the API events observed.

**Quality or visibility limitation:** Credential material was redacted in the session-created event per handling policy, so raw credential values cannot be independently verified.

**Related evidence:** EV-001, EV-003

### EV-005

**Observed fact:** A scenario-control verification event at 09:03:00Z confirmed all required event families (login, session, authorization, scenario-control) were present and that redaction was correctly applied.

**Source and time:** vcc-security-lab synthetic API telemetry, event time 2026-08-13T09:03:00Z UTC.

**What this evidence supports:** That the baseline dataset (09:00:00Z -- 09:03:00Z) is complete and bounded, suitable as a reference for detecting anomalies in future scenarios.

**What this evidence does not prove:** That this 3-minute baseline pattern holds consistently across a full day or week of activity.

**Quality or visibility limitation:** Only a 3-minute analysis window was captured.

**Related evidence:** EV-001, EV-002, EV-003, EV-004

## Transfer or review record

| Date/time UTC | Evidence ID(s) | From | To / reviewer | Purpose | Method | Confirmation |
|---|---|---|---|---|---|---|
| | | | | | | |

## Final checks

- [x] Every report fact points to an evidence ID or clearly identified source.
- [x] No credential, private key or enrolment token is included.
- [x] Personal or cross-pod information is removed or escalated rather than published.
- [ ] Screenshots show the required context and do not replace available raw records.
- [x] UTC conversions are documented.
- [x] Negative findings include the source, query and time range.
