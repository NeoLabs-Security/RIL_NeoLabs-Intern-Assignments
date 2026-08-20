# Module 9 - Risk Analysis and Professional Reporting

## Purpose

A penetration test is useful only when its evidence can be understood, prioritised and acted upon. This module teaches interns to move from an observation to a defensible finding without exaggeration.

## Learning outcomes

An intern should be able to:

- separate observation, evidence, interpretation, impact and recommendation;
- explain prerequisites and affected roles;
- distinguish technical severity from business priority;
- use CVSS concepts carefully without treating a score as the whole decision;
- write executive and technical sections for different audiences;
- document limitations, uncertainty and retest criteria.

## From observation to finding

Use this chain:

1. **Observation** - what the tool or application showed.
2. **Evidence** - the reproducible request, response and state.
3. **Expected control** - the policy or behaviour that should apply.
4. **Interpretation** - why the evidence indicates a control failure.
5. **Impact** - what an authorised synthetic actor could achieve.
6. **Likelihood conditions** - access, role, knowledge and timing required.
7. **Recommendation** - the control change that addresses the root cause.
8. **Retest criteria** - observable conditions that will prove remediation.

## Finding structure

A complete finding contains:

- title naming the control weakness;
- severity and confidence;
- affected component and scope;
- concise summary;
- prerequisites;
- reproduction steps limited to the authorised lab;
- redacted evidence;
- technical and business impact;
- affected and unaffected roles;
- recommended remediation;
- retest steps;
- limitations and cleanup status.

## Severity and priority

Severity describes potential harm under stated conditions. Priority also considers business context, exposure, exploitability, affected users, available compensating controls and remediation effort.

Avoid:

- rating every successful test as critical;
- assuming internet exposure when the lab is isolated;
- treating a verbose error as account compromise;
- claiming data loss when only synthetic read access was proven;
- using a CVSS score without explaining its assumptions.

## Confidence

Use a simple confidence scale:

- **High** - repeated evidence directly proves the control failure.
- **Medium** - evidence is strong but visibility or state confirmation is incomplete.
- **Low** - behaviour is suspicious but alternative explanations remain.

Low-confidence observations belong in notes or require more authorised validation; they should not be presented as certain findings.

## Executive summary

The executive summary should answer:

- What was tested?
- What was not tested?
- What are the most important risks?
- What should be fixed first?
- What residual limitations remain?

Avoid tool output, raw requests and jargon-heavy reproduction details in the executive section.

## Remediation quality

A recommendation should address the root cause. Examples include consistent server-side authorisation, secure session invalidation, schema allowlisting, workflow state validation, safe error handling and centralised access-control middleware. Do not recommend simply hiding buttons, changing status codes or blocking one test string.

## Evidence handling

- redact cookies, tokens, passwords and private endpoints;
- use synthetic identifiers;
- keep raw evidence in the approved restricted workspace;
- reference evidence IDs from the report;
- record timestamps and request IDs;
- state whether cleanup or rollback was completed.

## Peer review checklist

Before submission, confirm:

- another analyst can reproduce the finding from the authorised steps;
- the title describes the weakness;
- the affected role and object are clear;
- impact does not exceed the evidence;
- secrets are removed;
- the recommendation addresses the root cause;
- retest conditions are measurable;
- limitations are stated.

## Review questions

1. Why is an observation not yet a finding?
2. How does priority differ from severity?
3. What makes a remediation recommendation actionable?
4. Why must impact remain tied to proof?
5. What should a retest criterion look like?

## Authoritative basis

- NIST SP 800-115 for assessment analysis and mitigation reporting.
- OWASP WSTG v4.2 reporting principles.
- FIRST CVSS documentation for structured severity concepts.
