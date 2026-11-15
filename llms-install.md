# Installing FreeDict for an AI agent

FreeDict is a remote MCP server. There is nothing to install or build.

1. Add a remote MCP server named `freedict` with the URL `https://freedict.com/mcp` and transport Streamable HTTP.
2. On first use the client opens a FreeDict sign-in page. The user signs in or creates a free account and approves access.
3. Check the connection by calling the `lookup_word` tool with `word: "serendipity"`.

No API key is needed for MCP; the sign-in replaces it. For the REST API instead, see README.md.
