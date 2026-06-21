#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$REPO_ROOT"

ERRORS=$(mktemp)
trap 'rm -f "$ERRORS"' EXIT

report() {
  echo "$1" | tee -a "$ERRORS"
}

# Collect markdown files
mapfile -t FILES < <(find . -maxdepth 2 -name '*.md' -not -path './.git/*' | sort)

for file in "${FILES[@]}"; do
  echo "Checking $file"

  in_code_block=0
  line_no=0

  while IFS= read -r raw_line; do
    line_no=$((line_no + 1))

    if [[ "$raw_line" =~ ^\`\`\` ]]; then
      in_code_block=$((1 - in_code_block))
      continue
    fi

    if [[ "$in_code_block" -eq 1 ]]; then
      continue
    fi

    # Extract each markdown link on this line
    matches=$(echo "$raw_line" | grep -oE '\[([^\]]+)\]\(([^)]+)\)' || true)
    while IFS= read -r match; do
      [[ -z "$match" ]] && continue
      url=$(echo "$match" | sed -E 's/.*\]\(([^)]+)\).*/\1/')

      if [[ "$url" == \#* ]]; then
        target="${url:1}"
        if ! grep -qiE "^#{1,6} +.*${target//-/[- ]}.*$|^<a [^>]*name=\"${target}\"" "$file"; then
          report "  Broken anchor at $file:$line_no: $url"
        fi
        continue
      fi

      if [[ ! "$url" =~ ^https?:// ]]; then
        target_path="${url%%#*}"
        if [[ ! -e "$target_path" ]]; then
          report "  Broken internal link at $file:$line_no: $url"
        fi
        continue
      fi

      if [[ "$url" == *"linkedin.com"* || "$url" == *"twitter.com"* || "$url" == *"x.com"* ]]; then
        continue
      fi

      status=$(curl -sL -o /dev/null -w "%{http_code}" --max-time 15 "$url" || echo "000")
      if [[ "$status" != "200" && "$status" != "301" && "$status" != "302" && "$status" != "307" && "$status" != "308" ]]; then
        report "  Broken external link at $file:$line_no (HTTP $status): $url"
      fi
    done <<< "$matches"
  done < "$file"
done

if [[ ! -s "$ERRORS" ]]; then
  echo "All links look OK."
  exit 0
else
  echo "Broken links found."
  exit 1
fi
