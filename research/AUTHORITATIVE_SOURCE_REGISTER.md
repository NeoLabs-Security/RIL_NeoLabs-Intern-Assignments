# Authoritative Source Register — Grey-Box Penetration Testing

Review date: 2026-08-02

Use versioned or dated sources where possible. Source material must be paraphrased and attributed; do not copy substantial protected text into the toolkit.

## Core methodology

| Source | Use in toolkit | Notes |
|---|---|---|
| NIST SP 800-115, Technical Guide to Information Security Testing and Assessment | planning, execution, analysis and mitigation structure | Final publication; September 2008 |
| OWASP Web Security Testing Guide | web application testing categories and scenario identifiers | Stable project page; v4.2 is the current versioned release while v5.0 is under development |
| OWASP Application Security Verification Standard | expected security-control outcomes and verification language | Use the current stable version after editorial verification |
| OWASP API Security Top 10 | API risk categories and learning examples | Use current official OWASP release |
| CIS Controls v8.1, Control 18 | penetration-testing programme context | Use control language as high-level alignment, not as the sole testing method |

## Tool documentation

| Source | Use in toolkit | Notes |
|---|---|---|
| PortSwigger Burp Suite Documentation | Community Edition setup, Proxy, Repeater, scope and project settings | Official documentation updated frequently |
| PortSwigger Web Security Academy | legal external practice and concept reinforcement | Link to labs; do not reproduce lab solutions |
| Nmap Reference Guide | option meanings and safe restricted profiles | Use only with exact written authorisation |
| curl documentation | HTTP request construction and TLS behaviour | Restrict examples to local or assigned lab hosts |
| jq manual | structured JSON inspection | Read-only data transformation examples |

## Reporting and risk

| Source | Use in toolkit | Notes |
|---|---|---|
| FIRST CVSS v4.0 Specification | risk-vector literacy | Teach score limitations and separate severity from organisational priority |
| CWE | weakness terminology | Cite specific entries only after confirming relevance |
| NIST SP 800-53A | assessment language and evidence discipline | Selective conceptual alignment only |

## Source-control rules

- Prefer official standards bodies, project documentation and primary specifications.
- Record the review date and exact version in every published module.
- Mark interpretations and NeoLabs-specific procedures clearly.
- Never present a tool result as proof without manual verification.
- Keep live assignment scope and credentials outside this public repository.
