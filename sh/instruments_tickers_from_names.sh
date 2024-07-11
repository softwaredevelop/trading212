#!/usr/bin/env bash

TRADING212_HOST=${TRADING212_HOST:-"demo.trading212.com"}
NAME_FILE=${1:?"Error: NAME_FILE is required as the first argument."}
TYPE=${2:-"ETF"}
CURRENCY=${3:-"EUR"}

INSTRUMENTS=$(curl -s -X GET \
  https://"${TRADING212_HOST}"/api/v0/equity/metadata/instruments \
  -H "Authorization: ${TRADING212_API_KEY}")

while IFS= read -r NAME; do
  echo "${INSTRUMENTS}" | jq --arg name "${NAME}" --arg type "${TYPE}" --arg currency "${CURRENCY}" -r '.[] | select(.name == $name and .type == $type and .currencyCode == $currency) | .ticker'
done <"${NAME_FILE}"
