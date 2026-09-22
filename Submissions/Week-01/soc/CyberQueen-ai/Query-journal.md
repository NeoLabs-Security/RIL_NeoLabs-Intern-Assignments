&#x20;                                                                    Operation Night Watch — Query Journal



\## Query 1



Query:

Find all authentication login events.



Purpose:

To identify successful and failed authentication activity and establish the normal authentication baseline.



Result:

The telemetry showed one failed authentication caused by an ordinary password mistype, followed by a successful authentication for the same synthetic learner.





\## Query 2



Query:

Find all session events.



Purpose:

To identify when user sessions were created and closed and to understand the normal session lifecycle.



Result:

A session was created shortly after successful authentication and was later closed normally because of user logout.





\## Query 3



Query:

Find all authorization access events.



Purpose:

To identify the resources accessed by the authenticated learner and establish normal authorized application activity.



Result:

The learner accessed the profile, course catalogue, lesson list, lesson assets, and lesson progress resources. The requests were successfully authorized.





\## Query 4



Query:

Find all events associated with learner.pod-03.01@synthetic.neolabs.invalid.



Purpose:

To correlate the user's authentication, session, and application activity into one user activity sequence.



Result:

The same synthetic learner was observed progressing from a failed authentication attempt to successful authentication, session creation, profile access, course access, lesson access, lesson asset access, progress update, and normal logout.





\## Query 5



Query:

Find all events associated with source IP 203.0.113.23.



Purpose:

To determine which events originated from the same source IP and support event correlation.



Result:

The source IP was associated with the authentication, session, and application activity for the synthetic learners in the supplied baseline telemetry.





\## Query 6



Query:

Find all events with a failure outcome.



Purpose:

To identify failed activity that may require analyst review and determine whether the failure is consistent with the established baseline.



Result:

One failed authentication event was identified. The telemetry describes it as an ordinary baseline password mistype, so it was treated as normal Week 1 activity rather than confirmed malicious activity.





\## Query 7



Query:

Find all scenario-control events.



Purpose:

To identify the beginning and verification of the Operation Night Watch scenario and confirm that the expected telemetry was available.



Result:

The scenario started successfully at 09:14:00 UTC and verification completed successfully at 09:17:00 UTC.





\## Query 8



Query:

Correlate authentication events with subsequent session and authorization activity.



Purpose:

To verify the normal sequence from authentication to session creation and authorized application activity.



Result:

The successful authentication at 09:14:25 UTC was followed by session creation at 09:14:26 UTC and authorized application activity beginning at 09:14:40 UTC. This establishes a normal authentication-to-session-to-application sequence.





\## Query 9



Query:

Identify the fields available for event correlation.



Purpose:

To determine which fields can be used to connect related events during SOC analysis.



Result:

Useful correlation fields include timestamp, event\_id, pod\_id, synthetic\_user\_id, source\_ip, request\_id, scenario\_id, and event type

