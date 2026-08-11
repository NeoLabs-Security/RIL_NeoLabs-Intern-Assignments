# NeoLabs Grey-Box Pentest Toolkit Visual System

## Brand purpose

Every student guide, lab pack and technical handbook should read as one official **NeoLabs × RIL Cybersecurity Internship** publication while remaining clear enough for technical use on screen and in print.

## Wordmark

```text
NEOLABS
SECURITY LABS · GREY-BOX PENTEST
```

The NeoLabs wordmark is uppercase and dominant. The track line is smaller, spaced and uses Signal Cyan.

## Colour palette

| Role | Hex | Use |
|---|---|---|
| NeoLabs Midnight | `#101A2B` | cover, major headings, footer |
| Signal Cyan | `#00A6C8` | rules, links, scope markers |
| Analyst Blue | `#1F5F99` | secondary headings and callouts |
| Evidence Amber | `#D89216` | evidence/proof notes |
| Incident Red | `#B53838` | stop conditions and critical warnings |
| Slate | `#4B5563` | supporting text |
| Paper | `#F7F9FC` | page/callout background |
| White | `#FFFFFF` | cover text and contrast |

Colour is never the only indicator of meaning.

## Typography

- headings: `DejaVu Sans`, `Arial`, sans-serif;
- body: `DejaVu Serif`, `Georgia`, serif;
- code: `DejaVu Sans Mono`, `Consolas`, monospace.

Do not commit font files.

## Page structure

Covers contain the NeoLabs wordmark, publication title, track, version/date and **Authorised synthetic training use only** statement.

Running headers show `NEOLABS · GREY-BOX PENTEST`; footers show classification and page number.

## Pentest callouts

Use these labels consistently:

- **Scope boundary** — exact authorised systems/CIDRs and prohibited targets;
- **Tester note** — interpretation or workflow advice;
- **Evidence requirement** — proof that must be retained;
- **Stop condition** — when testing must end;
- **Tool technique** — approved way to use Burp/Nmap/browser tools;
- **Retest check** — what must be revalidated after a fix.

## Tables, code and screenshots

Tables use Midnight headers and light alternating rows. Code blocks use a light background, cyan left rule and monospaced type. Commands containing addresses must be either clearly synthetic examples or obtained from `neolabs targets` / `neolabs scope` during the live lab.

Screenshots must be readable, captioned and redacted. Never include Access Codes, session tokens, private keys, unrelated pod traffic or real personal data.

## Accessibility

Body text should render at approximately 10.5-11.5 pt with at least 1.35 line spacing. Heading hierarchy must remain semantic. Links should be recognisable without relying only on colour.

## Approval

A release publication is ready only after technical, safety, editorial and render checks succeed. Generated PDFs should be released from reviewed source and must not contain live secrets or target values.
