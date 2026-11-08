EVIDENCE REGISTER

Incident: W04 – Broken Gate
Evidence source: Wazuh alerts
Environment: NeoLabs Security Lab

Evidence ID| Description| Wazuh Rule| Severity
EV-001| First unauthorized access| 100142| 10
EV-002| Legitimate course access by Student B| 100141| 3
EV-003| Second unauthorized access| 100142| 10
EV-004| Third unauthorized access| 100142| 10
EV-005| Student A accesses own assignment| 100141| 3
EV-006| Successful authentication| 100120| 3
EV-007| API startup health| 100180| 3

Key Evidence

EV-001, EV-003 and EV-004

These records show:

- Expected decision: DENY.
- Actual decision: ALLOW.
- HTTP status: 200.
- Affected account: Student A.
- Affected resource: Web Development course material.

EV-002

Shows legitimate access by Student B because of active course enrolment.

EV-005

Shows Student A accessing their own private assignment.

Evidence Handling

- Evidence was taken from the supplied Wazuh logs.
- Internal IP addresses and session identifiers were removed.
- Synthetic account names were anonymized.
- Original log files should be retained separately.

Evidence conclusion: The records support the identification of unauthorized resource access in the training environment.


CONFIRMED AUTHORIZATION POLICY VIOLATION LOGS

1. First violation – 29 October 2026

- timestamp: Oct 29, 2026 @ 12:20:28.920
- data.event_type: authorization.check
- data.event_action: check
- data.event_time: 2026-10-29T11:20:28.920Z
- outcome: policy_violation
- data.request_id: 3753e0ac-dd34-46df-8b5e-6e94c7a3569d
- data.event_id: 6e37f845-8c95-43a7-a1ef-ebaa993fc98d
- data.synthetic_user_id: syn-w04-pod-01-student-a
- data.metadata.course_id: w04-pod-01-webdev
- data.metadata.resource_id: w04-pod-01-webdev-material
- data.metadata.actual_decision: allow
- data.metadata.policy_expected_decision: deny
- data.metadata.http_status: 200

2. Second violation – 31 October 2026

- timestamp: Oct 31, 2026 @ 04:00:15.222
- data.event_type: authorization.check
- data.event_action: check
- data.event_time: 2026-10-31T03:00:15.222Z
- outcome: policy_violation
- data.request_id: 22b4410a-1435-4982-b9a7-1fc526f1becc
- data.event_id: df5c1244-41d4-4b47-ad3c-689fb0a22e4c
- data.synthetic_user_id: syn-w04-pod-01-student-a
- data.metadata.course_id: w04-pod-01-webdev
- data.metadata.resource_id: w04-pod-01-webdev-material
- data.metadata.actual_decision: allow
- data.metadata.policy_expected_decision: deny
- data.metadata.http_status: 200

3. Third violation – 31 October 2026

- timestamp: Oct 31, 2026 @ 04:02:20.743
- data.event_type: authorization.check
- data.event_action: check
- data.event_time: 2026-10-31T03:02:20.743Z
- outcome: policy_violation
- data.request_id: a8eef8fb-043b-46b8-b754-2d9672d6ddc0
- data.event_id: 218d9b39-f7e9-4628-ad5f-7e7ce1386380
- data.synthetic_user_id: syn-w04-pod-01-student-a
- data.metadata.course_id: w04-pod-01-webdev
- data.metadata.resource_id: w04-pod-01-webdev-material
- data.metadata.actual_decision: allow
- data.metadata.policy_expected_decision: deny
- data.metadata.http_status: 200

TOTAL CONFIRMED POLICY VIOLATIONS: 3
WAZUH RULE ID: 100142
SEVERITY LEVEL: 10
