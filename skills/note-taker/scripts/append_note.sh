#!/usr/bin/env bash
# append_note.sh — Append a timestamped note to the current month's file in notes-technical vault
# Usage: append_note.sh "note content here"

set -euo pipefail

VAULT="/Users/trungnt13/Library/Mobile Documents/iCloud~md~obsidian/Documents/notes-technical"
MONTHLY_DIR="$VAULT/monthly_notes"

NOTE_CONTENT="${1:-}"
if [[ -z "$NOTE_CONTENT" ]]; then
  echo "Error: no note content provided." >&2
  echo "Usage: $0 \"note content\"" >&2
  exit 1
fi

# Get current time in Helsinki timezone
TIMESTAMP=$(TZ="Europe/Helsinki" date "+%d/%m-%H:%M")
MONTH_FILE=$(TZ="Europe/Helsinki" date "+%m-%Y")
TARGET="$MONTHLY_DIR/${MONTH_FILE}.md"

# Create the file with a header if it doesn't exist
if [[ ! -f "$TARGET" ]]; then
  MONTH_LABEL=$(TZ="Europe/Helsinki" date "+%B %Y")
  echo "# Notes — $MONTH_LABEL" > "$TARGET"
  echo "" >> "$TARGET"
fi

# Append the note with the timestamp header (matches existing format)
printf "\n### %s\n %s\n" "$TIMESTAMP" "$NOTE_CONTENT" >> "$TARGET"

echo "✅ Note appended to $TARGET"
echo "   Timestamp: $TIMESTAMP"
