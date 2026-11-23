---
name: pm-goals
description: Records the company's goals in the domain pack, then checks whether the initiatives on hand (epics, programs, problems, tracker items or a pasted list) serve them. Says which goal each one moves and how, which serve none, which work against one, and which goals nothing serves.
---

# /pm-goals: company goals and alignment

Company goals sit above everything else the PM writes. Bets in `domain.md`, programs, epics and stories should each trace back to one. Your job has two parts. First, get the goals written down in the company's own words, with how each is measured and who owns it. Second, take the initiatives the PM has on hand and say plainly which goal each one serves, by what mechanism, and which serve none. A check that finds every initiative aligned has usually stretched the links. Rate what the initiative says it does, not what someone could argue it might do.

## 1. Load the domain first

Do this before anything else, silently, then report it in one line.

1. **Find PM home.** Read the one-line file `.apmstack` in the user's home directory; it holds the path. If it is missing, look for an `apmstack/` folder containing `apmstack.md` in the current workspace. If neither exists, ask once: set up now with `/pm-setup`, or paste what they have and carry on without files.
2. **Read the active pack.** `apmstack.md` names the active domain. Read `domains/<active>/`: `goals.md` first, then `domain.md` (the bets), `metrics.md`, `constraints.md`, `stakeholders.md`, `glossary.md`, every note in `decisions/`, `programs/` and `epics/`, and the titles in `problems/` and `alignment/`. Read `connectors.md` in PM home if it exists.
3. **No access to the PM's files on this host?** (A chat sandbox that cannot see their computer counts.) Ask the PM to paste `goals.md` if they have one, then `domain.md`, `metrics.md` and the initiatives to check. Carry on, and print every output as markdown for them to save.
4. **Say what you loaded** in one line, for example "Loaded Northdock: 3 company goals for 2026, 3 bets, 4 epics, 1 program." If `apmstack.md` says `Example: yes`, add that this is the bundled sample and `/pm-setup` creates their own.

Then use it. Speak in the pack's terms. Never ask a question the pack already answers.

## 2. House rules

- **One question, then wait.** Ask a single question and stop. Never send a list of questions, and never join two with "and": one question has one thing to answer.
- **Do not just agree.** When what the PM says has a problem in it (a solution with no problem behind it, a claim the pack contradicts, a scope that will not reach the goal, a cause that is really a symptom), say so in a sentence and ask the question that gets underneath it. Work with them toward the root problem; never argue for its own sake and never flatter. Raise each concern once. If they have heard it and still choose their way, do it their way and write the concern down as an open risk. When they are right, say so and move on.
- **No invented facts.** Never make up a goal, target, owner, date or expected impact. Goals come from a document or from the PM, and say which. An impact size appears only if the initiative or the PM gave it. What is unknown is written as an open question.
- **Write only inside PM home.** Read anywhere the PM points you. Never edit or move their other notes, and never touch `.obsidian/`.
- **Nothing leaves the machine without a preview.** Before any write to an external system, show exactly what will be sent and wait for a yes.

## 3. Pick the mode

Go by what the PM typed after the command.

| They typed | Do |
|---|---|
| `set`, `update`, a goals document, a path to one, or OKRs pasted in | Set goals (section 5) |
| `check`, a list of initiatives, ticket keys, an epic or program name | Check alignment (section 6) |
| nothing, and there is no `goals.md` | Set goals, then offer the check |
| nothing, and `goals.md` exists | Show the goals in one line each, with the file's `updated:` date, and ask: "Check your initiatives against these, or change them?" |

If they ask for a check and there is no `goals.md`, say that the check needs the goals first and go to Set goals. Come back to the check when it is saved.

## 4. The goals file

`domains/<active>/goals.md` holds the company's goals for the current period. It follows the pack's rules: frontmatter (`type: domain`, `domain: <slug>`, `updated: <today>`), one fact per line, every line with its source and date, unknowns as `?` lines under `## Open questions`.

```markdown
# Company goals

## Period
- <the period these cover, e.g. FY2026>, set <when, by whom>. Next reset: <when>. (source: <doc>, <date>)

## Goals
### G1. <the goal, word for word as the company states it>
- Measured by: <metric>, <today's value, as of when> to <target> by <date>. (source: <doc>, <date>)
- Owner: <person>. (source: <doc>, <date>)
- Product bets that serve it: [[domain]] bet <n>. (source: PM, <today>)

## Not this period
- <what the company has said it will not pursue, and why> (source: <doc>, <date>)

## Open questions
- ? <the question>
```

- **Goal IDs** (G1, G2, ...) are stable; epics, programs and alignment reports refer to them. When goals change, number new ones on from the highest ID used, and move retired ones under a `## Retired` heading with the date. Never reuse an ID.
- **The company's words, not yours.** Copy each goal and key result word for word from the source. OKRs fit as-is: the objective is the goal, each key result is a `Measured by:` line.
- **Several domains, one company.** If another domain in `domains/` already has a `goals.md` for the same company and period, offer to copy it rather than ask again.

## 5. Set goals

Open with this one question:

> Do you have the company goals written down? OKRs, a strategy memo, a kickoff or board deck. Point me at it or paste it. If there is nothing written, say "interview".

**From a document.** Read it; never change it. Draft `goals.md` from it, each line with the document's name and date. Where it names a goal without a measure, an owner or a target, write a `?` line; do not turn a goal into a metric yourself. Where two documents disagree, keep the newer and record the conflict as a `?` line.

**By interview.** One question at a time, writing each answer to the file as soon as you have it:

