# APMstack

AI skills that do an associate PM's groundwork, then ask you the questions a good one would.

They learn your product, customers, company goals and team formats once, then interview you before writing problem statements, specs, programs, epics, stories and bugs. Everything is plain markdown in one folder you own. Works in Claude Code, the Claude desktop app and GitHub Copilot in VS Code.

## What it does

You bring:

> We need an exceptions aging dashboard for controllers, by carrier rep. I need a problem statement so Elena approves it.

Ten questions later you have a problem statement that says the dashboard rests on one lost deal, names two possible root causes, tags every line as evidence `[E]` or assumption `[A]`, and gives you one afternoon's test to tell the causes apart.

## Get started

About twenty minutes from install to your own first problem statement. You can stop after any step.

### 1. Install

**Claude Code** (terminal, or the Code tab of the Claude desktop app)

```sh
git clone https://github.com/alfre9/apmstack && ./apmstack/setup
```

This copies the skills to `~/.claude/skills` and, if you have no PM home yet, points APMstack at a sample company. Open a new session so the skills load.

**Claude Code plugin**

```
/plugin marketplace add alfre9/apmstack
/plugin install apmstack@apmstack
```

Commands then carry a prefix: read every `/pm-x` below as `/apmstack:pm-x`. The plugin does not install the sample, so skip to step 3.

**Claude desktop app or claude.ai** (no terminal)

