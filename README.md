# NeoLabs Grey-Box Penetration Testing Intern Toolkit

The **NeoLabs × RIL Grey-Box Pentest Toolkit** is the student-side **Learn + Connect + Operate** repository for authorised VCC training.

> **Current assignment:** Week 01 — Operation Night Watch.  
> **Current architecture/status:** [`PROGRAMME_CURRENT_STATE.md`](PROGRAMME_CURRENT_STATE.md)

## Week 1 objective

Safely map the authorised VCC learner application and establish its normal HTTP/service behaviour. Week 1 is a baseline/documentation exercise, not a vulnerability hunt.

Read first:

1. `publications/00_NeoLabs_GreyBox_Week_01_Launch_Pack.pdf`
2. `publications/01_NeoLabs_GreyBox_Week_01_Pentesting_Foundations.pdf`
3. [`RULES_OF_ENGAGEMENT.md`](RULES_OF_ENGAGEMENT.md)

## Windows — current startup

From the latest toolkit checkout, double-click `setup-windows.cmd` once. Then open PowerShell in this toolkit folder and use:

```powershell
.\neolabs.cmd login
.\neolabs.cmd status
.\neolabs.cmd pod info
.\neolabs.cmd scope
.\neolabs.cmd targets
.\neolabs.cmd connect
```

Windows interns do **not** need a global `pip install`, a Python Scripts PATH edit or a manually entered gateway URL. Do not use bare `neolabs` on Windows.

`login` asks for your assigned pod number and private NeoLabs Access Code. The server—not the workstation—controls your pod, track and currently authorised resources.

## Week 1 learner target

During the approved interactive window, `connect` opens the pod-isolated local learner surface, normally:

```text
http://127.0.0.1:18080
```

Keep the connection terminal open. Confirm `scope` and `targets` immediately before testing. Never substitute the public EC2 address, an old IP/hostname, a guessed CIDR or another pod.

If `targets` does not expose a current live resource, stop live-target work and wait for the approved window.

## Operation Night Watch workflow

1. Confirm current scope/target.
2. Configure Burp so only that target is in scope.
3. Use the repository-approved low-impact discovery wrapper only where the current assignment exposes network scope.
4. Browse the normal learner workflow through Burp Proxy.
5. Capture at least five normal requests from different functions.
6. Replay two normal non-state-changing requests in Repeater and explain them.
7. Record visible controls without bypassing them.
8. Build the service/request/application map and evidence register for later comparison.

Official graded submissions belong in `NeoLabs-Security/RIL_NeoLabs-Intern-Assignments`, not this toolkit.

## Safety boundary

No broad scanning, brute force/credential spraying, automated exploitation, destructive/state-changing testing, denial-of-service, cross-pod testing or targets outside the current manifest/assignment. Stop if another pod/host becomes reachable, real data/credentials appear, the proof threshold is reached, unexpected state changes occur or service availability is affected.

## Repository map

```text
README.md                 ← current start page
PROGRAMME_CURRENT_STATE.md← current runtime/access reference
START_HERE.md             ← detailed onboarding
RULES_OF_ENGAGEMENT.md    ← mandatory scope/safety rules
setup-windows.cmd         ← Windows readiness check
neolabs.cmd               ← Windows toolkit-local launcher
docs/week-01/             ← current Week 1 sources
publications/             ← student PDFs
tools/neolabs.py          ← underlying access client
scripts/                  ← approved guarded helpers
worksheets/ + templates/  ← work products/evidence
labs/                     ← safe synthetic practice
```

**Toolkit:** Learn + Connect + Operate  
**VCC:** scheduled five-pod isolated training target  
**Central Assignments:** submissions + assessment
