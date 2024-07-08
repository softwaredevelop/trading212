#!/usr/bin/env bash

DIRECTORY=${1:-"./"}

[[ "${DIRECTORY}" != */ ]] && DIRECTORY="${DIRECTORY}/"
OUTPUT_FILE="${DIRECTORY}list_isin.txt"

true >"$OUTPUT_FILE"

for file in "$DIRECTORY"*.pdf; do
  if [[ $file =~ ([A-Z]{2}[0-9A-Z]{10})\.pdf ]]; then
    echo "${BASH_REMATCH[1]}" >>"$OUTPUT_FILE"
  fi
done

echo "The ${OUTPUT_FILE} file has been successfully created with the ISIN numbers."
