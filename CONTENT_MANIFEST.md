# Content Manifest

| Material | Contents | Current status |
|---|---|---|
| Professional Foundations Manual | authorisation, scope, ethics, proof thresholds, evidence and escalation | Current |
| HTTP and Web Foundations | requests, responses, cookies, sessions, browser storage, JSON and APIs | Current |
| Burp Community Guide | proxy, exact scope, HTTP history, Repeater, Decoder, Comparer and evidence workflow | Current; screenshots may evolve with Burp UI |
| Application Mapping Handbook | roles, routes, endpoints, objects, inputs and trust boundaries | Current |
| Identity and Session Testing | account workflows, authentication, recovery and session lifecycle | Current |
| Authorisation Testing | horizontal, vertical, object, property and function-level controls | Current with local practice lab |
| Input and Logic Testing | validation, errors, file handling, server-side requests and business logic | Current |
| API Security Testing | object, property and function authorisation, resource controls and validation | Current |
| Risk and Reporting | evidence-led analysis, severity, priority, remediation and confidence | Current |
| Query and Command Reference | safe curl/jq/browser/proxy/Git and restricted discovery commands | Current |
| Practice Labs | local synthetic practice + assignment-controlled VCC scenarios | Current catalogue; later scenarios require their release/manifest |
| Evidence/Reporting Templates | scope, journal, evidence, finding, pentest and retest records | Current |
| Tool Preconfiguration | exact target allowlist, Burp scope guidance and restricted Nmap wrapper | Current |
| VCC Pod Integration | server assignment, private Access Code, current target manifest, localhost tunnel and stale-scope fail-closed behaviour | Active programme path |
| Troubleshooting | Git, browser proxy, certificates, target validation, Docker and evidence handling | Current |
| Capstone | end-to-end assessment, handoff and fixed-release retest | Staged until Week 12 release |

## Current operational path

The production training topology is five isolated pods. On Windows, students run `setup-windows.cmd` once and then use the toolkit-local `.\neolabs.cmd` commands. The server controls pod/track/resources; students do not need a global `pip install` or a manually entered gateway URL.

For Week 1 Operation Night Watch, `connect` exposes the authorised learner surface through the pod-isolated local tunnel, normally `http://127.0.0.1:18080`. Live target/network activity is permitted only while the current manifest exposes it. Old/cached target information is not continuing authorisation.

See [`PROGRAMME_CURRENT_STATE.md`](PROGRAMME_CURRENT_STATE.md).

## Current validation

- Python/Bash/Node/source validation.
- Exact-target guard accepts authorised scope and rejects unsafe/wildcard targets.
- Local practice target binds to loopback and passes Compose/build checks.
- CI rejects unsafe container capabilities and committed key/certificate/private target material.
- Student material contains no live Access Codes, mentor ground truth or cohort evidence.
- Student runtime scope remains server-authoritative.

## Publication/release rule

Student content may be staged before a scenario release. Presence of a file does not authorise VCC testing. Live practical work requires the current written assignment, current server-issued scope and the approved window.
