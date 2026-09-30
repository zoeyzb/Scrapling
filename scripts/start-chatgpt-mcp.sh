#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

if [ ! -d .mcp-venv ]; then
  python3 -m venv .mcp-venv
fi

.mcp-venv/bin/python -m pip install -q --upgrade pip
.mcp-venv/bin/python -m pip install -q -e ".[ai]"
.mcp-venv/bin/scrapling install

echo "Scrapling MCP: http://127.0.0.1:8768/mcp"
echo "Keep this terminal open."

exec npx -y supergateway \
  --stdio "$ROOT/.mcp-venv/bin/scrapling-mcp" \
  --outputTransport streamableHttp \
  --port 8768 \
  --streamableHttpPath /mcp
