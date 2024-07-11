#!/bin/bash

ISIN_FILE=${1:?"Error: ISIN_FILE is required as the first argument."}
DOWNLOAD_DIR=${2:?"Error: DOWNLOAD_DIR is required as the second argument."}
[[ "${DOWNLOAD_DIR}" != */ ]] && DOWNLOAD_DIR="${DOWNLOAD_DIR}/"

if [ ! -f "${ISIN_FILE}" ] || [ ! -r "${ISIN_FILE}" ]; then
  echo "Error: The file does not exist or is not readable: ${ISIN_FILE}"
  exit 1
fi

if [ ! -d "${DOWNLOAD_DIR}" ]; then
  mkdir -p "${DOWNLOAD_DIR}"
fi

while IFS= read -r ISIN; do
  echo "Downloading: ${ISIN}.pdf"
  curl -o "${DOWNLOAD_DIR}${ISIN}.pdf" "https://d215063395wcf4.cloudfront.net/EU_KIDs/${ISIN}.pdf"
done <"${ISIN_FILE}"

echo "All files have been downloaded."
