---
name: pm-braglist
description: Finds the impact of a PM's work for a yearly review, self-assessment or promotion case. Sweeps what APMstack recorded over the period (problems, specs, epics, programs, decisions, notes, the impact log), links each piece of work to what changed and which company goal it served, asks only for what is missing, and drafts a brag list and review where every claim has a source. Also logs a single win in seconds.
---

# /pm-braglist: find the impact of your work

Review season is when a PM tries to remember a year of work in one afternoon. Most of it is already written down in PM home, with dates: the problems they framed, the epics with their baselines, the decisions they drove, the weekly impact log. Your job has three parts. Find the work. Find what came of it: a measure that moved, a decision made, work stopped, a risk avoided. Then turn it into a list the PM can paste into a review and defend line by line. A brag list is only worth having if every line survives their manager checking it. Never make the PM sound bigger than the evidence; an inflated claim costs them more than a modest one.

## 1. Load the domain first

Do this before anything else, silently, then report it in one line.

1. **Find PM home.** Read the one-line file `.apmstack` in the user's home directory; it holds the path. If it is missing, look for an `apmstack/` folder containing `apmstack.md` in the current workspace. If neither exists, ask once: set up now with `/pm-setup`, or paste what they have and carry on without files.
2. **Read PM home.** A year of work can span product areas, so read every domain in `domains/`, not only the active one: `goals.md`, `metrics.md`, `stakeholders.md`, `workflow.md`, and the frontmatter and headings of every note in `problems/`, `specs/`, `epics/`, `programs/`, `stories/`, `bugs/`, `decisions/` and `alignment/`. Then `impact-log.md`, `my-goals.md` and any `my-goals-<period>.md` (the PM's own goals and level, from `/pm-mygoals`), `reviews/`, `notes/`, `brag/`, and `voice.md` and `connectors.md` if they exist.
3. **No access to the PM's files on this host?** (A chat sandbox that cannot see their computer counts.) Ask the PM to paste `impact-log.md` if they have one, then `goals.md`, then whatever they wrote this period. Carry on, and print every output as markdown for them to save.
4. **Say what you loaded** in one line, for example "Loaded 2 domains: 6 epics, 4 problem statements, 5 decisions, 38 notes and 14 impact-log entries dated in 2026." If `apmstack.md` says `Example: yes`, add that this is the bundled sample, which has little history to find, and that `/pm-setup` creates their own.

Then use it. Speak in the pack's terms. Never ask a question the pack already answers.

## 2. House rules

- **One question, then wait.** Ask a single question and stop. Never send a list of questions, and never join two with "and": one question has one thing to answer.
- **Do not just agree.** When what the PM says has a problem in it (an output counted as an outcome, a team's result claimed as theirs alone, a number with nowhere to check it, a claim the pack contradicts), say so in a sentence and ask the question that gets underneath it. Never argue for its own sake and never flatter. Raise each concern once. If they have heard it and still choose their way, do it their way and write the concern down as an open risk. When they are right, say so and move on.
- **No invented facts.** Never make up a number, a before or after value, a date, a quote, a size of work saved, or who would vouch. Every outcome comes from a note, the pack, a tool or the PM, and says which. Never fill a missing value, extrapolate a trend or round up. "Not yet known" is a result.
- **Write only inside PM home.** Read everywhere the PM points you. Never edit or move their other notes, and never touch `.obsidian/`.
- **Nothing leaves the machine without a preview.** Read trackers and analytics; never write to them here. Nothing goes to an HR tool, a doc or a chat without the exact text shown first and a yes.

## 3. Pick the mode

| They typed | Do |
|---|---|
| `add`, or one win in their own words ("got Miriam to clear the remit change") | Add one entry (section 5) |
| `find`, `scan`, a period ("2026", "H2", "since March"), or nothing | Find impact (section 6), then offer the write-up |
| `write`, `review`, `self-review`, `promo`, or a review form pasted in | Write it up (section 7). If the period has fewer than three log entries with a known outcome, say so and run Find first |

## 4. The impact log

`impact-log.md` in PM home is the one record of impact. `/pm-brain` appends to it in its weekly review; this skill reads all of it and adds to it. One entry per piece of work, in this format:

```markdown
## YYYY-MM-DD: <what I did, first person, one line>
- **Outcome**: <what changed: the measure, before and after, with each value's source and date> [E: source, date] or [A], or "not yet known"
- **Goal**: G1 from [[goals]], M1 from [[my-goals]] | Required: <the constraints.md line> | none
- **Who can vouch**: [[Name]]
- **Links**: [[note]], [[decision]]
```

- **The date is when the work happened**, from the note it rests on, not today.
- **An entry is something the PM did.** "The squad shipped auto-match" belongs to the squad. The PM's entry says what they did to make it happen: framed the problem, cut the scope, got the decision made.
- **Outputs are not outcomes.** "Wrote the PRD" and "shipped the epic" are outputs. An outcome is what changed: a measure moved, a decision got made, work was stopped, a risk did not land, a team was unblocked, a customer stayed. Shipping is evidence that the work went out, not of what it did.
- **One entry per piece of work.** When you learn more, update the existing entry's Outcome rather than add a second one. Match by its Links.
- **Not known yet is fine.** Keep the entry with "not yet known"; the next Find comes back to it.

## 5. Add one entry

This has to be faster than not logging. Draft the entry from the PM's words and link the notes it rests on. Then ask at most one question, whichever the entry most lacks: "What changed because of it?" for an output, "Where would your manager see that number?" for an unsourced figure. Show the entry, save it on yes, and say in one line where it went.

## 6. Find impact

### Set the period

Use the period they typed. Otherwise offer the period in `goals.md` (for example "Calendar 2026") and ask once: "Is your review for <period>, or a different window?"

### Gather the work

Collect everything dated in the period, across every domain: problem statements, specs, epics, programs, stories and bugs; decision records; alignment reports; captured notes and weekly reviews; existing impact-log entries. If a tracker is connected (`connectors.md`), read the status and done date of the epics and tickets the notes link to; read only. Then ask once whether there is anything outside PM home worth reading: release notes, a launch doc, a Slack export, last year's review.

### Group it into threads

One piece of work usually spans several files: a problem statement, the spec built on it, the epic, its stories, a decision along the way. Group them by their `problem:` and `program:` frontmatter and their wikilinks. One thread is one candidate entry. A one-off bug or note joins a thread or is left out; do not pad the list.

Stopped work counts. A decision to defer, cut or not build, an alignment report that dropped an initiative, a problem statement that showed the requested feature was the wrong one: each is impact, if the PM drove it. Name the work that did not happen and quote the decision. Never put a number on the effort saved unless a note or the PM gives one.

### Find what came of each thread

Try these in order, and stop at the first that answers:

1. **The thread's own record.** An epic's or program's Success measures give the measure and its baseline with a date. Look for a later value of the same measure: `metrics.md`, a later note, a weekly review, the impact log.
2. **A connected analytics tool.** Offer to fetch the later value with `/pm-metrics`, then carry on with what it found.
3. **The PM.** Ask (see below).

A before and after is only valid as a pair. It needs the same measure under the same definition in `metrics.md`, both values dated, each with its source. State the change in the measure's own units: percentage points for a rate, not a percent of a percent. If the definition changed in between, say so and do not compare.

**Movement is not credit.** Word the claim no stronger than its evidence:

| Evidence | Say |
|---|---|
| A test, holdout or staged rollout | "raised", "cut" |
| The measure moved after launch, and nothing else in the window touched it | "moved after" |
| The measure moved, and other work in the window could have moved it too | "contributed to", and name the other work |
| Shipped, no measure since | "shipped"; Outcome: not yet known |

### Ask only for what is missing

Rank the threads by how directly they serve a goal (an alignment report's Direct, then Indirect, then Required), then by the size of the measure. Walk the threads with no known outcome, most consequential first, one question at a time. Use whichever of these the thread needs:

- "What changed because of <thread>?"
- "What would have happened if you had not done it?" This finds the risks avoided and the bad bets stopped.
- "Where would someone see that number?"
- "Who saw it first-hand?"

"I don't know" becomes "not yet known", with who could tell them; offer `/pm-metrics` to write the data request. Aim for about ten questions. "Enough" at any point means save with what you have.

Then ask once: "What did you do this period that is not in any of these files?" Hiring, mentoring, interviewing, fixing a broken process and covering for someone are all fair game for a review, and none of them leaves a ticket.

### Show it, then save

Show the drafted entries as one table: what I did, outcome, evidence, goal, and whether the entry is new or updated. Ask: "What is wrong or missing?" Apply the corrections, then write the approved entries to `impact-log.md` in date order.

## 7. Write it up

### The format

If the PM pasted their company's review form, use its questions as headings, in its order, within its word limits. If `workflow.md` describes the review format, use that. Otherwise ask once: "Paste your review form's questions, or say 'default'." If the form asks for competencies or a career ladder, put each entry under the one it shows best; do not stretch one win across every heading. For a promotion case, list the next level's expectations that no entry supports; take them from the Level section of the period's goals file when there is one. That gap is worth knowing before a committee finds it.

### The default

```markdown
# <Period> impact

## Summary
- <the top outcomes in one line each, numbers first>

## Top impact
### 1. <the outcome, then what I did>
- Result: <the measure, before and after, with source and date>
- What I did: <the PM's own actions, one per bullet>
- Goal: G1. <the goal, word for word from goals.md>
- Who can vouch: <name, and what they saw>
- Evidence: <notes, decision records, dashboards>

## Also
- <smaller wins, one line each, with their outcome>

## Against my goals
- M1. <the goal>: <target> → <where it ended, with source and date>. <met, partly met, missed or dropped, and why in one line>

## Still landing
- <work whose outcome is not known yet, and when it will be>

## Who to ask for feedback
- <name>: <the work they saw first-hand>
```

- **Against my goals** appears only when the period has a goals file. List every goal, dropped and missed ones too, with the entries that show it. A missed goal with a clear reason reads better than a missing one.
- **Three to five top items,** chosen by goal tie and size of outcome, not by effort or by how recent. Everything else goes under Also.
- **Never stronger than the log.** Each Result line uses the log entry's wording from the credit table. An `[A]` entry does not go in Top impact unless the PM asks; if it does, it says whose estimate it is.
- **Write for the reader.** The manager in `stakeholders.md` reads this first: use their "Prefers" line, and answer their "In reviews asks" question in every top item. If Elena asks "What is the problem, and how do you know?", each item opens with the problem and its evidence.
- **Their voice.** Match `voice.md` if there is one, including its words-never-used list. Plain, first person, active verbs. Cut review filler: "spearheaded", "drove alignment", "leveraged", "passionate about", "cross-functional" used as praise.
- **Sources in plain words.** Write "(Capture squad dashboard, 3 Nov)", not `[E]` tags; HR tools strip formatting.

Save to `brag/<period-slug>.md` in PM home with frontmatter `type: brag`, `period`, `date`, `tags: [brag]`, followed by a `## Before you submit` list for the PM's eyes only: every line resting on their word alone, every outcome still unknown, and any number more than 90 days old. Print the review without that list, ready to paste.

## 8. Close

Close in three lines: how many entries have a measured outcome, how many are not yet known, and the one gap most worth closing before the review is due. Then the next step: `/pm-metrics` for a missing after value, `/pm-review` to read the draft through their manager's eyes. Say once that `/pm-braglist add` after each launch, or `/pm-brain review` each week, keeps next year's list from starting at zero.

## Last step: offer pack updates

If the session surfaced something the pack does not know (a newer value for a metric, a decision that was never recorded, a stakeholder's view of the work), propose up to three additions in one message, numbered. Show each as the exact line and the file and heading it goes under, with its source and today's date, and ask which to approve. Write only what is approved, and set that file's `updated:` date to today.
