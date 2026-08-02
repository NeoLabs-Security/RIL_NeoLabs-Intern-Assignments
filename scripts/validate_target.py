#!/usr/bin/env python3
"""Validate the exact mentor-issued target configuration.

This script does not discover targets and does not make network requests.
"""

from __future__ import annotations

import ipaddress
import os
import re
import sys

HOST_RE = re.compile(r"^(?=.{1,253}$)(?!-)(?:[A-Za-z0-9-]{1,63}\.)+[A-Za-z0-9-]{2,63}$")
ASSIGNMENT_RE = re.compile(r"^[A-Za-z0-9][A-Za-z0-9._-]{2,80}$")


def fail(message: str) -> "None":
    print(f"Target validation failed: {message}", file=sys.stderr)
    raise SystemExit(2)


def main() -> None:
    acknowledged = os.getenv("ROE_ACKNOWLEDGED", "").strip()
    host = os.getenv("AUTHORIZED_TARGET_HOST", "").strip().lower()
    scheme = os.getenv("AUTHORIZED_TARGET_SCHEME", "").strip().lower()
    port_text = os.getenv("AUTHORIZED_TARGET_PORT", "").strip()
    assignment_id = os.getenv("ASSIGNMENT_ID", "").strip()

    if acknowledged != "YES":
        fail("set ROE_ACKNOWLEDGED=YES only after reading the written Rules of Engagement")
    if not assignment_id or not ASSIGNMENT_RE.fullmatch(assignment_id):
        fail("ASSIGNMENT_ID is missing or invalid")
    if scheme not in {"http", "https"}:
        fail("AUTHORIZED_TARGET_SCHEME must be http or https")
    if not port_text.isdigit() or not 1 <= int(port_text) <= 65535:
        fail("AUTHORIZED_TARGET_PORT must be an integer from 1 to 65535")
    if any(token in host for token in ("*", "/", ",", " ", "..")):
        fail("wildcards, ranges, lists and paths are not allowed")

    if host == "localhost":
        pass
    else:
        try:
            parsed_ip = ipaddress.ip_address(host)
        except ValueError:
            if not HOST_RE.fullmatch(host):
                fail("target must be one exact DNS hostname or localhost")
        else:
            if not parsed_ip.is_loopback:
                fail("raw non-loopback IP targets are disabled; use the exact mentor-issued hostname")

    print(f"Authorised target validated for assignment {assignment_id}: {scheme}://{host}:{port_text}")


if __name__ == "__main__":
    main()
