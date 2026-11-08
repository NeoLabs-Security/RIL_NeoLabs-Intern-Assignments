Query Journal – Wazuh

Index: "wazuh-alerts-4.x-*"

Investigation period: 29 October – 3 November 2026

Query 1: Authorization Policy Violations

Query:

data.event_type:"authorization.check" AND
outcome:"policy_violation"

Purpose:

Identify authorization checks flagged as policy violations.

Expected Result:

Three matching authorization violations involving "student-a", all concerning the web-development course material.

---

Query 2: Unexpected Access

Query:

data.metadata.actual_decision:"allow" AND
data.metadata.policy_expected_decision:"deny"

Purpose:

Identify requests where the application allowed access despite an expected denial.

Expected Result:

Three matching events showing:

- Actual decision: "allow"
- Expected decision: "deny"
- HTTP status: "200"

These events confirm an authorization-control failure in the supplied synthetic telemetry.

---

Query 3: Authentication Failures

Query:

data.event_type:"authentication.login" AND
outcome:"failure"

Purpose:

Identify unsuccessful login attempts for further investigation.

Expected Result:

One matching failed login involving "student-b" on 3 November 2026 at 13:17:02 UTC.

The recorded reason is "invalid_credentials".

---

Query 4: Runtime Health

Query:

data.event_type:"host.runtime_health"

Purpose:

Review application runtime-health events during the investigation period.

Expected Result:

Two matching events reporting "healthy".

This indicates that runtime health was reported as normal at those recorded times. It does not establish that authorization controls were functioning correctly.

---

Query 5: Successful Authorization Checks

Query:

data.event_type:"authorization.check" AND
outcome:"success"

Purpose:

Identify successful authorization checks and compare expected access behavior against the policy violations.

Expected Result:

Four matching events in the supplied dataset:

- Two successful checks for "student-b" accessing web-development material.
- Two successful checks for "student-a" accessing a cybersecurity submission.

Actual and expected decisions are both "allow".

---

Query 6: Affected User Activity

Query:

data.synthetic_user_id:"syn-w04-pod-01-student-a"

Purpose:

Review authentication, session creation, and authorization activity associated with the affected synthetic user.

Expected Result:

Multiple login and session events, three web-development authorization violations, and successful authorization checks for the separate cybersecurity resource.

---


