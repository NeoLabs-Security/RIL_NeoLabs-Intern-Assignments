INCIDENT IVESTIGATION REPORT

*TARGET SCOPE* : NeoLabs VCC-Pod-01 Credentials-Storm.
*TRACK* : Soc Analyst
*TEAM* : Blue

##Executive Summary:

- Total incidents: 12 account hijacks or suspected takeovers reported between October 13,8pm and 11:59pm October 18, 2026.
- Confirmed impact: Multiple accounts were compromised, including four accounts hijacked in a single incident and one account hijacked twice.
- Attack pattern: Several external IP addresses were involved, while the logs repeatedly referenced the shared internal IP "172.18.0.3", possibly associated with a container or VPN.
- Security response: Firewall blocks were applied, compromised accounts were quarantined, and active sessions or refresh tokens were revoked.
- Key concern: Some IP addresses were blocked after suspicious authentication but later unblocked, potentially allowing further attacks.


*Case ID*: First Account hijack.
*Account ID:syn-credential-storm-pod-01-01
*First seen and last seen:2026-10-14T07:07:29.119Z---2026-10-14T18:49:37.489Z
*Source IP: 102.91.71.149
*Event IDs:acf45ec6-dff9-4056-9df8-f488a35da95e
*Assessment: Multiple Authentication failure followed by Authentication success and confirmed account takeover at 2026-10-14T18:49:31.629Z
*Watchlist action:-------------
*Firewall action: Blocked after account takeover
*Quarantine action:BlueAnalyst01,account_hijacked and session revoked.
*Limitations: Attacks carry a shared IP 172.18.0.3,probably a container's IP/VPN.


**Case ID*: Successful authentication for [] from ::ffff:172.18.0.3.
*Account ID: Unavailable
*First seen and last seen: 2026-10-15T22:25:36.082Z;2026-10-16T14:25:40.719Z;2026-10-16T14:50:29.013Z
*Source IP: 51.75.145.220;142.4.216.196;145.239.252.205
*Event IDs:d3d48525-f80e-4901-aa07-9cc2029f1d8e;208ff702-4732-4278-847a-2d486323b1a6;eefc321f-f45b-4891-9d6a-b174de041d00
*Assessment: Likely takeover
*Watchlist action:-51.75.145.220 was added 2026-10-14T22:07:28+00:00 and removed after blocking.
*Firewall action: Blocked after successful authentication.
*Quarantine action:---------
*Limitations: Shared IP.

**Case ID*:Second Account hijack
*Account ID:syn-credential-storm-pod-01-02
*First seen and last seen:2026-10-16T19:43:22+00:00---2026-10-16T20:04:30.399Z
*Source IP: 102.90.102.35
*Event IDs:443fec7f-4692-434f-88cf-6b6ed15609d9
*Assessment:Confirmed account takeover at 2026-10-16T20:04:30.399Z
*Watchlist action:------------
*Firewall action: Account user blocked after account hijack.
*Quarantine action: BlueAnalyst01,account_hijacked id and session revoked.
*Limitations:Attacks carry a shared IP 172.18.0.3,probably a container's IP/VPN.


**Case ID*: MULTIPLE ACCOUNTS HIJACK
*Account ID:syn-credential-storm-pod-01-03; syn-credential-storm-pod-01-05; syn-credential-storm-pod-01-09 & syn-credential-storm-pod-01-04
*First seen and last seen: 2026-10-16T20:18:28+00:00---2026-10-16T20:40:43+00:00
*Source IP: 145.239.255.68
*Event IDs:5d5f27fb-93cd-4230-944e-6b6df4a3cfa9; 65383a9f-b706-4df5-abf1-59b3c6827344; 8293740a-b2d2-4e72-9a87-29909a5a1eda; 19c085b5-0d63-4004-a6e2-d7527a0d297a.
*Assessment: four accounts hijacked.
*Watchlist action: ------------
*Firewall action: user account IP blocked upon discovery.
*Quarantine action: BlueAnalyst01,account_hijacked and session revoked.
*Limitations: Attacks carry a shared IP 172.18.0.3,probably a container's IP/VPN.

**Case ID*:7th Account Takeover
*Account ID: syn-credential-storm-pod-01-11
*First seen and last seen:2026-10-14T19:02:40+00:00--(2026-10-17T21:17:54.279Z)--2026-10-17T21:55:30+00:00
*Source IP:144.217.253.149
*Event IDs: 26efd063-533e-4a53-89be-58e9957fc6de
*Assessment: Account takeover successful at 2026-10-17T21:17:54.279Z
*Watchlist action:----------------
*Firewall action: Account user blocked after account hijack.
*Quarantine action:  BlueAnalyst01,account_hijacked and session revoked.
*Limitations: Attacks carry a shared IP 172.18.0.3,probably a container's IP/VPN.

