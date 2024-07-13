#!/usr/bin/env bash

TRADING212_HOST=${TRADING212_HOST:-"demo.trading212.com"}
ID=${1:?"Error: ID is required as the first argument."}

response=$(curl -s -X GET \
  https://"${TRADING212_HOST}"/api/v0/equity/pies/"${ID}" \
  -H "Authorization: ${TRADING212_API_KEY}")

echo "$response" | jq -r '.instruments[] | "\(.ticker) \(.expectedShare)"'
