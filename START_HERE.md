# Start Here — Grey-Box Penetration Testing

## Purpose

This toolkit teaches interns to plan, conduct, document and communicate authorised web application and API security assessments. It is not a general-purpose attack toolkit.

## Before any practical work

1. Read `RULES_OF_ENGAGEMENT.md`.
2. Confirm the written assignment identifies your exact target, testing window, accounts, permitted techniques and stop conditions.
3. Configure Burp Suite to include only the assigned target and drop out-of-scope requests.
4. Store evidence in the approved case folder; never commit live traffic or credentials.
5. Use the repository scripts only after setting the exact operator-issued target.

## Learning order

Follow `LEARNING_PATH.md`. Begin with scope, HTTP and evidence quality before vulnerability testing.

## Repository boundary

This public repository contains shared learning resources and safe tooling. It must not contain:

- live VCC pod addresses;
- student or mentor credentials;
- private keys or access tokens;
- real user information;
- mentor answer keys;
- active assignment details;
- Burp project files containing live traffic.

## Stop and escalate

Stop testing and notify the mentor when:

- the application becomes unstable;
- another pod or unassigned system appears reachable;
- real personal data is exposed;
- a technique would require persistence, destructive action or broad automation;
- the evidence already proves the approved finding;
- the Rules of Engagement are unclear.
