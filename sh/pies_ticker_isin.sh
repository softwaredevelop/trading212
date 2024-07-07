#!/usr/bin/env bash

TRADING212_HOST=${TRADING212_HOST:-"demo.trading212.com"}
TICKER=${1:?"Error: TICKER is required as the first argument."}

curl -s -X GET \
  https://"${TRADING212_HOST}"/api/v0/equity/metadata/instruments \
  -H "Authorization: $TRADING212_API_KEY" |
  jq --arg ticker "$TICKER" -r '.[] | select(.ticker == $ticker) | .isin'
