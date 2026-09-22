### &#x20;          **Week 1 SOC Baseline Report - Operation Night Watch**



##### **1. Scope**



Assigned Pod                  : "pod-03"

Scenario                      : "w01-night-watch-baseline"

Telemetry Source              : NeoLabs × RIL Week 1 SOC L1 Raw Telemetry Fallback

Baseline Release              : "launch/2026-08-11-integrated"

Traffic Profile               : "quiet-learning"

Environment                   : "vcc-security-lab"

Analysis Period               : "2026-08-13T09:14:00Z" to "2026-08-13T09:17:00Z"

Classification                : Synthetic training telemetry, sanitized and redacted.



The supplied telemetry is a raw-format fallback replay pack for the Operation Night Watch Week 1 baseline exercise. It contains synthetic training events and is not a live production or database export.



##### 

##### **2. Telemetry Observed**



The dataset contains the following main event categories:

\- Authentication activity

\- Session activity

\- Authorization and API activity

\- Scenario-control activity



A total of 12 events were observed in the supplied "pod-03" dataset.

The events include one scenario start, authentication attempts, session creation and closure, authorized application and API access, a second successful login, and a final scenario verification event.





##### 3\. Normal Authentication Pattern



The authentication activity shows normal login behavior within the Week 1 baseline.



At "2026-08-13T09:14:12Z", synthetic user "learner.pod-03.01@synthetic.neolabs.invalid" had a failed login from source IP "203.0.113.23". The recorded reason was "invalid\_credentials", and the metadata identifies it as an "ordinary\_baseline\_mistype".

At "2026-08-13T09:14:25Z", the same synthetic user successfully authenticated from the same source IP. The recorded reason was "active\_account".



The successful authentication was followed immediately by session creation and normal application activity.

A second successful authentication occurred at "2026-08-13T09:16:35Z" for synthetic user "learner.pod-03.02@synthetic.neolabs.invalid", also from source IP "203.0.113.23".



The failed authentication event does not by itself establish malicious activity. Within this Week 1 baseline dataset, it is consistent with an ordinary credential-entry failure followed by successful authentication.





##### **4. Normal Application/API Pattern**



The authorization events show successful and permitted access to normal application resources.



The first synthetic user accessed:

1\. "/api/me" using "GET"

2\. "/api/core/sections" using "GET"

3\. "/api/core/sections/sec-baseline-01/lessons" using "GET"

4\. "/api/core/lessons/lesson-baseline-01/assets" using "GET"

5\. "/api/progress/lessons/lesson-baseline-01" using "PUT"



All observed authorization events had:

Decision     : "allowed"

Outcome      : "success"

Status Code  : "200"



The activity represents a normal learning-session sequence in which a synthetic learner accesses their profile, views the course catalogue, accesses lessons and lesson assets, and updates lesson progress.

The progress update recorded the video position, video duration, notes progress, summary progress, and completion status.





##### **5. Normal Session Pattern**



The normal session sequence observed for synthetic user "learner.pod-03.01@synthetic.neolabs.invalid" was:

Successful authentication → Session created → Profile accessed → Course catalogue accessed → Lesson list accessed → Lesson assets accessed → Lesson progress updated → Session closed



The session was created at "2026-08-13T09:14:26Z" and later closed at "2026-08-13T09:16:05Z".

The session closure recorded the reason as "user\_logout", indicating normal termination of the session.

This sequence provides a useful baseline for comparing future activity against normal user behavior.





##### **6. Baseline Queries**



Query 1: Authentication Activity



Query:



event\_category = authentication



Purpose:

Show all authentication activity for the assigned pod. This establishes the normal authentication pattern and allows successful and failed authentication events to be reviewed together.



Query 2: Failed Authentication

Query:

event\_category = authentication

AND

outcome = failure



Purpose:

Identify failed login attempts so they can be compared with abnormal authentication patterns during future investigations.



Query 3: Application/API Access

Query:

event\_category = authorization

AND

outcome = success



Purpose:

Establish which application resources are normally accessed during legitimate activity.



Additional useful correlation fields include:

pod\_id

synthetic\_user\_id

source\_ip

request\_id

request\_path

event\_type

outcome



##### **7. Normal Activity Timeline**



The detailed chronological activity is documented in "timeline.md".

The main sequence begins with the Operation Night Watch scenario starting at "09:14:00Z".

An ordinary failed authentication occurs at "09:14:12Z", followed by successful authentication at "09:14:25Z".



A session is created at "09:14:26Z", followed by normal profile, course, lesson, and lesson-asset access.

At "09:15:40Z", the learner updates lesson progress.

The session is closed normally at "09:16:05Z".



A second synthetic learner successfully authenticates at "09:16:35Z".

The scenario verification event occurs at "09:17:00Z" and confirms that the baseline telemetry is present.



##### **8. Visibility Gaps**



The supplied telemetry provides useful authentication, session, authorization, correlation, and scenario-control information. However, it does not provide complete endpoint or network visibility.



The following information cannot be determined from this dataset alone:



\- Originating device hostname

\- Geographic location of the source

\- Network firewall activity

\- Endpoint process activity

\- DNS activity

\- File activity

\- Storage telemetry

\- Contents or state of the user's device

\- The exact reason behind every API action



Additional endpoint or EDR process logs would be required to determine which local processes generated suspicious activity.

Additional network telemetry would also be required to investigate firewall, DNS, and broader network behavior.

These limitations should be considered when investigating future security events.



##### **9. Baseline Conclusion**



The "pod-03" Operation Night Watch dataset establishes a normal Week 1 activity baseline consisting of scenario-control events, successful and ordinary unsuccessful authentication, session creation and termination, and authorized application/API activity.



The failed authentication event at "09:14:12Z" is explicitly associated with an ordinary baseline credential-entry mistake and is followed shortly by a successful authentication from the same synthetic activity context. It does not, by itself, provide evidence of malicious activity.

The normal user activity follows a predictable sequence of authentication, session creation, authorized resource access, lesson progress activity, and session closure.



This baseline can be used as a reference point for future investigations. Activity that differs significantly from these established patterns should be examined using the available correlation fields, including "synthetic\_user\_id", "source\_ip", "request\_id", "event\_type", "event\_category", "request\_path", and "outcome".

The current dataset should not be treated as sufficient to determine endpoint, DNS, firewall, file, or storage activity because those telemetry sources are not included.

