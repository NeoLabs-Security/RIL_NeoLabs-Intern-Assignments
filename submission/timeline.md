# Timeline - Operation Night Watch (pod-01)

| # | Time | Event Type | Outcome | Activity/Observation | Significance |
|---|---|---|---|---|---|
| 1 | 09:00:00Z | scenario-control.start | Success | The training scenario started for pod-01. | This marks the start of the exercise - everything else is measured from here. |
| 2 | 09:00:12Z | authentication.login | Failure | A learner tried to log in but typed the wrong password. | Just a normal typo, not a security issue. |
| 3 | 09:00:25Z | authentication.login | Success | The same learner (Ada) logged in successfully. | She got it right on the second try, which is normal behavior. |
| 4 | 09:00:26Z | session.created | Success | A new session started for Ada right after she logged in. | Normal, happens every time someone logs in. |
| 5 | 09:00:40Z | authorization.access | Success | The learner (Ada) viewed her own profile page. | A normal first step after logging in. |
| 6 | 09:00:55Z | authorization.access | Success | The learner (Ada) viewed the course list. | Normal browsing behavior. |
| 7 | 09:01:10Z | authorization.access | Success | The learner (Ada) opened the lesson list inside a course section. | She's simply moving deeper into the course, which is expected. |
| 8 | 09:01:25Z | authorization.access | Success | Ada opened the materials for a specific lesson. | Normal, getting ready to study the lesson. |
| 9 | 09:01:40Z | authorization.access | Success | The learner's (Ada) progress was saved partway through the lesson. | Normal, the system tracking study progress. |
| 10 | 09:02:05Z | session.closed | Success | The learner (Ada) logged out. | A normal, clean end to the session. |
| 11 | 09:02:35Z | authentication.login | Success | A second learner (Tobi) logged in from the same computer/IP. | New person, same shared lab network - not suspicious in this training environment. |
| 12 | 09:03:00Z | scenario-control.verification | Success | The system checked that all expected activity (logins, sessions, page views, etc.) was recorded properly. | This confirms the "quiet normal day" data was captured correctly, so it can be used as the baseline to compare against later. |
