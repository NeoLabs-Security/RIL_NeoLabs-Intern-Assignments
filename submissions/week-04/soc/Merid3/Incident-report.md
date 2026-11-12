Incident Report: NeoLabs VCC Broken-Gate

1. Incident Summary

Field| Details
Incident| Unauthorized course-material access
Environment| NeoLabs VCC Security Lab
Scenario| W04 Broken Gate
Affected resource| w04-pod-01-webdev-material
Severity| High (Level 10)
Status| Open – Escalation required 
Detection source| Wazuh

Executive Summary:

Wazuh telemetry identified three authorization policy violations involving synthetic user "student-a".

The application returned "allow" when the expected policy decision was "deny". All three events returned HTTP 200, indicating that the requests were accepted at the authorization/API level.

2. UTC Timeline

UTC Timestamp| Event| User| Outcome
Oct 29, 10:52:07| Login| student-a| Success
Oct 29, 11:15:35| Authorization check| student-b| Expected allow
Oct 29, 11:20:28| Authorization check| student-a| Policy violation
Oct 31, 02:59:01| Login| student-a| Success
Oct 31, 03:00:15| Authorization check| student-a| Policy violation
Oct 31, 03:02:09| Authorization check| student-b| Expected allow
Oct 31, 03:02:20| Authorization check| student-a| Policy violation
Nov 1, 10:48:59| Authorization check| student-a| Expected allow
Nov 3, 13:16:12| Authorization check| student-a| Expected allow
Nov 3, 13:17:02| Login| student-b| Failure

All timestamps are UTC and use "data.event_time".

3. Findings

- Three unauthorized authorization decisions were detected by student a.
- Actual decision: "allow".
- Expected decision: "deny".
- HTTP response: "200".
- All three violations involved the same synthetic user and web-development resource.
- Runtime health events reported healthy status.

4. Wazuh Detection

Rule ID: 100142
Rule description: Course access allowed despite expected denial.
Severity: Level 10.

The alert was triggered because:

- Expected decision: DENY
- Actual decision: ALLOW
- HTTP status: 200
 
5. Impact Assessment

The logs confirm an authorization-control failure in the synthetic lab environment.

However, they do not independently establish whether protected content was successfully retrieved or whether real-world users or systems were affected.

6. Recommended Actions

1. Escalate the findings to SOC L2.
2. Notify the NeoLabs engineering team.
3. Review course enrolment and resource authorization rules.
4. Investigate API authorization logic.
5. Search for additional expected-deny/actual-allow events.
6. Verify remediation using negative and positive authorization tests.

7. Conclusion

The investigation identified repeated authorization-policy violations in the NeoLabs VCC Broken-Gate scenario.

Wazuh successfully detected the unauthorized access through rule 100142.

The application permitted access despite an expected denial. Further investigation and remediation are required to prevent unauthorized access to restricted course materials..


