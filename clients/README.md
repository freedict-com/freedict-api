# Connecting MCP clients to FreeDict

Server URL: `https://freedict.com/mcp` (Streamable HTTP). Sign-in is OAuth 2.1: the client opens a FreeDict sign-in page the first time.

| Client | How |
|---|---|
| Claude (web, desktop) | Settings → Connectors → Add custom connector → `https://freedict.com/mcp` |
| Claude Code | `claude mcp add --transport http freedict https://freedict.com/mcp` |
| Cursor | `~/.cursor/mcp.json`: `{"mcpServers": {"freedict": {"url": "https://freedict.com/mcp"}}}` |
| VS Code | `.vscode/mcp.json`: `{"servers": {"freedict": {"type": "http", "url": "https://freedict.com/mcp"}}}` |
| Windsurf | `~/.codeium/windsurf/mcp_config.json`: `{"mcpServers": {"freedict": {"serverUrl": "https://freedict.com/mcp"}}}` |
| ChatGPT | Settings → Apps & Connectors → Create → MCP server URL `https://freedict.com/mcp` |
| Clients without remote support | `npx mcp-remote https://freedict.com/mcp` as a stdio command |

Every tool is a read-only lookup.
