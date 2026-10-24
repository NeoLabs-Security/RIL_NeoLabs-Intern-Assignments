
| Field | Entry |
|---|---|
| Report title | Operation Night Watch – Baseline Investigation Report|
| Case / assignment ID |W01-NIGHT-WATCH-BASELINE |
| Analyst name | Nwakwo Godsaves|
| Track and cohort | SOC Level 1 / |
| Assigned pod | 4|
| Report version | 1.0 |
| Prepared at | 2026-08-23 11:56 UTC |
| Reviewer | |
| Classification | Training use / confidential programme material as directed | |

### Executive summary

The investigation was triggered by the Operation Night Watch baseline scenario and the review of authentication, session, and authorization telemetry for assigned pod-04. The affected activity involved the synthetic user account observed in the provided telemetry and the associated application/API access. Confirmed evidence shows unsuccessful login activity followed by a successful authentication and subsequent session activity, with the scenario-control verification confirming the expected training scenario. The activity is currently classified as training-use baseline activity, with moderate-to-high confidence based on the available telemetry. The recommended next action is to document the observed authentication and session sequence, preserve the relevant evidence, and use the established baseline to identify any future deviations.


### Alert and detection information

| Field | Entry |
|---|---|
| Alert name | Operation Night Watch – Baseline Investigation|
| Alert / rule ID | not specified in the proviced telementry|
| Detection source |Wazuh / provided raw telemetry |
| Alert creation time | not specific|
| Earliest confirmed event time |09:21:00 UTC |
| Tool-assigned severity | no specified|
| Analyst-assigned priority | not specified|
| Relevant ATT&CK behaviour | Optional; explain mapping |   
    Authentication activity was observed, including unsuccessful and successful login events. No specific MITRE ATT&CK technique should be assigned without evidence of malicious behaviour.

## 4. Scope

### Affected identities

| Identity | Type | Role / context | Confirmed or suspected impact |
|---|---|---|---|
|Synthetic user ID from pod-04 telementry |Synthetic account | Training scenario / application authentication| Confirmed activity: unsuccessful login followed by successful authentication and session activity. No confirmed compromise or malicious impact.|

### Affected assets and services

| Asset / service | Identifier | Criticality / role | Evidence of impact |
|---|---|---|---|
|Application/API services | Pod-04 / w01-night-watch-baseline| Training application service| Authentication and authorization activity observed. No confirmed service compromise or disruption.|
|User session service|Associated with the synthetic user in pod-04 telemetry|Session management|Successful login followed by session activity was confirmed.|
|Wazuh monitoring stack|Wazuh Dashboard / pod-04 investigation environment|Security monitoring and investigation|Used to review and analyze the supplied telemetry; no impact to the monitoring stack was confirmed.|
### Network, file and cloud indicators

| Indicator | Type | Source | Relevance and limitation |
|---|---|---|---|
| Source IP associated with the synthetic user| Network/IP indicator| Raw telemetry|Relevant for correlating authentication activity. It is a synthetic training indicator and should not be treated as evidence of a real-world malicious source without additional evidence. |
|w01-night-watch-baseline|Scenario identifier|Raw telemetry|Confirms the activity belongs to the assigned training scenario|
|Pod-04 telemetry dataset|File/data source|Provided raw telemetry|Primary evidence for the investigation. Conclusions are limited to events contained in the supplied dataset|
|No confirmed cloud indicator|Cloud|Available evidence|No specific cloud resource, account, or cloud activity has been confirmed from the provided telemetry.

# 5. Observed facts

List facts directly supported by evidence. Number each fact so it can be referenced later.

1. The telemetry is associated with pod-04 and the scenario w01-night-watch-baseline.
2 A failed authentication login was observed before a subsequent successful login for the same synthetic user.
3 A successful authentication/login session was subsequently established and later closed at 09:23:05 UTC.
4 A scenario-control.verification event was recorded at 09:24:00 UTC, confirming the scenario/control state.
5 The observed events are based on synthetic telemetry; therefore, the evidence supports what occurred in the replayed scenario but does not by itself establish real-world malicious activity.
 
 

