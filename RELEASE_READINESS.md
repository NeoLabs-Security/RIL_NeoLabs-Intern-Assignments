# Grey-Box Toolkit — Operational Readiness

**Status date:** 2026-08-14  
**State:** active programme baseline on `main`  
**Current assignment:** Week 01 — Operation Night Watch

Earlier release-candidate/operator-to-do notes are superseded by the current deployed five-pod programme model described in [`PROGRAMME_CURRENT_STATE.md`](PROGRAMME_CURRENT_STATE.md).

## Student-facing readiness

- [x] Start guide, programme state and learning path
- [x] Rules of Engagement
- [x] Professional/HTTP/Burp/application-mapping foundations
- [x] Identity/session, authorisation, input/file/business-logic and API material
- [x] Risk/reporting/retest guidance
- [x] Query/command reference and troubleshooting
- [x] Synthetic local labs and reusable templates
- [x] Week 1 launch pack/publications

## Technical/runtime controls

- [x] Server-authoritative intern → track → pod/resource mapping
- [x] Toolkit-local Windows `neolabs.cmd` flow with preconfigured official gateway
- [x] Pod-isolated Week 1 local learner tunnel (`127.0.0.1:18080` when published)
- [x] Exact-target validator
- [x] Restricted low-rate discovery wrapper
- [x] Stale/old target scope is not continuing authorisation when the server no longer publishes it
- [x] Localhost-only synthetic practice target
- [x] Docker/source/safety boundary validation
- [x] Credential/private-key/live-target material excluded from Git

## Student operating rule

On Windows: `setup-windows.cmd` once, then `.\neolabs.cmd login/status/pod info/scope/targets/connect` from the toolkit folder. Students do not need a global `pip install` or manual gateway configuration.

Live VCC testing begins only when the current assignment and current server manifest authorise the target/window. The public EC2 address, an old IP/hostname, a guessed CIDR or technically reachable system is not automatically in scope.

## Current release decision

The toolkit is active for programme use. Current Week 1 work is application/service baseline mapping. Later-week content may be staged, but only the central assignment + current server state authorise practical testing.

## Stop conditions

Do not continue when another pod/host becomes reachable, real data/credentials appear, the task requires unapproved destructive/persistence activity, the approved proof threshold is reached, service stability is affected or current scope is unclear.
