// Look up a word with the FreeDict API (Node 18+). Run on your server, never in the browser: the key is secret.
const BASE = "https://freedict.com/api/v1";
const res = await fetch(`${BASE}/words/serendipity`, {
  headers: { "X-API-Key": process.env.FREEDICT_API_KEY },
});
const body = await res.json();
console.log(res.ok ? body.data : body.error);
