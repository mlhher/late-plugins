#!/usr/bin/env bash
# onToolCall hook — sends a desktop notification when a tool requires approval.
#
# Receives JSON on stdin: {"tool": "...", "arguments": {...}, "timestamp": "...", "requires_approval": true/false}
# Stdout is empty (pass-through, does not mutate or block the call).

payload=$(cat)

[ -z "$payload" ] && exit 0

if command -v jq >/dev/null 2>&1; then
  tool=$(echo "$payload" | jq -r '.tool // empty')
  requires_approval=$(echo "$payload" | jq -r '.requires_approval // false')
else
  tool=$(printf '%s' "$payload" | sed -n 's/.*"tool"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p' | head -1)
  case "$payload" in
    *"\"requires_approval\":true"*|*"\"requires_approval\": true"*)
      requires_approval=true
      ;;
    *)
      requires_approval=false
      ;;
  esac
fi

[ -z "$tool" ] && exit 0

# Only run notify-send when approval is actually required
if [ "$requires_approval" = "true" ]; then
  msg="Late: $tool requires approval"
  if command -v notify-send >/dev/null 2>&1; then
    notify-send "$msg" 2>/dev/null &
  elif command -v osascript >/dev/null 2>&1; then
    osascript -e "display notification \"$msg\" with title \"Late\" sound name \"Ping\"" 2>/dev/null &
  fi
fi

exit 0
