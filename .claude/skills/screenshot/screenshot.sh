#!/usr/bin/env bash
# Builds the web app and captures a headless Chrome screenshot.
# Usage: screenshot.sh [route] [output.png]
set -euo pipefail
cd "$(dirname "$0")/../../.."

route="${1:-/}"
output="${2:-build/screenshots/screenshot.png}"
chrome="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
port=8765

flutter build web --release --no-wasm-dry-run >/dev/null
mkdir -p "$(dirname "$output")"

python3 -m http.server "$port" --directory build/web >/dev/null 2>&1 &
server_pid=$!
trap 'kill "$server_pid" 2>/dev/null' EXIT
sleep 1

"$chrome" --headless=new --hide-scrollbars --force-device-scale-factor=1 \
  --window-size=500,1000 --virtual-time-budget=15000 \
  --user-data-dir="$(mktemp -d)" \
  --screenshot="$PWD/$output" "http://localhost:$port/#$route" >/dev/null 2>&1

echo "$output"
