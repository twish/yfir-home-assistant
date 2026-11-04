#!/bin/sh
# Maps the Home Assistant app's options to the variables yfir-agent run enrols from.
set -eu

options=/data/options.json

if [ -f "$options" ]; then
	YFIR_HUB=$(jq -r '.hub // empty' "$options")
	YFIR_TOKEN=$(jq -r '.token // empty' "$options")
	YFIR_TLS_FINGERPRINT=$(jq -r '.tls_fingerprint // empty' "$options")
	export YFIR_HUB YFIR_TOKEN YFIR_TLS_FINGERPRINT
fi

exec /usr/local/bin/yfir-agent run --state-dir /data
