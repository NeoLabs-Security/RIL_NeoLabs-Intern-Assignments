# Burp Suite Community — NeoLabs Safe Setup

## Objective

Configure Burp as a manual HTTP investigation tool for one authorised target. Burp must not be treated as proof by itself; analysts verify observations and preserve the relevant request and response.

## Required configuration

1. Use the Burp browser or a dedicated browser profile used only for the assignment.
2. Add only the mentor-issued hostname to Target scope.
3. Configure out-of-scope request handling to drop all out-of-scope requests.
4. Filter Proxy history and the site map to in-scope items.
5. Keep interception off during ordinary browsing and enable it only for a planned request.
6. Use Repeater for controlled manual comparisons.
7. Do not install unapproved extensions.
8. Do not use automated scanning, broad Intruder attacks or uncontrolled payload lists.

## Community Edition storage

Community Edition supports temporary in-memory projects. Store the investigation journal and minimum required evidence in the approved case folder instead of committing Burp traffic or project data to GitHub.

## Evidence workflow

For each meaningful test, record:

- timestamp in UTC;
- assignment and test-case identifier;
- role/account used without recording the password;
- endpoint and request method;
- exact change made;
- relevant response status and body excerpt;
- interpretation and alternative explanation;
- screenshot or redacted request/response evidence reference;
- whether the proof threshold was reached.

## Safety checks

Before sending a modified request, confirm that:

- the hostname is exactly the assigned target;
- the action will not delete, overwrite or expose real data;
- request volume remains within the Rules of Engagement;
- the test does not follow redirects to an unassigned host;
- the expected evidence cannot be obtained with a less invasive action.

Stop immediately when the application becomes unstable, a third-party hostname appears, another pod becomes visible or the approved proof threshold is met.
