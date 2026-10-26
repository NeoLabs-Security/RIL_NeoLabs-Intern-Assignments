# SOC — authorization investigation

Read [shared scope](README.md). Objective: demonstrate visibility into normal checks, denied attempts and successful policy-violating access through the existing Wazuh/live/replay workflow.

1. Use the canonical platform launcher in your SOC toolkit and confirm READY for your assigned pod and `w04-broken-gate`. Historical alerts from another scenario do not satisfy this check.
2. Record exact time-window and pod/scenario filters and prove an original event is searchable. Distinguish a missing alert from missing ingestion/indexing.
3. Build a UTC timeline using event/request IDs, synthetic actor, course/resource, intended policy, actual decision and HTTP result. Compare actual allow with expected deny; distinguish this from routine blocked requests.
4. Preserve source IP and ingress provenance separately from collector/agent identity. Explain tunnel/NAT limitations and corroborate with actor and request IDs.
5. Assess affected objects, evidence confidence and detection limits. Link an authorized Support escalation by safe evidence reference when available; no synchronous offensive/defensive coordination is required.
6. Propose response/retest steps for mentor review. Do not alter roles, block IPs or change shared lab state.

Submit `incident-report.md` using [the template](templates/incident-report.md), timeline/evidence register, and query/detection note. Never copy private URLs, credentials or another pod's events into the PR.
