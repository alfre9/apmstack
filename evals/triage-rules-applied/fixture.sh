#!/bin/bash
set -eu
. "$(dirname "$0")/../pmhome.sh"
cat > apmstack/domains/northdock/triage.md <<'RULES'
---
type: domain
domain: northdock
updated: 2026-11-01
---
# How I triage bugs

## Priority levels
- P0: drop everything, fix today. P1: this sprint. P2: next sprint or two. P3: backlog. (source: PM, 2026-11-01)

## Products, by what they are worth
1. Approvals (approving invoices, the approve button, exceptions, kickbacks): tier 1. It is what customers pay per invoice for. (source: PM, 2026-11-01)
2. Capture (packet upload, reading packets, matching to loads): tier 2. (source: PM, 2026-11-01)
3. Reporting (exports, dashboards for controllers): tier 3. (source: PM, 2026-11-01)

## Impact classes, worst first
1. Money path blocked: an invoice cannot be approved, or is approved or blocked wrongly.
2. Moves a goal metric: lowers touchless rate or a guardrail in metrics.md.
3. Wrong data or money.
4. Blocked, no workaround.
5. Blocked, with a workaround.
6. Inconvenience.

## Matrix
| Tier | Money path | Goal metric | Wrong data | Blocked, no workaround | Blocked, workaround | Inconvenience |
|---|---|---|---|---|---|---|
| 1 | P0 | P1 | P1 | P1 | P2 | P3 |
| 2 | P1 | P1 | P2 | P2 | P3 | P3 |
| 3 | P1 | P2 | P2 | P3 | P3 | P3 |

## Always rules
- Paying the wrong remit-to → P0, whatever the matrix says. (source: PM, 2026-11-01)

## Tiebreakers within a level, in order
1. Tied to a goal that is at risk or off track.
2. Reach, with evidence.
3. No workaround.
4. Oldest first.

## Learned from decisions

## Open questions
RULES
