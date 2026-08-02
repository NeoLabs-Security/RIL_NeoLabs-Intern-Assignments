# Rules of Engagement — Student Baseline

This document is a mandatory baseline. A live assignment may narrow these permissions but may not silently expand them.

## Required written details

Every practical assessment must identify:

- assigned intern or team;
- exact hostname or application identifier;
- authorised accounts and roles;
- start and end time;
- permitted testing categories;
- prohibited actions;
- request-rate limit;
- proof threshold;
- evidence location;
- mentor contact and emergency stop procedure.

## Default permitted actions

Only when listed in the assignment:

- manual browser and HTTP inspection;
- application and endpoint mapping;
- controlled request modification in Burp Repeater;
- low-rate checks using synthetic accounts and data;
- comparison of authorised roles;
- collection of the minimum evidence necessary to prove a finding;
- remediation retesting after mentor approval.

## Prohibited actions

- testing an unassigned host, IP address, pod, account or third-party service;
- denial-of-service, stress testing or uncontrolled concurrency;
- persistence, backdoors, remote shells or privilege retention;
- destructive file, database or account changes;
- extraction of real personal, payment or secret data;
- phishing or contacting real users;
- password spraying, credential stuffing or broad brute force unless a tightly controlled synthetic lab explicitly authorises it;
- scanning public address ranges;
- bypassing VCC pod assignment controls;
- concealing activity from mentors or the SOC track.

## Proof threshold

Demonstrate the weakness using the least invasive evidence possible. Do not continue merely to show that more damage could be done.

## Immediate stop conditions

Stop and preserve current evidence when:

- a real person’s information appears;
- another pod or infrastructure service becomes visible;
- service health degrades;
- scope is ambiguous;
- a test produces unexpected write access;
- the approved proof threshold has been reached.

## Accountability

Every test action must be attributable through the testing journal. Unrecorded or out-of-scope activity is a programme violation even when no damage occurs.
