# NeoLabs Grey-Box Penetration Testing Intern Toolkit

The **NeoLabs × RIL Grey-Box Pentest Toolkit** is the student-side **Learn + Connect + Operate** repository for authorised VCC testing.

## 🚀 WEEK 1 — START HERE

**Scenario:** Operation Night Watch  
**Goal:** safely map the authorised VCC application and learn its normal HTTP/service behaviour. **Week 1 is not a vulnerability hunt.**

### 1. Read the current pack

- Source: [`docs/week-01/operation-night-watch-launch-pack.md`](docs/week-01/operation-night-watch-launch-pack.md)
- Branded PDF: [`publications/00_NeoLabs_GreyBox_Week_01_Launch_Pack.pdf`](publications/00_NeoLabs_GreyBox_Week_01_Launch_Pack.pdf)
- Rules: [`RULES_OF_ENGAGEMENT.md`](RULES_OF_ENGAGEMENT.md)

### 2. Install the NeoLabs client

```bash
python -m pip install -e .
```

### 3. Authenticate and retrieve current scope

Set the NeoLabs gateway URL supplied in your onboarding message, then run:

```bash
neolabs login
neolabs status
neolabs pod info
neolabs scope
neolabs targets
```

Use **only** the hostname/IP/CIDR returned for your assigned pod. If no live target is published, do not substitute an old or guessed address.

### 4. Use the approved discovery wrapper

Only after `neolabs targets` returns the authorised live target:

```bash
bash scripts/safe-nmap.sh <returned-hostname-ip-or-cidr>
```

Then follow the Week 1 pack for Burp/application mapping and deliverables. Submit official work to `RIL_NeoLabs-Intern-Assignments`.

## Week 1 study shelf

- `docs/01-professional-foundations/README.md`
- `docs/02-http-browser-foundations/README.md`
- `docs/03-burp-suite/README.md`
- `docs/04-application-mapping/README.md`
- `docs/tool-setup/burp-community.md`
- `worksheets/application-mapping-workbook.md`

## What is preconfigured here

- installable `neolabs` authenticator/access client;
- server-managed pod/track/target scope;
- safe Nmap wrapper + target validator;
- Burp Community setup guidance;
- local-only practice application;
- application mapping, testing journal and evidence templates;
- Rules of Engagement and stop conditions;
- branded learning/publication workflows.

## Repository map

```text
README.md                 ← you are here
docs/week-01/             ← current task instructions
publications/             ← branded student PDFs
tools/neolabs.py          ← pod access/authenticator client
scripts/safe-nmap.sh      ← guarded service discovery
docs/tool-setup/          ← approved tool setup
worksheets/ + templates/  ← Week 1 work products
labs/                     ← safe local practice
research/ + references/   ← deeper material
```

## Safety boundary

- Test only current resources returned by the NeoLabs manifest **and** permitted by the written assignment.
- Never scan public networks, neighbouring pods or infrastructure outside returned scope.
- Never reuse a stale address when the current manifest is replay/offline.
- No brute force, broad automated exploitation, persistence, destructive testing or denial-of-service.
- Never commit Access Codes, runtime manifests, private keys, live Burp projects or unredacted evidence.
- Stop immediately if another pod, real data/credentials or unexpected infrastructure becomes visible.

**Toolkit:** Learn + Connect + Operate  
**VCC:** scheduled authorised live target  
**Central Assignments:** submissions + assessment
