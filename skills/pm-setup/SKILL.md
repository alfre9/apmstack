---
name: pm-setup
description: First-run setup for APMstack. Chooses the PM home folder (offers Obsidian vaults), creates it, notes which connectors are available, and starts the first domain pack. Run once after installing.
---

# /pm-setup

Get the PM from "just installed" to "first domain started" in about two minutes and no more than three questions. PMs drop a tool at the first error or the first thing that looks like a form, so detect what you can and ask only what you cannot.

## House rules

- **One question, then wait.** Ask a single question and stop. Never send a list of questions, and never join two with "and": one question has one thing to answer.
- **Write only inside PM home,** plus the one-line pointer file. Never edit or move the PM's other notes, and never touch `.obsidian/`.
- **Nothing leaves the machine without a preview.** Setup writes to no external system at all.

## Steps

1. **See what exists.** Read the one-line file `.apmstack` in the user's home directory.
   - It points at a PM home of their own: say where it is and which domain is active, then ask what they want: move PM home, add a domain (`/pm-domain new`), or nothing.
   - It points at the bundled sample (`apmstack.md` there says `Example: yes`), or it is missing: carry on.
   - This host cannot reach the PM's files (a chat sandbox counts): say so plainly. PM home needs a host that can read and write their files: Claude Code, the Code or Cowork tab of the Claude desktop app, or VS Code. In chat the skills still work by pasting domain files in. Offer to build a domain pack here and now with `/pm-domain`, printing each file for them to save, and stop setup.

2. **Choose PM home.** Look for Obsidian vaults in Obsidian's own vault list: `~/Library/Application Support/obsidian/obsidian.json` on macOS, `%APPDATA%\obsidian\obsidian.json` on Windows, `~/.config/obsidian/obsidian.json` on Linux. Each entry under `vaults` has a `path`. Read that file and nothing else under it. Then ask one question offering:
   - an `apmstack/` folder inside each vault found. Recommend this when there is a vault: their notes, graph and search then cover APMstack with no extra work, and APMstack writes only inside that one folder.
   - `~/Documents/apmstack`
   - a path they type.

3. **Create it.** If the folder already holds an `apmstack.md`, adopt it and change nothing. Otherwise create `domains/` and this `apmstack.md`:

   ```markdown
   # APMstack

   Active domain: (none yet)

   This folder is your PM home: everything APMstack knows, as plain markdown you can read and edit.

   - `domains/<name>/`: one domain pack per product area
   - `connectors.md`: which connected tools APMstack may use, and how
   ```

   Write the absolute path of PM home, on one line, to `.apmstack` in the user's home directory. Other folders are created later by the skills that need them.

4. **Note the connectors.** Look at the tools available in this session beyond files and shell: connected apps and MCP servers. Map each to a slot: tracker, docs, chat, email, analytics, research, design, calendar, notes. Write `connectors.md` in PM home with a `## <slot>` heading per slot and one line under it, either `- Tool: Linear, not configured` or `- Tool: none`. Ask nothing about them now. Tell the PM in one line what you found, that nothing is ever written to those tools without showing them first, and that `/pm-connect` records how each should be used. If there are none: "No connectors found. Every skill works by paste."

5. **Start the first domain.** Go straight into `/pm-domain` and follow it. If that skill is not installed, say so and stop.

6. **Close in five lines or fewer:** where PM home is, what was created, and the next command to try. If `~/apmstack-example` exists, mention that it is the sample and safe to delete.
