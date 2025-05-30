#!/bin/bash
# ForgeMaster: Inline Combined HTML into Prestige Template

set -e

INDEX="index.html"
COMBINED="all_combined.html"
OUTPUT="prestige_index.html"

echo "🔨 Forging $OUTPUT from $INDEX + $COMBINED..."

if [[ ! -f "$INDEX" ]]; then
  echo "❌ Missing $INDEX — please create it first."; exit 1;
fi

if [[ ! -f "$COMBINED" ]]; then
  echo "❌ Missing $COMBINED — did you generate all_combined.html?"; exit 1;
fi

sed "/<!-- Injected Content/,/End Combined HTML/{
  r $COMBINED
  d
}" < "$INDEX" > "$OUTPUT"

echo "✅ Prestige template generated: $OUTPUT"

