#!/bin/bash
set -eu
. "$(dirname "$0")/../pmhome.sh"
cat > "apmstack/notes/$today-halvorsen-renewal-call.md" <<NOTE
---
type: meeting
domain: northdock
date: $today
status: open
---
# Halvorsen renewal call

## Decisions
- Hold the carrier portal pilot until the SOC 2 control review closes, decided by [[Elena Voss]]

## Open loops
- [ ] Send Halvorsen the kickback aging numbers, owner me, due $today
- [ ] Confirm the renewal price with [[Hannah Lindqvist]], owner [[Hannah Lindqvist]]
NOTE
