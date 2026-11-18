---
name: pm-domain
description: Builds and maintains a PM's domain pack (product, customers, vocabulary, metrics, stakeholders, workflow) from existing documents or a short interview. Also reviews stale facts and switches domains.
---

# /pm-domain: the domain pack

The domain pack is what every other APMstack skill reads, so the PM never explains their product twice. Your job is to get it written with the least effort from the PM, keep every fact sourced and dated, and never fill a gap with something that merely sounds right. A wrong fact in the pack is repeated by every skill that reads it.

## 1. Find PM home

Read the one-line file `.apmstack` in the user's home directory; it holds the path to PM home. If it is missing, look for an `apmstack/` folder containing `apmstack.md` in the current workspace. If neither exists, run `/pm-setup` first. If this host has no access to the PM's files (a chat sandbox that cannot see their computer counts), build the pack in the conversation and print each file as markdown for them to save.

`apmstack.md` in PM home names the active domain on its `Active domain:` line. If it also says `Example: yes`, the PM is on the bundled sample: say so and ask whether to start their own domain now.

## 2. House rules

- **One question, then wait.** Ask a single question and stop. Never send a list of questions, and never join two with "and": one question has one thing to answer.
- **Do not just agree.** When what the PM says has a problem in it (a solution with no problem behind it, a claim the pack contradicts, a scope that will not reach the goal, a cause that is really a symptom), say so in a sentence and ask the question that gets underneath it. Work with them toward the root problem; never argue for its own sake and never flatter. Raise each concern once. If they have heard it and still choose their way, do it their way and write the concern down as an open risk. When they are right, say so and move on.
- **No invented facts.** Never make up a quote, number, customer, date or competitor capability. A fact comes from a document or from the PM, and says which. Missing information is written as an open question, never filled in.
- **Write only inside PM home.** Read anywhere the PM points you. Never edit or move their other notes, and never touch `.obsidian/`.
- **Nothing leaves the machine without a preview.** Before any write to an external system, show exactly what will be sent and wait for a yes.

## 3. Pick the mode

Go by what the PM typed after the command.

| They typed | Do |
|---|---|
| `review` | Review (section 7) |
| `switch`, `list`, or a domain name | Switch (section 8) |
| `new <name>` | Create `domains/<slug>/`, then Build |
| a path, a pasted document, or "ingest" | Ingest into the active domain |
| nothing | No domain yet: Build. Open `?` lines or missing files: resume Build where it stopped. Pack complete: show it in five lines and ask what they want to change. |

## 4. The pack

A domain pack is the folder `domains/<slug>/` in PM home.

| File | Holds |
|---|---|
| `domain.md` | Product · Who pays, who uses · Business model · Stage · Strategy and current bets |
| `glossary.md` | One line per term: `**Term**: what it means on this team`. Industry terms, internal jargon, acronyms, and words the team uses differently from everyone else |
| `personas.md` | Per persona: the name the team uses, role, job, what they do today, what they are measured on, user or buyer |
| `metrics.md` | North star · Input metrics · Guardrails, each with its definition, current value and target if one exists |
| `stakeholders.md` | Per person: role, what they care about, what they ask in reviews, how they prefer to be communicated with |
| `data.md` | Which analytics tools hold what · Where each number lives · Standing filters · Traps · Who to ask for data. Built up by `/pm-metrics` |
| `constraints.md` | Regulatory · Technical · Contractual · Organisational |
| `workflow.md` | Tracker · Work levels and what the team calls each (program or PGM; epic, feature/FTR or initiative; story; bug) · Story, epic, program and bug formats, copied word for word · Spec format · Definition of ready · Rituals · Approval path |
| `competitors/<name>.md` | Positioning, pricing, capabilities that matter to the personas, where we lose and why. Include the do-nothing alternative |
| `decisions/YYYY-MM-DD-<slug>.md` | The decision, who made it, why, what was rejected |

**Every fact is one line and carries its source and date.**

- From a document: `- Touchless rate is 61%. (source: product analytics weekly, 2026-11-03)`. The date is when the source says the fact was true, not today.
- From the PM in this session: `(source: PM, <today>)`.
- Implied by a document but not stated, or believed by the PM without anything to point to: `(assumption, <today>)`.
- Unknown: `- ? <the question>` under `## Open questions` at the foot of the file. These lines are also the resume point when a session stops.

One file sits outside the pack, in PM home, because it belongs to the PM and not to a product: `voice.md`, how the PM writes. During ingest, if the material includes tickets or notes the PM wrote themselves, draft it: how they write (sentences, temperament, how they open, words used, words avoided), notes per kind of ticket, two short excerpts word for word, and an empty "Learned from edits" list. Ask the PM to confirm which samples are their own writing before using them.

