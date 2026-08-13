# NeoLabs Grey-Box Penetration Testing Intern Toolkit

The **NeoLabs × RIL Grey-Box Pentest Toolkit** is the student-side repository for authorised VCC training.

## 🚀 WEEK 1 — START HERE

**Scenario:** Operation Night Watch  
**Goal:** safely map the authorised VCC application and learn its normal service behaviour. Week 1 is a baseline and documentation exercise.

### 1. Read the current pack

1. [`publications/00_NeoLabs_GreyBox_Week_01_Launch_Pack.pdf`](publications/00_NeoLabs_GreyBox_Week_01_Launch_Pack.pdf)
2. [`publications/01_NeoLabs_GreyBox_Week_01_Pentesting_Foundations.pdf`](publications/01_NeoLabs_GreyBox_Week_01_Pentesting_Foundations.pdf)
3. [`RULES_OF_ENGAGEMENT.md`](RULES_OF_ENGAGEMENT.md)

### 2. Windows setup — IMPORTANT

> **Windows interns: use ` .\neolabs.cmd ` — not `neolabs`.**  
> Run every NeoLabs command from inside this toolkit folder. Do not use bare `neolabs` and do not manually add the Python Scripts folder to PATH.

First, double-click:

```text
setup-windows.cmd
```

Then open PowerShell in this toolkit folder and confirm the launcher works:

```powershell
.\neolabs.cmd --help
```

The launcher automatically uses the official NeoLabs gateway. You do not need to type the gateway URL, run `pip install -e .`, or configure PATH.

### 3. Week 1 connection commands

Use these exact Windows commands:

```powershell
.\neolabs.cmd login
.\neolabs.cmd status
.\neolabs.cmd pod info
.\neolabs.cmd scope
.\neolabs.cmd targets
.\neolabs.cmd connect
```

`login` asks for your assigned pod number and private NeoLabs Access Code. Keep the connection terminal open while you use the authorised Week 1 learner application.

Your authorised local learner application is made available at:

```text
http://127.0.0.1:18080
```

Work only with the pod and resources issued to you by the NeoLabs gateway and the Week 1 assignment.

### 4. Complete Operation Night Watch

Follow the Week 1 launch pack for the required application map, request/service observations, testing journal and evidence register. Submit official work to `RIL_NeoLabs-Intern-Assignments`.

## Windows command reminder

```text
CORRECT:   .\neolabs.cmd login
CORRECT:   .\neolabs.cmd status
CORRECT:   .\neolabs.cmd connect

DO NOT USE: neolabs login
DO NOT USE: neolabs status
DO NOT USE: python tools\neolabs.py login --base-url ...
```

## Repository map

```text
README.md                 ← start here
setup-windows.cmd         ← Windows readiness check
neolabs.cmd               ← use this for ALL Windows NeoLabs commands
docs/week-01/             ← Week 1 instructions
publications/             ← student PDFs
tools/neolabs.py          ← underlying client
scripts/                  ← approved helpers
worksheets/ + templates/  ← Week 1 work products
```

## Safety boundary

Use only the pod and resources returned by the current NeoLabs gateway and permitted by the written assignment. Do not use another intern's access details or work outside the assigned environment. Stop and contact a mentor if another pod, real data, credentials, or unexpected infrastructure becomes visible.

**Toolkit:** Learn + Connect + Operate  
**VCC:** scheduled pod-isolated training target  
**Central Assignments:** submissions + assessment
