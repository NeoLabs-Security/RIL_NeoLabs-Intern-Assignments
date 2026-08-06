# NeoLabs Grey-Box Testing Query and Command Reference

This reference supports authorised VCC Security Lab assessments. It is not a general scanning or exploitation cheat sheet. Every command must use the exact operator-issued target and remain within the Rules of Engagement.

## Before using a command

1. Confirm `RULES_OF_ENGAGEMENT.md` has been read.
2. Load the operator-issued target configuration.
3. Run `python scripts/validate_target.py`.
4. Confirm the assignment ID, hostname, scheme and port.
5. Record the command and timestamp in the testing journal.

## HTTP inspection with curl

Use placeholders rather than real secrets in saved notes.

```bash
curl --silent --show-error --include \
  --request GET \
  "https://AUTHORIZED_HOST/approved-path"
```

For an operator-issued bearer token, load it from a protected local environment variable and never echo it:

```bash
curl --silent --show-error --include \
  --header "Authorization: Bearer ${VCC_TOKEN}" \
  "https://AUTHORIZED_HOST/api/approved-resource"
```

Do not add `-k` merely to bypass certificate errors. Fix the approved lab certificate trust using the troubleshooting guide.

## JSON formatting with jq

```bash
curl --silent "https://AUTHORIZED_HOST/api/approved-resource" | jq '.'
```

Select fields without saving secrets:

```bash
jq '{id, status, owner_id}' response.json
```

List keys:

```bash
jq 'keys' response.json
```

Filter a synthetic object:

```bash
jq '.items[] | select(.id == "synthetic-001")' response.json
```

## Comparing responses

Save redacted response bodies only:

```bash
diff -u allowed-response.redacted.json denied-response.redacted.json
```

Useful comparison questions:

- Did the status code change?
- Did the body expose a restricted field?
- Did server-side state change?
- Was a correlation ID returned?
- Did the response reveal object existence?

## Browser Developer Tools

Use the Network panel to inspect:

- request method and path;
- query parameters;
- request and response headers;
- status code;
- initiator;
- timing;
- response preview;
- storage and cookie attributes.

Never export a full HAR from a live VCC assignment into the public toolkit repository. Store restricted evidence only in the approved assignments workspace.

## Burp Suite Community

Approved primary tools:

- Proxy and HTTP history for observing normal traffic;
- Target scope for exact-host control;
- Repeater for one controlled request variation at a time;
- Decoder for non-secret synthetic data transformations;
- Comparer for redacted request and response differences.

Do not enable broad automated crawling or send out-of-scope requests. Intruder use must be explicitly authorised and bounded by a supplied tiny input set and request ceiling.

## Restricted discovery

Use only the provided wrapper:

```bash
bash scripts/safe-nmap.sh
```

The wrapper fixes the target and low-rate profile and does not accept learner-supplied flags. Do not replace it with broad network scans.

## Evidence redaction

Replace sensitive values with labels:

```text
Authorization: Bearer [REDACTED]
Cookie: session=[REDACTED]
Host: [ASSIGNED_VCC_HOST]
User: [SYNTHETIC_LEARNER_A]
```

A short hash or evidence ID may be used for correlation when approved, but never store the complete credential.

## Git workflow for submissions

```bash
git checkout -b submission/week-N-short-title
git status
git add submissions/week-N/
git commit -m "Submit week N grey-box assessment"
git push -u origin submission/week-N-short-title
```

Open a Pull Request and link the assigned Issue. Do not commit Burp project files, cookies, tokens, private URLs or raw evidence.

## Common command mistakes

- using an unvalidated target;
- copying a command from the internet with unknown flags;
- disabling TLS verification instead of fixing trust;
- putting tokens directly in shell history;
- saving unredacted responses in Git;
- using loops or concurrency without written permission;
- treating tool output as a confirmed finding.
