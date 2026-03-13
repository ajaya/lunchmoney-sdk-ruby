#!/usr/bin/env bash
set -euo pipefail

# Regenerate the SDK from the OpenAPI spec.
# Requires: openapi-generator-cli (https://openapi-generator.tech)
#
# Usage:
#   ./scripts/regenerate-sdk.sh [path-to-spec]
#
# If no spec path is given, uses openapi/lunchmoney-v2.json

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
SPEC_FILE="${1:-$REPO_ROOT/openapi/lunchmoney-v2.json}"
GEM_VERSION="$(sed -n "s/.*VERSION = '\([^']*\)'.*/\1/p" "$REPO_ROOT/lib/lunchmoney-sdk-ruby/version.rb")"

if [ ! -f "$SPEC_FILE" ]; then
  echo "ERROR: Spec file not found: $SPEC_FILE"
  exit 1
fi

echo "Regenerating SDK from: $SPEC_FILE"

# Strip "x-internal": true so the generator produces models for all schemas
PROCESSED_SPEC="$(mktemp)"
trap 'rm -f "$PROCESSED_SPEC"' EXIT
jq 'walk(if type == "object" then del(."x-internal") else . end)' "$SPEC_FILE" > "$PROCESSED_SPEC"

openapi-generator generate \
  -i "$PROCESSED_SPEC" \
  -g ruby \
  -o "$REPO_ROOT" \
  --additional-properties=gemName=lunchmoney-sdk-ruby,moduleName=LunchMoney,gemVersion=$GEM_VERSION,library=httpx \
  --skip-validate-spec

echo "SDK regenerated successfully."
echo "Review changes with: git diff"
