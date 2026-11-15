## Evidence 001
Event: Successful authentication
Timestamp:2026-08-13T09:07:25Z"
Event ID:"7bb1987f-3160-500f-a1ac-81e90ef2ce86"
User:"Tobi Learner"
Source IP:"198.51.100.22"
Request ID:"synthetic-pod-02-vu1-it03-login"
Outcome:"success",
Observation:successful login because the correct credentials were entered

## Evidence 002
Event: Failed authentication
Timestamp:2026-08-13T09:07:12Z
Event ID:f2779f7b-0b92-5977-9c37-718ea21a0c4c
User:"Tobi Learner"
Source IP:198.51.100.22"
Request ID:"synthetic-pod-02-vu1-it02-ordinary-password-mistype",
Outcome:"failure"
Observation:"invalid_credentials" occured due to password mistype

## Evidence 003
Event: Application access
Timestamp:"2026-08-13T09:07:55Z"
Event ID:"47436c0b-9f21-5aef-95c9-297d54f0b53a"
Resource:"course-catalogue",
Request ID:synthetic-pod-02-vu1-it06-sections"
Outcome:"success"
Observation: the user was authorized to use view the course catalogue

## Evidence 004
Event: Session activity
Timestamp:"2026-08-13T09:07:26Z"
Event ID:"47f986d4-ce8c-556a-bd6a-9665f71ba8c1"
User:"b29943a2-3b94-53a1-a1aa-8f82fe2c61d7"
Outcome:"success"
Observation:normal session establishment for synthetic learner account

## Evidence 005
Event: Scenario verification
Timestamp:"2026-08-13T09:10:00Z"
Event ID:"ebb01d0c-8658-5577-8fcb-9fee484b9e92"
Pod:"pod-02"
Scenario:"w01-night-watch-baseline"
Outcome:success
Observation:it was observed that the required baseline telemetry for pod-02 was successfully verified, with login, authorization, and scenario-control events present```
 
