 query-journal.md

### Query Journal

### Query 001 — Authentication Activity

  ### Query Concept
```text
event_category = authentication

### Purpose

Identify authentication activity within the Pod 04 baseline.
Expected Results
•	Successful logins 
•	Failed logins 

 ### Analyst Use

This query establishes the normal authentication pattern that can
later be compared against suspicious authentication activity.

### Query 002 — Failed Authentication

### Query Concept

event_category = authentication
AND
outcome = failure

### Purpose
Identify failed authentication attempts.

### Finding

A failed login occurred at:
2026-08-13T09:21:12Z
The event contained:
ordinary_baseline_mistype=true
Analyst Assessment
The event does not independently establish malicious activity.

### Query 003 — Successful Authentication

### Query Concept
event_type = authentication.login
AND
outcome = success

### Purpose
Identify successful user authentication.

### Finding
Chidi Learner successfully authenticated at:
2026-08-13T09:21:25Z

### Query 004 — Authorization Activity

### Query Concept
event_category = authorization
AND
outcome = success

### Purpose
Establish normal API/application access.

### Finding
Normal successful requests were observed for profile,
course catalogue, lessons, lesson assets and progress.

### Query 005 — Follow a User

### Query Concept
synthetic_user_id = bca3eeaa-a553-5c6d-b678-f96b84a361d7

### Purpose
Correlate events belonging to the same synthetic user.

### Result
The query reconstructs the user's activity from authentication
through logout.

### Query 006 — Failed Authentication by Source

### Query Concept
event_category = authentication
AND
outcome = failure
AND
source_ip = 192.0.2.24 

###Purpose
Determine whether authentication failures are associated with
a particular synthetic source address.

### Analyst Note

The supplied dataset is synthetic and does not provide enough
network context to treat the source IP as evidence of malicious
infrastructure.



