# Weekly review

When to use: Gather what the student wrote and finished over the last seven days into a weekly review note. Use when the student asks for a weekly review or a summary of their week.

1. Find notes in `my-notes/`, `daily/` and `interests/` whose `created` date falls in the last seven days. Then use `git log --since="7 days ago" --name-only` to add older notes the student edited this week. If the first commit of the vault is less than seven days old, Git lists every note, so rely on `created` alone.
2. Find tasks in `tasks/` with `status: done` and a `done` date in the last seven days, tasks due in the next seven days, and tasks past their `due` date that are not done. If a finished task has no `done` date, list it and say the date is missing.
3. Run `python3 tools/authorship.py --write` to refresh the authorship report.
4. Create `agent/reviews/<today>-week.md` with `author: ai`:

```markdown
# Week ending <today>

## What you wrote
- [[note]]: one line on what it covers

## Days you logged
<dates with a daily log, and dates without one>

## Interests that moved
- [[interest page]]: questions added or closed this week

## Finished
## Due next week
## Overdue

## Authorship this week
<counts from the report>

## One thing to try next week
```

5. Describe, do not grade. "One thing to try" is a single concrete suggestion, such as a note that has no links yet.
6. End with the list of files you created.
