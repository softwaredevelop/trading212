#!/usr/bin/env bash

TRADING212_HOST=${TRADING212_HOST:-"demo.trading212.com"}

response=$(curl -s -X GET \
  https://"${TRADING212_HOST}"/api/v0/equity/pies \
  -H "Authorization: ${TRADING212_API_KEY}")

echo "$response" | jq -r '.[] | "\(.id) \(.result.resultCoef)"' | sort -k2 -nr
