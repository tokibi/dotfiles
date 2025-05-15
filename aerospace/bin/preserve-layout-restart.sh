#!/usr/bin/env bash
set -euo pipefail

export PATH="/opt/homebrew/bin:$PATH"

STATE_JSON="$(mktemp -t aerospace_state_XXXX.json)"
trap 'rm -f "$STATE_JSON"' EXIT

echo "- Dumping current window state..."
aerospace list-windows --all \
  --format '%{window-id} %{workspace} %{app-name}' --json \
  > "$STATE_JSON"

echo "- Stopping AeroSpace..."
osascript -e 'quit app "AeroSpace"'
sleep 1

echo "- Starting AeroSpace..."
open /Applications/AeroSpace.app

echo -n "- Waiting for AeroSpace to become ready"
until aerospace list-workspaces --focused &>/dev/null; do
  echo -n "."
  sleep 1
done
echo ""

echo "- Switching layout..."
aerospace layout tiles

echo "- Restoring window state..."
jq -c '.[] | select(.workspace != null and .["window-id"] != null)' "$STATE_JSON" |
while IFS= read -r window; do
  id=$(jq -r '."window-id"' <<< "$window")
  ws=$(jq -r '.workspace' <<< "$window")
  appname=$(jq -r '."app-name"' <<< "$window")
  echo "  - Restoring Window ID:$id Name:$appname -> Workspace:$ws"
  aerospace move-node-to-workspace --window-id "$id" "$ws" --focus-follows-window </dev/null &>/dev/null || true
done

echo "- Restoration complete."
