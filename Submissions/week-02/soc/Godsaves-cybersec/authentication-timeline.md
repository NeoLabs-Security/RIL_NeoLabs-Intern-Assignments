# Authentication / Session Timeline

All timestamps are recorded in UTC.

| Time (UTC) | Event | User | Source IP | Session ID | Evidence ID | Assessment |
|---|---|---|---|---|---|---|
| 09:18:33 | Successful profile access | svc-backup | 203.0.113.44 | sess-suspect-902 | EV-01 | Suspicious activity requiring investigation |
| 09:19:02 | Cross-pod evidence access attempted and denied | svc-backup | 203.0.113.44 | sess-suspect-902 | EV-02 | Authorization violation |
| 09:19:41 | Student17 email successfully changed | svc-backup | 203.0.113.44 | sess-suspect-902 | EV-03 | Sensitive account change |
| 09:20:19 | Suspicious session revoked | svc-backup | N/A | sess-suspect-902 | EV-04 | Containment action |
| 09:24:58 | Endpoint-process telemetry gap ended | N/A | N/A | N/A | EV-05 | Visibility restored |
| 09:25:00 | Endpoint-process feed reported connected | N/A | N/A | N/A | EV-05 | Monitoring restored |

## Timeline Analysis

The investigation identified a common session ID,
`sess-suspect-902`, across the application-access,
authorization and account-change events.

The same source IP, `203.0.113.44`, was also associated with the
application-access, authorization and account-change activity.

The sequence culminated in successful session revocation at
09:20:19 UTC.