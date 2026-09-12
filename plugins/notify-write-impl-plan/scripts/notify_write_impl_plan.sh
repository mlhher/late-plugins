#!/usr/bin/env bash
# onToolResult hook — sends a desktop notification when write_implementation_plan finishes.
#
# Receives JSON on stdin: {"tool": "...", "result": "..."}
# Stdout is empty (pass-through, does not mutate or block the result).

payload=$(cat)

[ -z "$payload" ] && exit 0

if command -v jq >/dev/null 2>&1; then
  tool=$(echo "$payload" | jq -r '.tool // empty')
else
  tool=$(printf '%s' "$payload" | sed -n 's/.*"tool"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p' | head -1)
fi

[ -z "$tool" ] && exit 0

# Only notify when write_implementation_plan finishes
if [ "$tool" = "write_implementation_plan" ]; then
  msg="Late: write_implementation_plan finished"
  if command -v notify-send >/dev/null 2>&1; then
    notify-send "$msg" 2>/dev/null &
  elif command -v osascript >/dev/null 2>&1; then
    osascript -e "display notification \"$msg\" with title \"Late\" sound name \"Ping\"" 2>/dev/null &
  fi
fi

exit 0
