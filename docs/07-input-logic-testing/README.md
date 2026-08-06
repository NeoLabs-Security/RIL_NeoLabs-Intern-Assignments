# Module 7 - Input Validation, File Handling and Business Logic

## Purpose

This module teaches interns to investigate how an application processes user-controlled input and enforces workflow rules. The focus is controlled validation, not broad payload execution.

## Learning outcomes

An intern should be able to:

- identify every location where input enters a request;
- distinguish syntax validation, semantic validation and authorisation;
- test server-side validation using small, harmless variations;
- assess error handling and information exposure;
- review file-upload controls and business workflows safely;
- stop before destructive, persistent or externally directed effects occur.

## Input model

For each parameter, record:

- name and location;
- expected type, format and length;
- whether it is required;
- allowed values;
- server response to missing, malformed and boundary values;
- resulting state change;
- related authorisation decision.

Client-side restrictions are useful for usability but do not replace server-side controls.

## Safe validation sequence

Use a small sequence:

1. normal valid value;
2. empty or missing value where permitted;
3. wrong type;
4. documented minimum or maximum boundary;
5. one harmless special-character case;
6. one state or order-of-operations variation.

Do not use destructive payloads or large automated payload collections. The assignment must explicitly identify any specialised vulnerability class to be demonstrated in the isolated lab.

## Error handling

Assess whether errors:

- reveal stack traces, internal paths, query details, secrets or environment values;
- differ in ways that disclose accounts, roles or object existence;
- return a safe user message while preserving detailed server-side logging;
- use appropriate status codes;
- leave partial or inconsistent state.

A verbose error is not automatically a high-severity finding. Explain what useful information it exposes and how reliably it appears.

## File-upload review

Map:

- accepted file types and extensions;
- content-type and content inspection;
- size and count limits;
- filename handling;
- storage location and generated name;
- access-control checks on retrieval;
- malware-scanning or moderation stage where designed;
- deletion and retention behaviour.

Use only supplied harmless sample files. Do not upload executables, malware or active content unless a supervised synthetic exercise provides a safe inert fixture.

## Path and server-side request behaviour

In isolated scenarios, the mentor may provide a bounded path or URL-handling exercise. Keep tests within the supplied synthetic resource list. Never direct the application toward public or private third-party services, cloud metadata endpoints or neighbouring lab components.

## Business-logic testing

Business-logic weaknesses arise when valid functions can be used in an invalid order or context. Build a state diagram for the normal workflow, then ask:

- Can a required step be skipped?
- Can an action be repeated when it should be single-use?
- Can a value change after approval?
- Can the same resource be consumed twice?
- Can one role trigger another role’s state transition?
- Are server-side limits applied consistently?

Test one transition at a time with synthetic records.

## Evidence standard

Record:

- expected validation or workflow rule;
- exact harmless variation;
- response and final state;
- repetition and consistency;
- affected role and object;
- proof threshold;
- cleanup performed;
- visibility limits.

## Common mistakes

- reporting browser validation without testing the server;
- assuming every unusual error is exploitable;
- changing several fields simultaneously;
- continuing after an unexpected write;
- using copied internet payload lists without scope approval;
- testing external URLs or real files;
- confusing weak input validation with broken authorisation.

## Guided exercise

Map one synthetic form and one multi-step workflow. Produce:

- parameter inventory;
- workflow state diagram;
- three safe validation tests;
- one skipped-step hypothesis;
- evidence register;
- conclusion and remediation recommendation.

## Authoritative basis

- OWASP WSTG v4.2 input validation, error handling, business logic and client-side testing sections.
- OWASP API Security Top 10 2023, including unrestricted access to sensitive business flows and unsafe consumption of APIs.
- NIST SP 800-115 for controlled test design and limitations.
