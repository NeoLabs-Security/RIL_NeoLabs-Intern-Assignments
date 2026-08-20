# Module 10 - Assessment Capstone, Remediation Verification and Retesting

## Purpose

The capstone combines scope confirmation, application mapping, controlled testing, evidence handling, reporting and remediation verification. It is designed for the VCC Security Lab and must remain within the assigned hostname, pod, accounts and time window.

## Capstone stages

### 1. Scope acceptance

Confirm:

- assignment and intern ID;
- exact authorised target;
- synthetic accounts and roles;
- permitted testing categories;
- request-rate ceiling;
- prohibited actions;
- proof thresholds;
- start and end times;
- mentor escalation route;
- evidence and submission locations.

No practical work begins until the scope record is complete.

### 2. Normal-use mapping

Document:

- pages and API endpoints;
- roles and permissions;
- objects and ownership;
- session lifecycle;
- state-changing workflows;
- trust boundaries;
- visible security controls;
- expected telemetry.

### 3. Hypothesis register

Each hypothesis should contain:

- expected control;
- reason for suspicion;
- minimum test;
- anticipated safe result;
- stop condition;
- cleanup requirement.

### 4. Controlled testing

Use manual browser inspection, Burp Repeater and approved restricted scripts. Change one condition at a time. Stay below the request ceiling. Record every action in the testing journal.

### 5. Finding development

For each confirmed weakness:

- link evidence IDs;
- identify affected role and object;
- state prerequisites;
- explain impact without exceeding proof;
- provide root-cause remediation;
- define retest criteria.

Unconfirmed observations remain in the testing notes.

### 6. Cross-track handoff

The SOC track may investigate the generated telemetry. IT Security Support may implement an approved configuration or service change. Pentesters provide only the minimum technical detail required for remediation and do not share secrets or mentor ground truth.

### 7. Fixed-release retest

A retest is not a repetition of the entire pentest. It verifies the specific control and checks for closely related regression.

Retest procedure:

1. confirm the fixed release and approved window;
2. verify the normal allowed workflow still functions;
3. repeat the original minimum proof test;
4. confirm server-side state, not only the interface;
5. test one or two directly related variations approved by the mentor;
6. record fixed, partially fixed, not fixed or unable to verify;
7. describe residual risk and limitations.

### 8. Closure

Submit:

- signed scope confirmation;
- application map;
- testing journal;
- evidence register;
- pentest report;
- individual finding records;
- retest report;
- cleanup confirmation;
- reflection on limitations and cross-track collaboration.

## Assessment rubric

| Area | Weight | Evidence |
|---|---:|---|
| Scope and safety | 20% | target discipline, stop conditions, no prohibited activity |
| Methodology | 15% | mapping, hypotheses and controlled tests |
| Evidence | 20% | clear, redacted, reproducible records |
| Analysis | 15% | defensible conclusions and limitations |
| Reporting | 15% | professional findings and remediation |
| Retesting | 10% | accurate fixed-release verification |
| Collaboration | 5% | useful SOC and Support handoff |

A serious scope violation overrides the numerical score.

## Completion standard

The intern can independently interpret written Rules of Engagement, map an application, choose a low-impact test, stop at proof, preserve evidence, communicate a finding and verify remediation without crossing the lab boundary.
