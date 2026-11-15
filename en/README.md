# Starter vault

Open this folder as a vault in Obsidian, or in any editor that shows Markdown. Then start your coding agent inside it (`claude`, `codex`, or whichever one you use).

Everything here is plain text in folders. No note depends on one app, one agent or one model, so the vault keeps working when those change.

- `AGENTS.md`: the rules the agent follows. Read it once. `CLAUDE.md` points to it.
- `my-notes/`, `daily/`, `interests/`: your notes, daily logs and interest pages. The agent can read them and cannot edit them.
- `skills/`: the step-by-step procedures the agent follows. Plain text, so you can read and change them.
- `checks/tool-change-check.md`: six requests to run whenever the agent or its model changes.
- `agent/`: everything the agent writes.
- `tasks/`, `inbox/`, `templates/`: tasks, sources waiting to be filed, note templates.
- `tools/authorship.py`: counts notes by author.

The notes marked `sample: true` are placeholders so the graph and the counts have something to show. They were written for this starter, not by a student. Delete them when you start.

First run:

```bash
git init
git add .
git commit -m "Start vault"
python3 tools/authorship.py --write
```

Known limit: `.claude/settings.json` blocks edits only in Claude Code. Other agents rely on `AGENTS.md` alone, so run the tool change check and read `git diff` after each session. Even in Claude Code the block on `my-notes/` covers the agent's file-editing tools. It does not cover shell commands, so read what a command does before you approve it.
