#!/usr/bin/env bash

TRADING212_HOST=${TRADING212_HOST:-"demo.trading212.com"}
TICKER=${1:?"Error: TICKER is required as the first argument."}
TYPE=${2:-"ETF"}
CURRENCY=${3:-"EUR"}

curl -s -X GET \
  https://"${TRADING212_HOST}"/api/v0/equity/metadata/instruments \
  -H "Authorization: ${TRADING212_API_KEY}" |
  jq --arg ticker "${TICKER}" --arg type "${TYPE}" --arg currency "${CURRENCY}" -r '.[] | select(.ticker == $ticker and .type == $type and .currencyCode == $currency) | .isin'
