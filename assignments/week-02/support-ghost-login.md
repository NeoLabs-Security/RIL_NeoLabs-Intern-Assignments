# [W02][IT SECURITY SUPPORT] The Ghost Login — Identity, Recovery & Escalation

## Business Story

The VCC Support desk has opened several authentication-related cases from synthetic users in your assigned pod. Some reports may be ordinary login mistakes. Some are ambiguous. At least one deserves careful security review.

Your job is **not** to decide that every unusual report is an incident. Work the queue as a professional support analyst: verify the user, record facts, preserve useful context, triage the report, escalate suspicious cases to SOC, perform only approved recovery actions and validate the result.

Your Support work is part of the same Week 2 story being investigated by SOC and Grey-Box Pentest. A good SOC escalation should help the SOC analyst narrow the Wazuh investigation without telling them what conclusion to reach.

## Before You Begin

Use the **IT Security Support toolkit repository** for learning material, pod authentication and the live Support queue. Do not store your NeoLabs Access Code, broker session or live runtime manifest in this assignment repository.

1. Read the branded Week 2 case/learning material in the Support toolkit.
2. Read `SUPPORT_BOUNDARIES.md`.
3. Read `docs/week-02/support-ticket-queue.md`.
4. On Windows, run `setup-windows.cmd` once if you have not already prepared the toolkit.
5. Use the pod number and private NeoLabs Access Code delivered through the approved private channel.
6. From the Support toolkit root run:

```powershell
.\neolabs.cmd login
.\neolabs.cmd status
.\neolabs.cmd pod info
.\neolabs.cmd tickets
.\neolabs.cmd targets
```

The `tickets` command refreshes the authenticated broker manifest and displays the queue issued for your **server-assigned pod**. There is no student-controlled ticket-pod selector.

If you need to reopen one displayed case:

```powershell
.\neolabs.cmd tickets --ticket <ticket-id-from-your-own-queue>
```

Use only the endpoints/assets returned for your assigned pod and the authority stated by this assignment/ticket. Reachability is not permission to make changes.

## Your Queue Task

Triage **all tickets published in your Week 2 queue**. For each report, record:

- ticket ID;
- synthetic account reference;
- reported time/window;
- whether the user remembers the login;
- approved device/browser context;
- current access state;
- what is confirmed versus merely reported;
- what Support is authorised to do;
- whether the case remains a routine Support matter or requires SOC escalation.

The queue order differs between pods. Do not assume that a specific ticket number or queue position is the important case.

## SOC Escalation Requirement

When a case justifies security review, create a concise handoff that gives SOC enough information to narrow its Wazuh search:

1. synthetic account reference;
2. reported investigation window;
3. whether the user confirms or denies the login;
4. approved device/browser context;
5. current account/access state;
6. evidence already preserved;
7. actions already taken by Support;
8. the exact question you need SOC to answer.

A suitable question is:

> Please correlate authentication and session events for the supplied synthetic account inside the reported Week 2 window and determine whether the activity matches the user's account of events.

Do **not** write “this is the Ghost Login” as your handoff conclusion. SOC must independently verify what the telemetry supports.

## Objectives

- triage the complete pod-scoped authentication support queue;
- verify synthetic users using the approved procedure;
- distinguish common login mistakes from cases that justify security review;
- preserve timestamps and context before account changes;
- produce a useful evidence-based SOC escalation;
- carry out only approved containment/recovery actions;
- validate legitimate access after the fixed scenario is announced.

## Safety Boundary

- Do not request or store passwords in tickets, screenshots, Slack, email or GitHub.
- Do not clear logs or delete suspicious evidence simply to close a ticket.
- Do not browse another pod's resources.
- Do not change accounts, permissions, firewall rules, services or security controls unless the current ticket/assignment explicitly authorises it.
- If another pod appears anywhere in your queue, stop and contact a mentor.
- Escalate suspected compromise to SOC rather than destroying evidence.

## Deliverables

Submit under `submissions/week-02/support/<github-username>/`:

1. `support-ticket.md` — triage record covering the queue and your reasoning;
2. `account-recovery-record.md` — only authorised recovery/containment work;
3. `escalation-note.md` — the SOC handoff for the case(s) that justified escalation;
4. `validation-checklist.md` — user-facing validation and fixed-release retest notes;
5. `evidence/` — redacted screenshots/approved evidence.

## Submission Workflow

Create a branch named:

`week-02/support/<github-username>-account-recovery`

Open a Pull Request to the central assignments repository, link the assigned Issue when provided and respond to mentor review on the same branch. Do not merge your own PR unless instructed by a mentor.

## Ticket Checklist

- [ ] Week 2 case material and Support boundaries reviewed
- [ ] NeoLabs pod authentication successful
- [ ] Server-issued pod confirmed with `pod info`
- [ ] Pod-scoped queue retrieved with `tickets`
- [ ] Every published ticket triaged
- [ ] User/account verification recorded where required
- [ ] Reported time/window recorded
- [ ] Device/browser context recorded where approved
- [ ] Confirmed facts separated from user report/inference
- [ ] Relevant evidence preserved before account changes
- [ ] SOC escalation completed where justified
- [ ] Handoff gives SOC account + window + context, not a predetermined answer
- [ ] Recovery/containment action was explicitly authorised
- [ ] User access validated
- [ ] Fixed release retested when mentors announce it
- [ ] Secrets/private information removed from submission
- [ ] PR linked to Issue when one was provided
