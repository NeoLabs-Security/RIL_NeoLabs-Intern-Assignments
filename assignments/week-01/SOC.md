# SOC Level 1 — Week 01

## Operation Night Watch: Build the Baseline

### Objective
Use your assigned pod's Wazuh telemetry to establish a defensible picture of normal authentication and application activity.

### Required preparation
Use the SOC toolkit Week 1 launch pack and study shelf. Confirm:

```bash
neolabs status
neolabs pod info
neolabs connect
```

### Tasks
1. Locate the synthetic verification event for your assigned pod/scenario.
2. Identify normal successful authentication and ordinary failed authentication if present.
3. Identify normal application/API activity and useful correlation fields.
4. Record approved storage/other telemetry visible to your pod.
5. Save at least three reusable baseline queries/filters.
6. Build a short timeline using at least two event types.
7. Record one visibility gap and what source/field would close it.
8. Explain what this Week 1 baseline will help you detect later.

### Required files
Place these under `submissions/week-01/soc/<github-username>/`:

- `baseline-log-report.md`
- `timeline.md`
- `evidence-log.md`
- `query-journal.md`
- `screenshots/` only where useful and redacted

### Quality bar
- Every important claim is tied to evidence.
- Event time and replay/ingestion time are not confused.
- Another analyst could reproduce your searches.
- Unusual does not automatically mean malicious.
- No other pod's data appears in your work.

### Stop conditions
Stop and contact a mentor if another pod's events, real data, credentials/private keys, unexpected infrastructure access or instability appears.
