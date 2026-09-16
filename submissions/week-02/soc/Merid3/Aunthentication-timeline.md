# Chronological Authentication & Session Event Log

All timestamps are in **UTC**.

| Event Time (UTC) | Ingest Time (UTC) | Event ID | Actor /  User    | Source IP | Action / Event | Outcome | Correlation ID | Evidence Ref |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **2026-08-01 08:55:02** | 08:55:03 | `evt-auth-0001` | `student03` | `198.51.100.10` | Login (`learner-web`) | Success | `corr-normal-001` | Baseline |
| **2026-08-01 09:14:21** | 09:14:23 | `evt-auth-0002` | `svc-backup` | `203.0.113.44` | Login (`learner-api`) | Failure (`invalid_credentials`) | `corr-auth-701` | **EV-01** |
| **2026-08-01 09:14:49** | 09:14:51 | `evt-auth-0003` | `svc-backup` | `203.0.113.44` | Login (`learner-api`) | Failure (`invalid_credentials`) | `corr-auth-702` | **EV-01** |
| **2026-08-01 09:15:17** | 09:15:18 | `evt-auth-0004` | `svc-backup` | `203.0.113.44` | Login (`learner-api`) | Failure (`invalid_credentials`) | `corr-auth-703` | **EV-01** |
| **2026-08-01 09:15:45** | 09:15:47 | `evt-auth-0005` | `svc-backup` | `203.0.113.44` | Login (`learner-api`) | Failure (`invalid_credentials`) | `corr-auth-704` | **EV-01** |
| **2026-08-01 09:16:13** | 09:16:14 | `evt-auth-0006` | `svc-backup` | `203.0.113.44` | Login (`learner-api`) | Failure (`invalid_credentials`) | `corr-auth-705` | **EV-01** |
| **2026-08-01 09:16:38** | 09:16:40 | `evt-auth-0007` | `student17` | `203.0.113.44` | Login (`learner-api`) | Failure (`invalid_credentials`) | `corr-auth-706` | **EV-01** |
| **2026-08-01 09:16:55** | 09:16:56 | `evt-health-0001` | `endpoint-feed` | N/A | Feed Status | Disconnected | `corr-health-301` | **EV-05** |
| **2026-08-01 09:17:06** | 09:17:08 | `evt-auth-0008` | `student22` | `203.0.113.44` | Login (`learner-api`) | Failure (`invalid_credentials`) | `corr-auth-707` | **EV-01** |
| **2026-08-01 09:18:07** | 09:18:10 | `evt-auth-0009` | `svc-backup` | `203.0.113.44` | Login (`learner-api`) | **Success** (`sess-suspect-902`) | `corr-auth-708` | **EV-02** |
| **2026-08-01 09:18:33** | 09:18:35 | `evt-app-0001` | `svc-backup` | `203.0.113.44` | View Profile (`profile-student17`) | Success | `corr-app-901` | Baseline |
| **2026-08-01 09:19:02** | 09:19:04 | `evt-authz-0001` | `svc-backup` | `203.0.113.44` | Read Evidence (`pod-04`) | **Denied** (`cross_pod_scope`) | `corr-authz-901` | **EV-03** |
| **2026-08-01 09:19:41** | 09:19:43 | `evt-account-0001`| `svc-backup` | `203.0.113.44` | Change Email (`student17`) | **Success** | `corr-account-901` | **EV-04** |
| **2026-08-01 09:20:19** | 09:20:21 | `evt-session-0001`| `scenario-controller`| Internal | Revoke Session (`sess-suspect-902`) | Success | `corr-session-901` | Context |
| **2026-08-01 09:21:04** | 09:21:06 | `evt-auth-0010` | `svc-backup` | `203.0.113.44` | Login (`learner-api`) | Failure (`session_revoked`) | `corr-auth-709` | Context |
| **2026-08-01 09:25:00** | 09:25:01 | `evt-health-0002` | `endpoint-feed` | N/A | Feed Status | Connected | `corr-health-302` | **EV-05** |
| **2026-08-01 10:02:11** | 10:02:12 | `evt-auth-0011` | `student03` | `198.51.100.10` | Login (`learner-web`) | Failure (`invalid_credentials`) | `corr-normal-002` | Baseline |
| **2026-08-01 10:02:38** | 10:02:39 | `evt-auth-0012` | `student03` | `198.51.100.10` | Login (`learner-web`) | Success | `corr-normal-003` | Baseline |
