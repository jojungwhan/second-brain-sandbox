# Interest page

When to use: the student wants to start or grow a page about a topic they are curious about, or asks for sources on one of their interests.

The page in `interests/` belongs to the student. You look for sources and report. They read and decide.

1. Read the page the student named in `interests/`. If there is none, tell them to create one from `templates/interest.md` and fill in "Why I care" first.
2. Read their open questions. Pick the one they say matters most, or ask.
3. Find at most three sources for that one question. For each, write a note in `agent/sources/` with the `ingest` shape, including where in the source each key point sits.
4. Write `agent/reports/<today>-<topic>-sources.md` with `author: ai`: the question, the three sources as `[[links]]`, what each one claims, and where they disagree. Do not pick a winner.
5. Do not answer the question on the interest page, and do not edit the page. The student reads the sources and writes what they now think, in their own words.
6. If the topic is a current school assignment, say so and stop at step 4. The report is a reading list, not a draft.
7. End with the list of files you created.