**Case ID*: DOUBLE HIJACK OF syn-credential-storm-pod-01-12
*Account ID: syn-credential-storm-pod-01-12
*First seen and last seen:2026-10-18T14:12:19+00:00---2026-10-18T14:28:33+00:00
*Source IP: 145.239.252.205;145.239.252.205
*Event IDs: 561650bd-688e-4141-a489-cd6f89fe6d5f;2f048171-0b6a-4cb3-87fc-701d05c4380e
*Assessment:Confirmed account hijacked twice of the same account.
*Watchlist action: IP was previously blocked for successful authentication only and unblocked afterwards.
*Firewall action: Account IP blocked again after account hijack.
*Quarantine action:BlueAnalyst01,account_hijacked and session revoked.
*Limitations: Attacks carry a shared IP 172.18.0.3,probably a container's IP/VPN.

**Case ID*:9th Account hijack
*Account ID:syn-credential-storm-pod-01-15
*First seen and last seen: 2026-10-18T20:16:12+00:00---2026-10-18T20:26:34+00:00
*Source IP: 142.4.216.196
*Event IDs: 45fb2b49-d9c2-4b6f-8d9e-c22624ba204c
*Assessment:Account hijack confirmed at 2026-10-18T20:24:12.310Z for credential-storm-pod-01-15@example.invalid [syn-credential-storm-pod-01-15] from ::ffff:172.18.0.3.
*Watchlist action:IP was previously blocked for successful authentication only and unblocked afterwards.
*Firewall action:Account IP blocked again after account hijack.
*Quarantine action: BlueAnalyst01-syn-credential-storm-pod-01-15 quarantined; 1 refresh session(s) revoked.
*Limitations:Attacks carry a shared IP 172.18.0.3,probably a container's IP/VPN.

**Case ID*: 10th Account hijack
*Account ID:syn-credential-storm-pod-01-13
*First seen and last seen:2026-10-18T21:10:57+00:00---2026-10-18T21:15:09+00:00
*Source IP: 51.75.145.220
*Event IDs:98d9b25d-5986-4497-aab4-5de48aee4153
*Assessment: Account hijack confirmed at 2026-10-18T20:24:12.310Z for credential-storm-pod-01-13@example.invalid [syn-credential-storm-pod-01-13] from ::ffff:172.18.0.3.
*Watchlist action:IP was previously blocked for successful authentication only and unblocked afterwards.
*Firewall action:Account IP blocked again after account hijack.
*Quarantine action: BlueAnalyst01-syn-credential-storm-pod-01-13 quarantined; 2 refresh session(s) revoked.
*Limitations: Attacks carry a shared IP 172.18.0.3,probably a container's IP/VPN.

**Case ID*: 11th Account hijack
*Account ID:syn-credential-storm-pod-01-08
*First seen and last seen:2026-10-18T22:20:00+00:00---2026-10-18T22:24:06+00:00
*Source IP: 51.75.145.20
*Event IDs:74b9b839-edf8-40c2-be7e-93a5648bc3c6
*Assessment:Account hijack confirmed at 2026-10-18T22:20:53.348Z for credential-storm-pod-01-08@example.invalid [syn-credential-storm-pod-01-08] from ::ffff:172.18.0.3.
*Watchlist action:-------------------
*Firewall action: Blocked after confirmation of account takeover.
*Quarantine action: BlueAnalyst01-syn-credential-storm-pod-01-08 quarantined; 1 refresh session(s) revoked.
*Limitations: Attacks carry a shared IP 172.18.0.3,probably a container's IP/VPN.


**Case ID*:12th/Final Account hijack
*Account ID:syn-credential-storm-pod-01-06
*First seen and last seen:2026-10-15T09:39:30+00:00---2026-10-18T22:56:44+00:00
*Source IP:147.135.15.16
*Event IDs:8fbf556b-3329-40e4-8efc-77cb66dc964f
*Assessment:Account hijack confirmed at 2026-10-18T22:56:39.816Z for credential-storm-pod-01-06@example.invalid [syn-credential-storm-pod-01-06] from ::ffff:172.18.0.3.
*Watchlist action:---------------------
*Firewall action:Blocked after confirmation of account takeover.
*Quarantine action: BlueAnalyst01-syn-credential-storm-pod-01-06 quarantined; 1 refresh session(s) revoked.
*Limitations:Attacks carry a shared IP 172.18.0.3,probably a container's IP/VPN.

**CONCLUSION* : The credential storm exercise resulted in the successful hijacking of 12 out of 15 targeted accounts (80%) between October 13 and October 18, 2026. The report records multiple confirmed account takeovers, including four accounts compromised in a single incident and TWO accounts hijacked twice,although defensive measures, including firewall blocking, account quarantine, and session revocation, were implemented.
Additionally, the repeated appearance of the shared internal IP address 172.18.0.3 limited the ability to attribute the activity to a specific external source.
