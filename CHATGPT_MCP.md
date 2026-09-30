# ChatGPT local MCP

Scrapling already includes an MCP server. This branch only adds a Mac launcher;
the scraper/MCP implementation itself is unchanged.

## Mac quick start

Requirements: Python 3.10+, Node/npm.

```bash
git checkout chatgpt-mcp-local
chmod +x scripts/start-chatgpt-mcp.sh
./scripts/start-chatgpt-mcp.sh
```

The script installs this checkout with the `ai` extra, installs browser
dependencies, and exposes Scrapling's existing stdio MCP through Supergateway:

```
http://127.0.0.1:8768/mcp
```

For ChatGPT web, keep this local endpoint private and connect it through OpenAI
Secure MCP Tunnel.
