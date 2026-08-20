# Module 1 — Professional Grey-Box Testing Foundations

## Purpose

Grey-box penetration testing combines authorised internal knowledge with independent technical verification. The tester may receive approved accounts, role information, architecture notes or API documentation, but must still validate how the target actually behaves.

The goal is not to "break everything." The goal is to produce reliable evidence about security weaknesses while protecting the system, its users and the validity of the assessment.

## Learning outcomes

By the end of this module, an intern should be able to:

- explain the difference between an event, observation, weakness, vulnerability and confirmed finding;
- distinguish black-box, grey-box and white-box testing;
- read a Rules of Engagement document before using any technical tool;
- identify in-scope targets, accounts, actions and testing windows;
- recognise stop conditions and escalation triggers;
- maintain an auditable testing journal;
- separate evidence from interpretation;
- communicate a finding without exaggerating impact.

## The testing lifecycle

### 1. Planning

Before testing begins, confirm:

- the business purpose of the assessment;
- exact target hostnames and application routes;
- authorised accounts and roles;
- allowed and prohibited techniques;
- testing window and contact persons;
- evidence-handling rules;
- stop conditions;
- reporting deadline and expected format.

No tool output can replace missing authorization.

### 2. Discovery and mapping

The tester identifies the application's visible structure, roles, endpoints, parameters, state transitions and trust boundaries. Mapping should begin with normal user activity before any abnormal requests are attempted.

### 3. Hypothesis development

A good test starts with a question, for example:

> Does the server verify that the signed-in user owns the requested object?

The hypothesis should name the expected control and the evidence that would support or reject it.

### 4. Controlled validation

Use the least disruptive action capable of proving or disproving the hypothesis. Stop when sufficient proof has been collected. Do not expand impact merely to make a screenshot look more dramatic.

### 5. Analysis

Compare observed behaviour with the expected security control. Consider preconditions, reproducibility, affected roles, data sensitivity, business impact and visibility limitations.

### 6. Reporting and retest

A finding must be understandable to both technical and non-technical readers. After remediation, reproduce the original test safely and record whether the weakness is fixed, partially fixed or still present.

## Essential terminology

| Term | Working meaning |
|---|---|
| Scope | The exact systems, identities, actions and time period covered by written permission. |
| Observation | Something directly seen in a response, interface, log or tool output. |
| Hypothesis | A testable explanation for the observation. |
| Vulnerability | A weakness that can be used to violate a security requirement. |
| Finding | A documented assessment result supported by reproducible evidence. |
| False positive | A suspected weakness that is not supported after validation. |
| Preconditions | Conditions required before a weakness can be reproduced. |
| Proof threshold | The minimum evidence needed to validate a finding without unnecessary impact. |
| Residual risk | Risk remaining after remediation or compensating controls. |

## Facts, interpretations and claims

A professional report separates three levels:

1. **Fact:** `GET /api/orders/102` returned order 102 while the tester was signed in as a different synthetic user.
2. **Interpretation:** the endpoint may not be enforcing object ownership.
3. **Claim:** an authenticated user can access another user's order record.

The claim is only justified after the tester confirms the session identity, object ownership and reproducibility within scope.

## Stop conditions

Stop testing and contact the authorised supervisor when:

- a request appears to affect availability or stability;
- real personal, financial or production data appears unexpectedly;
- the target resolves outside the approved environment;
- the issued account gains unexpected administrative access;
- another pod or learner's data becomes visible;
- the tester is unsure whether an action is authorised;
- a serious weakness can be proven without further interaction.

## Evidence quality

Useful evidence includes:

- timestamp in UTC;
- target hostname and approved role;
- request method, path and relevant headers;
- response status and relevant fields;
- screenshot or export identifier;
- test conditions and expected result;
- sanitised reproduction notes;
- limitations and unresolved questions.

Never place live passwords, session cookies, private keys or unredacted personal information in a report.

## Worked example

### Situation

A learner account can view its own synthetic profile through `/api/profile/learner-01`.

### Hypothesis

The server may rely on the profile identifier supplied by the browser instead of deriving ownership from the authenticated session.

### Safe validation

The tester changes only the synthetic profile identifier to another approved lab object and sends one request. No modification is attempted.

### Evidence

The response contains a different synthetic user's profile while the original session remains active.

### Conclusion

The evidence supports a horizontal access-control finding. The report must still state that only the approved synthetic records were tested and that broader impact was not assessed.

## Review questions

1. Why is written scope more important than tool capability?
2. What is the difference between an observation and a confirmed finding?
3. Why should a tester stop after reaching the proof threshold?
4. What information should be removed from shared evidence?
5. When should a serious discovery be escalated immediately?

## Authoritative basis

- NIST SP 800-115, *Technical Guide to Information Security Testing and Assessment*.
- OWASP Web Security Testing Guide v4.2, especially the testing framework and methodology sections.
- NeoLabs `RULES_OF_ENGAGEMENT.md` and `AGENTS.md`.
