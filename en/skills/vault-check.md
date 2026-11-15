# Vault health check

When to use: Check the vault for broken links, missing frontmatter and misfiled notes, and write a report. Use when the student asks for a health check, a vault check, or asks what needs tidying.

1. Run `python3 tools/authorship.py --write`. It lists notes with a missing or invalid `author`.
2. Find `[[links]]` whose target note does not exist.
3. Find notes with no tags, notes with no links in or out, and tasks with no `due` date.
4. Find notes in `agent/` marked `author: human`, and notes in `my-notes/`, `daily/` or `interests/` marked `author: ai`. Both are misfiled or mislabelled.
5. Write `agent/reports/<today>-vault-check.md` with `author: ai`, one section per problem type, each item as a `[[link]]` with a one-line suggested fix.
6. Fix nothing in `my-notes/`, `daily/` or `interests/`. You may fix problems in notes under `agent/`. Everything else is a suggestion for the student.
7. End with the list of files you created or changed.
