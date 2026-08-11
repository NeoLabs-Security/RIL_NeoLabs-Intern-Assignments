#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TARGET="${1:-}"

if [[ -z "$TARGET" || $# -ne 1 ]]; then
  echo "Usage: $0 <exact-hostname|ip|approved-cidr>" >&2
  echo "Run: python3 tools/neolabs.py scope && python3 tools/neolabs.py targets" >&2
  exit 2
fi

python3 "$ROOT_DIR/scripts/validate_target.py" "$TARGET"

if ! command -v nmap >/dev/null 2>&1; then
  echo "nmap is not installed." >&2
  exit 2
fi

if [[ ! -f "$ROOT_DIR/runtime/access-manifest.json" ]]; then
  echo "Missing live NeoLabs access manifest. Run neolabs connect first." >&2
  exit 2
fi

POD_ID="$(python3 -c 'import json,sys; print(json.load(open(sys.argv[1], encoding="utf-8"))["pod_id"])' "$ROOT_DIR/runtime/access-manifest.json")"
SCENARIO_ID="$(python3 -c 'import json,sys; print(json.load(open(sys.argv[1], encoding="utf-8")).get("scenario_id") or "unassigned")' "$ROOT_DIR/runtime/access-manifest.json")"
SAFE_SCENARIO="$(printf '%s' "$SCENARIO_ID" | tr -cd 'A-Za-z0-9._-')"
OUTPUT_DIR="$ROOT_DIR/evidence/${SAFE_SCENARIO}/${POD_ID}/discovery"
mkdir -p "$OUTPUT_DIR"
chmod 700 "$ROOT_DIR/evidence" "$ROOT_DIR/evidence/${SAFE_SCENARIO}" "$ROOT_DIR/evidence/${SAFE_SCENARIO}/${POD_ID}" "$OUTPUT_DIR" 2>/dev/null || true

STAMP="$(date -u +%Y%m%dT%H%M%SZ)"
OUTPUT_BASE="$OUTPUT_DIR/nmap-${STAMP}"

cat <<NOTICE
NeoLabs approved discovery profile
Pod: $POD_ID
Scenario: $SCENARIO_ID
Target: $TARGET

The target has been checked against the current server-issued manifest.
No user-supplied Nmap flags or additional targets are accepted by this wrapper.
NOTICE

nmap \
  -sT \
  -sV --version-light \
  -T3 \
  --max-rate 50 \
  --max-retries 2 \
  --host-timeout 5m \
  --top-ports 100 \
  -Pn \
  -oA "$OUTPUT_BASE" \
  -- "$TARGET"

echo "Results saved under: $OUTPUT_DIR"
