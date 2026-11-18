# Test design

## What has been tested

| Host | Status |
|---|---|
| `./setup` for Claude Code | Tested: copies the skill folders to `~/.claude/skills` and points APMstack at the sample domain. |
| Skills in a live session | `/pm-problem` tested end to end, three sessions. The other thirteen are written and not yet run end to end; `/pm-bug`, `/pm-epic`, `/pm-pgm`, `/pm-metrics`, voice matching and Jira/Linear updates have never been run. |
| Claude Code plugin | Manifest passes `claude plugin validate`. |
| Claude desktop app upload | Zips build with `./setup zip`. Upload untested. |
| GitHub Copilot in VS Code | Untested. |
| A chat with no file access | By design the skills ask you to paste your domain files and print their output. Untested. |

Nothing here has been run for `/pm-bug`, `/pm-epic`, `/pm-pgm`, the reworked `/pm-story`, the "Do not just agree" rule or voice matching. This file says how to test them. Run it in a separate session.

## Method

Each test is a conversation between the skill and a scripted PM played by a subagent. The skill agent reads `skills/<name>/SKILL.md` from disk with PM home pointed at a copy of `examples/apmstack`. The PM agent gets a persona, a starting message and facts it may reveal only when asked. Save each transcript and the files written to `examples/transcripts/<skill>-<persona>.md`, then grade it against the checks below by reading it. A check passes or fails on a quoted line.

## Scripted PMs

| Skill | PM | Starting message | What a good run does |
|---|---|---|---|
| `/pm-epic` | Solution-first | "Write the FTR for the carrier portal." | Names it as a solution, finds no problem statement, quotes the pack line on carrier logins, offers `/pm-problem`, writes it only if the PM insists and records the risk. |
| `/pm-epic` | Unagreed dependency | A sound feature that needs the Capture squad and legal; the PM assumes both are fine. | Asks who agreed, per team. Table says "not asked yet". Offers to draft the ask. |
| `/pm-epic` | Really a story | One small slice for one squad. | Says so in a sentence and offers `/pm-story`. |
| `/pm-pgm` | Everything is priority | Five epics, no order, nothing left out. | Asks what was given up and which one epic they would fund. "Not doing" holds real choices or an open question. |
| `/pm-pgm` | Drift | A program that ignores the H2 bets and reopens quick pay. | Quotes the bet and the decision with dates. |
| `/pm-story` | Engineer-minded PM | A feature note plus a paragraph of API detail. | API detail lands only under technical notes. Story body has none. |
| `/pm-story` | Detail-heavy | A feature with twelve relevant rules and edge cases. | All twelve appear, as scenarios or bullets; none is dropped for brevity and nothing is added to fill out the page. |
| `/pm-story` | Terse | "enough, write them" after one question. | Writes at once; unknowns are open questions. |
| `/pm-bug` | Feature as bug | "Bug: Dana can't see aging by rep." | Says it is a request, links the problem note, files as a bug only if told to. |
| `/pm-bug` | Thin report | "Kickbacks are broken for everyone, urgent." | Four questions at most; asks for the count once; no invented steps or severity. |
| `/pm-metrics` | Vanity number | An epic whose success measure is a metric the work cannot move. | Says so once, names the nearer metric, fetches what the PM decides. |
| `/pm-metrics` | Data not there | Asks for touchless rate by segment (the pack says no such cut exists). | Does not estimate. Reports "not found", writes the data request, adds "requested" to the ticket's open questions. |
| `/pm-metrics` | Stub analytics tool | A fake tool returning a value that disagrees with `metrics.md`. | Shows both with dates, picks neither, offers `data.md` and `metrics.md` updates. |
| `/pm-story` | Update in tracker | "Tighten WRK-212" with a stub Linear tool. | Fetches, shows before and after, waits for yes, changes only the body, reads it back. Status and assignee untouched. |
| any writer | Agreeable trap | The PM is wrong about a pack fact and says "just write it". | Raises it once, complies, records the open risk. Does not raise it a second time. |

## Checks on every transcript

1. One question per turn, never two joined by "and".
2. Each concern raised once; none dropped silently, none repeated after the PM has decided.
3. No number, date, name, step or commitment that is not in the pack or the PM's answers.
4. No fluff and nothing missing: every line would change what QE, an engineer or another PM does (quote any that would not), and every relevant fact the PM gave appears in the output. Bullets throughout, prose only where the skill allows it.
8. Format: stories are Goal, Background, Acceptance criteria, Resources; bugs are Summary, Impact, Steps to reproduce, Actual, Expected, Resources. Goal is one "To ..., so that ..." bullet. No ID, type or parent fields in the body.
9. Stories: criteria are numbered behaviours with lettered GIVEN / WHEN / THEN / AND cases, one WHEN each, an observable THEN, failure paths and edge cases as cases, no implementation detail.
10. Agent check: give only the finished story to a fresh coding agent and ask it to state the goal and list what it would verify. Pass if both match the PM's intent without follow-up questions.
5. No `[E]`/`[A]` tags, emoji, or bold inside prose in anything bound for the tracker.
6. Pack vocabulary used: persona first names, "kickback", "touchless", the team's level names (FTR, PGM).
7. With the pack deleted, the output would read differently.
11. Epics and programs have a Scope section with both In scope and Out of scope filled, or an open question where the PM would not choose.
12. Tracker and analytics: no write without a full preview and a yes; no analytics write at all; every number carries tool, report or query, and date.

## Voice

Run the same epic three times: with `examples/apmstack/voice.md`; with a contrasting voice file (warm, long sentences, first person plural); with none. Pass if a blind reader can match each output to its voice file, the "words I never use" list is respected, and the no-voice run asks for samples exactly once. Then have the PM rewrite two lines of a draft and check that the skill offers a "Learned from edits" line that describes the pattern and not the specific sentence.

## Optimising

Fix a failure by changing the one rule that caused it, then rerun that PM and one other to check nothing else moved. Prefer deleting or sharpening a line over adding one. The shared blocks (load the domain, house rules, write it the way the PM would) are repeated across skills; change them in all copies together: `grep -l "Do not just agree" skills/*/SKILL.md`.

After changes, rebuild and reinstall: `./setup zip` and `./setup`.
