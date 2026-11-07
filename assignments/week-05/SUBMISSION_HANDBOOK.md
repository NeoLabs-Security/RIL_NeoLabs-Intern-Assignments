# Week 05 — Submission handbook (draft)

Students use the existing **RIL_NeoLabs-Intern-Assignments** repository submission workflow, not VCC runtime folders.

## Branch and path
- Branch: `week-05/<track>/<github-username>-poisoned-upload`
- Report folder: `submissions/week-05/<track>/<github-username>/`
- Track: `pentest`, `soc`, or `support` as assigned.

## Minimum report skeleton
```markdown
# Week 05 - <track> - <GitHub username>
Scenario: w05-poisoned-upload
Assigned pod: pod-0X
UTC investigation window: <start> to <end>
Incident reference: <mentor-issued ID>
Approved scope and source: <current manifest reference>

## Objective and method
## Evidence IDs and timestamps
## Findings / investigation / ticket outcome
## Retest or recovery validation
## Limitations, escalation and reflection
```

Use filenames such as `finding.md`, `incident-report.md`, `ticket-resolution.md` and `evidence-log.md` as appropriate to your track. Include screenshots only when sanitized and relevant.

## Git and PR procedure
1. Pull the current main branch after mentor publishes the assignment.
2. Create the Week 05 branch and your own folder.
3. Commit your Markdown reports and sanitized evidence only.
4. Open a PR into `main`, link the assigned Issue, and **leave it open** for mentor review.

Do not commit Access Codes, cookies, passwords, signed URLs, private keys, complete raw request headers, personal information, live targets or uploaded binaries. Redact sensitive fields; use relative paths and safe hashes/IDs.

**Due date and rubric:** supplied in the individual mentor Issue after the environment is approved. This draft is not an authorization or official release.
