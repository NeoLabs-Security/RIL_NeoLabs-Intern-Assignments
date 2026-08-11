#!/usr/bin/env python3
"""Validate one requested Pentest target against the NeoLabs live access manifest.

The script performs no network requests. It only accepts an exact hostname/IP listed by
the server or an IP/CIDR that falls within an explicitly returned allowed CIDR.
"""

from __future__ import annotations

import ipaddress
import json
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
MANIFEST_PATH = ROOT / "runtime" / "access-manifest.json"
HOST_RE = re.compile(r"^(?=.{1,253}$)(?!-)(?:[A-Za-z0-9-]{1,63}\.)+[A-Za-z0-9-]{2,63}$")


def fail(message: str) -> "NoReturn":
    print(f"Target validation failed: {message}", file=sys.stderr)
    raise SystemExit(2)


def read_manifest() -> dict:
    if not MANIFEST_PATH.is_file():
        fail("missing runtime/access-manifest.json; run `neolabs login` and `neolabs connect` first")
    try:
        value = json.loads(MANIFEST_PATH.read_text(encoding="utf-8"))
    except (OSError, json.JSONDecodeError):
        fail("runtime access manifest is unreadable; run `neolabs connect` again")
    if not isinstance(value, dict) or value.get("track") != "PENTEST":
        fail("runtime manifest is not a Grey-Box Pentest assignment")
    resources = value.get("resources")
    if not isinstance(resources, dict):
        fail("runtime manifest contains invalid resources")
    return value


def allowed_networks(resources: dict) -> list[ipaddress.IPv4Network | ipaddress.IPv6Network]:
    result = []
    values = resources.get("allowed_cidrs", [])
    if not isinstance(values, list):
        fail("allowed_cidrs in the server manifest is invalid")
    for raw in values:
        try:
            network = ipaddress.ip_network(str(raw), strict=True)
        except ValueError:
            fail(f"server returned invalid allowed CIDR: {raw}")
        result.append(network)
    return result


def explicit_targets(resources: dict) -> tuple[set[str], set[ipaddress._BaseAddress]]:
    hostnames: set[str] = set()
    addresses: set[ipaddress._BaseAddress] = set()
    values = resources.get("targets", [])
    if not isinstance(values, list):
        fail("targets in the server manifest is invalid")
    for item in values:
        if not isinstance(item, dict):
            continue
        hostname = item.get("hostname")
        if isinstance(hostname, str) and hostname:
            hostnames.add(hostname.strip().lower())
        raw_ip = item.get("ip")
        if isinstance(raw_ip, str) and raw_ip:
            try:
                addresses.add(ipaddress.ip_address(raw_ip.strip()))
            except ValueError:
                fail(f"server returned invalid target IP: {raw_ip}")
    return hostnames, addresses


def validate(requested: str, manifest: dict) -> str:
    value = requested.strip().lower()
    if not value or any(token in value for token in ("*", ",", " ", "..")):
        fail("use one exact hostname, IP address or server-approved CIDR; wildcards/lists are not accepted")

    resources = manifest["resources"]
    networks = allowed_networks(resources)
    hostnames, addresses = explicit_targets(resources)

    if "/" in value:
        try:
            requested_network = ipaddress.ip_network(value, strict=True)
        except ValueError:
            fail("CIDR target is invalid")
        if requested_network not in networks:
            fail("CIDR was not explicitly returned by `neolabs scope`")
        return str(requested_network)

    try:
        requested_ip = ipaddress.ip_address(value)
    except ValueError:
        if not HOST_RE.fullmatch(value):
            fail("target is not a valid exact hostname, IP or CIDR")
        if value not in hostnames:
            fail("hostname is not listed by `neolabs targets`")
        return value

    if requested_ip in addresses or any(requested_ip in network for network in networks):
        return str(requested_ip)
    fail("IP address is outside the server-returned pod scope")


def main() -> None:
    if len(sys.argv) != 2:
        fail("usage: python3 scripts/validate_target.py <hostname|ip|cidr>")
    manifest = read_manifest()
    target = validate(sys.argv[1], manifest)
    print(f"Authorised NeoLabs target for {manifest.get('pod_id')}: {target}")


if __name__ == "__main__":
    main()
