#!/bin/sh
# Look up a word, then its synonyms and rhymes. Set FREEDICT_API_KEY first (free key: https://freedict.com/account/api).
curl -s -H "X-API-Key: $FREEDICT_API_KEY" https://freedict.com/api/v1/words/serendipity
curl -s -H "X-API-Key: $FREEDICT_API_KEY" https://freedict.com/api/v1/words/happy/synonyms
curl -s -H "X-API-Key: $FREEDICT_API_KEY" https://freedict.com/api/v1/words/time/rhymes
curl -s -H "X-API-Key: $FREEDICT_API_KEY" https://freedict.com/api/v1/word-of-the-day
