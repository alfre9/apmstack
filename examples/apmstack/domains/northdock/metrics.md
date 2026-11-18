---
type: domain
domain: northdock
updated: 2026-11-03
example: true
---
# Metrics

## North star
- **Touchless rate**: 61% of carrier invoices approved with no human touch. (source: product analytics weekly, 2026-11-03)
- Target: 75% by the end of Q1 2027. (source: H2 strategy memo, 2026-07-14)
- Last four quarters: 58%, 60%, 61%, 61%. (source: product analytics quarterly, 2026-10-01)

## Input metrics
- **Capture accuracy**: 96.8% of packet fields read correctly. (source: Capture squad dashboard, 2026-11-03)
- **Auto-match rate**: 88% of packets matched to a load without help. (source: Capture squad dashboard, 2026-11-03)
- **Exception rate**: 39% of invoices raise at least one exception. (source: Workflow squad dashboard, 2026-11-03)
- **Exception resolution time**: median 3.4 business days, p90 11 business days. (source: Workflow squad dashboard, 2026-11-03)

## Guardrails
- **Overpayment rate**: 0.21% of approved spend later clawed back or written off. (source: customer audit sample, 2026-06-30)
- **Carrier days-to-pay**: median 27 days from packet received to approved for payment. Most rate cons say net 30. (source: product analytics weekly, 2026-11-03)
- **Support tickets**: 14 per 1,000 invoices. (source: CS monthly report, 2026-10-31)

## Definitions
- A touch is any human edit, approval click or comment before approval. (source: metrics definition doc, 2026-08-01)
- Business days exclude weekends and US federal holidays. (source: metrics definition doc, 2026-08-01)

## Open questions
- ? Touchless rate by customer segment; no such cut exists
- ? No metric for time carrier reps spend on kickbacks
- ? Whether exception resolution time is measured from when the exception is raised or from when it is first opened
