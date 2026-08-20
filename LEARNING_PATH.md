# NeoLabs Grey-Box Penetration Testing Learning Path

The track progresses from authorisation/protocol literacy to controlled testing, evidence, reporting and retesting. Current runtime/access guidance lives in [`PROGRAMME_CURRENT_STATE.md`](PROGRAMME_CURRENT_STATE.md).

## Phase 1 — Professional foundations

- written authorisation, scope and Rules of Engagement;
- grey-box testing and supplied knowledge;
- stop conditions, proof thresholds and escalation;
- evidence handling, confidentiality and professional conduct.

## Phase 2 — HTTP and application foundations

- requests, responses, methods, headers, parameters and status codes;
- cookies, sessions, tokens and browser storage;
- HTML, JavaScript and JSON interpretation;
- REST APIs, roles, objects and trust boundaries.

## Phase 3 — Safe testing workflow

- Burp Proxy, HTTP history, Repeater, Decoder and Comparer;
- exact current target scope and out-of-scope blocking;
- application mapping and endpoint inventory;
- guarded low-rate discovery only when the server publishes network scope;
- testing journals and evidence capture.

## Phase 4 — Identity and access testing

- identity/account workflows;
- authentication/recovery logic;
- session lifecycle/logout;
- horizontal/vertical authorisation;
- object ownership and function-level access control.

## Phase 5 — Application/API testing

- configuration/information exposure;
- input validation/error handling;
- file handling/path controls/server-side request behaviour;
- business-logic/workflow testing;
- API object/property/function authorisation.

## Phase 6 — Analysis and reporting

- observation, evidence, interpretation and impact;
- reproducibility/preconditions;
- severity, priority and confidence;
- remediation guidance/limitations;
- cross-track handoff, fixed-version retest and residual risk.

## Twelve-week application

| Week | Scenario | Main pentest competency |
|---|---|---|
| 01 | Operation Night Watch | safe application/service mapping |
| 02 | Ghost Login | authentication/session testing |
| 03 | Credential Storm | bounded mentor-controlled credential exercise |
| 04 | Broken Gate | access control / IDOR testing |
| 05 | Poisoned Upload | safe upload validation |
| 06 | Web Breach | controlled web vulnerability validation |
| 07 | Cloud Locker | bounded IAM/S3 permission assessment |
| 08 | S3 Insider Trail | predefined cloud misuse validation |
| 09 | Data Escape | controlled cloud data-path assessment |
| 10 | Hidden Endpoint | scoped API enumeration/mapping |
| 11 | Developer Ransomware Drill | exposure/control validation without malware execution |
| 12 | Blackout at VCC | capstone validation, handoff and retest |

Later-week files can be staged before release. The current central assignment and server-issued manifest determine what is actually authorised.

## Completion standard

A learner should be able to test only current authorised scope, map an application, form/test a defensible hypothesis, stop at the approved proof threshold, preserve evidence, write a clear finding, hand off to SOC/Support and verify remediation without extending beyond the assignment.
