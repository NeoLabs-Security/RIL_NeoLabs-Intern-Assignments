# Week 05 — IT Support ticket and containment / <GitHub username>
**Scenario:** w05-poisoned-upload · **Assigned pod:** pod-0X  
**Incident / ticket:** INC-W05-... · **Authorized UTC window:** <start–end>  
**Requester/owner (role, no private user details):** <mentor/SOC>

## Problem report and triage
**Reported issue:** <synthetic upload accepted unexpectedly>  
**Source Pentest event ID / request ID:** <IDs>  
**Wazuh SOC alert / rule 100191 indexed?:** <yes/no + evidence>  
**Source upload ID:** <opaque 32 hex>  
**Filename, declared MIME, detected MIME:** <values>  
**SHA-256:** <digest>  
**Pre-change status:** <active or quarantined>  
**Time/evidence preserved:** <UTC>

## Approval and action
**Decision-maker/approval recorded at:** <mentor role and UTC>  
**Incident reference verified with mentor:** <yes/no>  
**Containment action:** <selected exact assigned-pod upload; manual confirmed quarantine>  
**Response state:** <quarantined or failed>  
**Containment event ID:** <UUID>  
**Containment request ID:** <ID>  
**After-action inventory state:** <quarantined or not verified>

## SOC confirmation
**Rule 100193 indexed with original quarantine event ID:** <yes/no/not verified>  
**Any discrepancy / escalation:** <details>

## Recovery and retest
**Fixed-state mismatched JPG rejected 415:** <confirmed by Pentest/mentor event ID or pending>  
**Normal valid PNG accepted 201:** <confirmed by Pentest/mentor event ID or pending>  
**Service health / authorized user impact:** <read-only verification>

## User-facing update and knowledge-base note
<Concise non-secret status update, prevention: content-signature checks, isolation, audit trail>

## Closure / handoff
**Closure decision:** <resolved / pending SOC / escalated>  
**Remaining risks:** <limitations>  
**Evidence filenames:** <sanitized relative links; no uploaded binary or credential>
