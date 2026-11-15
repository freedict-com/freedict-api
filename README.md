# FreeDict API and MCP server

<img src="logo.png" alt="FreeDict" width="96" align="right">

English dictionary data for apps, sites, games and AI agents: definitions, examples, pronunciation, synonyms and antonyms, rhymes, word origins, slang, word forms and translations, plus a word finder that takes every filter in one call.

You can use it two ways:

- **MCP server** for AI apps: `https://freedict.com/mcp` (Streamable HTTP, OAuth 2.1 sign-in).
- **REST API**: `https://freedict.com/api/v1`, with a key in the `X-API-Key` header.

This repository holds the public docs, the OpenAPI file and client setup examples. The service itself runs at [freedict.com](https://freedict.com).

## Connect an AI app (MCP)

Add `https://freedict.com/mcp` as a remote MCP server or custom connector. The app opens a FreeDict sign-in the first time; a free account is enough to start.

**Claude** (claude.ai or Claude Desktop): Settings → Connectors → Add custom connector → paste `https://freedict.com/mcp`.

**Claude Code**

```bash
claude mcp add --transport http freedict https://freedict.com/mcp
```

**Cursor** (`~/.cursor/mcp.json`) and other clients that take a JSON config:

```json
{
  "mcpServers": {
    "freedict": { "url": "https://freedict.com/mcp" }
  }
}
```

**Cline** (`cline_mcp_settings.json`, or ask Cline to "add the FreeDict MCP server"):

```json
{
  "mcpServers": {
    "freedict": { "type": "streamableHttp", "url": "https://freedict.com/mcp" }
  }
}
```

**VS Code** (`.vscode/mcp.json`):

```json
{
  "servers": {
    "freedict": { "type": "http", "url": "https://freedict.com/mcp" }
  }
}
```

More clients are in [`clients/`](clients/). An agent can set itself up from [`SKILL.md`](SKILL.md).

Official MCP Registry name: `com.freedict/mcp` ([`server.json`](server.json)).

## Call the REST API

Get a free key at [freedict.com/account/api](https://freedict.com/account/api), then:

```bash
curl -H "X-API-Key: $FREEDICT_API_KEY" https://freedict.com/api/v1/words/serendipity
```

Every response is JSON: results come in `data` (with `meta`), errors as `error` with a `code` and a `message`. The full description is in [`openapi.json`](openapi.json) (OpenAPI 3.1), also served live at [freedict.com/api/v1/openapi.json](https://freedict.com/api/v1/openapi.json). Examples in several languages are in [`examples/`](examples/).

### Endpoints

All paths are under `https://freedict.com/api/v1`.

| Endpoint | What it returns |
|---|---|
| `GET /words/{word}` | Meanings with part of speech, pronunciation, respelling and CEFR level |
| `GET /words/{word}/examples` | Example sentences |
| `GET /words/{word}/synonyms` | Synonyms and antonyms, grouped by meaning |
| `GET /words/{word}/rhymes` | Rhymes and near rhymes |
| `GET /words/{word}/etymology` | Where the word comes from |
| `GET /words/{word}/forms` | Plurals, tenses and other forms |
| `GET /words/{word}/translations` | The word in other languages |
| `GET /words/{word}/usage` | Usage notes |
| `GET /words/{word}/sounds` | Pronunciation and homophones |
| `GET /words/{word}/frequency` | How common the word is |
| `GET /words/{word}/faqs` | Common questions about the word |
| `GET /words/{word}/quiz` | Quiz questions for the word |
| `GET /words` | Find words |
| `GET /words/query` | Word search: pattern, letters, length, start, end, meaning, sound, or a seeded word list |
| `POST /words/batch` | Several words in one call |
| `GET /words/random` | A random word |
| `GET /word-of-the-day` | Today's word |
| `GET /autocomplete` | Words starting with what someone typed, with spelling suggestions |
| `GET /unscramble` | Words that can be made from a set of letters |
| `GET /sounds-like` | Words that sound like another word |
| `GET /compare` | The difference between two easily confused words |
| `GET /slang/{term}` | What a slang term means |
| `GET /translate/reverse` | The English for a word in another language |
| `GET /meta` | Dataset info |

## Plans

The Free plan covers non-commercial projects; paid plans cover commercial use. Limits and prices: [freedict.com/api/pricing](https://freedict.com/api/pricing). Use rules: [freedict.com/api/terms](https://freedict.com/api/terms).

## Links

- Docs: [freedict.com/api/docs](https://freedict.com/api/docs)
- For AI apps: [freedict.com/llms.txt](https://freedict.com/llms.txt)
- Questions and bug reports: open an issue here, or use [freedict.com/contact](https://freedict.com/contact)

The docs and examples in this repository are MIT licensed. The dictionary data is served under the [FreeDict API terms](https://freedict.com/api/terms).
