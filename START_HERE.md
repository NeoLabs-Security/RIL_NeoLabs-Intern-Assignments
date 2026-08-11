# Start Here — Grey-Box Penetration Testing

This repository is the **NeoLabs × RIL Grey-Box Pentest Toolkit**. It provides branded learning material, safe testing helpers and the student-side client that authenticates you to the VCC pod assigned by the programme.

Official weekly tasks and graded submissions belong in the separate **RIL_NeoLabs-Intern-Assignments** repository.

## One-time CLI setup

From this repository root install the student CLI locally:

```bash
python3 -m pip install --user -e .
```

Confirm `neolabs --help` works. If your operating system does not add the user-level Python scripts directory to `PATH`, follow the Python installation warning or use `python3 tools/neolabs.py` as the equivalent fallback.

## Before any practical work

1. Read `RULES_OF_ENGAGEMENT.md`.
2. Set the NeoLabs lab base URL supplied by the programme as `NEOLABS_LAB_BASE_URL`.
3. Use the private pod number + NeoLabs Access Code delivered for the week.
4. Authenticate and refresh your scope:

```bash
neolabs login
neolabs connect
neolabs scope
neolabs targets
```

The base URL is the **authentication/discovery entry point**. It is not necessarily the pentest target.

## Why the toolkit now shows real IPs

Pentest training sometimes requires actual IP/CIDR work for Nmap and service discovery. The broker therefore returns the exact lab targets that your pod is authorised to test. A week may expose one IP, several named services or a bounded lab range.

The student cannot select a different pod by editing a local file. The current manifest is server-issued and stored only in the ignored `runtime/` directory.

## Safe Nmap workflow

Always read scope first:

```bash
neolabs scope
neolabs targets
```

Then use the fixed wrapper with **one** returned target:

```bash
bash scripts/safe-nmap.sh 10.40.3.21
```

or, only when `neolabs scope` explicitly returns the range:

```bash
bash scripts/safe-nmap.sh 10.40.3.16/28
```

The validator rejects IPs/CIDRs/hostnames outside the live server-issued manifest and the wrapper does not accept arbitrary Nmap flags.

## Burp/browser work

Configure Burp Suite and browser tooling only for the hostnames/URLs returned by `neolabs targets` and the limits written in the current GitHub assignment.

## Learning order

Follow `LEARNING_PATH.md`: scope and HTTP first, then proxy workflow, mapping, identity/session testing, authorization, validation/business logic, API security, evidence and retesting.

## Repository boundary

This public repository may contain reusable tools, synthetic labs, templates and NeoLabs-branded learning material. It must not contain live Access Codes, private keys, raw session files, unredacted cohort evidence, mentor answer keys or production data.

The `runtime/` folder is ignored because it is generated from the live broker.

## Stop and escalate

Stop testing and notify a mentor when the application becomes unstable, a non-returned system appears reachable, real personal data appears, the task would require persistence/destructive action, the approved proof threshold is already met or the written Rules of Engagement are unclear.
