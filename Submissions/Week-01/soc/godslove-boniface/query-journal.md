## Query 1 — Authentication activity

## Concept:
Authentication activity and normal login behavior.


##  Query
 event_category =authentication


## Purpose:
Identify all authentication events in the pod-02 Operation Night Watch baseline and establish the normal authentication pattern.

## result
Three authentication events were observed: one failed login followed by two successful logins.

## interpretation
The authentication sequence provides the baseline for normal login activity.


### Baseline Query 2 - Failed authentication

## Concept:
Failed authentication and distinguishing ordinary errors from suspicious activity.


## Query
event_category = authentication
AND
outcome = failure


## Purpose:

 Identify failed login attempts so they can later be compared with abnormal authentication patterns.

## Result
one failed authentication was observed at 2026-08-13T09:07:12Z

## interpretation
The event was caused by invalid credentials due to Password mistype#.

### Baseline Query 3 - Application/API access

## Concept:
Authorized application/API activity.

## Query
event_category = authorization
AND
outcome = success

## Purpose:
 Establish which application resources are normally accessed during legitimate activity.

 ## Result
 Five successful authorization events were observed between 2026-08-13T09:07:40Z and 2026-08-13T09:08:40Z.

 ## interpretation
 The activity represents normal authorized access to the profile, course catalogue, lessons, lesson assets, and lesson-progress resources.

 
