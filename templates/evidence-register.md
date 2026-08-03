# NeoLabs Pentest Evidence Register

Use one row per evidence item. Evidence must be synthetic, sanitised and connected to an authorised test.

| Evidence ID | UTC timestamp | Hypothesis/finding | Target and role | Evidence type | Sanitised description | File/hash reference | Collected by | Handling notes |
|---|---|---|---|---|---|---|---|---|
| E-001 | | | | HTTP request/response | | | | |

## Evidence handling rules

- Record UTC time and the approved synthetic role.
- Redact passwords, session cookies, bearer tokens, private keys and personal information.
- Preserve the smallest response section that proves the observation.
- Do not edit an original export; create a sanitised working copy and record its identifier.
- Store screenshots and exports only in the approved evidence location.
- Do not include another learner's pod data.
- Record limitations, missing context and uncertainty.

## Suggested evidence types

- browser screenshot;
- Burp request and response export;
- API response body;
- application state before and after an approved action;
- tool output from the fixed NeoLabs profile;
- retest evidence;
- supervisor escalation acknowledgement.

## Evidence quality check

- [ ] The evidence supports a specific observation.
- [ ] Target, role and time are identifiable.
- [ ] Secrets and personal data are redacted.
- [ ] The evidence remains within the authorised proof threshold.
- [ ] The evidence can be understood without relying on memory.
