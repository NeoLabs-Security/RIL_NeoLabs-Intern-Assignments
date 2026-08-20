#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TARGET="${1:-}"
MANIFEST="$ROOT_DIR/runtime/access-manifest.json"

if [[ -z "$TARGET" || $# -ne 1 ]]; then
  echo "Usage: $0 <exact-hostname|ip|approved-cidr>" >&2
  echo "Run: neolabs scope && neolabs targets" >&2
  exit 2
fi

python3 "$ROOT_DIR/scripts/validate_target.py" "$TARGET"

if ! command -v nmap >/dev/null 2>&1; then
  echo "nmap is not installed." >&2
  exit 2
fi

if [[ ! -f "$MANIFEST" ]]; then
  echo "Missing live NeoLabs access manifest. Run neolabs login, then keep neolabs connect running in another terminal." >&2
  exit 2
fi

readarray -t META < <(python3 - "$MANIFEST" <<'PY'
import json,sys
m=json.load(open(sys.argv[1],encoding='utf-8'))
r=m.get('resources') or {}
t=r.get('tunnel') if isinstance(r,dict) else None
print(m['pod_id'])
print(m.get('scenario_id') or 'unassigned')
print((m.get('lab_state') or 'LIVE'))
print((t or {}).get('transport') or '')
print((t or {}).get('local_port') or '')
PY
)
POD_ID="${META[0]}"
SCENARIO_ID="${META[1]}"
LAB_STATE="${META[2]}"
TUNNEL_TRANSPORT="${META[3]}"
TUNNEL_LOCAL_PORT="${META[4]}"

if [[ "$LAB_STATE" != "LIVE" && "$LAB_STATE" != "CLOUD_LIVE" && "$LAB_STATE" != "ENDPOINT_LIVE" ]]; then
  echo "NeoLabs state is $LAB_STATE; no interactive Nmap target is authorised." >&2
  exit 3
fi

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

COMMON=(
  -sT
  -sV --version-light
  -T3
  --max-rate 50
  --max-retries 2
  --host-timeout 5m
  -Pn
  -oA "$OUTPUT_BASE"
)

if [[ "$TUNNEL_TRANSPORT" == "ssh-local-forward" ]]; then
  if [[ "$TARGET" != "127.0.0.1" || ! "$TUNNEL_LOCAL_PORT" =~ ^[0-9]+$ ]]; then
    echo "Tunnel mode authorises only the manifest-issued localhost target/port." >&2
    exit 3
  fi
  echo "Tunnel mode: scanning only the server-issued local forward port $TUNNEL_LOCAL_PORT."
  nmap "${COMMON[@]}" -p "$TUNNEL_LOCAL_PORT" -- "$TARGET"
else
  nmap "${COMMON[@]}" --top-ports 100 -- "$TARGET"
fi

echo "Results saved under: $OUTPUT_DIR"
