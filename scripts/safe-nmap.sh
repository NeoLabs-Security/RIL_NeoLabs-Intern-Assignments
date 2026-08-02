#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CONFIG_FILE="${1:-$ROOT_DIR/tools/authorized-target.env}"

if [[ ! -f "$CONFIG_FILE" ]]; then
  echo "Missing target configuration: $CONFIG_FILE" >&2
  echo "Copy tools/authorized-target.example.env to an ignored local authorized-target.env file." >&2
  exit 2
fi

set -a
# shellcheck disable=SC1090
source "$CONFIG_FILE"
set +a

python3 "$ROOT_DIR/scripts/validate_target.py"

if ! command -v nmap >/dev/null 2>&1; then
  echo "nmap is not installed." >&2
  exit 2
fi

OUTPUT_DIR="$ROOT_DIR/evidence/${ASSIGNMENT_ID}/discovery"
mkdir -p "$OUTPUT_DIR"
chmod 700 "$ROOT_DIR/evidence" "$ROOT_DIR/evidence/${ASSIGNMENT_ID}" "$OUTPUT_DIR" 2>/dev/null || true

STAMP="$(date -u +%Y%m%dT%H%M%SZ)"
OUTPUT_BASE="$OUTPUT_DIR/nmap-${STAMP}"

cat <<NOTICE
Running the fixed NeoLabs low-rate discovery profile against one validated hostname.
No user-supplied Nmap flags, ranges or additional targets are accepted.
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
  -- "$AUTHORIZED_TARGET_HOST"

echo "Results saved under: $OUTPUT_DIR"
