---
name: freedict
description: |
  FreeDict is an English dictionary for AI agents and apps: definitions,
  examples, pronunciation, synonyms, rhymes, word origins, slang,
  translations into dozens of languages, usage guides and word-game search.
  Use this skill to add the official FreeDict MCP server, or the REST API,
  when the user wants to look up words, check meanings or spelling, or
  build something that needs dictionary data.
---

# FreeDict

FreeDict gives agents a real dictionary to check instead of guessing:
English words with definitions, examples, IPA, CEFR levels,
synonyms, origins, slang and translations into dozens of languages.

**What it can access:** the tools are read-only dictionary lookups. FreeDict
receives only the words and parameters you send. It can't read the user's
files or chats, or change their FreeDict account.

## Install

Set up the FreeDict MCP server in the current app first. If the user asked
only for the REST API, skip to REST API below.

1. Reuse a working FreeDict MCP connection if one already exists.
2. Otherwise add the remote server for the current app, as listed under
   Choose your app. If you can run commands or edit the app's MCP config
   (Claude Code, Codex, Gemini CLI, Cursor, VS Code), confirm with the user,
   then add it. Claude connectors and ChatGPT can only be added by the user
   in their settings, so give them those steps. Either way the app runs
   FreeDict's sign-in in the browser, so you never handle a password, API
   key or token.
3. Let the user complete sign-in. If they already have a FreeDict account,
   they sign in and press **Allow**. If not, the same page creates a free
   account first.
4. Verify (below) before marking FreeDict ready.

| Setting | Value |
|---|---|
| Server URL | `https://freedict.com/mcp` |
| Transport | Streamable HTTP |
| Auth | OAuth 2.1 with PKCE, dynamic client registration |

## Choose your app

**Claude (claude.ai, Claude Desktop, and Claude Code in the desktop app)**
The user adds it once as a custom connector: Settings → Connectors → Add
custom connector → name `FreeDict`, URL `https://freedict.com/mcp` → Add →
Connect. It's then available in every conversation, and in Claude Code when
signed in with the same Claude account.

**Claude Code (terminal)**

```bash
claude mcp add --transport http freedict https://freedict.com/mcp
```

