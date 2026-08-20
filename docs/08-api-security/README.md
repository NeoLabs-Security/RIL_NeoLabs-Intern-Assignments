# Module 8 - API Security Testing

## Purpose

This module provides a structured method for assessing approved REST-style APIs in the VCC Security Lab. It focuses on mapping, authorisation, validation, resource controls and evidence rather than unrestricted scanning.

## Learning outcomes

An intern should be able to:

- build an endpoint inventory from approved documentation, browser traffic and application behaviour;
- identify authentication, role, object and property boundaries;
- test object-level, property-level and function-level authorisation;
- assess pagination, filtering, rate limits and error handling;
- recognise sensitive business flows and unsafe downstream trust;
- produce a clear API finding and retest result.

## Endpoint inventory

For each endpoint record:

| Field | Example |
|---|---|
| Method | `GET` |
| Path | `/api/v1/submissions/{id}` |
| Purpose | retrieve one synthetic submission |
| Authentication | bearer session required |
| Expected roles | learner owner; assigned mentor |
| Inputs | path ID, optional fields query |
| Success response | object JSON |
| Failure responses | 401, 403, 404 |
| State change | none |
| Related endpoint | update, submit, archive |

Version, host and pod are supplied by the operator and must not be guessed.

## Core testing areas

### Object-level authorisation

Confirm that every endpoint using an object identifier checks whether the current subject may access that object.

### Property-level authorisation

Confirm that responses do not expose restricted fields and that requests cannot change protected properties. Compare the documented schema with the actual request and response.

### Function-level authorisation

Confirm that administrative or mentor actions are enforced by the server, not merely hidden from navigation.

### Authentication

Check token placement, expiry, revocation and error handling with operator-issued synthetic accounts. Never copy tokens into issues, commits or screenshots.

### Resource consumption

Observe documented limits for page size, upload size and request frequency. Do not conduct stress or denial-of-service testing. A mentor may provide a tiny bounded limit exercise.

### Sensitive business flows

Identify workflows whose repeated or automated use could create harm, such as account creation, submission approval or recovery. Validate controls only with the supplied synthetic records and request ceiling.

### Server-side request behaviour

Any URL-fetching or webhook scenario must use only operator-provided internal synthetic destinations. Public services, cloud metadata endpoints and neighbouring infrastructure are out of scope.

### API inventory and versioning

Look for approved but forgotten versions, undocumented methods or inconsistent security controls only within the exact assigned hostname and paths. Do not search other domains or address ranges.

## Safe request workflow

1. Capture a normal request from the approved client.
2. Save a redacted copy in the testing journal.
3. Change one object, property, method or role condition.
4. Send one manual request.
5. verify both response and server-side state;
6. stop at the proof threshold;
7. restore synthetic state if instructed.

## Useful non-secret evidence

- endpoint and method;
- synthetic role label;
- redacted request body;
- response status and selected non-sensitive fields;
- object ownership relationship;
- state before and after;
- rate-limit headers where present;
- correlation or request ID;
- expected policy and observed decision.

## API finding quality

A finding should identify the broken control rather than only the request trick. For example, describe missing object-level authorisation, the affected role and business impact, then recommend a server-side check that is applied consistently to every relevant endpoint.

## Review questions

1. What is the difference between object-level and property-level authorisation?
2. Why is a `200` response not enough to prove data exposure?
3. Why must rate-limit testing remain bounded?
4. What should an endpoint inventory contain?
5. How do you prove that a fixed endpoint is no longer vulnerable?

## Authoritative basis

- OWASP API Security Top 10 - 2023.
- OWASP Web Security Testing Guide v4.2.
- NIST SP 800-115.
- Official HTTP and API documentation for the tested application.
