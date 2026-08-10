# Local Lab 1 — Application Mapping and Object Ownership

## Purpose

This localhost-only synthetic web application is used to practise normal workflow mapping, HTTP request/response interpretation, object identifiers, authentication versus authorization reasoning, evidence collection and restrained access-control reporting.

It contains one intentional read-only ownership weakness. It contains no real users, credentials, production data or VCC connectivity.

## Safety boundary

- Run only on the learner's own workstation.
- The service is published only on `127.0.0.1:8088`.
- Use only `learner-01`, `learner-02`, `order-101` and `order-102`.
- The proof threshold is one unauthorised synthetic record read.
- Do not add external targets, high-rate automation, denial of service or destructive actions.

## Start and verify

From this directory run:

```bash
docker compose up --build -d
docker compose ps
```

Wait until the service reports healthy, then open:

```text
http://127.0.0.1:8088
```

The page is **interactive**. Clicking **My orders** or **Get order by ID** must change the output panel. If it does not, do not continue as if the lab is working.

Verify the backend directly:

```text
http://127.0.0.1:8088/health
```

It should return JSON containing `"status": "ok"` and `"synthetic": true`.

If Node.js 18+ is installed, run the supplied end-to-end smoke test while the container is running:

```bash
node smoke-test.mjs
```

A correct lab prints `PASS` and confirms both the normal ownership workflow and the intended synthetic training condition.

## Exercise

1. Select `learner-01`.
2. Click **My orders** and record the normal request/response in the application-mapping workbook.
3. Identify how an order is addressed.
4. Form one hypothesis about server-side object ownership enforcement.
5. Use only the supplied synthetic object identifiers to perform the minimum read-only validation.
6. Record one evidence item and stop when the proof threshold is reached.
7. Write the finding using `templates/vulnerability-finding.md`.
8. Compare the object-by-ID behaviour with `/api/my-orders`, which derives ownership from the selected synthetic identity.

## If the page looks static

1. Confirm you opened `http://127.0.0.1:8088`, not a local HTML file.
2. Run `docker compose ps` and confirm the container is healthy.
3. Open `/health` in the browser.
4. Make sure JavaScript is enabled for localhost.
5. Open browser Developer Tools → Console and Network, click **My orders**, and check for a failed request.
6. Run `node smoke-test.mjs` if Node.js is available.
7. If the smoke test passes but buttons still do not respond, try the current Firefox/Chrome/Edge version without a script-blocking extension for localhost.
8. If the smoke test fails, copy the exact output plus `docker compose ps` into the programme support channel.

## Stop

```bash
docker compose down --remove-orphans
```

A complete submission should distinguish the selected synthetic identity, requested object identifier, server-side authorization decision, supporting evidence and the limits of the test. Mentor ground truth remains outside the public repository.