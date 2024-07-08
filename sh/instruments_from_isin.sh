#!/usr/bin/env bash

TRADING212_HOST=${TRADING212_HOST:-"demo.trading212.com"}
ISIN=${1:?"Error: ISIN is required as the first argument."}
TYPE=${2:-"ETF"}
CURRENCY=${3:-"EUR"}

curl -s -X GET \
  https://"${TRADING212_HOST}"/api/v0/equity/metadata/instruments \
  -H "Authorization: $TRADING212_API_KEY" |
  jq --arg isin "$ISIN" --arg type "$TYPE" --arg currency "$CURRENCY" '.[] | select(.isin == $isin and .type == $type and .currencyCode == $currency)'
