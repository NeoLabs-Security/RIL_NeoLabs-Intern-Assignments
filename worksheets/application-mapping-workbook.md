# NeoLabs Application Mapping Workbook

Complete this workbook before attempting vulnerability validation.

## Assessment identity

- Assessment ID:
- Tester:
- Approved target hostname:
- Approved testing window:
- Assigned synthetic accounts and roles:
- Rules of Engagement version:

## Business-purpose map

| Feature | Intended user | Business purpose | Sensitive action or data | Notes |
|---|---|---|---|---|
| | | | | |

## Role matrix

| Capability | Anonymous | Standard user | Elevated user | Administrator | Observed enforcement point |
|---|---:|---:|---:|---:|---|
| Sign in | | | | | |
| View own record | | | | | |
| View another record | | | | | |
| Create record | | | | | |
| Modify record | | | | | |
| Delete record | | | | | |

Use `Expected`, `Observed`, or `Not tested`. Do not infer permissions from hidden buttons alone.

## Endpoint inventory

| ID | Method | Path | Authentication | Role used | Inputs | Response fields | State change | Evidence ID |
|---|---|---|---|---|---|---|---|---|
| EP-001 | | | | | | | | |

## Object and identifier inventory

| Object type | Example synthetic identifier | Ownership field | Created by | Read endpoint | Update endpoint | Delete endpoint |
|---|---|---|---|---|---|---|
| | | | | | | |

## Trust boundaries

Document where data or authority crosses a boundary:

- browser to web application;
- application to API;
- API to database;
- user role to privileged function;
- file upload to storage or processing;
- application to external service;
- VCC pod to student-facing telemetry or support workflow.

| Boundary | Data crossing it | Expected control | Evidence of control | Open question |
|---|---|---|---|---|
| | | | | |

## Authentication workflow

Record normal behaviour for:

- sign in;
- invalid sign in;
- logout;
- session expiry;
- password reset;
- MFA enrolment or challenge, when present;
- account lockout or rate limit.

## State-changing workflows

For each important action, record:

1. the interface action;
2. request method and path;
3. required role;
4. object identifier;
5. anti-CSRF or confirmation mechanism;
6. resulting state;
7. relevant audit or telemetry event.

## Error behaviour

| Trigger | Status | User-facing message | Technical detail exposed | Security significance | Evidence ID |
|---|---:|---|---|---|---|
| | | | | | |

## Candidate hypotheses

| Hypothesis ID | Expected control | Observation that motivated the test | Minimum safe validation | Stop condition | Status |
|---|---|---|---|---|---|
| H-001 | | | | | Planned |

## Mapping completion check

- [ ] Exact target and testing window confirmed.
- [ ] Normal user journeys recorded before abnormal requests.
- [ ] All issued roles mapped.
- [ ] Authentication and logout behaviour recorded.
- [ ] Important identifiers and ownership fields identified.
- [ ] State-changing requests identified.
- [ ] Evidence contains no live secrets.
- [ ] Candidate tests are tied to written scope.
