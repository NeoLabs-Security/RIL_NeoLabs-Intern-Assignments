# NeoLabs Grey-Box Penetration Testing Intern Toolkit

The **NeoLabs Grey-Box Penetration Testing Intern Toolkit** is the shared learning, practice and technical enablement repository for authorised web application and API security testing through the VCC Security Lab.

It contains NeoLabs-branded learning materials, safe tool configurations, synthetic practice applications, testing checklists, evidence templates and reporting resources. Official weekly assignments, live pod addresses, credentials, mentor ground truth and student submissions belong in the restricted central assignments workflow—not here.

## Start here

1. Read `RULES_OF_ENGAGEMENT.md`.
2. Follow `LEARNING_PATH.md`.
3. Use `docs/README.md` as the complete documentation index.
4. Practise first with `labs/local-access-control/` and run its smoke test before relying on the lab.
5. Use the scope validator, safe Burp workflow, approved restricted discovery helper and reporting templates during assigned work.
6. Treat the exact target issued in the assignment as the only authorised target.

## Version 1 contents

- professional scope, Rules of Engagement, stop conditions and proof thresholds;
- HTTP, browser, proxy and API foundations;
- Burp Suite Community workflow and exact-scope guidance;
- application mapping and grey-box methodology;
- authentication, session and authorisation testing;
- input validation, business logic and API security;
- restricted low-rate discovery and exact-target validation;
- evidence, finding, pentest and retest templates;
- interactive localhost-only synthetic practice application with a student-runnable smoke test;
- troubleshooting and capstone material;
- repository safety checks that reject credentials, live target material and unsafe container settings.

## Safety boundary

- Test only the exact target assigned in writing by NeoLabs.
- Never scan public networks, neighbouring pods or infrastructure not listed in the Rules of Engagement.
- Stop when the approved proof threshold is reached; do not establish persistence, exfiltrate data or disrupt service.
- Use synthetic accounts and data only.
- Never commit credentials, tokens, private URLs, Burp project files containing live traffic or unredacted evidence.
- A local change to a target label must never grant access to another VCC pod.

## Release status

The Version 1 student toolkit is on `main` and is ready for onboarding, local practice and supervised VCC assessments. Live VCC work still requires an operator-issued assignment, exact target, synthetic account, testing window and approved scope.
