#!/usr/bin/env -S uv run -s
# /// script
# dependencies = ["packaging"]
# ///

import json
import os
import re
import sys
import urllib.request
from pathlib import Path

try:
    from packaging.version import Version, InvalidVersion

    HAVE_PACKAGING = True
except Exception:
    HAVE_PACKAGING = False

ROOT = (
    Path(__file__).resolve().parents[1]
    if (Path(__file__).parent.name == "scripts")
    else Path.cwd()
)
PKG_DIR = ROOT / "packages"

TOPLEVEL_PNAME_RE = re.compile(r'^\s*pname\s*=\s*"([^"]+)"\s*;', re.M)
TOPLEVEL_VERSION_RE = re.compile(r'^\s*version\s*=\s*"([^"]+)"\s*;', re.M)


def parse_default_nix(path: Path):
    text = path.read_text(encoding="utf-8", errors="replace")
    # Heuristic: take the first pname/version inside the top-level derivation
    # (before "src = fetchPypi" if present) to avoid inner pname overrides used for src.
    split_idx = text.find("src = fetchPypi")
    search_text = text if split_idx == -1 else text[:split_idx]
    mname = TOPLEVEL_PNAME_RE.search(search_text) or TOPLEVEL_PNAME_RE.search(text)
    mver = TOPLEVEL_VERSION_RE.search(search_text) or TOPLEVEL_VERSION_RE.search(text)
    if not mname or not mver:
        return None
    return {"name": mname.group(1), "version": mver.group(1), "file": str(path)}


def fetch_pypi_json(name: str):
    # Try name as-is; if it fails, try swapping _ and -
    def get(url):
        with urllib.request.urlopen(url, timeout=15) as r:
            return json.load(r)

    base = "https://pypi.org/pypi/{}/json"
    variants = [name, name.replace("-", "_"), name.replace("_", "-")]
    last_err = None
    for v in variants:
        try:
            return get(base.format(urllib.request.quote(v)))
        except Exception as e:
            last_err = e
    raise last_err


def is_prerelease(vs: str):
    # Simple pre-release detector (PEP 440 markers)
    s = vs.lower()
    return any(tag in s for tag in ("a", "b", "rc", "dev")) and "post" not in s


def best_version(releases: dict, include_prereleases=False):
    keys = list(releases.keys())
    if not keys:
        return None
    if not include_prereleases:
        keys = [k for k in keys if not is_prerelease(k)] or list(releases.keys())
    if HAVE_PACKAGING:

        def keyfunc(x):
            try:
                return Version(x)
            except InvalidVersion:
                return Version("0")

        return str(sorted(keys, key=keyfunc)[-1])
    else:
        # Fallback: PyPI info.version is usually the latest release (may include pre-release)
        # Without packaging, we just return the lexicographically max string
        return sorted(keys)[-1]


def main(include_prereleases=False):
    if not PKG_DIR.is_dir():
        print(f"Error: packages directory not found at {PKG_DIR}", file=sys.stderr)
        sys.exit(1)

    entries = []
    for df in sorted(PKG_DIR.glob("*/default.nix")):
        meta = parse_default_nix(df)
        if meta:
            entries.append(meta)

    if not entries:
        print("No derivations found.")
        return

    if not HAVE_PACKAGING:
        print(
            "Note: packaging not available; version comparison is less precise. "
            "pip install packaging for best results.\n",
            file=sys.stderr,
        )

    rows = []
    for e in entries:
        name = e["name"]
        cur = e["version"]
        try:
            data = fetch_pypi_json(name)
            releases = data.get("releases", {})
            latest = best_version(releases, include_prereleases=include_prereleases)
            if latest is None:
                status = "unknown (no releases)"
            else:
                if HAVE_PACKAGING:
                    newer = Version(latest) > Version(cur)
                else:
                    newer = latest != cur
                status = "OUTDATED" if newer else "up-to-date"
        except Exception as ex:
            latest = "n/a"
            status = f"pypi lookup failed: {ex}"
        rows.append((name, cur, latest, status, e["file"]))

    # Pretty print
    name_w = max(len(r[0]) for r in rows)
    cur_w = max(len(r[1]) for r in rows)
    lat_w = max(len(str(r[2])) for r in rows)
    print(f"{'package':{name_w}}  {'current':{cur_w}}  {'latest':{lat_w}}  status")
    print("-" * (name_w + cur_w + lat_w + 10))
    for r in rows:
        print(f"{r[0]:{name_w}}  {r[1]:{cur_w}}  {str(r[2]):{lat_w}}  {r[3]}")


if __name__ == "__main__":
    include_prereleases = "--pre" in sys.argv
    main(include_prereleases)
