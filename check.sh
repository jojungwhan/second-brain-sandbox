#!/usr/bin/env bash
# Checks that this computer can run the vault. Changes nothing except:
# if the vault folder is not under Git yet, it runs "git init" and makes the first commit.
# Usage:  bash check.sh ko     (or: bash check.sh en)
set -u
vault="${1:-}"
here="$(cd "$(dirname "$0")" && pwd)"
if [ "$vault" != "ko" ] && [ "$vault" != "en" ]; then
  echo "Usage: bash check.sh ko   (or: bash check.sh en)"; exit 2
fi
cd "$here/$vault" || { echo "FAIL  folder $vault not found"; exit 1; }
fail=0
ok()   { echo "OK    $1"; }
bad()  { echo "FAIL  $1"; fail=1; }
note() { echo "NOTE  $1"; }

for f in AGENTS.md CLAUDE.md skills/ingest.md checks/tool-change-check.md tools/authorship.py; do
  [ -f "$f" ] || bad "missing file: $vault/$f (download the repository again)"
done
[ $fail -eq 0 ] && ok "vault files are in place"

if command -v git >/dev/null 2>&1; then
  ok "git: $(git --version)"
  if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    ok "this folder is under Git"
    if [ -n "$(git remote 2>/dev/null)" ]; then
      note "this copy has a Git remote. Do not push your own notes. Safer: download the ZIP instead of cloning."
    fi
  else
    git init -q && git add -A && git -c user.name="vault" -c user.email="vault@localhost" commit -q -m "Start vault" \
      && ok "started Git history in $vault/ (first commit made)" || bad "could not start Git history"
  fi
else
  bad "git not found. Install it: https://git-scm.com/downloads"
fi

py=""
for c in python3 python py; do
  if command -v "$c" >/dev/null 2>&1 && "$c" -c "import sys; sys.exit(0 if sys.version_info >= (3, 8) else 1)" >/dev/null 2>&1; then py="$c"; break; fi
done
if [ -n "$py" ]; then
  if "$py" tools/authorship.py >/dev/null 2>&1; then ok "authorship tool runs ($py tools/authorship.py)"; else bad "authorship tool failed: $py tools/authorship.py"; fi
else
  note "Python 3 not found. Only the authorship count needs it. The agent works without it. https://www.python.org/downloads/"
fi

agents=0
if command -v claude >/dev/null 2>&1; then ok "Claude Code: $(claude --version 2>/dev/null | head -1)"; agents=1; fi
if command -v codex  >/dev/null 2>&1; then ok "Codex CLI: $(codex --version 2>/dev/null | head -1)"; agents=1; fi
if [ $agents -eq 0 ]; then
  bad "no coding agent found. Install one of them:"
  echo "        Claude Code  https://code.claude.com/docs/en/setup"
  echo "        Codex CLI    https://developers.openai.com/codex/cli"
fi

echo
if [ $fail -eq 0 ]; then
  echo "Ready. Next:"
  echo "  cd $vault"
  echo "  claude        (or: codex)"
  echo "  then sign in with your subscription and try the first request in checks/tool-change-check.md"
else
  echo "Fix the FAIL lines above, then run this check again."
fi
exit $fail
