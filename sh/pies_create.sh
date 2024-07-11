#!/usr/bin/env bash

TRADING212_HOST=${TRADING212_HOST:-"demo.trading212.com"}
NAME=${1:?"Error: NAME is required as the first argument."}
INSTRUMENT_SHARES_FILE=${2:?"Error: INSTRUMENT_SHARES JSON file is required as the second argument."}
ICON=${3:-"Coins"}

INSTRUMENT_SHARES=$(cat "${INSTRUMENT_SHARES_FILE}")

curl -s -X POST \
  https://"${TRADING212_HOST}"/api/v0/equity/pies \
  -H "Authorization: ${TRADING212_API_KEY}" \
  -H 'Content-Type: application/json' \
  -d '{
    "dividendCashAction": "REINVEST",
    "endDate": "2040-01-01T23:59:59.999+03:00",
    "goal": 0,
    "icon": "'"${ICON}"'",
    "instrumentShares": '"${INSTRUMENT_SHARES}"',
    "name": "'"${NAME}"'"
  }' |
  jq '.[]'
