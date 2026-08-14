# Start Here — Grey-Box Penetration Testing

This repository is the **NeoLabs × RIL Grey-Box Pentest Toolkit**. It provides branded learning material, guarded testing helpers and the student-side client that authenticates you to the VCC pod assigned by the programme.

Official weekly tasks and graded submissions belong in `RIL_NeoLabs-Intern-Assignments`. For the current runtime/access model, read [`PROGRAMME_CURRENT_STATE.md`](PROGRAMME_CURRENT_STATE.md).

## One-time Windows setup

From this repository root, double-click:

```text
setup-windows.cmd
```

The readiness check verifies the current Windows prerequisites. Windows interns do **not** need a global `pip install`, Python Scripts PATH changes or a manually configured gateway URL.

Use the toolkit-local launcher from PowerShell:

```powershell
.\neolabs.cmd --help
```

## Before any practical work

1. Pull the latest toolkit.
2. Read `RULES_OF_ENGAGEMENT.md` and the current weekly assignment.
3. Authenticate with the assigned pod + private Access Code:

```powershell
.\neolabs.cmd login
.\neolabs.cmd status
.\neolabs.cmd pod info
.\neolabs.cmd scope
.\neolabs.cmd targets
.\neolabs.cmd connect
```

The NeoLabs gateway is the **authentication/discovery entry point**, not the pentest target. Scope is server-issued.

## Week 1 local target

For Operation Night Watch, keep the isolated NeoLabs connection open and use the authorised learner surface, normally:

```text
http://127.0.0.1:18080
```

Confirm `scope` and `targets` immediately before practical work. Never substitute the public EC2 address, another pod or a cached/remembered IP.

## Why later tasks may show IP/CIDR scope

Some pentest weeks require Nmap/service discovery. When authorised, the current server manifest returns the exact lab hostname/IP/CIDR allowed for that task. If the runtime enters replay/offline mode, stale network scope must not be treated as continuing permission.

## Safe Nmap/Burp workflow

Use the repository's target validator/low-rate discovery wrapper only for the exact current scope. Configure Burp only for current authorised hostnames/URLs and the limits written in the central assignment. The validator does not make an otherwise out-of-scope target authorised.

## Learning order

Follow `LEARNING_PATH.md`: professional scope/ethics → HTTP/browser → Burp/application mapping → identity/session → authorisation → input/file/business logic → API security → evidence/reporting/retest.

## Repository boundary

This public repository may contain reusable tools, synthetic labs, templates and learning material. It must not contain live Access Codes, private keys, session files, signed private URLs, unredacted cohort evidence, mentor answer keys or production data. Runtime state is generated from the server and ignored by Git.

## Stop and escalate

Stop testing when the application becomes unstable, a non-returned system becomes reachable, real data/credentials appear, persistence/destructive action would be needed, the approved proof threshold has already been met or the written Rules of Engagement are unclear.
