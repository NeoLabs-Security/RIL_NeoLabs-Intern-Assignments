# Student Submission Rules

These rules apply to all NeoLabs × RIL internship submissions. Read [`PROGRAMME_CURRENT_STATE.md`](PROGRAMME_CURRENT_STATE.md) and the current weekly assignment before starting.

## Before starting

- Pull the latest track toolkit and use its current connection/startup path.
- Read the current GitHub Issue/assignment.
- Confirm the server-issued pod, track, resources, time window and allowed tools.
- Ask a mentor when scope is unclear. Do not guess.
- Do not use an old IP, cached target, copied Access Code or another intern's runtime state.

## Branch

Create one branch per assignment:

`week-XX/<track>/<github-username>-<task>`

## Submission location

`submissions/week-XX/<track>/<github-username>/`

Do not place submissions in the track toolkit repositories.

## Commits

Use short meaningful commit messages, for example:

- `add authentication timeline`
- `document baseline evidence`
- `add fixed-version retest`

Never commit NeoLabs Access Codes, passwords, session tokens, signed URLs, certificates/private keys, AWS credentials, unredacted real data or another pod's data.

## Pull Request

Your PR must:

- link the assigned Issue when provided;
- contain only your assignment work;
- include the required evidence and reproducible notes;
- separate observed facts from inference;
- contain no secrets/private credentials;
- include a short summary of what you did/found;
- remain open for mentor review.

Students must not merge their own PR unless explicitly instructed.

## Evidence quality

Screenshots should show enough context to prove the claim while redacting secrets. Logs/queries should include the relevant time range and assigned pod. SOC work should distinguish original event time from replay/ingestion time. Pentest/Support work should state the current server-issued target/resource rather than an old remembered endpoint.

## Stop conditions

Stop and contact a mentor if another pod becomes visible/reachable, real personal/production data appears, credentials/private keys are exposed, the task would affect an unassigned target, or service stability is affected.