## 6. Timeline

Use UTC unless the assignment specifies otherwise. Separate event time from ingest or alert time when relevant.

| UTC time | Source | Entity | Observed activity | Evidence reference | Confidence |
|---|---|---|---|---|---|
|09:21:00 UTC |Raw telemetry | Synthetic user / pod-04| Authentication activity begins; login event observed.|Raw telemetry — authentication.login |High |
|09:21:12 UTC|Raw telemetry|Synthetic user / pod-04|Failed authentication/login attempt observed.|Raw telemetry — authentication.login|high|
|09:21:25 UTC|Raw telemetry|Synthetic user / pod-04|Successful authentication/login observed, establishing a session.|Raw telemetry — authentication.login|high|
|09:23:05 UTC|Raw telemetry|Synthetic user / pod-04|Established session is closed|Raw telemetry — session event|high|
|09:24:00 UTC|Raw telemetry|Synthetic user / pod-04|cenario-control.verification event recorded for the baseline scenario.|Raw telemetry — scenario-control.verification|high

## 7. Evidence reviewed

| Evidence ID | Source | Collection / query method | Time range | Integrity or quality note | Location / reference |
|---|---|---|---|---|---|
|EV-001|Raw telemetry JSONL|Reviewed telemetry records and filtered by pod_id=pod-04 and scenario_id=w01-night-watch-baseline|09:21:00–09:24:00 UTC|Synthetic replay telemetry; timestamps and event fields were preserved from the supplied source|NeoLabs_Week1_Operation_Night_Watch_Raw_Telemetry_pod-04.md 
| EV-002|Authentication events|Reviewed authentication.login events and correlated the synthetic user/session activity|09:21:00–09:23:05 UTC|Evidence directly supports the observed failed and successful authentication sequence.|Raw telemetry — authentication.login events
| EV-003|Scenario-control event|Reviewed scenario-control.verification event|09:24:00 UTC|Used to verify the scenario/control state; not treated as evidence of malicious activity.|Raw telemetry — scenario-control.verification| 

Use the separate evidence log for detailed records.

## 8. Queries performed

| Query ID | Data source | Query / filter | Time range | Result summary | Next pivot |
|---|---|---|---|---|---|
| Q-001|Raw telemetry JSONL|Filtered pod_id=pod-04 and scenario_id=w01-night-watch-baseline|09:21:00–09:24:00 UTC|
Returned the relevant baseline telemetry for the assigned pod and scenario.|Pivot to authentication.login events | 
| Q-002|Raw telemetry JSONL|Filtered event_type / event_category for authentication.login|09:21:00–09:23:05 UTC|Identified a failed login followed by a successful authentication/session.|Pivot using the same synthetic_user_id|
| Q-003|Raw telemetry JSONL|Correlated events using the observed synthetic_user_id|09:21:00–09:23:05 UTC|Built the authentication/session sequence and identified the subsequent session closure.|Review related authorization activity| 
|Q-004|Raw telemetry JSONL|Filtered for scenario-control.verification|09:24:00 UTC|Confirmed the scenario-control verification event for the baseline.|Use as scenario validation; no further investigative pivot required|

# 9. Analysis

### Interpretation

Explain what the combined facts suggest. Connect evidence through identity, time, process, network, session, request, file or resource pivots.

The reviewed telemetry supports a sequence of authentication activity involving pod-04 and the w01-night-watch-baseline scenario. A failed authentication attempt was followed by a successful authentication for the same synthetic user, after which an authenticated session was established and later closed at 09:23:05 UTC. The subsequent scenario-control.verification event at 09:24:00 UTC confirms the expected scenario-control state.

