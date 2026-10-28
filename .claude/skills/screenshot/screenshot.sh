#!/usr/bin/env bash
# Builds the web app and captures a headless Chrome screenshot at phone size.
# Usage: screenshot.sh [route] [output.png] [width] [height]
#
# Headless Chrome on macOS won't make windows narrower than ~500px, so the
# app is rendered inside an iframe of the requested size.
set -euo pipefail
cd "$(dirname "$0")/../../.."

route="${1:-/}"
output="${2:-build/screenshots/screenshot.png}"
width="${3:-393}"
height="${4:-852}"
chrome="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
port=8765

flutter build web --release --no-wasm-dry-run >/dev/null
mkdir -p "$(dirname "$output")"
cat >build/web/_frame.html <<EOF
<!doctype html>
<style>html,body{margin:0;background:#888}iframe{border:0;display:block}</style>
<iframe src="/#$route" width="$width" height="$height"></iframe>
EOF

python3 -m http.server "$port" --directory build/web >/dev/null 2>&1 &
server_pid=$!
trap 'kill "$server_pid" 2>/dev/null' EXIT
sleep 1

window_width=$((width > 500 ? width : 500))
"$chrome" --headless=new --hide-scrollbars --force-device-scale-factor=2 \
  --window-size="$window_width,$height" --virtual-time-budget=15000 \
  --user-data-dir="$(mktemp -d)" \
  --screenshot="$PWD/$output" "http://localhost:$port/_frame.html" \
  >/dev/null 2>&1

echo "$output (${width}x${height} inside a ${window_width}px window)"
