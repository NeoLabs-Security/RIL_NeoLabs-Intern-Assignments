# Rules of Engagement — Student Baseline

This document is mandatory. A current assignment may narrow these permissions; it may expand a category only when the expansion is explicit, synthetic, bounded and mentor-approved. Current runtime/access reference: [`PROGRAMME_CURRENT_STATE.md`](PROGRAMME_CURRENT_STATE.md).

## Authoritative scope

Practical authority comes from **both** the current central assignment and the current NeoLabs server-issued manifest/resources. A public EC2 address, old hostname/IP/CIDR, screenshot, cached runtime file, technically reachable system or another intern's instructions are not authorisation.

Every practical assessment must identify:

- assigned intern/team and track;
- server-assigned pod;
- current target/application/resource or tunnel scope;
- authorised synthetic accounts/roles;
- start/end or live window;
- permitted testing categories;
- prohibited actions/request-rate limit;
- proof threshold;
- evidence location;
- mentor contact/emergency stop procedure.

## Default permitted actions

Only when listed by the current assignment/scope:

- manual browser/HTTP inspection;
- application/endpoint mapping;
- controlled request modification in Burp Repeater;
- low-rate checks using synthetic accounts/data;
- comparison of authorised roles;
- repository-approved bounded discovery against current network scope;
- collection of minimum evidence needed to prove a finding;
- remediation retesting after release/approval.

## Prohibited actions

- testing an unassigned host/IP/pod/account/third-party/production service;
- substituting the main EC2 public IP or stale target for a current server-issued target;
- denial-of-service/stress/uncontrolled concurrency;
- persistence/backdoors/remote shells/privilege retention;
- destructive file/database/account changes;
- extraction of real personal/payment/secret data;
- phishing/contacting real users;
- password spraying/credential stuffing/broad brute force unless a tightly controlled synthetic scenario explicitly authorises it for that window;
- scanning public address ranges;
- bypassing pod assignment/tunnel/scope controls;
- concealing activity from mentors or the SOC track.

## Proof threshold

Demonstrate a weakness using the least invasive evidence possible. Stop once the approved proof threshold is met; do not continue merely to demonstrate additional impact.

## Immediate stop conditions

Stop/preserve evidence/contact a mentor when real data/credentials/private keys appear, another pod/host/infrastructure service becomes visible, service health degrades, scope becomes ambiguous, a test produces unexpected write/privilege access, or the approved proof threshold has been reached.

## Runtime rule

If the current manifest stops publishing an interactive target (for example the scenario moves to replay/offline), network/browser target scope does not remain valid simply because it was valid earlier. Wait for the next approved interactive/cloud/endpoint window.

## Accountability

Every test action must be attributable through the testing journal. Unrecorded/out-of-scope activity is a programme violation even when no damage occurs.
