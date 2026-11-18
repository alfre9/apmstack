# APMstack

AI skills that do an associate PM's groundwork, then ask you the questions a good one would.

They learn your product, customers and team formats once, then interview you before writing problem statements, specs, epics, stories and bugs. Plain markdown. Works in Claude Code, the Claude desktop app and GitHub Copilot in VS Code.

## Install

**Claude Code** (terminal, or the Code tab of the Claude desktop app)

```sh
git clone https://github.com/alfre9/apmstack && ./apmstack/setup
```

Open a new session and type `/pm-problem`. It runs on a sample company (Northdock, freight invoicing) until you type `/pm-setup` to add your own.

**Claude Code plugin**

```
/plugin marketplace add alfre9/apmstack
/plugin install apmstack@apmstack
```

Commands then carry a prefix: `/apmstack:pm-problem`.

**Claude desktop app or claude.ai** (no terminal)

Download the zips from the [latest release](https://github.com/alfre9/apmstack/releases/latest). In the app: Customize > Skills > + > Upload a skill, once per zip. Start with `pm-setup`, `pm-domain` and `pm-problem`.

**GitHub Copilot in VS Code**

```sh
git clone https://github.com/alfre9/apmstack && ./apmstack/setup copilot
```

**Uninstall:** `./apmstack/setup remove`. Your notes are never touched.

## What it does

You bring:

> We need an exceptions aging dashboard for controllers, by carrier rep. I need a problem statement so Elena approves it.

Ten questions later you have a problem statement that says the dashboard rests on one lost deal, names two possible root causes, tags every line as evidence `[E]` or assumption `[A]`, and gives you one afternoon's test to tell the causes apart.

## The skills

| Command | Use it to |
|---|---|
| `/pm` | Not sure? Say what you're doing and it picks the skill. |
| `/pm-setup` | Pick where your notes live (Obsidian works) and start your first domain. |
| `/pm-domain` | Teach it your product, customers, terms, metrics and stakeholders. |
| `/pm-problem` | Get from a symptom or a solution down to the real problem. |
| `/pm-spec` | Write a one-pager, PRD or PR-FAQ in your team's format. |
| `/pm-pgm` | Write a program: strategy, outcomes, epics, order, what's out. |
| `/pm-epic` | Write an epic or feature: goal, bet, scope, stories, dependencies. |
| `/pm-story` | Slice work into stories with Gherkin acceptance criteria. |
| `/pm-bug` | Write a bug an engineer can act on after one read. |
| `/pm-metrics` | Find the numbers in your analytics tools, or write the data request. |
| `/pm-compete` | Research a competitor, with a source on every claim. |
| `/pm-brain` | File notes and transcripts, ask "what do we know about X". |
| `/pm-connect` | Connect Jira, Linear, Slack, Notion and set how each is used. |
| `/pm-review` | Get a staff-level critique through your stakeholders' eyes. |

## How it behaves

- **Knows your domain.** Uses your terms, templates and people. Skips questions it already knows the answer to.
- **Asks before it writes.** One question at a time. "I don't know" becomes an open question. Say "enough, draft it" any time.
- **Pushes back once.** No problem behind your epic, or a team that hasn't agreed? It says so, then does it your way and logs the risk.
- **Never invents facts.** No made-up quotes, metrics or competitor claims. Unknowns stay unknown.
- **Writes like you.** Paste a few tickets you liked; it matches your voice.
- **Your files, your machine.** Everything is markdown in one folder you own. Nothing goes to Jira, Linear or anywhere else without a preview and your yes.

## Status

Early (v0.1). `/pm-problem` has been tested end to end. The rest are written but not fully tested. Details in [TESTING.md](TESTING.md).

Not built yet: prioritisation, discovery interviews, pre-mortems, roadmaps, launch plans, stakeholder updates.

## Licence

MIT
