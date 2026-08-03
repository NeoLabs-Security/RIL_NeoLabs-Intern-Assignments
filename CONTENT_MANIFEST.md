# Content Manifest

| Material | Planned contents | Status |
|---|---|---|
| Professional Foundations Manual | authorisation, scope, ethics, proof thresholds, evidence and escalation | Module 1 complete; editorial review pending |
| HTTP and Web Foundations | requests, responses, cookies, sessions, browser storage, JSON and APIs | Module 2 complete; practical QA pending |
| Burp Community Guide | proxy, scope, history, Repeater, Decoder, Comparer and evidence workflow | Initial guide complete; screenshot-led tutorials pending |
| Application Mapping Handbook | roles, routes, endpoints, objects, inputs and trust boundaries | Mapping workbook complete; narrative handbook pending |
| Identity and Session Testing | account workflows, authentication, recovery and session lifecycle | Planned |
| Authorisation Testing | horizontal, vertical, object and function-level controls | First local access-control lab implemented; full module pending |
| Input and Logic Testing | validation, errors, file handling, server-side requests and business logic | Planned |
| API Security Testing | object, property and function authorisation, rate limits and validation | Foundations introduced; dedicated module pending |
| Query and Command Reference | safe curl, jq, browser, proxy and restricted discovery commands | Restricted Nmap profile complete; broader reference pending |
| Practice Labs | local synthetic applications and VCC supervised scenarios | Local access-control lab complete and CI-validated |
| Evidence and Reporting Templates | journal, evidence register, finding, pentest and retest reports | Journal, evidence register and finding template complete |
| Tool Preconfiguration | exact target allowlist, Burp scope guidance and restricted Nmap wrapper | Initial controls complete; signed VCC manifest client pending |
| VCC Pod Integration | operator assignment, signed target manifest, credential binding and revocation | Architecture design complete; VCC implementation pending review |
| Troubleshooting | browser proxy, certificates, DNS, containers and evidence handling | Planned |

## Current validation

- Python, Bash and Node syntax validation.
- Exact-target guard accepts an authorised local target and rejects wildcards and raw public IP targets.
- Local practice target must bind to `127.0.0.1`, pass Docker Compose validation and build successfully.
- CI rejects unsafe container privileges and committed key, certificate, Burp project or live target material.

## Publication rule

A student-facing material is approved only after technical review, safety review, source verification, lab validation, NeoLabs branding and Markdown/PDF quality assurance.
