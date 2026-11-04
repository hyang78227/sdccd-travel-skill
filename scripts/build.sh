#!/usr/bin/env bash
# Builds dist/sdccd-travel-claude.zip and dist/sdccd-travel-chatgpt.zip after a personal-data check.
# Optional: list private terms (your name, home address, chartfield values,
# past TA/ER IDs), one per line, in scripts/denylist.local.txt. That file is
# git-ignored and never committed.
set -euo pipefail
cd "$(dirname "$0")/.."

FILES=(skills platforms docs scripts/single_file.py README.md AGENTS.md CHANGELOG.md .claude-plugin scripts/build.sh)

echo "Checking for personal data..."
# The District Office address is allowed; blank it out before matching so the
# rest of the same line is still checked.
scan() {
  grep -rnI "" "${FILES[@]}" | sed -E 's/3375 Camino del Rio South//g'
}

patterns=(
  '\b0000[0-9]{6}\b'                                         # PeopleSoft TA/ER IDs
  '[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}'           # email addresses
  '\(?\b[0-9]{3}\)?[ .-][0-9]{3}[ .-][0-9]{4}\b'             # phone numbers
  '\b[0-9]{3,6} ([NSEW]\.? )?([A-Z][a-z]+ ){1,3}(Drive|Dr|Street|St|Avenue|Ave|Road|Rd|Lane|Ln|Court|Ct|Way|Blvd|Boulevard|Place|Pl|Circle|Cir|Terrace|Ter|Parkway|Pkwy)\b'
  '\b(Camino|Calle|Via|Paseo|Avenida) [A-Z][a-z]+'           # Spanish-style street names
  'Fund [0-9]{4}|Dept [0-9]{5}|Product [0-9]{6}'             # real chartfield values
)

hits=""
for p in "${patterns[@]}"; do
  found=$(scan | grep -E "$p" | grep -v 'scripts/build.sh' | grep -vE 'Fund <|Dept <|Product <|Dept 12345' || true)
  [ -n "$found" ] && hits+="$found"$'\n'
done

if [ -f scripts/denylist.local.txt ]; then
  while IFS= read -r term; do
    [ -z "$term" ] && continue
    found=$(scan | grep -iF -- "$term" || true)
    [ -n "$found" ] && hits+="$found"$'\n'
  done < scripts/denylist.local.txt
fi

if [ -n "${hits//[$'\n']/}" ]; then
  echo "Possible personal data found. Remove it, then rebuild:"
  printf '%s' "$hits" | sort -u
  exit 1
fi

# Two packages from one source: the Claude one uses skills/sdccd-travel as is;
# the ChatGPT one swaps in platforms/chatgpt/platform.md.
rm -f dist/*.zip
BUILD=$(mktemp -d)
trap 'rm -rf "$BUILD"' EXIT

cp -r skills/sdccd-travel "$BUILD/sdccd-travel"
(cd "$BUILD" && zip -rq "$OLDPWD/dist/sdccd-travel-claude.zip" sdccd-travel -x '*.DS_Store')

cp platforms/chatgpt/platform.md "$BUILD/sdccd-travel/reference/platform.md"
(cd "$BUILD" && zip -rq "$OLDPWD/dist/sdccd-travel-chatgpt.zip" sdccd-travel -x '*.DS_Store')

# Single-file versions (SKILL.md with every reference file appended), for AI
# agents that install a skill from one file (e.g. Claude's "save skill" card).
python3 scripts/single_file.py skills/sdccd-travel skills/sdccd-travel/reference/platform.md dist/single/claude/SKILL.md
python3 scripts/single_file.py skills/sdccd-travel platforms/chatgpt/platform.md dist/single/chatgpt/SKILL.md

echo "Built:"
ls -l dist/*.zip dist/single/*/SKILL.md
