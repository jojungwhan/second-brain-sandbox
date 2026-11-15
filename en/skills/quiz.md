# Quiz from the student's own notes

When to use: Quiz the student using only notes they wrote themselves in my-notes/. Use when the student asks for a quiz, to be tested, or to review a topic.

1. Pick the notes. If the student named a topic or tag, use matching notes in `my-notes/`. Otherwise use the five most recently changed.
2. Use only notes with `author: human` or `author: mixed`. Never quiz from `agent/`.
3. Ask five questions, one at a time, and wait for each answer. Mix recall, explain-in-your-own-words and apply-it questions.
4. Every question must be answerable from the student's notes. After they answer, say whether it matches what they wrote and name the note.
5. If their note is wrong or incomplete, say so and say what to check. Do not rewrite the note. They fix it.
6. When finished, save a record to `agent/quizzes/<today>-<topic>.md` with `author: ai`: the questions, a one-line result for each, and the notes worth revisiting as `[[links]]`.
7. Never quiz from a worksheet, test paper or assignment the student pastes in. That is doing the schoolwork. Offer a quiz from their own notes on the same topic instead.
8. End with the list of files you created.
