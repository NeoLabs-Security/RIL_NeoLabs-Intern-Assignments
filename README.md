# NeoLabs Grey-Box Penetration Testing Intern Toolkit

The **NeoLabs × RIL Grey-Box Pentest Toolkit** is the student-side **Learn + Connect + Operate** repository for authorised web, API and bounded network discovery work in the VCC Security Lab.

It contains NeoLabs-branded learning material, safe tool configuration, synthetic practice applications, evidence/reporting templates and the NeoLabs pod-access client. Official weekly assignments and graded submissions belong in the separate central assignments repository.

## Current week

**Week 02 — The Ghost Login**

- Learning source: `docs/week-02/ghost-login-learning-pack.md`
- Branded PDF: `publications/NeoLabs_GreyBox_Pentest_Week_02_Ghost_Login.pdf`
- Practical task: issued through `RIL_NeoLabs-Intern-Assignments`

## Student flow

1. Read `START_HERE.md`, `RULES_OF_ENGAGEMENT.md` and `LEARNING_PATH.md`, then install the repo CLI once with `python3 -m pip install --user -e .`.
2. Receive your pod number and private NeoLabs Access Code.
3. Authenticate and refresh the current server-authorised scope:

```bash
neolabs login
neolabs connect
neolabs scope
neolabs targets
```

4. Use the returned hostname/IP/CIDR only. For Nmap, use the fixed wrapper:

```bash
bash scripts/safe-nmap.sh <returned-hostname-ip-or-cidr>
```

5. Complete the week's GitHub Issue and submit evidence/reporting to `RIL_NeoLabs-Intern-Assignments`.

## Why target IPs are not committed here

Pentest interns need real lab IPs and sometimes a CIDR to learn host/service discovery correctly. Those values are therefore returned **at runtime** by the NeoLabs broker and written to ignored `runtime/access-manifest.json`.

A rebuilt pod can receive a different IP without requiring a repo edit or a new manual target file. `neolabs connect` refreshes it.

The safe Nmap validator accepts an exact server-returned hostname/IP, an IP inside a server-returned CIDR, or an exact CIDR returned by `neolabs scope`. It rejects everything else.

## Toolkit contents

- Rules of Engagement, stop conditions and proof thresholds;
- HTTP/browser/proxy/API foundations;
- Burp Suite Community workflow;
- application mapping and grey-box methodology;
- authentication/session/authorisation testing;
- input validation, business logic and API security;
- restricted low-rate Nmap discovery bound to the live pod manifest;
- evidence, finding, pentest and retest templates;
- localhost-only synthetic practice applications;
- NeoLabs-branded publication pipeline.

## Architecture boundary

**Toolkit repo:** Learn + Connect + Operate  
**VCC Security Lab:** Target + Scenario + Synthetic Data  
**Lab Access Broker:** Authenticate + Resolve Pod + Publish IP/CIDR Scope  
**Central Assignment repo:** Task + Evidence + Submission + Assessment

## Safety boundary

- Test only resources returned by the broker **and** permitted by the written assignment.
- Never scan public networks, neighbouring pods or infrastructure outside the returned scope.
- Stop at the approved proof threshold; do not establish persistence, destroy data or disrupt service.
- Use synthetic accounts/data only.
- Never commit Access Codes, runtime manifests, private keys, Burp projects containing live traffic or unredacted evidence.

## Release status

The toolkit on `main` contains the installable broker client, manifest-bound discovery helpers and the current branded Week 2 learning pack. Live VCC work still depends on the broker being deployed/enabled and the current pod/scenario resources being published by the operator pipeline.
