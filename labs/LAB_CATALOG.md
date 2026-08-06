# NeoLabs Grey-Box Practice Lab Catalogue

All labs use synthetic data and authorised local or VCC Security Lab targets. Every lab requires the Rules of Engagement, testing journal and evidence register.

## Lab 1 - HTTP Request Mapping

**Level:** Beginner  
**Environment:** Browser, Burp Community and a supplied local application

Objectives:

- map interface actions to HTTP requests;
- identify methods, parameters, cookies and JSON fields;
- separate client-side behaviour from server-side enforcement;
- produce an endpoint inventory.

Deliverables: application map, five annotated redacted requests and a reflection on visibility gaps.

## Lab 2 - Local Object Ownership Review

**Level:** Beginner  
**Environment:** `labs/local-access-control/`

Objectives:

- establish the normal owner workflow;
- use the supplied synthetic objects;
- perform one controlled object-ownership comparison;
- stop at proof;
- write a vulnerability finding and remediation recommendation.

## Lab 3 - Session Lifecycle Investigation

**Level:** Beginner to Intermediate  
**Environment:** Mentor-approved synthetic scenario

Objectives:

- observe session creation and cookie attributes;
- document logout and expiry behaviour;
- verify whether an approved account-state change affects existing sessions;
- distinguish interface state from server-side revocation.

Prohibited: credential guessing, spraying or use of real accounts.

## Lab 4 - Role-Action-Object Matrix

**Level:** Intermediate

Objectives:

- map learner, support and mentor roles;
- document expected decisions;
- manually verify a small approved set of read and write operations;
- identify one confirmed control and one possible visibility limitation.

## Lab 5 - API Object and Property Authorisation

**Level:** Intermediate

Objectives:

- build an approved endpoint inventory;
- inspect object identifiers and response properties;
- compare two supplied synthetic roles;
- verify server-side state;
- produce a finding or documented negative result.

## Lab 6 - Workflow and Input Validation

**Level:** Intermediate

Objectives:

- diagram a multi-step synthetic workflow;
- test safe missing, type and boundary values;
- attempt one mentor-approved skipped-step variation;
- assess error handling;
- document cleanup.

## Lab 7 - Cross-Track Red-Blue-Support Exercise

**Level:** Intermediate

Pentesting interns validate the approved weakness and stop at proof. SOC interns investigate the telemetry. IT Security Support interns apply the approved remediation or configuration change. Pentesters then retest the fixed release.

Required outputs:

- pentest finding;
- SOC timeline or incident record;
- Support change record;
- retest report;
- joint lessons learned.

## Lab 8 - Final Capstone

The capstone uses the complete process in `docs/10-capstone-retest/README.md`.

Completion requires:

- signed scope confirmation;
- normal-use application map;
- hypothesis register;
- testing journal;
- evidence register;
- professional report;
- remediation retest;
- cleanup and access-revocation confirmation.

## Lab release rule

A VCC lab is assigned only after mentor rehearsal, scenario certification, pod-isolation validation and task publication. This public catalogue contains no live hostnames, credentials, hidden flags or mentor answer keys.
