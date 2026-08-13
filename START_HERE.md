# Start Here — Grey-Box Penetration Testing

This repository is the **NeoLabs × RIL Grey-Box Pentest Toolkit**. It provides branded learning material, safe testing helpers and the student-side client that authenticates you to the VCC pod assigned by the programme.

Official weekly tasks and graded submissions belong in the separate **RIL_NeoLabs-Intern-Assignments** repository.

## One-time Windows setup

From this repository root, double-click:

```text
setup-windows.cmd
```

The readiness check verifies Python and Windows OpenSSH. Windows interns do **not** need `pip install`, Python Scripts PATH changes or a manually configured gateway URL.

Use the toolkit-local launcher from PowerShell:

```powershell
.\neolabs.cmd --help
```

For Linux/macOS or advanced manual use, the Python client under `tools/neolabs.py` remains available.

## Before any practical work

1. Read `RULES_OF_ENGAGEMENT.md`.
2. Use the private pod number + NeoLabs Access Code delivered for the week.
3. Authenticate and refresh your scope:

```powershell
.\neolabs.cmd login
.\neolabs.cmd connect
.\neolabs.cmd scope
.\neolabs.cmd targets
```

The NeoLabs gateway is the **authentication/discovery entry point**. It is not the pentest target.

## Why the toolkit can show real IPs

Pentest training sometimes requires actual IP/CIDR work for Nmap and service discovery. The broker therefore returns the exact lab targets that your pod is authorised to test. A week may expose one IP, several named services or a bounded lab range.

The student cannot select a different pod by editing a local file. The current manifest is server-issued and stored only in the ignored `runtime/` directory.

## Safe Nmap workflow

Always read scope first:

```powershell
.\neolabs.cmd scope
.\neolabs.cmd targets
```

For Week 1, keep the isolated NeoLabs tunnel open and use the guarded wrapper only against the server-issued local target described in the assignment. Never substitute the public EC2 address or another pod.

The validator rejects targets outside the live server-issued manifest and the wrapper does not accept arbitrary Nmap flags.

## Burp/browser work

Configure Burp Suite and browser tooling only for the hostnames/URLs returned by `targets` and the limits written in the current GitHub assignment.

## Learning order

Follow `LEARNING_PATH.md`: scope and HTTP first, then proxy workflow, mapping, identity/session testing, authorization, validation/business logic, API security, evidence and retesting.

## Repository boundary

This public repository may contain reusable tools, synthetic labs, templates and NeoLabs-branded learning material. It must not contain live Access Codes, private keys, raw session files, unredacted cohort evidence, mentor answer keys or production data.

The `runtime/` folder is ignored because it is generated from the live broker.

## Stop and escalate

Stop testing and notify a mentor when the application becomes unstable, a non-returned system appears reachable, real personal data appears, the task would require persistence/destructive action, the approved proof threshold is already met or the written Rules of Engagement are unclear.
