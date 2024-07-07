#!/usr/bin/env bash

TRADING212_HOST=${TRADING212_HOST:-"demo.trading212.com"}
TYPE=${1:-"ETF"}
CURRENCY=${2:-"EUR"}

curl -s -X GET \
  https://"${TRADING212_HOST}"/api/v0/equity/metadata/instruments \
  -H "Authorization: $TRADING212_API_KEY" |
  jq --arg type "$TYPE" --arg currency "$CURRENCY" '.[] | select(.type == $type and .currencyCode == $currency)'
