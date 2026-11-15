# Ingest a source

When to use: File a source from inbox/ (or a pasted text or URL) into the vault as a summary note linked to the student's own notes. Use when the student says ingest, file this, summarise this source, or names a file in inbox/.

1. Read the source the student named. If they named none, list `inbox/` and ask which one.
2. Search `my-notes/`, `interests/` and `agent/sources/` for notes on the same topics so you can link to them.
3. Create one note in `agent/sources/` named after the source. Use this shape:

```markdown
---
author: ai
created: <today>
source: <inbox path or URL>
tags: [<up to five existing tags>]
---

# <Source title>

## In three sentences

## Key points

## Terms worth knowing

## Connects to
- [[<existing note>]]: <how it connects>

## Questions to think about
```

4. Keep it under 300 words. It is a pointer back to the source, not a replacement for reading it.
5. "Questions to think about" are open questions for the student to answer in their own notes. Do not answer them.
6. Do not touch `my-notes/`. If the student's note should link to the new one, tell them and let them add the link.
7. Mark every key point with where it sits in the source (heading, paragraph or page). If you cannot point to the place, leave the point out.
8. End with the list of files you created.
