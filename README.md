# NeoLabs Grey-Box Penetration Testing Intern Toolkit

The **NeoLabs × RIL Grey-Box Pentest Toolkit** is the student-side **Learn + Connect + Operate** repository for authorised web, API, cloud and bounded network discovery work in the VCC Security Lab.

It contains NeoLabs-branded learning material, safe tool configuration, synthetic practice applications, evidence/reporting templates and the NeoLabs pod-access client. Official weekly assignments and graded submissions belong in the separate central assignments repository.

## Current week

**Week 02 — The Ghost Login**

- Learning source: `docs/week-02/ghost-login-learning-pack.md`
- Branded PDF: `publications/NeoLabs_GreyBox_Pentest_Week_02_Ghost_Login.pdf`
- Practical task: issued through `RIL_NeoLabs-Intern-Assignments`

## Student flow

1. Read `START_HERE.md`, `RULES_OF_ENGAGEMENT.md` and `LEARNING_PATH.md`, then install the repo CLI once with `python3 -m pip install --user -e .`.
2. Receive your pod number, stable NeoLabs lab URL and private NeoLabs Access Code.
3. Authenticate and refresh current server-authorised scope:

```bash
neolabs login
neolabs connect
neolabs status
neolabs scope
neolabs targets
```

4. Only when an interactive surface is active, use the returned hostname/IP/CIDR. For Nmap:

```bash
bash scripts/safe-nmap.sh <returned-hostname-ip-or-cidr>
```

5. During `REPLAY`/`OFFLINE`, the CLI deliberately clears target IPs/CIDRs from `runtime/access-manifest.json`, so the Nmap guard rejects stale scope. Use `neolabs evidence` for any approved offline material.
6. Complete the week's GitHub Issue and submit evidence/reporting to `RIL_NeoLabs-Intern-Assignments`.

## Runtime states

- **LIVE** — VCC web/API/network target is available. Normal Pentest interaction is allowed within the returned scope.
- **CLOUD_LIVE** — the approved S3/cloud scenario is live even though the main VCC EC2 may be off. There may be no Nmap CIDR because the task is cloud-native.
- **ENDPOINT_LIVE** — an approved disposable endpoint is live for a bounded endpoint task.
- **REPLAY** — no interactive Pentest target is active. Reporting/research/evidence review can continue, but stale VCC addresses are not scan-authorised.
- **OFFLINE** — no current practical surface is published.

## Why target IPs are not committed here

Pentest interns sometimes need real lab IPs/CIDRs to learn host/service discovery correctly. Those values are returned **at runtime** and written only to ignored `runtime/access-manifest.json` while an appropriate live surface exists.

A rebuilt pod can receive a different IP without a repo edit or new manual target file. `neolabs connect` refreshes it.

The safe Nmap validator accepts an exact current server-returned hostname/IP, an IP inside a current server-returned CIDR, or an exact current CIDR. It rejects everything else. When state changes to `REPLAY` or `OFFLINE`, the CLI writes an empty network scope so the old IP is no longer accepted.

## Toolkit contents

- Rules of Engagement, stop conditions and proof thresholds;
- HTTP/browser/proxy/API foundations;
- Burp Suite Community workflow;
- application mapping and grey-box methodology;
- authentication/session/authorisation testing;
- input validation, business logic and API security;
- restricted low-rate Nmap discovery bound to the live pod manifest;
- support for cloud-native live scenarios where Nmap may not be appropriate;
- approved pod/scenario evidence download through `neolabs evidence`;
- evidence, finding, pentest and retest templates;
- localhost-only synthetic practice applications;
- NeoLabs-branded publication pipeline.

## Architecture boundary

**Toolkit repo:** Learn + Connect + Operate  
**Replay Gateway:** Stable Authentication + Runtime State + Approved Evidence  
**VCC EC2:** On-demand Web/API/Network Target  
**Lab S3/Cloud:** Storage-native Weeks 7–9 surface + replay evidence  
**Central Assignment repo:** Task + Evidence + Submission + Assessment

## Safety boundary

- Test only resources returned by the current manifest **and** permitted by the written assignment.
- Never scan public networks, neighbouring pods or infrastructure outside returned scope.
- Never reuse an address from an old screenshot, report or prior live window when the manifest has moved to `REPLAY`/`OFFLINE`.
- Stop at the approved proof threshold; do not establish persistence, destroy data or disrupt service.
- Use synthetic accounts/data only.
- Never commit Access Codes, runtime manifests, private keys, Burp projects containing live traffic or unredacted evidence.
- Students never receive AWS credentials or broad S3 listing permissions.

## Release status

The toolkit on `main` contains the installable access client, runtime-state-aware scope controls, manifest-bound Nmap helper, approved evidence download and the current branded Week 2 learning pack. Interactive work still depends on the operator publishing an appropriate `LIVE`, `CLOUD_LIVE` or `ENDPOINT_LIVE` surface.
