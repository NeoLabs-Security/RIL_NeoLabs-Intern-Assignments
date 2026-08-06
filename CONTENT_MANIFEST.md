# Content Manifest

| Material | Contents | Version 1 status |
|---|---|---|
| Professional Foundations Manual | authorisation, scope, ethics, proof thresholds, evidence and escalation | Complete |
| HTTP and Web Foundations | requests, responses, cookies, sessions, browser storage, JSON and APIs | Complete |
| Burp Community Guide | proxy, exact scope, HTTP history, Repeater, Decoder, Comparer and evidence workflow | Complete for student use; screenshots may be refreshed as the interface changes |
| Application Mapping Handbook | roles, routes, endpoints, objects, inputs and trust boundaries | Complete |
| Identity and Session Testing | account workflows, authentication, recovery and session lifecycle | Complete |
| Authorisation Testing | horizontal, vertical, object, property and function-level controls | Complete with local practice lab |
| Input and Logic Testing | validation, errors, file handling, server-side requests and business logic | Complete |
| API Security Testing | object, property and function authorisation, resource controls and validation | Complete |
| Risk and Reporting | evidence-led analysis, severity, priority, remediation and confidence | Complete |
| Query and Command Reference | safe curl, jq, browser, proxy, Git and restricted discovery commands | Complete |
| Practice Labs | progressive local and VCC-supervised exercises | Eight-lab catalogue complete; VCC details remain assignment-controlled |
| Evidence and Reporting Templates | scope, journal, evidence, finding, pentest and retest records | Complete |
| Tool Preconfiguration | exact target allowlist, Burp scope guidance and restricted Nmap wrapper | Complete for Version 1 |
| VCC Pod Integration | operator assignment, signed target manifest, credential binding and revocation | Architecture documented; live issuance remains an operator function |
| Troubleshooting | Git, browser proxy, certificates, target validation, Docker and evidence handling | Complete |
| Capstone | end-to-end assessment, handoff and fixed-release retest | Complete |

## Current validation

- Python, Bash and Node syntax validation.
- Exact-target guard accepts an authorised local target and rejects wildcards and raw public IP targets.
- Local practice target binds to `127.0.0.1`, passes Docker Compose validation and builds successfully.
- CI rejects unsafe container privileges and committed key, certificate, Burp project or live target material.
- Student material contains no live VCC targets, credentials, mentor ground truth or cohort evidence.

## Publication rule

Version 1 is student-ready after the release PR passes CI and is merged. Live VCC assessment access remains controlled through written assignments, issued synthetic accounts, exact target manifests and operator-approved testing windows.
