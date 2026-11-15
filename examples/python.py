"""Look up a word with the FreeDict API. Needs: pip install requests, and FREEDICT_API_KEY set."""
import os
import requests

BASE = "https://freedict.com/api/v1"
HEADERS = {"X-API-Key": os.environ["FREEDICT_API_KEY"]}

resp = requests.get(f"{BASE}/words/serendipity", headers=HEADERS, timeout=10)
body = resp.json()
if resp.ok:
    print(body["data"])
else:
    print(body["error"]["code"], body["error"]["message"])
