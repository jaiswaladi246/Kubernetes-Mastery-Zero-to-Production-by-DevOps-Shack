#!/usr/bin/env bash
# Kubernetes Mastery: Zero to Production · by DevOps Shack · https://devopsshack.com · https://www.youtube.com/@devopsshack
# Verifies that DevOps Shack credits are intact in every file.
set -euo pipefail
cd "$(dirname "$0")/.."
fail=0
while IFS= read -r -d '' f; do
  case "$f" in ./.github/*) continue;; esac
  grep -q '<!-- devopsshack:header -->' "$f" && grep -q 'by \*\*DevOps Shack\*\*' "$f" \
    && grep -q '<!-- devopsshack:footer -->' "$f" && grep -q 'Made with ❤️ by' "$f" \
    || { echo "MISSING DevOps Shack credit: $f"; fail=1; }
done < <(find . -name '*.md' -not -path './.git/*' -print0)
while IFS= read -r -d '' f; do
  case "$f" in ./.github/*) continue;; esac
  head -3 "$f" | grep -q 'by DevOps Shack' || { echo "MISSING DevOps Shack banner: $f"; fail=1; }
done < <(find . \( -name '*.yaml' -o -name '*.yml' -o -name '*.sh' \) -not -path './.git/*' -print0)
for f in LICENSE NOTICE AUTHORS.md; do
  [ -f "$f" ] && grep -q 'DevOps Shack' "$f" || { echo "MISSING or altered: $f"; fail=1; }
done
[ "$fail" -eq 0 ] && echo "Branding check passed: DevOps Shack credits intact." || exit 1
