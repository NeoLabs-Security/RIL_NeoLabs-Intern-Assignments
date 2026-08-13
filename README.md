# NeoLabs Grey-Box Penetration Testing Intern Toolkit

The **NeoLabs × RIL Grey-Box Pentest Toolkit** is the student-side **Learn + Connect + Operate** repository for authorised VCC testing.

## 🚀 WEEK 1 — START HERE

**Scenario:** Operation Night Watch  
**Goal:** safely map the authorised VCC application and learn its normal HTTP/service behaviour. **Week 1 is not a vulnerability hunt.**

### 1. Read the current pack

1. [`publications/00_NeoLabs_GreyBox_Week_01_Launch_Pack.pdf`](publications/00_NeoLabs_GreyBox_Week_01_Launch_Pack.pdf) — exact Week 1 task and deliverables.
2. [`publications/01_NeoLabs_GreyBox_Week_01_Pentesting_Foundations.pdf`](publications/01_NeoLabs_GreyBox_Week_01_Pentesting_Foundations.pdf) — scope, HTTP, Burp, safe discovery and evidence foundations.
3. [`RULES_OF_ENGAGEMENT.md`](RULES_OF_ENGAGEMENT.md) — mandatory safety boundary.

### 2. Windows setup — no pip/PATH work required

From the cloned toolkit folder, double-click:

```text
setup-windows.cmd
```

It checks that Python and the Windows OpenSSH Client are available. You do **not** need to run `pip install -e .`, edit PATH, or manually enter the NeoLabs gateway URL.

Then open PowerShell in this toolkit folder and use the local launcher:

```powershell
.\neolabs.cmd --help
```

The launcher automatically uses the official NeoLabs gateway and runs the toolkit client with the Python installation Windows can actually find.

### 3. Authenticate and open your isolated live tunnel

Run:

```powershell
.\neolabs.cmd login
.\neolabs.cmd status
.\neolabs.cmd pod info
.\neolabs.cmd scope
.\neolabs.cmd targets
.\neolabs.cmd connect
```

`login` asks only for your assigned pod number and your private NeoLabs Access Code. For Week 1, `connect` opens a **pod-isolated SSH local forward**. When SSH asks for a password, enter the same private **NeoLabs Access Code** you used for login and keep that terminal open.

Your authorised learner application is then exposed only on:

```text
http://127.0.0.1:18080
```

Do not scan the EC2 public IP, another local port, another student's tunnel or any remembered target from an earlier session.

### 4. Use the approved discovery wrapper

With the NeoLabs tunnel still running in another terminal:

```bash
bash scripts/safe-nmap.sh 127.0.0.1
```

The wrapper is tunnel-aware and scans only the server-issued local-forward port. Then follow the Week 1 pack for Burp/application mapping and deliverables. Submit official work to `RIL_NeoLabs-Intern-Assignments`.

## Week 1 study shelf

- `docs/01-professional-foundations/README.md`
- `docs/02-http-browser-foundations/README.md`
- `docs/03-burp-suite/README.md`
- `docs/04-application-mapping/README.md`
- `docs/tool-setup/burp-community.md`
- `worksheets/application-mapping-workbook.md`

## What is preconfigured here

- local Windows `neolabs.cmd` launcher with the official gateway preconfigured;
- Windows readiness check with no pip/PATH dependency;
- server-managed pod/track/target scope;
- restricted SSH local-forward workflow using the private Access Code;
- tunnel-aware safe Nmap wrapper + target validator;
- Burp Community setup guidance;
- local-only practice application;
- application mapping, testing journal and evidence templates;
- Rules of Engagement and stop conditions;
- branded Week 1 launch/foundations PDFs.

## Repository map

```text
README.md                 ← you are here
setup-windows.cmd         ← one-click Windows readiness check
neolabs.cmd               ← Windows launcher; avoids pip/PATH problems
docs/week-01/             ← current task/foundations sources
publications/             ← branded student PDFs
tools/neolabs.py          ← pod access/authenticator client
scripts/safe-nmap.sh      ← guarded tunnel-aware discovery
docs/tool-setup/          ← approved tool setup
worksheets/ + templates/  ← Week 1 work products
labs/                     ← safe local practice
research/ + references/   ← deeper material
```

## Safety boundary

- Test only current resources returned by the NeoLabs manifest **and** permitted by the written assignment.
- Never scan public networks, neighbouring pods or infrastructure outside returned scope.
- Never reuse a stale address when the current manifest is replay/offline.
- No brute force, authorization-bypass attempts, broad automated exploitation, persistence, destructive testing or denial-of-service in Week 1.
- Never commit Access Codes, runtime manifests, private keys, live Burp projects or unredacted evidence.
- Stop immediately if another pod, real data/credentials or unexpected infrastructure becomes visible.

**Toolkit:** Learn + Connect + Operate  
**VCC:** scheduled pod-isolated live target  
**Central Assignments:** submissions + assessment
