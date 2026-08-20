# Module 5 - Identity, Authentication and Session Testing

## Purpose

This module teaches interns to assess identity workflows without turning a controlled assessment into credential abuse. The objective is to understand how an application establishes identity, changes identity state and maintains an authenticated session.

## Learning outcomes

An intern should be able to:

- map registration, sign-in, sign-out, password change, password recovery and MFA workflows;
- distinguish identification, authentication, authorisation and session management;
- recognise insecure differences in error messages, response timing or state transitions;
- verify whether logout, password reset and account disablement invalidate existing sessions;
- document session-cookie and bearer-token properties without exposing their values;
- test only operator-issued synthetic accounts and stop at the approved proof threshold.

## Workflow mapping before testing

For each identity workflow, record:

1. entry point and HTTP method;
2. required fields and headers;
3. normal successful response;
4. normal failed response;
5. rate-limit or lockout behaviour;
6. state change in the user account;
7. session or token issued;
8. audit event expected;
9. recovery or rollback path.

Do not change requests until the normal workflow is understood.

## Account enumeration

Enumeration occurs when an application reveals whether an account exists through messages, status codes, response sizes, timing or follow-up behaviour. A defensible finding requires a repeatable difference using synthetic test identities. Avoid large username lists. Compare only the small set authorised by the assignment.

## Password and MFA workflows

Review whether:

- password policy is enforced by the server rather than only the browser;
- reset tokens are short-lived, single-use and bound to the intended account;
- changing a password invalidates sessions where required;
- MFA enrolment, removal and recovery require appropriate re-authentication;
- backup or recovery methods do not silently bypass stronger controls;
- sensitive values are excluded from URLs, logs and screenshots.

## Session lifecycle

A session should be considered as a lifecycle:

`created -> used -> refreshed -> expired or revoked`

Test questions include:

- Is a new session identifier issued after successful authentication?
- Does logout revoke the server-side session or merely remove a browser cookie?
- Are expired or revoked sessions rejected consistently?
- Are session cookies marked `Secure`, `HttpOnly` and with an appropriate `SameSite` policy?
- Does a role or password change affect existing sessions as designed?
- Are concurrent sessions visible or manageable where the product requires it?

## Safe comparison method

Use two operator-issued synthetic accounts with different roles only when the Rules of Engagement permit it. Record the expected behaviour first, then perform the minimum comparison needed. Do not attempt password spraying, credential stuffing or unrestricted brute force.

## Evidence standard

Capture:

- timestamp and assignment ID;
- synthetic account label, not a real identity;
- redacted request and response;
- relevant cookie or token attributes with values removed;
- resulting account or session state;
- repetition count;
- expected versus observed behaviour;
- limitations and alternative explanations.

## Stop and escalate

Stop when:

- a real account or personal record appears;
- another pod or environment becomes visible;
- the test affects availability;
- a reset or session action has an unexpected write effect;
- the approved proof threshold is reached.

## Guided exercise

Using the local synthetic practice target or a mentor-approved VCC scenario:

1. map sign-in and sign-out;
2. compare one valid and one invalid synthetic account response;
3. inspect session-cookie attributes;
4. verify the documented logout outcome;
5. record one hypothesis, one test and one conclusion;
6. submit the testing journal and evidence register.

## Review questions

1. Why is authentication different from authorisation?
2. What proves that logout invalidates a session?
3. Why should reset tokens be single-use?
4. What information must be removed from screenshots?
5. When does a response difference become a defensible enumeration finding?

## Authoritative basis

- OWASP Web Security Testing Guide v4.2 authentication, identity and session-management sections.
- NIST SP 800-115 for planned, authorised and evidence-led technical assessment.
- Official browser documentation for cookie attributes and storage behaviour.
