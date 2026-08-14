# SOC Analyst Level 1 — Week 01

## Operation Night Watch: Build the Baseline

### Objective

Use your assigned pod's VCC telemetry in the local NeoLabs Wazuh workstation to establish a defensible picture of normal authentication and application activity.

### Required preparation

On Windows, pull the latest SOC toolkit and normally double-click:

```text
START-NEOLABS-SOC.cmd
```

The launcher must reach **SOC WORKSTATION READY** before you begin. READY now means your assigned-pod VCC telemetry is actually indexed/searchable in Wazuh, not merely that Docker containers are running. The launcher also reports the most recent indexed VCC event, checks local index/disk health, and opens the Wazuh dashboard.

If startup or telemetry looks wrong, use:

```text
CHECK-NEOLABS-SOC.cmd
```

or:

```powershell
.\neolabs.cmd doctor
```

At the Wazuh login page use username `admin`; on Windows the launcher copies the locally generated password to the clipboard without printing it.

### Where to work in Wazuh

Use the preconfigured **NeoLabs — Operation Night Watch** view/dashboard when it is available. Otherwise use Threat Hunting/Discover over `wazuh-alerts-*` and filter only your server-assigned pod.

The current Night Watch view focuses on fields such as `pod_id`, `event_type`, user identity, `source_ip`, `outcome`, `correlation_id`, Wazuh rule level and original `event_time`. The separate **NeoLabs — Telemetry Health** view focuses on rule `100150` and collection/visibility problems.

### Tasks

1. Confirm the displayed pod matches your server assignment.
2. Record the latest VCC event freshness and note any telemetry-health warning before analysis.
3. Locate normal successful authentication and ordinary failed authentication where present.
4. Identify normal application/API activity and useful correlation/session fields.
5. Record approved storage/other telemetry visible to your pod.
6. Save or reuse at least three baseline queries/filters.
7. Build a short timeline using at least two event types and original event time.
8. Record one visibility gap and what source/field would close it.
9. Explain what this Week 1 baseline will help you detect in later scenarios.

### Required files

Place these under `submissions/week-01/soc/<github-username>/`:

- `baseline-log-report.md`
- `timeline.md`
- `evidence-log.md`
- `query-journal.md`
- `screenshots/` only where useful and redacted

### Quality bar

- Every important claim is tied to evidence/event IDs or a reproducible query.
- Original event time and replay/ingestion/index time are not confused.
- Another analyst could reproduce your searches.
- Unusual does not automatically mean malicious.
- No other pod's data appears in your work.
- A zero-result search is not treated as proof until telemetry health/freshness is checked.

### Stop conditions

Stop and contact a mentor if another pod's events, real data, credentials/private keys, unexpected infrastructure access or service instability appears.
