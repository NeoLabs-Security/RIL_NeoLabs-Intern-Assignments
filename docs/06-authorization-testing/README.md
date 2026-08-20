# Module 6 - Authorisation and Access-Control Testing

## Purpose

Authorisation determines what an authenticated or unauthenticated actor may do. This module teaches interns to test access-control decisions carefully, using only assigned synthetic roles and the minimum proof required.

## Learning outcomes

An intern should be able to:

- distinguish horizontal, vertical, object-level and function-level authorisation;
- build a role-action-object matrix before testing;
- recognise insecure direct object reference patterns without assuming every identifier is vulnerable;
- compare expected and observed server-side decisions;
- test read and write operations separately;
- document a finding without exposing another student's evidence or another pod.

## Access-control model

Represent each test as:

`subject + action + object + context -> decision`

Example:

- subject: synthetic learner A;
- action: read;
- object: learner A's draft submission;
- context: assigned pod and active session;
- expected decision: allow.

Changing one element at a time produces clearer evidence than changing several values together.

## Types of failure

### Horizontal privilege escalation

One user accesses another user’s peer-level object.

### Vertical privilege escalation

A lower-privileged role performs an administrator or mentor function.

### Broken object-level authorisation

The server accepts an object identifier without confirming that the current subject may access that object.

### Broken function-level authorisation

A protected function or route is available to an unauthorised role even when the interface hides it.

### Broken object-property authorisation

A user can read or change fields that should be restricted, even when access to the wider object is legitimate.

## Role-action-object matrix

Create a matrix before testing:

| Role | Object | Read | Create | Update | Delete | Special action |
|---|---|---:|---:|---:|---:|---:|
| learner | own draft | expected allow | allow | allow | assignment-dependent | submit |
| learner | peer draft | expected deny | n/a | deny | deny | deny |
| support | support ticket | assigned scope | create | update | controlled | escalate |
| mentor | cohort review | allow | controlled | controlled | controlled | approve |

The matrix is a hypothesis. The server response and resulting state are the evidence.

## Safe testing sequence

1. Confirm both synthetic roles and objects are authorised for the exercise.
2. Capture the normal allowed request.
3. Change only the object identifier, role context or function path specified by the lab.
4. Send one request manually in Burp Repeater.
5. Check the response and the resulting application state.
6. Stop once the access-control decision is proven.
7. Record cleanup or rollback requirements.

Do not enumerate large identifier ranges. Do not automate object access unless the assignment explicitly supplies a tiny bounded dataset and request limit.

## Read versus write impact

A successful response code alone is not proof. For read tests, verify whether restricted content was actually returned. For write tests, verify whether state changed, then use the approved rollback. Unexpected write access is an immediate stop-and-escalate condition.

## Common false positives

- a public object was intentionally accessible;
- the synthetic accounts belong to the same approved team or tenant;
- a cached page is displayed although the server denied the new request;
- the response is generic and contains no restricted data;
- the tested field is user-controlled by design;
- an administrator account was accidentally used.

## Evidence and reporting

A strong finding states:

- subject role and synthetic identity label;
- object ownership and expected policy;
- exact action tested;
- redacted request and response;
- actual resulting state;
- business impact in the lab story;
- proof threshold and why testing stopped;
- recommended server-side control;
- retest criteria.

## Guided lab link

Complete `labs/local-access-control/` before a VCC authorisation scenario. Use the application-mapping workbook, testing journal, evidence register and vulnerability-finding template.

## Review questions

1. Why must the server enforce authorisation even if a button is hidden?
2. What is the difference between object-level and function-level authorisation?
3. Why should only one variable be changed at a time?
4. What proves an unauthorised write?
5. Which conditions require immediate escalation?

## Authoritative basis

- OWASP WSTG v4.2 authorisation testing.
- OWASP API Security Top 10 2023: broken object-level, property-level and function-level authorisation.
- NIST SP 800-115 assessment planning and evidence practices.
