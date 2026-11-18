---
type: domain
domain: northdock
updated: 2026-10-01
example: true
---
# Workflow

## Tracker
- Linear. Team keys: CAP (Capture squad), WRK (Workflow squad). (source: PM, 2026-10-01)

## Story format
Copied from the team template. (source: Linear template "Story", 2026-10-01)

```
# <Persona> can <outcome>

### Goal
- To <what this ships>, so that <who> can <outcome>.

### Background
- <why this matters, what we know and from where, link to the epic or problem>

### Acceptance criteria
1. <Behaviour, named for its outcome>
   a. GIVEN <who I am and the state I am in>
      WHEN <the one thing I do>
      THEN <what I can see or check>
      AND <anything else that must be true>
2. <Next behaviour>
   a. ...

### Resources
1. Figma: <link, if provided>
2. Out of scope: <what this story does not do>
3. <Other links, open questions, anything else provided>
```
- Technical notes: optional last section, for anything only an engineer needs.

## Work levels
- Program (PGM): the strategy for a product area for a half, owned by the PM, approved by Elena. (source: team working agreement, 2026-06-05)
- Feature (FTR): one goal, several stories, often both squads. Linear project. (source: team working agreement, 2026-06-05)
- Story and Bug: Linear issues. (source: team working agreement, 2026-06-05)

## Bug format
(source: Linear template "Bug", 2026-10-01)

```
# <What is broken, for whom>

### Summary
- <what went wrong>

### Impact
- <why it matters: who is affected, how many, how we know, any workaround>

### Steps to reproduce
1. ...

### Actual
1. <what we see>

### Expected
1. <what we should see>

### Resources
1. <Figma, screenshots, logs, links, if provided>
2. <Where it happens, and other details, if provided>
```
- Severity: S1 invoices approved or blocked wrongly; S2 a persona cannot finish their task and has no workaround; S3 everything else. (source: support runbook, 2026-04-12)

## Definition of ready
A story is ready when all of these hold. (source: team working agreement, 2026-06-05)
- It links to a problem statement.
- Acceptance criteria are numbered, with GIVEN / WHEN / THEN cases.
- The cases cover at least: a factored carrier (remit-to differs from carrier), a multi-stop load, and a read-only TMS.
- Any TMS dependency is named, with read or write stated.
- Design is attached if there is UI.
- Engineering has sized it at five days or less.

## Spec format
- One-pager first: problem, evidence, proposal, metric, risks, ask. A PRD is written only after Elena approves the one-pager. (source: team working agreement, 2026-06-05)

## Rituals
- Monday: sprint planning (two-week sprints). (source: team calendar, 2026-10-01)
- Wednesday: customer call review with Customer Success. (source: team calendar, 2026-10-01)
- Thursday: spec review. (source: team calendar, 2026-10-01)

## Approval path
- PM writes the one-pager, Elena approves the problem, Raj confirms feasibility, then Thursday spec review. (source: team working agreement, 2026-06-05)

## Open questions
- ? No written definition of done
- ? No agreed FTR or PGM template; each PM writes their own
