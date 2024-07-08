#!/usr/bin/env bash

TRADING212_HOST=${TRADING212_HOST:-"demo.trading212.com"}
ISIN_FILE=${1:?"Error: ISIN_FILE is required as the first argument."}
TYPE=${2:-"ETF"}
CURRENCY=${3:-"EUR"}

INSTRUMENTS=$(curl -s -X GET \
  https://"${TRADING212_HOST}"/api/v0/equity/metadata/instruments \
  -H "Authorization: $TRADING212_API_KEY")

while IFS= read -r ISIN; do
  echo "$INSTRUMENTS" | jq --arg isin "$ISIN" --arg type "$TYPE" --arg currency "$CURRENCY" -r '.[] | select(.isin == $isin and .type == $type and .currencyCode == $currency) | .ticker'
done <"$ISIN_FILE"
