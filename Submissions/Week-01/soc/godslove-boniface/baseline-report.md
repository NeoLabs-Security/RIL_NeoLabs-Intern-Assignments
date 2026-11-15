# Week 1 SOC Baseline Report - Operation Night Watch

### 1. Scope
- **Assigned Pod:** pod-02
- **Scenario:** w01-night-watch-baseline
- **Telemetry Source:** vcc-security-lab
- **Analysis Period:** One-week

### 2. Telemetry Observed
- **Authentication:** 3
- **Session:** 2
- **Authorization/API:** 5
- **Scenario-control:** 2
- **Total:** 13 events

### 3. Normal Authentication Pattern
- One failed authentication was observed at `2026-08-13T09:07:12Z` due to invalid credentials and is identified in the telemetry as an ordinary baseline password mistype.
- A successful authentication followed at `2026-08-13T09:07:25Z`.

### 4. Normal Application / API Pattern
Five successful authorization events were observed.

The activity involved normal access to:
- Profile
- Course catalogue
- Lesson list
- Lesson assets
- Lesson progress

### 5. Normal Session Pattern
- At `2026-08-13T09:07:26Z` a session was successfully created.
- At `2026-08-13T09:07:40Z` the user performed an authorized activity to retrieve their profile.
- At `2026-08-13T09:07:55Z` the user performed an authorized activity to retrieve the course catalogue.
- At `2026-08-13T09:09:05Z` the session was closed/terminated due to user logout.

### 6. Baseline Queries

**Query 1:** `event_type: authentication AND outcome: success`  
**Purpose:** To identify successful user logins and establish normal starting point of a user session.

**Query 2:** `event_type: session AND action: creation AND outcome: success`  
**Purpose:** To confirm that a session is successfully created after authentication and establish the beginning of normal session activity.

**Query 3:** `event_type: session AND action: closed AND outcome: success`  
**Purpose:** To identify when a user session ends and determine whether it was terminated normally, such as through user logout.

### 7. Normal Activity Timeline

| Time | Event | Activity | Outcome |
| :--- | :--- | :--- | :--- |
| 2026-08-13T09:07:12Z | Authentication | Failed login - invalid credentials | Failure |
| 2026-08-13T09:07:25Z | Authentication | tobi learner logged in | Success |
| 2026-08-13T09:07:26Z | Session | Session created | Success |
| 2026-08-13T09:07:40Z | Authorization | Retrieve profile | Success |
| 2026-08-13T09:07:55Z | Authorization | Retrieve course catalogue | Success |
| 2026-08-13T09:09:05Z | Session | Session closed - user logout | Success |

### 8. Visibility Gaps
The available telemetry cannot currently determine whether any suspicious activity occurred during the session, who definitely initiated the logout, why the subsequent user logged in, or what occurred after session termination.

### 9. Baseline Conclusion
Week 1 appears to represent normal user activity: successful login, session creation, authorized access to resources, normal learning activity, and session closure through logout.

For a future security incident, compare the activity against this baseline, especially:
- Login times and frequency
- Session creation and termination
- Resources accessed
- Successful vs. failed requests
- User and pod involved
- Unusual or unauthorized actions

Any significant deviation from this normal pattern could be investigated as potentially suspicious activity.
