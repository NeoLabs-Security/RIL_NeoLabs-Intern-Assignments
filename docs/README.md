# NeoLabs Grey-Box Pentesting Documentation Index

Use this page as the learning-material map. For current connection/runtime behaviour read [`../PROGRAMME_CURRENT_STATE.md`](../PROGRAMME_CURRENT_STATE.md); for skills progression read [`../LEARNING_PATH.md`](../LEARNING_PATH.md); and read [`../RULES_OF_ENGAGEMENT.md`](../RULES_OF_ENGAGEMENT.md) before any practical work.

## Current Week 1

- `week-01/operation-night-watch-launch-pack.md` — current task/setup flow
- `week-01/pentesting-foundations.md` — Week 1 technical foundations

On Windows, the current programme flow is `setup-windows.cmd` once and then the toolkit-local `.\neolabs.cmd` commands. Old global-CLI/manual-gateway examples are superseded.

## Core modules

- `01-professional-foundations/` — authorisation, scope, proof thresholds and evidence
- `02-http-browser-foundations/` — HTTP, browser, cookies, sessions, JSON and APIs
- `03-burp-suite/` — safe Burp Suite workflow and exact target scope
- `04-application-mapping/` — routes, roles, objects, inputs and trust boundaries
- `05-identity-session-testing/` — authentication, recovery, MFA and session lifecycle
- `06-authorization-testing/` — object, function and role authorisation
- `07-input-logic-testing/` — validation, file handling and workflow logic
- `08-api-security/` — API mapping/authorisation/validation
- `09-risk-reporting/` — evidence, findings and risk communication
- `10-capstone-retest/` — capstone/retest material; use only when released

## Practical resources

- `../labs/` — synthetic practice and assignment-controlled labs
- `../scripts/validate_target.py` — exact-scope validation
- `../scripts/safe-nmap.sh` — bounded low-rate discovery helper
- `../templates/` and `../worksheets/` — evidence/testing/finding/report work products
- `../troubleshooting/` — proxy, certificate, Docker, scope and evidence troubleshooting

Live VCC targets and assignment details are server/assignment controlled. During Week 1 the isolated local learner surface is normally `http://127.0.0.1:18080` while `connect` is running. Never infer permission from technical reachability, an old screenshot, public EC2 IP or cached target.
