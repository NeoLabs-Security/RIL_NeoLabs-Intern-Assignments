# Grey-Box Toolkit Troubleshooting

Use this guide before asking for help. Do not solve a setup problem by weakening security controls or leaving the authorised scope.

## 1. Repository access or Git problems

### Clone or pull fails

- Confirm the correct GitHub account is signed in.
- Confirm the repository invitation has been accepted.
- Run `git remote -v` and compare the repository name.
- Use `git status` before pulling.
- Commit or safely stash your own work before changing branches.

### Push is rejected

- Confirm you are on your submission branch, not `main`.
- Run `git pull --rebase origin <your-branch>` only when instructed.
- Never force-push a shared branch.
- Open a Pull Request from your branch to the required base branch.

### Merge conflict

- Stop and preserve your work.
- Read each conflict marker carefully.
- Keep the current approved template structure and add your submission content in the intended fields.
- Ask a mentor before resolving a conflict involving shared toolkit files.

## 2. Burp proxy problems

### Browser does not load pages

- Confirm Burp is running.
- Confirm the browser proxy points to Burp's local listener.
- Confirm the exact assigned host is in scope.
- Check whether intercept is accidentally holding the request.
- Do not add unrelated hosts to scope.

### HTTPS certificate warning

- Use the approved lab certificate installation procedure for the dedicated testing browser profile.
- Do not disable certificate validation globally.
- Do not install the Burp CA into a normal personal browser profile.
- Remove the training certificate when the programme instructs you to do so.

### Traffic is missing

- Confirm the browser is using the dedicated proxy profile.
- Check filters in HTTP history.
- Generate one normal application action.
- Confirm the application is not using a different browser or native client.

## 3. Target validation fails

The validator intentionally fails closed.

Check:

- `ROE_ACKNOWLEDGED=YES`;
- exact operator-issued hostname;
- approved `http` or `https` scheme;
- numeric approved port;
- non-empty assignment ID;
- no wildcard, CIDR range, comma-separated host or public raw IP.

Do not edit the validator to make an unauthorised target pass.

## 4. Local Docker lab problems

### Docker command unavailable

Install a supported Docker environment using official vendor instructions, then restart the terminal.

### Port 8088 is already in use

Identify the local process using the port. Stop the unrelated local service or ask a mentor for an approved alternate local port. Do not expose the lab publicly.

### Container starts but the page is unavailable

Run:

```bash
docker compose -f labs/local-access-control/docker-compose.yml ps
docker compose -f labs/local-access-control/docker-compose.yml logs --tail=100
```

Confirm the service remains bound to `127.0.0.1`.

### Reset the local lab

Use the documented Compose stop and remove procedure. The local lab contains synthetic data only. Do not apply reset commands to VCC infrastructure.

## 5. VCC target or credential problems

- Never post credentials in Slack channels, Issues or screenshots.
- Confirm the assignment window is active.
- Confirm the target manifest belongs to your intern ID and assignment.
- A changed local pod label cannot change server-side assignment.
- If access is denied unexpectedly, preserve the error and correlation ID and contact the mentor.
- If another pod or real data appears, stop immediately and escalate.

## 6. Evidence and submission problems

### Screenshot contains a token or personal data

Do not upload it. Retake or redact the image using the approved evidence process. Record that the original remains restricted if preservation is required.

### Large files are rejected

Do not commit full Burp projects, HAR files or packet captures. Extract only the minimum redacted evidence requested by the assignment.

### Pull Request does not link to the Issue

Add `Closes #<issue-number>` or the exact required link in the Pull Request description, then confirm the submission checklist.

## Escalation package

When asking for support, provide:

- intern ID and track;
- assignment ID;
- operating system and tool version;
- exact non-secret error text;
- command or step that failed;
- what you expected;
- what you already checked;
- whether any scope or data concern exists.

Never include passwords, tokens, cookies, private keys or private target addresses in a public support request.
