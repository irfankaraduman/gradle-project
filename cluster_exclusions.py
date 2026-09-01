#!/usr/bin/env python3

import argparse
import csv
import json
import os
import re
import ssl
import sys
from urllib.parse import urlencode
from urllib.request import Request, urlopen
from urllib.error import HTTPError, URLError

APIS_ENDPOINT = "/api/v3/apis"
PAGE_LIMIT = 500

UUID_RE = re.compile(r"^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$", re.I)
NUMERIC_RE = re.compile(r"^\d+$")


def fetch_all_apis(base_url, token, insecure=False):
    all_apis = []
    offset = 0

    ssl_context = None
    if insecure:
        ssl_context = ssl.create_default_context()
        ssl_context.check_hostname = False
        ssl_context.verify_mode = ssl.CERT_NONE

    while True:
        query_params = [
            ("limit", PAGE_LIMIT),
            ("offset", offset),
            ("returnFields", "path"),
            ("returnFields", "method"),
            ("returnFields", "host"),
        ]
        url = base_url.rstrip("/") + APIS_ENDPOINT + "?" + urlencode(query_params)
        req = Request(url, headers={
            "Authorization": f"Bearer {token}",
            "Accept": "application/json",
        })

        try:
            with urlopen(req, timeout=30, context=ssl_context) as resp:
                raw = resp.read()
        except HTTPError as e:
            print(f"HTTP error ({url}): {e.code} {e.reason}", file=sys.stderr)
            try:
                print(e.read().decode("utf-8", errors="replace"), file=sys.stderr)
            except Exception:
                pass
            sys.exit(1)
        except URLError as e:
            print(f"Connection error: {e.reason}", file=sys.stderr)
            sys.exit(1)

        data = json.loads(raw)
        entities = data.get("entities", [])
        all_apis.extend(entities)
        print(f"  offset={offset}: fetched {len(entities)} (total so far: {len(all_apis)})")

        if not data.get("moreEntities", False) or not entities:
            break
        offset += PAGE_LIMIT

    return all_apis


def load_exclusions(path):
    with open(path, "r", encoding="utf-8") as f:
        return set(line.strip().lower() for line in f if line.strip())


def get_segments(path):
    segments = []
    for part in path.split("/"):
        if not part:
            continue
        if re.fullmatch(r"\{.*\}", part):
            continue
        if UUID_RE.match(part) or NUMERIC_RE.match(part):
            continue
        segments.append(part)
    return segments


def analyze(paths, exclusion_words):
    results = []
    for path in paths:
        segments = get_segments(path)
        matched = [s for s in segments if s.lower() in exclusion_words]
        results.append({"path": path, "matched": matched, "hit": bool(matched)})
    return results


def word_counts(results):
    counts = {}
    for r in results:
        if r["hit"]:
            for w in r["matched"]:
                counts[w.lower()] = counts.get(w.lower(), 0) + 1
    return counts


def print_report(results, exclusion_count):
    total = len(results)
    hits = [r for r in results if r["hit"]]
    hit_count = len(hits)
    pct = (hit_count / total * 100) if total else 0

    print()
    print("=" * 60)
    print("Clustering Exclusions Match Report")
    print("=" * 60)
    print(f"Total discovered endpoints : {total}")
    print(f"Total exclusion words      : {exclusion_count}")
    print(f"Endpoints hit              : {hit_count}")
    print(f"Hit rate                   : {pct:.1f}%")
    print(f"Endpoints not hit          : {total - hit_count}")
    print()

    counts = word_counts(results)
    if counts:
        print("-" * 60)
        print(f"HIT COUNT PER EXCLUSION WORD ({len(counts)} words matched)")
        print("-" * 60)
        for w, c in sorted(counts.items(), key=lambda x: -x[1]):
            print(f"  {w:<30} {c}")
        print()

    if hits:
        print("-" * 60)
        print(f"ENDPOINT -> MATCHED WORD(S) ({hit_count} endpoints)")
        print("-" * 60)
        for r in hits:
            print(f"  {r['path']:<60} <- [{', '.join(r['matched'])}]")
        print()


def write_csv(results, exclusion_count, csv_path):
    total = len(results)
    hits = [r for r in results if r["hit"]]
    hit_count = len(hits)
    pct = (hit_count / total * 100) if total else 0
    counts = word_counts(results)

    with open(csv_path, "w", newline="", encoding="utf-8") as f:
        writer = csv.writer(f)
        
        # Summary Section
        writer.writerow(["=== SUMMARY REPORT ==="])
        writer.writerow(["Metric", "Value"])
        writer.writerow(["Total discovered endpoints", total])
        writer.writerow(["Total exclusion words", exclusion_count])
        writer.writerow(["Endpoints hit", hit_count])
        writer.writerow(["Hit rate (%)", f"{pct:.1f}%"])
        writer.writerow(["Endpoints not hit", total - hit_count])
        writer.writerow([])
        
        # Word Hit Counts Section
        writer.writerow(["=== WORD HIT COUNTS ==="])
        writer.writerow(["Exclusion Word", "Hit Count"])
        for w, c in sorted(counts.items(), key=lambda x: -x[1]):
            writer.writerow([w, c])
        writer.writerow([])
        
        # Endpoint Match Details
        writer.writerow(["=== ENDPOINT MATCH DETAILS ==="])
        writer.writerow(["Path", "Hit", "Matched Words"])
        for r in results:
            writer.writerow([r["path"], "YES" if r["hit"] else "NO", ", ".join(r["matched"])])

    print(f"Report exported to CSV: {csv_path}")


def main():
    parser = argparse.ArgumentParser(description="API kümeleme hariç tutma kelimelerini analiz eden ve CSV raporu üreten script.")
    parser.add_argument("--base-url", help="API sunucusunun base URL adresi")
    parser.add_argument("--token", help="Bearer erişim token'ı")
    parser.add_argument("--exclusions", required=True, help="Hariç tutulacak kelimelerin bulunduğu dosya yolu")
    parser.add_argument("--insecure", action="store_true", help="SSL sertifika doğrulamasını devre dışı bırak")
    parser.add_argument("--csv", help="Ekrana basılan raporu kaydedeceğiniz CSV dosya yolu")
    args = parser.parse_args()

    base_url = args.base_url or os.environ.get("NONAME_BASE_URL")
    token = args.token or os.environ.get("NONAME_API_TOKEN")

    if not base_url or not token:
        print("Error: --base-url and --token are required (or set NONAME_BASE_URL / NONAME_API_TOKEN).", file=sys.stderr)
        sys.exit(1)

    print(f"Fetching API inventory from {APIS_ENDPOINT} ...")
    apis = fetch_all_apis(base_url, token, insecure=args.insecure)
    print(f"Fetched {len(apis)} APIs total.\n")

    paths = [a.get("path", "") for a in apis if a.get("path")]
    exclusion_words = load_exclusions(args.exclusions)

    results = analyze(paths, exclusion_words)
    
    # Ekrana raporu bas
    print_report(results, len(exclusion_words))

    # Eğer --csv parametresi verildiyse ekrandaki raporu CSV olarak kaydet
    if args.csv:
        write_csv(results, len(exclusion_words), args.csv)


if __name__ == "__main__":
    main()