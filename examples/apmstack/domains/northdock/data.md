---
type: domain
domain: northdock
updated: 2026-11-03
example: true
---
# Data

Part of the bundled sample. Every tool, report and person named here is invented for the example.

## Tools
- Product analytics: invoice and exception events since January 2025. Good for rates and funnels. No finance data. (source: PM, 2026-11-03)
- Squad dashboards (Capture, Workflow): the numbers each squad reviews weekly. (source: PM, 2026-11-03)
- Finance reports: ARR, churn, clawbacks. Not connected; ask finance. (source: PM, 2026-11-03)

## Where numbers live
- **Touchless rate**: product analytics > weekly report "Touchless". (source: product analytics weekly, 2026-11-03)
- **Exception rate, exception resolution time**: Workflow squad dashboard, cut by reason code and owner. (source: Workflow squad dashboard, 2026-11-03)
- **Capture accuracy, auto-match rate**: Capture squad dashboard. (source: Capture squad dashboard, 2026-11-03)
- **Overpayment rate**: customer audit sample, run by finance twice a year. (source: customer audit sample, 2026-06-30)

## Standing filters
- Exclude sandbox customers and internal test brokerages. (source: metrics definition doc, 2026-08-01)
- Business days exclude weekends and US federal holidays. (source: metrics definition doc, 2026-08-01)

## Traps
- A touch includes comments, so a commented invoice is not touchless even if nobody edited it. (source: metrics definition doc, 2026-08-01)

## Who to ask
- ? Who owns data requests, and where they like to receive them

## Open questions
- ? Touchless rate by customer segment; no such cut exists
