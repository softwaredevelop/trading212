#!/usr/bin/env bash

TRADING212_HOST=${TRADING212_HOST:-"demo.trading212.com"}

curl -s -X GET \
  https://"${TRADING212_HOST}"/api/v0/equity/pies \
  -H "Authorization: ${TRADING212_API_KEY}" |
  jq '.[]'