Download the zips from the [latest release](https://github.com/alfre9/apmstack/releases/latest). In the app: Customize > Skills > + > Upload a skill, once per zip. Upload all of them; if you only want a few, start with `pm`, `pm-setup`, `pm-domain` and `pm-problem`. Then skip to step 3.

In a plain chat the skills cannot see your files, so they ask you to paste your domain files and print what they write for you to save. To keep a PM home on disk, use the Code or Cowork tab.

**GitHub Copilot in VS Code** (untested so far)

```sh
git clone https://github.com/alfre9/apmstack && ./apmstack/setup copilot
```

### 2. Try it on the sample

Setup points APMstack at Northdock, a fictional freight-invoicing company with a full domain pack: personas, metrics, company goals, stakeholders, competitors and past decisions. Try it before you build your own, so you see what a filled pack does.

Open a new session and type:

```
/pm-problem We need an exceptions aging dashboard for controllers, by carrier rep. I need a problem statement so Elena approves it.
```

Answer as if you were Northdock's PM; make up whatever you like. Say "enough, draft it" when you have seen enough.

Two more worth a look while you are on the sample:

- `/pm-goals` shows Northdock's three 2026 goals. Then try `/pm-goals check carrier portal, SOC 2 control review, aging dashboard` and see which ones it says serve no goal.
- `/pm-review`, then paste a paragraph proposing anything. It tells you what Elena (CPO) and Raj (VP Engineering) will ask before you are in the room.

### 3. Make it yours

```
/pm-setup
```

Three questions at most. It picks where your notes live (it offers an `apmstack/` folder inside your Obsidian vault if you have one), notes which tools are connected without writing to any of them, and hands you straight to `/pm-domain` to build your first domain pack.

**Give it documents rather than answering from scratch.** `/pm-domain` opens by asking what you already have: old PRDs, a strategy deck, OKRs, a wiki or tracker export, a story you thought was good. It drafts the whole pack from them, then you correct one file at a time. That is much faster than the interview (about sixteen questions, fifteen minutes). Stop any time; it picks up where it left off.

If the company goals did not come up, record them next:

```
/pm-goals set
```

Paste the OKRs or strategy memo. Each goal gets a stable ID (G1, G2) that programs, epics and reviews refer back to.

The sample stays in `~/apmstack-example`. Delete it whenever you like.

### 4. Connect your tools (optional)

Every skill works by paste. Connectors make it faster: `/pm-story` can rewrite a Linear ticket in place, `/pm-metrics` can pull a baseline from your analytics tool.

```
/pm-connect
```

It finds the tools connected to this session, asks how you want each one used, and explains how to connect the common ones (Jira, Linear, Notion, Slack). Nothing is ever sent to a tool without a preview and your yes.

### 5. Put it on a schedule (optional)

Let the morning brief and the Friday review run on their own. Add `unattended` to the command and the skill asks you nothing: it reads, writes only inside PM home, sends nothing to any tool, and saves each question or change that needs your yes to `inbox.md`. Your dashboard lists those items, and `/pm-brain inbox` goes through them with you, one at a time.

**Claude desktop app** (runs every day, can read your files)

1. In the Code tab, click **Scheduled**, then **New task**.
2. Name it `pm-dash`. For what Claude should do, type `/pm-dash unattended`.
3. Open **Advanced settings** and turn on **Only on this computer**. Pick your PM home as the folder.
4. Choose **Weekdays** and a time before you start work, then **Create**.
5. Click **Run now** once. Choose "always allow" for each prompt, so later runs don't stop to ask.

Make a second task the same way with `/pm-brain weekly unattended`, set to **Weekly** on Friday afternoon. Tasks run while the app is open and your computer is awake; a missed run catches up once.

**In a Claude Code session**

```
/loop 2h /pm-dash unattended
```

This refreshes your brief every two hours while that session stays open, for up to seven days.

With the plugin install, type `/apmstack:pm-dash unattended` and `/apmstack:pm-brain weekly unattended` instead. Cloud routines (`/schedule`) don't fit: they start from a fresh copy of a git repo and can't see PM home on your computer.

## How the skills fit together

Each skill reads what the others wrote, so the order matters. Three common paths:

**A new idea, from request to tickets**

1. `/pm-goals check <the idea>`: does it serve a company goal at all?
2. `/pm-problem`: get from the request to the real problem. `/pm-spec`, `/pm-epic` and `/pm-story` push back if this step is missing.
3. `/pm-spec`: a one-pager, PRD or PR-FAQ in your team's format, to get the decision.
4. `/pm-review`: hear what each stakeholder will ask, the day before the meeting.
5. `/pm-epic`: once it is approved. Goal, bet, scope, stories, who else has to agree.
6. `/pm-metrics`: the baseline and success measure, or a data request when the numbers are not there.
7. `/pm-story`: slice it into stories with Gherkin acceptance criteria, checked against your definition of ready.

**Planning a quarter or a half**

1. `/pm-goals set` with this period's OKRs.
2. `/pm-pgm`: the program for your area. Outcomes, which epics, in what order, what is left out.
3. `/pm-goals check`: which epics serve a goal, which serve none, and which goal nothing serves.
4. `/pm-review` before it goes to leadership.

**Your year, from goals to review**

1. `/pm-mygoals set` at the start of the year or half: your goals, each tied to a company goal and to what your level expects. They show on `/pm-dash`, and `/pm-mygoals check` keeps their status honest each month.
2. `/pm-brain weekly` every Friday through the year. It keeps `impact-log.md` up to date.
3. `/pm-braglist add <a win>` the day something lands, so you don't have to remember it in December.
4. `/pm-braglist 2026`: it sweeps everything APMstack recorded that year, ties each piece of work to what changed and which goal it served, and asks only for what is missing.
5. `/pm-braglist write`: a review draft where every claim has a source your manager can check.

**Any day:** `/pm-dash` in the morning for your brief and the three things to do first, `/pm-bug` when something breaks, `/pm-triage` when the bug queue needs ranking, `/pm-compete <name>` before a deal review, `/pm-brain` to file meeting notes or ask "what do we know about X". Not sure which skill? Type `/pm` and say what you are trying to do.

## The skills

| Command | Use it to | Try |
|---|---|---|
| `/pm` | Not sure? Say what you're doing and it picks the skill. | `/pm I need Raj to agree to the portal` |
| `/pm-setup` | Pick where your notes live (Obsidian works) and start your first domain. | `/pm-setup` |
| `/pm-domain` | Teach it your product, customers, terms, metrics and stakeholders. | `/pm-domain review` · `/pm-domain new <area>` · `/pm-domain switch` |
| `/pm-goals` | Record the company's goals, then check which initiatives serve them and which don't. | `/pm-goals set` · `/pm-goals check` |
| `/pm-problem` | Get from a symptom or a solution down to the real problem. | `/pm-problem` + the complaint as you'd tell your manager |
| `/pm-spec` | Write a one-pager, PRD or PR-FAQ in your team's format. | `/pm-spec` (it finds your problem statement) |
| `/pm-pgm` | Write a program: strategy, outcomes, epics, order, what's out. | `/pm-pgm` |
| `/pm-epic` | Write an epic or feature: goal, bet, scope, stories, dependencies. | `/pm-epic` · `/pm-epic <ticket key>` |
| `/pm-story` | Slice work into stories with Gherkin acceptance criteria. | `/pm-story <epic>` · `/pm-story tighten <ticket key>` |
| `/pm-bug` | Write a bug an engineer can act on after one read. | `/pm-bug` + what you saw |
| `/pm-triage` | Rank a list of bugs by your own rules (which product earns most, what kind of breakage, which goal it hurts) and learn from the calls you change. | `/pm-triage` + paste the list · `/pm-triage rules` · `/pm-triage review` |
| `/pm-metrics` | Find the numbers in your analytics tools, or write the data request. | `/pm-metrics how many kickbacks wait on carrier reps?` |
| `/pm-compete` | Research a competitor, with a source on every claim. | `/pm-compete <name>` · `/pm-compete` to refresh the oldest |
| `/pm-brain` | File notes and transcripts, ask "what do we know about X", go through your inbox. | paste notes · `/pm-brain what do we know about X` · `/pm-brain weekly` · `/pm-brain inbox` |
| `/pm-mygoals` | Set your own goals, tied to the company's goals and to your level or the one you're going for. Shows them on your dashboard. | `/pm-mygoals set` · `/pm-mygoals level` + your ladder · `/pm-mygoals check` |
| `/pm-braglist` | Find the impact of your year's work and draft your review, with a source on every claim. | `/pm-braglist 2026` · `/pm-braglist add` + a win · `/pm-braglist write` + your review form |
| `/pm-dash` | A daily brief across all your projects from tickets, email, chat and notes: the three most important items first, the rest ranked by impact and effort. Five design styles. | `/pm-dash` · `/pm-dash since Monday` · `/pm-dash style glass` · `/pm-dash unattended` |
| `/pm-connect` | Connect Jira, Linear, Slack, Notion and set how each is used. | `/pm-connect` |
| `/pm-review` | Get a staff-level critique through your stakeholders' eyes. | `/pm-review` + paste or name the document |

## Get the most out of it

- **The pack is the product.** Every skill reads your domain pack, so a richer pack makes every output better. Feed it documents, not answers from memory.
- **Approve the pack updates.** At the end of most sessions it offers up to three new facts it learned (a decision, a metric, what a stakeholder cares about). Saying yes is how it gets smarter; every later skill uses them.
- **Teach it your voice.** Paste two or three tickets you wrote and liked; it saves how you write to `voice.md`. When you rewrite its drafts, it offers to learn the pattern.
- **"I don't know" is a fine answer.** It becomes an open question, never an invented fact. "Enough, draft it" works any time.
- **Let it push back.** It raises each concern once, then does it your way and logs the risk. If you think it is wrong, say so.
- **Keep it fresh.** Run `/pm-domain review` once a month. It lists metrics older than 45 days, goals and stakeholders older than 90, and facts with no source.
- **Run the weekly review.** `/pm-brain weekly` on Fridays lists decisions, problems that moved and open loops, and adds to `impact-log.md`. At review time, `/pm-braglist` turns it into the draft. Easiest on a schedule (step 5 above).
- **One domain per product area.** `/pm-domain new <area>` starts another; `/pm-domain switch` changes which is active. `/pm-goals` offers to copy goals across domains of the same company.
- **Start from a ticket.** With a tracker connected, give any writing skill a ticket key and it fetches, edits and shows you the change before saving it back.

## What's in PM home

Everything APMstack knows is markdown you can open and edit. If PM home sits in an Obsidian vault, the `[[links]]` show up in your graph.

```
apmstack/                 PM home, wherever /pm-setup put it
├── apmstack.md           which domain is active
├── voice.md              how you write
├── connectors.md         which tools APMstack may use, and how
├── dashboard.html        your daily brief and board, kept by /pm-dash
├── inbox.md              questions and changes scheduled runs saved for you
├── home.md  impact-log.md  notes/  people/  reviews/      kept by /pm-brain
├── my-goals.md           your goals and level, kept by /pm-mygoals
├── brag/                 review drafts from /pm-braglist
└── domains/<area>/
    ├── domain.md  goals.md  personas.md  metrics.md  stakeholders.md
    ├── glossary.md  constraints.md  workflow.md  data.md
    ├── competitors/  decisions/
    └── problems/  specs/  programs/  epics/  stories/  bugs/  alignment/
```

The sample in [examples/apmstack](examples/apmstack) shows every pack file filled in.

## How it behaves

- **Knows your domain.** Uses your terms, templates and people. Skips questions it already knows the answer to.
- **Asks before it writes.** One question at a time. "I don't know" becomes an open question. Say "enough, draft it" any time.
- **Pushes back once.** No problem behind your epic, or a team that hasn't agreed? It says so, then does it your way and logs the risk.
- **Never invents facts.** No made-up quotes, metrics or competitor claims. Unknowns stay unknown.
- **Writes like you.** Paste a few tickets you liked; it matches your voice.
- **Your files, your machine.** Everything is markdown in one folder you own. Nothing goes to Jira, Linear or anywhere else without a preview and your yes. The plugin install adds a safety net: Claude Code itself asks you before any write to Jira, Linear, Slack, Notion or email, so a scheduled run, or an instruction hidden in an email, can't send anything on its own.
- **Waits for you when you're away.** Scheduled runs never guess. What they would have asked goes to `inbox.md` for you to answer later.

## Update and uninstall

**Update:** `cd apmstack && git pull && ./setup` (add `copilot` for VS Code). It replaces the skills and leaves your PM home alone. In the Claude app, upload the zips from the newer release.

**Uninstall:** `./apmstack/setup remove`. Your notes are never touched.

## Status

Early (v0.1). `/pm-problem` has been tested end to end. Automated checks pass for scheduled runs of `/pm-dash` and `/pm-brain weekly`, for an instruction hidden in your notes, and for an unsourced claim in `/pm-braglist`. The rest are written but not fully tested. Details in [TESTING.md](TESTING.md).

Not built yet: prioritisation, discovery interviews, pre-mortems, roadmaps, launch plans, stakeholder updates.

## Licence

MIT
