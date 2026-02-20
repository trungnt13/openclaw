---
name: note-taker
description: "Append a quick note to monthly_notes in the notes-technical Obsidian vault. Triggers when the user says note followed by content or asks to save/log a note to monthly notes. Captures the text after the note prefix and appends it with a Helsinki-timezone timestamp (DD/MM-HH:MM) to the current month file (MM-YYYY.md)."
---

# Note Taker

Appends timestamped notes to the `notes-technical` Obsidian vault under `monthly_notes/`.

## Vault & Path

- Vault: `/Users/trungnt13/Library/Mobile Documents/iCloud~md~obsidian/Documents/notes-technical`
- Target dir: `monthly_notes/`
- Current month file: `MM-YYYY.md` (e.g. `07-2025.md`)

## Timestamp Format (existing convention)

```
### DD/MM-HH:MM
 NOTE_CONTENT
```

Example:

```
### 15/07-14:23
 create agents talent metrics: speed, general knowledge, code, cost, etc
```

## How to Append a Note

Run the bundled script — it handles timezone, file creation, and format automatically:

```bash
bash ~/codes/openclaw/skills/note-taker/scripts/append_note.sh "note content here"
```

Pass the content verbatim (everything after "note:"). Strip only the leading "note:" prefix and any leading/trailing whitespace.

## After Appending

Confirm to the user: what was saved and the timestamp used. Keep it short (1-2 lines).
