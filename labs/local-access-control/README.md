# Local Lab 1 — Application Mapping and Object Ownership

## Purpose

This lab provides a synthetic, localhost-only web application for practising:

- normal workflow mapping;
- HTTP request and response interpretation;
- object identifier recognition;
- authentication versus authorization reasoning;
- evidence collection;
- writing a restrained access-control finding.

It contains an intentional read-only ownership weakness. The lab does not contain real users, credentials, production data or VCC connectivity.

## Safety boundary

- Run only on the learner's own workstation.
- The service is published only on `127.0.0.1:8088`.
- Use only the included synthetic users and order identifiers.
- Do not modify the container to target external systems.
- The proof threshold is one unauthorised synthetic record read.
- No high-rate automation, denial of service or destructive action is needed.

## Start

```bash
docker compose up --build -d
```

Open:

```text
http://127.0.0.1:8088
```

Stop and remove the lab:

```bash
docker compose down --remove-orphans
```

## Exercise

1. Choose `learner-01` in the interface.
2. Use the normal **My orders** function.
3. Record the request and response in the mapping workbook.
4. Identify how an order is addressed.
5. Form a hypothesis about object ownership enforcement.
6. Perform the minimum read-only validation using only the listed synthetic objects.
7. Record one evidence item and stop.
8. Write the finding using `templates/vulnerability-finding.md`.
9. Compare the intentionally weak route with `/api/my-orders`, which derives the owner from the selected synthetic session.

## Expected learning, not an answer key

A complete submission should distinguish:

- the synthetic identity selected by the client;
- the order identifier supplied in the path;
- the server-side ownership decision;
- the evidence that supports the conclusion;
- the limits of what was tested.

Mentor ground truth and grading notes must remain outside this public repository.