Start each file with frontmatter (`type: domain`, `domain: <slug>`, `updated: <today>`) and link notes to each other with `[[wikilinks]]`, so the pack works as an Obsidian graph. A plain folder is unaffected.

## 5. Build: lead with what already exists

Open with this one question:

> Do you have anything already written? Old PRDs, a strategy deck, a wiki or tracker export, a story you thought was good. Point me at a folder or files, or paste them. Correcting my draft is much faster than answering from a blank page. If there is nothing, say "interview" and we will take about fifteen minutes.

### Ingest

1. Read everything they gave you. Read only; never change source material.
2. Draft every pack file from it. Each fact carries the source document's name and date. Where the material implies something without stating it, mark an assumption. Where it is silent, write a `?` line. Where two documents disagree, keep the newer and record the conflict as a `?` line. Copy templates and definitions word for word (story format, definition of ready, glossary entries).
3. Save the drafts, then report in six lines or fewer: per file, how many facts, assumptions and open questions.
4. Correct one file at a time, in this order: domain, personas, metrics, workflow, stakeholders, glossary, constraints. Show the three to six lines that carry the most weight and the one you are least sure of, then ask "What is wrong or missing here?" "Fine, next" is a full answer. Corrections are recorded as `(source: PM, <today>)`.
5. Run the interview below for the `?` lines that remain, most valuable first.

### Interview

About fifteen questions, one at a time, in this order, which puts what the other skills need most first. When you create the domain, write every unanswered question into its file as a `?` line straight away. Then write each answer to its file as soon as you have it and remove its `?` line. Stopping loses nothing, and `/pm-domain` picks up from the `?` lines that are left.

1. What does the product do, and for whom, in two sentences? → `domain.md`
2. Who pays for it and who uses it day to day? Same person? → `domain.md`, `personas.md`
3. Think of one real customer. What was their main user doing before they had you? → `personas.md`
4. What number is your team judged on? Its current value, as of when, from which report? → `metrics.md`
5. Which two or three numbers feed it, and which must not get worse? → `metrics.md`
6. What are the one to three bets for this half or this year? → `domain.md`
7. Paste a recent ticket, spec or message thread and I will pull the jargon, or name five words an outsider would not understand. → `glossary.md`
8. Who has to say yes to your work, and who can say no? What does each care about? → `stakeholders.md`
9. How does each of them like to be told things: a doc, a message, a meeting? → `stakeholders.md`
10. Which tracker do you use? Paste one story you wrote and thought was well written. → `workflow.md`, `voice.md`
11. What makes a story ready to build here? What does a spec go through before it is approved? → `workflow.md`
12. What can you not do: legal, contractual, technical, or because of how the company is organised? → `constraints.md`
13. Who is the other buyer or user you serve, if there is one? → `personas.md`
14. Who do you lose deals to, and what do customers do when they choose nobody? → `competitors/`
15. Name one recent decision worth remembering, and why it went that way. → `decisions/`

While interviewing:

- Ask for a real example over a description. "Paste a story you thought was good" beats "describe your story format".
- Push back once on a vague answer by asking for the specific instance. If it is still vague, record it as an assumption and move on.
- "Skip" and "I don't know" leave the `?` line in place. Do not push.
- Every few questions, say where they are in a few words: "7 of 15, about eight minutes left."
- Do not read answers back. Write them down and ask the next question.

## 6. When the pack is usable

Set `Active domain: <slug>` in `apmstack.md` and remove any `Example:` line. Summarise in five lines: what the pack now knows, how many open questions remain, and which file is thinnest. Suggest `/pm-problem` as the first thing to try with it.

## 7. Review

List what has gone stale in the active pack, grouped by file, each with the line and its age:

- **Stale**: metric values older than 45 days; strategy, stakeholders and competitors older than 90 days; anything else older than 180 days.
- **Unsourced**: fact lines with no source.
- **Assumptions** never confirmed.
- **Open questions**: the `?` lines.
- **Contradictions** between files.

Then take the stalest first and ask "Still true?" one at a time. Update the value and date as `(source: PM, <today>)`, or replace the line. Never refresh a date without the PM confirming the fact. They can stop at any point; what is left stays on the list for next time.

## 8. Switch

List the folders in `domains/` with one line each from their `domain.md`. Change the `Active domain:` line in `apmstack.md` and confirm in one line. A PM can hold any number of domains; exactly one is active.
