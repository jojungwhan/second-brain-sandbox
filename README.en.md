# Second brain practice repository

한국어: [README.md](README.md)

This repository holds the starter vault for CIT's 12-session course on a personal record vault with an AI helper. If a download fails or a setup gets tangled, take this one repository and start again from a clean state.

The only thing that costs money is one Claude or Codex subscription. You do not create an API key.

- Course: https://citcoding.com/agent-office/en/course/
- Sessions: https://citcoding.com/agent-office/en/course-sessions/
- Tutor guide: https://citcoding.com/agent-office/en/course-tutor/

## What is here

| Folder | Contents |
| --- | --- |
| `en/` | English starter vault |
| `ko/` | Korean starter vault. Folder and file names are the same as in the English one |
| `check.sh`, `check.ps1` | Scripts that check whether this computer can run the vault |

Each vault holds the rules the agent follows (`AGENTS.md`), six procedure files (`skills/`), the tool change check (`checks/`), templates and sample notes.

## What you need

| Needed | Why | Where |
| --- | --- | --- |
| Claude Code or Codex CLI, one of them | The coding agent you run inside the vault. You sign in with your subscription | [Claude Code](https://code.claude.com/docs/en/setup), [Codex CLI](https://developers.openai.com/codex/cli) |
| Git | To see what the agent changed | https://git-scm.com/downloads |
| Python 3 (optional) | Only for the tool that counts notes by author | https://www.python.org/downloads/ |
| Obsidian (optional) | A comfortable way to read the notes. Any editor works | https://obsidian.md/download |

Where a student cannot sign up for a service, a parent or tutor manages the account and it is used during class only.

## Getting started

1. Press the green **Code** button at the top of this page and choose **Download ZIP**. Unzip the file.
2. In a terminal, go into the unzipped folder and run the check. Use `ko` in place of `en` for the Korean vault.

   macOS, Linux:

   ```bash
   bash check.sh en
   ```

   Windows (PowerShell):

   ```powershell
   powershell -ExecutionPolicy Bypass -File check.ps1 en
   ```

3. When every line says `OK`, go into the vault folder, start the agent and sign in with your subscription.

   ```bash
   cd en
   claude
   ```

   With Codex, type `codex` in place of `claude`.

4. Give the agent the first request in `checks/tool-change-check.md`, exactly as written. If it suggests a line and leaves your note untouched, the rules are working.

The check runs `git init` and a first commit only when the vault folder is not under Git yet. It changes nothing else.

## Your notes stay on your computer

**Use Download ZIP.** A `git clone` or a fork brings a remote address with it, and a push from that copy can put your logs and notes on the internet. If you already cloned, remove the remote before you use the vault.

```bash
git remote remove origin
```

The agent's rules also say it never sends vault content anywhere. Check your own setup all the same.

## When something does not work

| What you see | What to try |
| --- | --- |
| `claude` or `codex` is not found | Install it from the links above, then open a new terminal |
| `python3` is not found on Windows | Run `python tools\authorship.py` |
| Claude Code asks whether you trust this folder | Check it is the vault folder and accept. It asks once |
| Codex started from a script sits there | It is waiting for input. Run `codex` directly in a terminal |
| An older vault prints many line-ending warnings on `git add` | Harmless. The vaults in this repository do not print them |
| A note written in Notepad is counted as having no author | Fixed in this repository. For an older vault, replace `tools/authorship.py` with the new one |
| You hit a usage limit | That is the limit of the subscription plan. Wait for it to reset. Do not create an API key |
| The agent does not follow the rules | Run the six requests in `checks/tool-change-check.md`, see which row fails, and tell your tutor |

To return the vault to its first state, download this repository again. Copy your own `my-notes/`, `daily/` and `interests/` folders somewhere else first.

## Where it was checked

| System | What was checked |
| --- | --- |
| Linux | Korean and English vaults, Claude Code and Codex CLI |
| Windows 11 (Korean) | Five check requests on the English vault, the first request on the Korean vault, and this repository's `check.ps1`. Claude Code and Codex CLI |
| macOS | Not checked yet |

Dates and versions are in the [tutor guide](https://citcoding.com/agent-office/en/course-tutor/). Run the check again when the tool or model changes.