This adds it to the current project only (Claude Code's default). Add
`--scope user` if the user wants it in every project. Then run `/mcp`,
choose `freedict` and sign in.

**Cursor**
[Add to Cursor](cursor://anysphere.cursor-deeplink/mcp/install?name=freedict&config=eyJ1cmwiOiJodHRwczovL2ZyZWVkaWN0LmNvbS9tY3AifQ%3D%3D)
or add `"freedict": { "url": "https://freedict.com/mcp" }` under `mcpServers`
in `~/.cursor/mcp.json`, then press **Connect** in Settings → MCP.

**VS Code**
[Install in VS Code](vscode:mcp/install?%7B%22name%22%3A%22freedict%22%2C%22type%22%3A%22http%22%2C%22url%22%3A%22https%3A%2F%2Ffreedict.com%2Fmcp%22%7D)

**ChatGPT**
Developer mode is required to add a custom server: Settings → Apps &
Connectors → Advanced settings → Developer mode → Create, with the URL
`https://freedict.com/mcp`, then sign in.

**Codex**

```bash
codex mcp add freedict --url https://freedict.com/mcp
codex mcp login freedict
```

**Gemini CLI**

```bash
gemini mcp add --transport http freedict https://freedict.com/mcp
```

Gemini opens the sign-in the first time a FreeDict tool is used.

**Other MCP clients**
Add a remote HTTP server at `https://freedict.com/mcp`. Discovery follows the
MCP authorization spec (`/.well-known/oauth-protected-resource`).

## Verify

Call the `word_of_the_day` tool. A reply with a word and its meaning means
FreeDict is ready.

Many apps load new MCP tools only in a new conversation or after a restart.
If the FreeDict tools don't appear yet, tell the user setup is done and ask
them to start a new conversation (or reload MCP servers), then ask you to
check FreeDict. Don't report it as ready until the call succeeds.

**If sign-in fails:** check the user is signed in to freedict.com in the
browser that opened, then remove and re-add the server. A user can see and
disconnect connected apps at https://freedict.com/account/api.

Report what you set up, where (which app and scope), and any step that is
still waiting on the user.

## Tools

All tools are read-only.

| Tool | Returns | Plan |
|---|---|---|
| `lookup_word` | The full entry: every definition with its part of speech, IPA (US or UK), an easy respelling, CEFR level and content flags. Add `include` to get examples, synonyms, origin, forms, usage notes, FAQs and translations in the same call. | Free |
| `examples` | Example sentences for each meaning. | Free |
| `synonyms` | Synonyms, antonyms, broader and narrower terms (oak is a kind of tree), part-of and has-parts (trunk is part of a tree) and related words, grouped by meaning. | Free |
| `rhymes` | Words that rhyme by sound, common words first and names last. Choose perfect rhymes, near rhymes or consonant matches. | Free |
| `pronunciation` | How a word sounds: phonemes, syllable count, IPA and words that sound the same (course, coarse). | Free |
| `sounds_like` | Find a word from how it sounds, even misspelled: "jirraf" finds giraffe. | Free |
| `translate` | Translations into dozens of languages, with part of speech and a romanised form for non-Latin scripts. Pass `lang` for one language. | Free |
| `word_of_the_day` | Today's Word of the Day with its full entry, or a past day's with `date`. | Free |
| `random_word` | A random common word with its full entry, optionally filtered by CEFR level or part of speech. | Free |
| `autocomplete` | Up to 10 words starting with what someone has typed, most common first, with a short meaning. If nothing starts with it, the real words it was probably meant to be ("recieve" gives receive), with corrected: true. | Free |
| `etymology` | Where the word comes from: origin language, first known use and the story of how it reached English. | Starter |
| `word_forms` | Plurals, verb tenses, comparatives and spelling variants. | Starter |
| `frequency` | How common the word is: its rank among English words and its CEFR level. | Starter |
| `slang` | What a slang term means, an example, where it came from and when it appeared. | Starter |
| `unscramble` | Every word that can be made from a set of letters, longest first. Use ? for a blank tile. | Starter |
| `find_words` | One search for any mix of spelling (pattern t??k or un*able, starts, ends, contains, length), sound (sounds like, rhymes with), meaning ("ringing in the ears"), company (adjectives for a noun, what follows a word), kind-of and part-of, syllables, part of speech and CEFR level. A misspelled pattern still finds the word. Common words first, or in meaning, sound or company order. Each result has its definition, level and syllables; add examples or translations in the same call. | Free |
| `usage_guide` | Usage notes: a plain-English meaning, common mistakes, common word pairings, easily confused words, formality, UK and US differences and a learner tip. | Pro |
| `compare_words` | The difference between two easily confused words (affect vs effect), with a quick answer, an explanation and FAQs. | Pro |
| `word_faqs` | Common questions about a word with short answers: meaning, spelling, pronunciation, plural, opposite. | Pro |
| `quiz` | Multiple-choice questions about a word (meaning, synonym, origin), with the answer and an explanation. | Pro |
| `reverse_translate` | The English word for a word in another language, e.g. "fauché" (French) → broke. | Pro |

## Plans

Every account starts on the Free plan: 3,000 calls a month, for
non-commercial use. Commercial use and tools above the Free plan need a paid
plan: Starter $12, Pro $49 or Business $149 a month
(https://freedict.com/api/pricing). Calls from AI apps count toward the
user's plan. Tell the user about these limits if they matter for what they
are building.

## When to use FreeDict

- The user asks what a word means, how to pronounce or spell it, or for an example.
- They want a synonym, an opposite, a rhyme, or a word that fits letters or a pattern.
- They ask where a word comes from, what slang means, or the difference between two words.
- They want a word in another language, or the English for a foreign word.

Link to the entry when you show one: `https://freedict.com/word/{slug}`.

## REST API

For code (an app, a script, a server), use the REST API with a key:

1. The user creates a free key at https://freedict.com/account/api.
2. Store it in an environment variable such as `FREEDICT_API_KEY`, not in source code.
3. Send it as the `X-API-Key` header:

```bash
curl "https://freedict.com/api/v1/words/serendipity?locale=en-US&include=examples,synonyms" \
  -H "X-API-Key: $FREEDICT_API_KEY"
```

Docs: https://freedict.com/api/docs · Plans: https://freedict.com/api/pricing ·
API terms: https://freedict.com/api/terms · Privacy: https://freedict.com/privacy
