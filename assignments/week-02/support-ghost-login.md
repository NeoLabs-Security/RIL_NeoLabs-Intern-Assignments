# [W02][IT SECURITY SUPPORT] The Ghost Login — Account Recovery & Escalation

## Business Story
Synthetic VCC users are reporting unfamiliar login notifications. Support must verify the user, gather useful information, perform the approved recovery workflow and escalate suspicious cases without destroying investigation evidence.

## Before You Begin

Use the **IT Security Support toolkit repository** for learning material, pod authentication and authorised support-resource discovery. Do not store your NeoLabs Access Code, broker session or live runtime manifest in this assignment repository.

1. Read the branded Week 2 learning pack: `publications/NeoLabs_ITSEC_Support_Week_02_Ghost_Login.pdf` in the Support toolkit.
2. Read `SUPPORT_BOUNDARIES.md` in the toolkit.
3. Set the programme-provided `NEOLABS_LAB_BASE_URL` on your workstation.
4. Use the pod number and private NeoLabs Access Code delivered through the approved private channel.
5. From the Support toolkit root run:

```bash
python3 tools/neolabs.py login
python3 tools/neolabs.py connect
python3 tools/neolabs.py status
python3 tools/neolabs.py targets
```

Use only the endpoints/assets returned for your assigned pod and the authority stated by this Issue/ticket. Reachability is not permission to make changes.

## Objectives
- triage a suspicious-login support ticket;
- verify the synthetic user's identity using the approved procedure;
- distinguish common login mistakes from a possible security incident;
- preserve useful timestamps and context before account changes;
- carry out only approved containment/recovery actions;
- escalate appropriately to SOC;
- validate restored access after the fixed scenario.

## Safety Boundary
- Do not request or store passwords in tickets, screenshots, Slack, email or GitHub.
- Do not clear logs or delete suspicious evidence simply to close a ticket.
- Do not browse another pod's resources.
- Do not change accounts, permissions, firewall rules, services or security controls unless the current ticket/Issue explicitly authorises it.
- Escalate suspected compromise to SOC rather than destroying evidence.

## Deliverables
Submit under `submissions/week-02/support/<github-username>/`:
1. `support-ticket.md`
2. `account-recovery-record.md`
3. `escalation-note.md`
4. `validation-checklist.md`
5. `evidence/`

## Submission Workflow
Create a branch named:

`week-02/support/<github-username>-account-recovery`

Open a Pull Request, link the assigned Issue and respond to mentor review on the same branch. Do not merge your own PR unless instructed by a mentor.

## Ticket Checklist
- [ ] Week 2 learning pack and support boundaries reviewed
- [ ] NeoLabs pod authentication successful
- [ ] Authorised support resources reviewed with `neolabs targets`
- [ ] User/account verified
- [ ] Reported time recorded
- [ ] Device/browser/network context recorded where approved
- [ ] Recent authorised user activity confirmed
- [ ] Suspicious indicators preserved
- [ ] Recovery/containment action approved
- [ ] SOC escalation completed where required
- [ ] User access validated
- [ ] Ticket closure notes completed
- [ ] Secrets/private information removed from submission