The failed login followed by a successful login is an observable authentication pattern that warrants correlation with subsequent authorization or resource-access events. However, the available evidence does not by itself prove credential compromise, unauthorized access, or malicious activity. The sequence may represent normal user behaviour, a replayed test condition, or an intentionally simulated security event.

The strongest investigative pivot is the synthetic user identity: correlate all authentication, authorization, session, request, source-IP, and resource-access events associated with that identity within the relevant UTC time window. Any conclusion about impact should be based only on events directly supported by the telemetry.

### Alternative explanations considered

| Alternative | Evidence supporting it | Evidence against it | Status |
|---|---|---|---|
|Normal authentication behaviour after an initial failed attempt|A successful login follows the failed authentication; the session is subsequently established and closed normally.|The initial failure followed by success warrants correlation with other activity.|Open |
 | Repeated/incorrect credentials followed by a legitimate login|Failed authentication followed by successful authentication is consistent with a user correcting credentials.|No direct evidence in the reviewed events establishes why the first attempt failed.|Open| 
 |Simulated or replayed security activity|The telemetry belongs to the w01-night-watch-baseline synthetic scenario and includes a scenario-control.verification event.|The authentication sequence is still an observed event sequence within the replay.|Likely|
 |Credential compromise or unauthorized access|A failed login followed by a successful login can occur during an attempted account compromise.|No direct evidence reviewed here establishes credential theft, source-IP anomaly, privilege escalation, or unauthorized resource access.|Open|
 |Confirmed malicious activity|The sequence could be investigated as a potential security signal.|Current evidence does not establish malicious intent or confirmed compromise.|Unlikely|

### Visibility gaps and limitations

State missing data, parser failures, disconnected sources, clock issues, retention gaps or permissions that limit the conclusion.
 
 The evidence reviewed is synthetic replay telemetry, so conclusions are limited to the supplied scenario.
The available authentication sequence alone does not establish why the login failed or whether the credentials were legitimate.
Additional correlation with authorization/access events, source IP, request IDs, session identifiers, and resource activity is required before determining whether the successful login resulted in unauthorized activity.
No independent endpoint, network, identity-provider, or cloud telemetry was identified in the reviewed evidence, limiting cross-source validation.
The analysis relies on the timestamps supplied in the telemetry and assumes the recorded UTC timestamps are reliable.
No evidence of parser failure or timestamp corruption was identified in the reviewed records; however, absence of such evidence does not prove that the dataset is complete.
The 09:24:00 UTC scenario-control verification event should be treated as scenario validation, not as evidence that the preceding authentication activity was malicious.

# 10. Classification and confidence

| Field | Entry |
|---|---|
| Classification |  insufficient evidence |
| Confidence |high |
| Confidence reasoning | The telemetry confirms a failed authentication followed by a successful authentication and subsequent session closure. However, the available evidence does not establish credential compromise, unauthorized access, malicious intent, or confirmed impact. The dataset is also a synthetic replay scenario.|
| Potential severity | low|
| Business or lab impact | No confirmed business or production impact was identified. Within the lab scenario, the observed authentication sequence warrants further correlation with authorization, request, source-IP, and resource-access events.|

## 11. Actions and recommendations

### Actions already taken

Record only authorised actions actually performed.

1. Reviewed the supplied raw telemetry for pod-04 and the w01-night-watch-baseline scenario.
2. Correlated the observed authentication events and established the relevant timeline, including the failed login, successful login/session, session closure, and scenario-control verification event.

### Recommended next actions

