#!/bin/sh
set -eu

required_paths='
README.md
PROJECT_BRIEF.md
docs/research/README.md
docs/architecture/README.md
docs/matrices/README.md
docs/decisions/README.md
fixtures/v1/README.md
contracts/README.md
.github/workflows/README.md
.gitignore
'

missing=0
for path in $required_paths; do
  if [ ! -e "$path" ]; then
    printf 'missing required path: %s\n' "$path" >&2
    missing=1
  fi
done

if [ "$missing" -ne 0 ]; then
  exit 1
fi

if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  sensitive=$(git ls-files | grep -vE '(^|/)\.env\.example$' | grep -E '(^|/)(\.env(\..*)?|.*\.(pem|key|p12|pfx))$' || true)
  if [ -n "$sensitive" ]; then
    printf 'tracked sensitive filename(s):\n%s\n' "$sensitive" >&2
    exit 1
  fi
fi

printf 'layout verification passed\n'
