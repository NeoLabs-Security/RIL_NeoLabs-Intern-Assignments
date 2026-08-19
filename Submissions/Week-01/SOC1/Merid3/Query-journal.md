## Query 1 — Authentication Activity

### Concept
Authentication activity and normal login behavior.

### Purpose
Identify all authentication events in the pod-03 Operation Night Watch baseline and establish the normal authentication pattern.

### Query
event_category = "authentication"

### Result
Three authentication events were observed: one failed login followed by two successful logins.

### Interpretation
The authentication sequence provides the baseline for normal login activity.

## Query 2 — Failed Authentication

### Concept
Failed authentication and distinguishing ordinary errors from suspicious activity.

### Purpose
Identify failed authentication events and determine whether the failure represents an abnormal or potentially suspicious pattern.

### Query

event_category = "authentication" AND outcome = "failure"

### Result
One failed authentication was observed at 09:14:12 UTC.

### Interpretation
The event was caused by invalid credentials and is explicitly marked in the telemetry as an ordinary baseline password mistype. It should not be classified as malicious based on this event alone.

## Query 3 — Application and API Access

### Concept
Authorized application/API activity.

### Purpose
Identify successful application and API access and establish the normal resource-access pattern for the pod.

### Query
event_category = "authorization" AND outcome = "success"

### Result
Five successful authorization events were observed between 09:14:40 and 09:15:40 UTC.

### Interpretation
The activity represents normal authorized access to the profile, course catalogue, lessons, lesson assets, and lesson-progress resources.

#	Time (UTC)	User	Method	Resource	Result	Request ID
1	09:14:00	N/A	N/A	N/A	success	synthetic-pod-03-vu1-it01-scenario-start
2	09:14:12	learner.pod-03.01@synthetic.neolabs.invalid	N/A	N/A	failure	synthetic-pod-03-vu1-it02-ordinary-password-mistype
3	09:14:25	learner.pod-03.01@synthetic.neolabs.invalid	N/A	N/A	success	synthetic-pod-03-vu1-it03-login
4	09:14:26	Synthetic user 4d98e392-5386-5e93-8815-da2cadfeff0f	N/A	N/A	success	synthetic-pod-03-vu1-it04-session-created
5	09:14:40	learner.pod-03.01@synthetic.neolabs.invalid	GET	/api/me	success	synthetic-pod-03-vu1-it05-profile
6	09:14:55	learner.pod-03.01@synthetic.neolabs.invalid	GET	/api/core/sections	success	synthetic-pod-03-vu1-it06-sections
7	09:15:10	learner.pod-03.01@synthetic.neolabs.invalid	GET	/api/core/sections/sec-baseline-01/lessons	success	synthetic-pod-03-vu1-it07-lessons
8	09:15:25	learner.pod-03.01@synthetic.neolabs.invalid	GET	/api/core/lessons/lesson-baseline-01/assets	success	synthetic-pod-03-vu1-it08-lesson-assets
9	09:15:40	learner.pod-03.01@synthetic.neolabs.invalid	PUT	/api/progress/lessons/lesson-baseline-01	success	synthetic-pod-03-vu1-it09-lesson-progress
10	09:16:05	learner.pod-03.01@synthetic.neolabs.invalid	N/A	N/A	success	synthetic-pod-03-vu1-it10-logout
11	09:16:35	learner.pod-03.02@synthetic.neolabs.invalid	N/A	N/A	success	synthetic-pod-03-vu1-it11-login
12	09:17:00	N/A	N/A	N/A	success	synthetic-pod-03-vu1-it12-verification