| Priority | Recommendation | Owner / escalation target | Reason | Deadline |
|---|---|---|---|---|
| High|Correlate the synthetic user identity across authentication and authorization events.|SOC L1 / assigned investigator|Determine whether the successful login resulted in any unusual or unauthorized access.|During investigation| 
|High|Review source IP, request ID, and session-related fields associated with the authentication sequence.|SOC L1|Identify whether the activity originated from the expected source and whether events belong to the same session/request chain.|During investigation| 
|Medium|Review subsequent resource/file/cloud activity for the same identity and session.|SOC L1|Establish whether any resource was accessed or modified after authentication.|During investigation |
|Medium|Preserve the relevant telemetry and evidence references in the evidence log |SOC L1|Maintain traceability and support reproducibility of the investigation.|Before submission|
|Low|Escalate only if additional evidence demonstrates unauthorized access, privilege escalation, suspicious source activity, or confirmed impact.|SOC L1 → SOC L2 / mentor|Prevent over-classifying a synthetic authentication sequence without supporting evidence.|If new evidence emerges|

# 12. Escalation decision

| Field | Entry |
|---|---|
| Escalated? | no |
| Escalated to | N/A|
| Time |N/A |
| Reason | The reviewed telemetry shows a failed authentication followed by a successful authentication, but there is insufficient evidence to establish compromise, unauthorized access, or confirmed impact. The activity is also part of the synthetic w01-night-watch-baseline scenario.|
| Information supplied | N/A — no escalation performed. Relevant findings are documented in the investigation report and evidence log.|
| Questions requiring higher-tier review | None at this stage. Escalation should be reconsidered if further correlation identifies suspicious source activity, unauthorized resource access, privilege escalation, or other evidence of compromise.|

## 13. Lessons and detection improvements

- Which field or source was most valuable?
- 
The raw telemetry was the most valuable source. In particular, event_time, event_type, event_action, outcome, synthetic_user_id, source_ip, request_id, pod_id, and scenario_id enabled the authentication sequence to be reconstructed.

Which evidence was missing?

More detailed authorization/resource-access telemetry, endpoint/network telemetry, and additional identity/session context would improve confidence about whether the successful authentication resulted in suspicious activity.

Did the detection title and severity accurately describe the activity?

The activity should be treated as an authentication signal requiring investigation, rather than automatically classified as a confirmed incident. The final classification of insufficient evidence and potential severity of low are appropriate based on the evidence reviewed.

What safe tuning, logging or playbook improvement is recommended?

Correlate failed and successful authentication events by synthetic_user_id, source_ip, request_id, and session identifiers. The playbook should also require analysts to check subsequent authorization and resource-access events before escalating an authentication alert.

What should the analyst do differently next time?

Start by confirming the assigned pod and scenario, establish the UTC timeline, pivot through the synthetic identity and request/session identifiers, and document only facts directly supported by telemetry. Avoid treating a failed login followed by a successful login as proof of compromise without additional evidence.

## 14. References and attachments

List approved screenshots, exports, evidence IDs, task instructions and public references. Use repository-relative paths where possible. Redact sensitive values.

|Reference|	Type|	Purpose|
|-----|-----|-----|
|NeoLabs_Week1_Operation_Night_Watch_Raw_Telemetry_pod-04.md|Raw telemetry|	Primary source for observed events and timeline|
|reports/evidence/investigation/screenshots/01-pod-and-scenario.png	|Screenshot	|Pod and scenario verification
|reports/evidence/investigation/screenshots/02-failed-login-context.png	|Screenshot	|Failed authentication evidence|
|reports/evidence/investigation/screenshots/03-successful-login-session.png|Screenshot|	Successful authentication/session evidence|
|reports/evidence/investigation/screenshots/04-investigation-evidence.png|Screenshot|Supporting investigation evidence|
|EV-001	|Evidence ID|	Assigned raw telemetry evidence|
|EV-002|	Evidence ID	|Authentication-event evidence|
|EV-003	|Evidence ID|	Scenario-control verification evidence|
|Q-001–Q-004|	Query IDs	|Documented investigation queries and pivots|
Assignment instructions	Task reference	Scope, safety boundaries, and reporting requirements


## 15. Reviewer notes

| Reviewer | Date | Decision | Required corrections |
|---|---|---|---|
| | | Approved / revise | |