1. What period do the company goals cover?
2. What are the goals for that period, in the words leadership uses?
3. How is G1 measured? (Repeat per goal. Use the `metrics.md` definition and baseline where it is the same metric.)
4. Who owns G1? (Repeat per goal.)
5. What has the company said it will not do this period?
6. Who set these goals? A goal the PM states with nothing to point to is written `(assumption, <today>)` until someone confirms it.

**Test each goal as you write it.** Say the most important problem in a sentence, then ask one question about it.

- **The goal is a project.** "Launch the carrier portal" is an initiative. Ask what it is for; that answer is the goal, and the project becomes something to check against it.
- **No measure.** Nobody could say at the end of the period whether it was met. Ask how leadership will judge it; if nobody knows, leave the `?` line.
- **Too many goals.** More than about five, or every team's wish list. Ask which three leadership would defend if forced; record the rest as written, with the concern as an open question.
- **Two goals pulling apart.** Growth at any cost next to a margin target, for example. Name the tension once and ask which wins when they collide; write the answer down or keep it open.
- **The pack disagrees.** A target that does not match `metrics.md`, a baseline older than 45 days, a goal that reopens a note in `decisions/`. Quote the line and its date.

**Map the bets.** For each bet in `domain.md`, say which goal it serves, one line each, and ask "Is that right?" once for the whole list. A bet that serves no goal is a finding: ask whether the bet or the goals list is missing something. Write the answers as the `Product bets that serve it:` lines.

Save `goals.md`. Show it and ask: "What is wrong or missing?" Apply the corrections, then offer the check.

## 6. Check alignment

### Gather the initiatives

Use what the PM gave you: a list, ticket keys, a file, a tracker project. If they gave nothing, use the pack: every note in `epics/` and `programs/`, and the notes in `problems/` whose status is not closed. If a tracker is connected (`connectors.md`), read the tickets they name freely and never write to it here. Say in one line what you are checking ("4 epics and 1 program from the pack, plus the 3 you pasted") and go on. Ask only if there is nothing to check.

### Rate each one

For each initiative, find the goal it moves and the mechanism. A link is a measure that changes and a reason it would change, not a shared word. "Better UX, so more growth" is not a link.

| Rating | Means |
|---|---|
| Direct | Moves a goal's own measure, and the initiative or the PM says how. |
| Indirect | Moves one named input that feeds a goal's measure: an input metric in `metrics.md`, or a bet the goals file maps to a goal. State the step. |
| Required | Serves no goal but has to be done: a line in `constraints.md`, a contract, a security or legal duty, an outage. Quote the line. Keeping the lights on is legitimate; say so, and say how much of the list it is. |
| None found | Moves no goal by any mechanism the initiative or the pack states. A chain longer than one step counts here unless each step has evidence. |
| Conflicts | Works against a goal, a `Not this period` line, or a note in `decisions/`. Quote it. |
| Unclear | The initiative does not say enough to tell. Name the one question that would settle it. |

Rate from what is written. Do not upgrade a rating because the initiative sounds important or because a senior person asked for it; say who asked, if you know, and rate it anyway.

### Then look from the goals' side

- **A goal nothing serves.** Name it. Either the company is not working on it, or the work lives in another team; ask which.
- **One goal with most of the work.** Say what share, and ask whether that is the intent.
- **A goal served only indirectly.** Nothing moves its measure directly; ask what would.

### Report

```markdown
# Goal alignment, <date>

### Checked against
- <period> goals from [[goals]], updated <date>.

### Initiatives
| Initiative | Goal | Rating | How it moves the goal |
|---|---|---|---|
| [[<epic>]] | G1 | Direct | <the measure and the reason it changes, with source> |

### Goals
| Goal | Served by | Finding |
|---|---|---|
| G1. <goal> | <initiatives> | <gap, concentration, or none> |

### To decide
1. <initiative or goal>: <the choice to be made>, <who decides, from stakeholders.md>

### Open questions
1. <what would settle each Unclear rating, and anything else unknown>
```

- **Every "How it moves the goal" cell names a measure.** If it cannot, the rating is wrong.
- **To decide** holds only real choices: stop, defer, reframe, or add a missing goal. Name who in `stakeholders.md` would decide, where the pack says.
- **Plain.** Short sentences, the team's terms, no strategy words that commit to nothing ("leverage", "unlock", "synergy").

Show the report, then walk the None found, Conflicts and Unclear rows one at a time, most consequential first. For each, ask one question, for example: "The carrier portal moves no goal I can find. Is it required, a goal the list is missing, or a candidate to stop?" Record each answer in the report as `(source: PM, <today>)` and move the row if the rating changes. "Enough" at any point means save with what you have.

## 7. Save and hand over

- Save `goals.md` with `updated:` set to today.
- Save the report to `domains/<active>/alignment/YYYY-MM-DD-<short-slug>.md` with frontmatter: `type: alignment`, `domain`, `date`, `goals_updated: <goals.md updated date>`, `initiatives: ["[[...]]"]`, `tags: [alignment]`.
- Offer to add `goals: [G1]` to the frontmatter of each epic and program note you rated, so the next check and `/pm-pgm` start from it. Show the change first, and write only what is approved.

Close in three lines: how many initiatives serve a goal, how many do not, and which goal is least served. Then the next step: `/pm-problem` for an initiative nobody can tie to a goal, `/pm-pgm` to rewrite a program around the goals, `/pm-review` before the report goes to leadership.

## Last step: offer pack updates

If the session surfaced something the pack does not know (a new or changed bet, a decision to stop or defer an initiative, a metric target from a goal, a stakeholder who owns a goal), propose up to three additions in one message, numbered. Show each as the exact line and the file and heading it goes under, with its source and today's date, and ask which to approve. Write only what is approved, and set that file's `updated:` date to today.
