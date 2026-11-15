#!/usr/bin/env python3
"""Count who wrote the notes in this vault.

Reads the `author` field in each note's frontmatter (human, ai or mixed) and
prints the totals. With --write it also saves the result to
agent/reports/authorship.md so the Home note can show it.

Usage:
    python3 tools/authorship.py           # print the counts
    python3 tools/authorship.py --write   # print and save the report
    python3 tools/authorship.py --json    # machine-readable output

Uses only the Python standard library.
"""
import datetime
import json
import sys
from pathlib import Path

VAULT = Path(__file__).resolve().parent.parent
REPORT = VAULT / "agent" / "reports" / "authorship.md"
VALID = ("human", "ai", "mixed")
# Folders that hold no notes (inbox holds raw sources), plus the report this script writes.
SKIP_DIRS = {".git", ".obsidian", ".claude", ".trash", "templates", "tools", "inbox",
             "skills", "checks"}
SKIP_FILES = {REPORT, VAULT / "AGENTS.md", VAULT / "CLAUDE.md", VAULT / "README.md"}


def read_author(path):
    """Return the author value from a note's frontmatter, or None if absent."""
    lines = path.read_text(encoding="utf-8-sig", errors="replace").splitlines()
    if not lines or lines[0].strip() != "---":
        return None
    for line in lines[1:]:
        if line.strip() == "---":
            return None
        if line.startswith("author:"):
            return line.split(":", 1)[1].strip().strip("\"'").lower()
    return None


def scan():
    counts = {name: 0 for name in VALID}
    problems = []
    for path in sorted(VAULT.rglob("*.md")):
        relative = path.relative_to(VAULT)
        if path in SKIP_FILES or SKIP_DIRS.intersection(relative.parts):
            continue
        author = read_author(path)
        if author in counts:
            counts[author] += 1
        else:
            problems.append((relative.as_posix(), author))
    return counts, problems


def percent(part, total):
    return round(100 * part / total) if total else 0


def render(counts, problems):
    total = sum(counts.values())
    lines = [
        "---",
        "author: ai",
        f"created: {datetime.date.today().isoformat()}",
        "tags: [report]",
        "---",
        "",
        "# Authorship",
        "",
        "| Author | Notes | Share |",
        "| --- | --- | --- |",
    ]
    for name in VALID:
        lines.append(f"| {name} | {counts[name]} | {percent(counts[name], total)}% |")
    lines.append(f"| total | {total} | |")
    if problems:
        lines += ["", "## Notes with a missing or invalid author", ""]
        lines += [f"- `{path}` (found: {value or 'nothing'})" for path, value in problems]
    return "\n".join(lines) + "\n"


def main():
    counts, problems = scan()
    total = sum(counts.values())
    if "--json" in sys.argv:
        print(json.dumps({"counts": counts, "total": total,
                          "problems": [p for p, _ in problems]}))
    else:
        for name in VALID:
            print(f"{name:>6}: {counts[name]:>4}  {percent(counts[name], total):>3}%")
        print(f"{'total':>6}: {total:>4}")
        for path, value in problems:
            print(f"missing or invalid author: {path} (found: {value or 'nothing'})")
    if "--write" in sys.argv:
        REPORT.parent.mkdir(parents=True, exist_ok=True)
        REPORT.write_text(render(counts, problems), encoding="utf-8")
        print(f"saved {REPORT.relative_to(VAULT).as_posix()}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
