---
author: human
created: 2026-11-07
tags: [python, coding]
sample: true
---

# Python dictionaries

- Key and value pairs: `ages = {"mina": 15}`
- `ages["mina"]` raises `KeyError` if the key is missing. `ages.get("mina", 0)` does not.
- Keys must be hashable, so a list cannot be a key. See [[python-lists]].
