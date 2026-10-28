# VCC Week 3 Red Team Report

## 1. Team information

| Field        | Entry                                                                       |
|--------------|-----------------------------------------------------------------------------|
| Team name    | `Red Team`                                                                  |
| Team lead    | `Bakor Barilee Owen` |
| Team members | `Bakor Barilee Owen, Ndubuisi Amarachi, Nwankwo Godsaves` |

## 2. Submission declaration

By submitting this file, the team confirms that:

- all activity was limited to the authorised Week 3 arena, its published challenge endpoints and the 15 synthetic accounts;
- testing stopped immediately at the final whistle or any facilitator pause;
- no account was claimed more than once by this team;
- no quarantined account was attacked further or restored by the Red Team;
- no real credentials, production systems, AWS resources, Wazuh systems, administrative interfaces or unlisted hosts were targeted;
- no denial of service, persistence, destructive payload, data alteration, logging interference or evidence manipulation was performed; and
- the submission contains no passwords, cookies, bearer tokens, private certificates, operator credentials or other secrets.

Team lead confirmation: `I CONFIRM`

## 3. Claim summary

| Claim | Synthetic account ID | Synthetic email | Challenge used | Verified UTC time | Evidence file | SHA-256 | Status |
|---|---|---|---|---|---|---|---|
| 1 | `credential-storm-pod-01-12` | `credential-storm-pod-01-12@example.invalid` | `password` | `2026-10-18T15:23:00Z` | `evidence/RED_01_152300Z.png` | `ce0b7652a11b2fb3137e8f3332b8d6cb67c71ed827d149d38adc61b4e9f2fa55` | `Pending facilitator verification` |
| 2 | `credential-storm-pod-01-13` | `credential-storm-pod-01-13@example.invalid` | `password` | `2026-10-18T22:20:00Z` | `evidence/RED_02_222000Z.png` | `1c4961ab52d5459ddd21d1916ee3ae93c7db80a73314be5264840102a58951ea` | `Pending facilitator verification` |

## 4. Claim details

### Claim 1: `credential-storm-pod-01-12`

| Field                         | Entry                                                              |
|-------------------------------|--------------------------------------------------------------------|
| Synthetic account ID          | `credential-storm-pod-01-12`                                       |
| Synthetic email               | `credential-storm-pod-01-12@example.invalid`                       |
| Red Team member responsible   | `Bakor Barilee Owen`                                               |
| Challenge used                | `password`                                                         |
| Attempt started (UTC)         | `2026-10-18T15:00:00Z`                                         |
| Successful verification (UTC) | `2026-10-18T15:23:00Z`                                             |
| Workbench or arena URL shown  | `[REDACTED: lab endpoint]`                                              |
| Evidence filename             | `evidence/RED_01_152300Z.png`                                      |
| Evidence SHA-256              | `ce0b7652a11b2fb3137e8f3332b8d6cb67c71ed827d149d38adc61b4e9f2fa55` |
| Facilitator result            |                                                                    |
| Facilitator note              |                                                                    |

#### What was demonstrated

The target account’s authentication accepted a weak, guessable credential. Access was obtained via a credential brute-force attack executed from a Kali Linux environment (routed through VPN per engagement rules), targeting the normal login flow. Successful authentication was confirmed by reaching the account’s authenticated profile page.

#### Evidence checklist

- [x] Screenshot shows the arena/workbench URL.
- [x] Screenshot shows the authenticated state.
- [x] Screenshot shows the synthetic account ID or email.
- [ ] Screenshot shows a visible UTC clock.
- [x] SHA-256 value matches the submitted image.
- [x] No password, cookie, bearer token or other secret is visible.
- [ ] Claim was completed before the final whistle.
- [ ] Account was not already quarantined when the successful session was established.

### Claim 2: `credential-storm-pod-01-13`

| Field                         | Entry                                                              |
|-------------------------------|--------------------------------------------------------------------|
| Synthetic account ID          | `credential-storm-pod-01-13`                                       |
| Synthetic email               | `credential-storm-pod-01-13@example.invalid`                       |
| Red Team member responsible   | `Bakor Barilee Owen`                                               |
| Challenge used                | `password`                                                         |
| Attempt started (UTC)         | `2026-10-18T22:00:00Z`                                         |
| Successful verification (UTC) | `2026-10-18T22:20:00Z`                                             |
| Workbench or arena URL shown  | `[REDACTED: lab endpoint]`                                              |
| Evidence filename             | `evidence/RED_02_222000Z.png`                                      |
| Evidence SHA-256              | `1c4961ab52d5459ddd21d1916ee3ae93c7db80a73314be5264840102a58951ea` |
| Facilitator result            |                                                                    |
| Facilitator note              |                                                                    |

#### What was demonstrated

The target account’s authentication accepted a weak, guessable credential. Access was obtained via a credential brute-force attack executed from a Kali Linux environment (routed through VPN per engagement rules), targeting the normal login flow. Successful authentication was confirmed by reaching the account’s authenticated profile page.

#### Evidence checklist

- [ ] Screenshot shows the arena/workbench URL.
- [x] Screenshot shows the authenticated state.
- [x] Screenshot shows the synthetic account ID or email.
- [ ] Screenshot shows a visible UTC clock.
- [x] SHA-256 value matches the submitted image.
- [x] No password, cookie, bearer token or other secret is visible.
- [ ] Claim was completed before the final whistle.
- [ ] Account was not already quarantined when the successful session was established.

## 5. Evidence manifest

| Evidence file | SHA-256 | Synthetic account ID | UTC time |
|---|---|---|---|
| `evidence/RED_01_152300Z.png` | `ce0b7652a11b2fb3137e8f3332b8d6cb67c71ed827d149d38adc61b4e9f2fa55` | `credential-storm-pod-01-12` | `2026-10-18T15:23:00Z` |
| `evidence/RED_02_222000Z.png` | `1c4961ab52d5459ddd21d1916ee3ae93c7db80a73314be5264840102a58951ea` | `credential-storm-pod-01-13` | `2026-10-18T22:20:00Z` |
