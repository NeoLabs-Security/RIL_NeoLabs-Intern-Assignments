### &#x20;            **Week 1 SOC Evidence-log - Operation Night Watch**

##### \## Evidence 001



Event         : Scenario control start

Timestamp     : 2026-08-13T09:14:00Z

Event ID      : ae2035ad-1750-5621-8139-b9cd38f4b2ea

User          : N/A

Source IP     : N/A

Request ID    : synthetic-pod-03-vu1-it01-scenario-start

Outcome       : success



Observation:

The Operation Night Watch baseline scenario started successfully for pod-03. This establishes the beginning of the Week 1 baseline activity.





##### \## Evidence 002



Event          : Failed authentication

Timestamp      : 2026-08-13T09:14:12Z

Event ID       : dccbfcd2-8f8b-53cc-8382-9b59359ef4b3

User           : learner.pod-03.01@synthetic.neolabs.invalid

Source IP      : 203.0.113.23

Request ID     : synthetic-pod-03-vu1-it02-ordinary-password-mistype

Outcome        : failure



Observation:

The synthetic learner's authentication attempt failed because of invalid credentials. The telemetry identifies this as an ordinary baseline password mistype, so the event is consistent with normal Week 1 activity and does not by itself establish malicious activity.





##### \## Evidence 003



Event        : Successful authentication

Timestamp    : 2026-08-13T09:14:25Z

Event ID     : 8e926a0c-fb84-54a9-8316-42172018578c

User         : learner.pod-03.01@synthetic.neolabs.invalid

Source IP    : 203.0.113.23

Request ID   : synthetic-pod-03-vu1-it03-login

Outcome      : success



Observation:

The same synthetic learner successfully authenticated using an active account from the same source IP as the previous failed authentication. This supports the interpretation that the earlier failure was an ordinary credential-entry error.



##### 

##### \## Evidence 004



Event       : Session created

Timestamp   : 2026-08-13T09:14:26Z

Event ID    : b4615e71-7e49-5147-a079-224e2d213bf6

User        : learner.pod-03.01@synthetic.neolabs.invalid

Source IP   : 203.0.113.23

Request ID  : synthetic-pod-03-vu1-it04-session-created

Outcome     : success



Observation:

A synthetic learning session was successfully created one second after the successful authentication. This provides a clear correlation between authentication and session creation.





##### \## Evidence 005



Event         : Application access

Timestamp     : 2026-08-13T09:14:40Z

Event ID      : d44372ca-acd4-5d98-ae2c-a21c748db81f

User          : learner.pod-03.01@synthetic.neolabs.invalid

Source IP     : 203.0.113.23

Request ID    : synthetic-pod-03-vu1-it05-profile

Outcome       : success



Observation:

The authenticated learner accessed the profile resource through /api/me using a GET request. The request was allowed and returned HTTP status code 200, indicating normal authorized application activity.





##### \## Evidence 006



Event       : Application access

Timestamp   : 2026-08-13T09:14:55Z

Event ID    : 974a4859-a7bb-5ad8-8b45-53b09be68d00

User        : learner.pod-03.01@synthetic.neolabs.invalid

Source IP   : 203.0.113.23

Request ID  : synthetic-pod-03-vu1-it06-sections

Outcome     : success



Observation:

The learner accessed the course catalogue through /api/core/sections using a GET request. The request was allowed and returned HTTP status code 200. This is consistent with normal learning activity.





##### \## Evidence 007



Event      : Application access

Timestamp  : 2026-08-13T09:15:10Z

Event ID   : 6f49f64e-9e6d-5d79-a2fd-26c0b06f1cb5

User       : learner.pod-03.01@synthetic.neolabs.invalid

Source IP  : 203.0.113.23

Request ID : synthetic-pod-03-vu1-it07-lessons

Outcome    : success



Observation:

The learner accessed the lesson list through /api/core/sections/sec-baseline-01/lessons using a GET request. The request was allowed and returned HTTP status code 200, consistent with normal authorized learning activity.





##### \## Evidence 008



Event         : Application access

Timestamp     : 2026-08-13T09:15:25Z

Event ID      : 9feae286-ccfa-5c50-bf1e-23fbe6bd1004

User          : learner.pod-03.01@synthetic.neolabs.invalid

Source IP     : 203.0.113.23

Request ID    : synthetic-pod-03-vu1-it08-lesson-assets

Outcome       : success



Observation:

The learner accessed the lesson assets through /api/core/lessons/lesson-baseline-01/assets using a GET request. The request was allowed and returned HTTP status code 200, showing normal authorized access to lesson content.





##### \## Evidence 009



Event        : Application access

Timestamp    : 2026-08-13T09:15:40Z

Event ID     : 541e9b4d-cb2c-5743-9365-348a94177376

User         : learner.pod-03.01@synthetic.neolabs.invalid

Source IP    : 203.0.113.23

Request ID   : synthetic-pod-03-vu1-it09-lesson-progress

Outcome      : success



Observation:

The learner updated lesson progress through /api/progress/lessons/lesson-baseline-01 using a PUT request. The request was allowed and returned HTTP status code 200. The recorded activity is consistent with normal interaction with the learning application.





##### \## Evidence 010



Event       : Session closed

Timestamp   : 2026-08-13T09:16:05Z

Event ID    : 18bd05a7-77f7-56a7-b54a-32030b10608c

User        : learner.pod-03.01@synthetic.neolabs.invalid

Source IP   : 203.0.113.23

Request ID  : synthetic-pod-03-vu1-it10-logout

Outcome     : success



Observation:

The synthetic learner's session was closed successfully because of user logout. This represents a normal termination of the learning session.





##### \## Evidence 011



Event       : Successful authentication

Timestamp   : 2026-08-13T09:16:35Z

Event ID    : f30a4a80-52fd-5192-a9d3-fd33ca7900a7

User        : learner.pod-03.02@synthetic.neolabs.invalid

Source IP   : 203.0.113.23

Request ID  : synthetic-pod-03-vu1-it11-login

Outcome     : success



Observation:

A second synthetic learner successfully authenticated using an active account from source IP 203.0.113.23. This represents another successful authentication event within the Week 1 baseline activity.





##### \## Evidence 012



Event        : Scenario verification

Timestamp    : 2026-08-13T09:17:00Z

Event ID     : f73a9596-7382-5208-9c58-a68590dd60de

User         : N/A

Source IP    : N/A

Request ID   : synthetic-pod-03-vu1-it12-verification

Outcome      : success



Observation:

The Operation Night Watch baseline telemetry was successfully verified for pod-03. The verification confirmed that the required login, session, authorization, and scenario-control event families were present.

