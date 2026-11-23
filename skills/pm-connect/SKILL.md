---
name: pm-connect
description: Finds the tools connected to this session (tracker, docs, chat, email, analytics and others), records how the PM wants each one used, and explains how to connect the common ones. Other APMstack skills read the result.
---

# /pm-connect: connected tools

APMstack works by paste with nothing connected. A connected tool only saves the PM a copy and paste. This skill finds what is connected, asks how the PM wants each tool used, and writes that to `connectors.md` in PM home, where the other skills read it.

APMstack cannot ship credentials or connect anything itself. A connector is something the PM has already authorised in their AI host (usually an MCP server). If nothing is connected, that is fine: say so, show the guide in section 6, and stop.

## 1. Find PM home

Read the one-line file `.apmstack` in the user's home directory; it holds the path to PM home. If it is missing, look for an `apmstack/` folder containing `apmstack.md` in the current workspace. If neither exists, run `/pm-setup` first. Read `connectors.md` if it exists, and `workflow.md` in the active domain for the tracker and tools the team says it uses.

If this host has no access to the PM's files, do the session in the chat and print `connectors.md` at the end for them to save.

## 2. House rules

- **One question, then wait.** Ask a single question and stop. Never send a list of questions, and never join two with "and": one question has one thing to answer.
- **No invented facts.** List only tools that are present in this session. Never claim a tool is connected because the team uses it, and never guess a project key, channel or label.
- **Write only inside PM home.** Never edit the host's configuration files, settings or credentials. Tell the PM what to do there and let them do it.
- **Nothing leaves the machine without a preview.** This skill never writes to a connected tool. It may make one read-only call per tool to confirm the connection works, after saying which call.

## 3. The slots

| Slot | What other skills use it for | Typical tools |
|---|---|---|
| tracker | `/pm-story`, `/pm-bug`, `/pm-epic` and `/pm-pgm` read, create and update tickets; `/pm-triage` reads bugs and sets their priority; `/pm-dash` reads what is assigned to the PM | Jira, Linear, Azure DevOps, GitHub Issues |
| docs | `/pm-spec` creates the document; `/pm-domain` ingests | Confluence, Notion, Google Docs, SharePoint |
| chat | reading threads the PM points at; `/pm-dash` reads mentions and direct messages | Slack, Teams |
| email | `/pm-dash` finds asks and deadlines sent to the PM | Gmail, Outlook |
| analytics | `/pm-metrics` finds the numbers a ticket needs | Amplitude, Mixpanel, a warehouse |
| research | call notes and interview material | Dovetail, Gong, a shared drive |
| design | linking designs to stories | Figma |
| calendar | finding the next ritual or review | Google Calendar, Outlook |
| notes | `/pm-brain` | Obsidian (plain files need no connector) |

## 4. Discover and record

1. **Look at the tools available in this session** beyond files and shell: connected apps and MCP servers. Map each to a slot by what it can do. A tool that is listed but needs signing in counts as "needs sign-in", not as connected.
2. **Report in one short table:** slot, tool found, state (ready · needs sign-in · none). Note any tool `workflow.md` names that is not connected.
3. **Configure the filled slots one at a time,** most useful first (tracker, then docs, then chat, then email). For each, one question:
   - tracker: "Which project or team key should stories go to, and is there a label you want on anything APMstack creates?"
   - docs: "Where should new documents be created: which space, folder or parent page?"
   - chat: "Which channels may I read when you point me at a thread? Anything that must never be quoted or posted?"
   - email: "Which folders or labels may I read for to-dos? Anything I must never read or quote?"
   - analytics: "Which workspace or project holds your product's data, and are there filters I should always apply, such as excluding test accounts?" Write the filters to `data.md` in the active domain.
   - others: "How do you want me to use this, and is anything off limits?"

   Offer a read-only check where it helps (listing the projects the PM can see, so they pick a key and do not have to type one). "Skip" leaves the slot as `not configured`; a skill that needs it later asks then.
4. **Write `connectors.md`** after each answer, so stopping loses nothing.

## 5. connectors.md

```markdown
# Connectors

Updated: YYYY-MM-DD. Maintained by /pm-connect. Edit by hand if you like.

## tracker
- Tool: Linear (connector "linear"), ready
- Use: team key WRK; label `pm-draft` on everything created (source: PM, YYYY-MM-DD)
- Never: close or reassign existing issues (source: PM, YYYY-MM-DD)

## docs
- Tool: Notion, not configured

## chat
- Tool: none
```

How the other skills read it:

- **Ready, with a `Use:` line:** the skill may read through it for the slot's purpose, and offers writes. Every write is previewed in full and waits for a yes, every time. There is no "always allow".
- **`not configured`:** the tool still works. The skill asks the one thing it needs (a project or team key for a tracker, which workspace for analytics), uses it, and offers to save the answer here. Writes are previewed as always.
- **`needs sign-in`:** the skill mentions it once and falls back to paste.
- **`none` or no file:** paste in, markdown out, and nothing said about it.
- **A `Never:` line is absolute.** A skill does not ask to override it.

## 6. Connecting a tool

Connections are made in the AI host, not in APMstack. Give the PM only the part for their host and their tool. Checked on 2026-11-15; hosts and vendors change these often, so the vendor's own page wins where it differs.

**Claude desktop app and claude.ai.** Open Customize, then Connectors. Browse the directory, pick the tool, press Connect and sign in. A tool that is not in the directory can be added there as a custom connector by pasting its server URL. On Team and Enterprise plans an owner has to enable a connector before members see it. Connectors added here also appear in Claude Code when it is signed in to the same account.

**Claude Code.** In a terminal: `claude mcp add --transport http <name> <server URL>`. Then start a session, type `/mcp` and sign in.

**GitHub Copilot in VS Code.** Open the command palette, run "MCP: Add Server" and paste the server URL. Tools appear in agent mode. Not tested by APMstack.

| Tool | Server URL | Vendor instructions |
|---|---|---|
| Linear | `https://mcp.linear.app/mcp` | linear.app/docs/mcp |
| Notion | `https://mcp.notion.com/mcp` | developers.notion.com/docs/mcp |
| Slack | `https://mcp.slack.com/mcp` (a workspace admin must approve it first) | docs.slack.dev/ai/slack-mcp-server |
| Jira and Confluence | Atlassian has changed this URL more than once; take it from their page | support.atlassian.com/atlassian-rovo-mcp-server |

For anything else (Gmail, Outlook, Figma, Amplitude, Google Drive, Teams, Dovetail), look in the host's connector directory first, then on the vendor's site for "MCP server". Do not give the PM a server URL from memory; if you cannot open the vendor's page in this session, tell them to look it up there.

After they connect something, they run `/pm-connect` again and it picks up at step 1.

## 7. Close

Three lines: what is ready, what is connected but not configured, what still works by paste (everything).
