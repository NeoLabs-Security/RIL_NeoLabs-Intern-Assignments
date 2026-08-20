# AGENTS.md — NeoLabs Grey-Box Penetration Testing Toolkit

## Mission

Build beginner-to-intermediate learning materials and safe technical resources for authorised VCC Security Lab web application and API assessments.

## Non-negotiable boundaries

- Never add real targets, public IP addresses, credentials, tokens, cookies, private keys or raw cohort evidence.
- Never add persistence, evasion, destructive, exfiltration or denial-of-service tooling.
- Do not add unrestricted scanners, brute-force automation, credential attacks or broad payload collections.
- Every practical command must require an exact authorised target and must reject ranges, wildcards and extra hosts.
- Practice applications must bind to localhost or an isolated internal container network by default.
- Keep mentor ground truth, assignment scope and answer keys outside this public repository.

## Content standard

- Preserve correct terminology and explain it before asking beginners to use it.
- Base methodology on primary sources such as NIST, OWASP, FIRST and official tool documentation.
- Distinguish observation, evidence, interpretation, impact and confidence.
- Teach the least-invasive proof threshold and mandatory stop conditions.
- Include limitations, false-positive considerations and remediation verification.

## Code standard

- Prefer small, readable Python, Bash and PowerShell tools.
- Default to read-only or low-rate behaviour.
- Fail closed on missing scope, ambiguous targets or unsafe configuration.
- Add tests for target validation and repository safety.
- Never print secrets or include them in command history examples.

## Pull requests

Summarise educational changes, technical changes, safety controls, tests performed, sources reviewed and remaining limitations.
