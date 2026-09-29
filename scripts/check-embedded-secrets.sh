#!/usr/bin/env sh
# VIOR-933 AC7 — nothing published may carry a secret, a private git URL or an
# internal hostname.
#
#   sh scripts/check-embedded-secrets.sh
#
# Exit 0 = clean. Exit 1 = a match, printed with its file and line.
#
# ⚠️ This repo has no CI, so nothing runs this for you. It is here so the check
# is reproducible and reviewable rather than a claim in a PR body; wiring it to
# a workflow is separate work.
#
# ⚠️ Note the `for` loop rather than `… | while read`. A pipeline runs its loop
# in a subshell, so `status=1` is lost and the script exits 0 no matter what it
# matched — which is exactly what the first version of this file did. If you
# change the iteration here, plant a fake key and confirm it still exits 1.
set -eu

cd "$(dirname "$0")/.."

# Each pattern is something that must never appear in a published page. The
# API-key shapes require real length, because documentation legitimately shows
# `sk-...` as a placeholder. The git patterns match a *clone* URL — `.git`, or
# the ssh form — not a plain link: `cli/install.mdx` has to name
# github.com/viorant/viorant-cli in the cosign signature identity, and a guard
# that fires on correct content is a guard people learn to skip.
patterns='BEGIN [A-Z ]*PRIVATE KEY
\bsk-[A-Za-z0-9]{20,}
\bghp_[A-Za-z0-9]{20,}
\bAIza[A-Za-z0-9_-]{20,}
\bxox[baprs]-[A-Za-z0-9-]{10,}
viorant-shared\.git
git@github\.com:viorant/
github\.com/viorant/[A-Za-z0-9_.-]+\.git
gs://viorant-
\.internal\b
localhost:[0-9]+'

status=0
old_ifs=$IFS
IFS='
'
for pattern in $patterns; do
  IFS=$old_ifs
  if grep -rEn --include='*.mdx' --include='*.json' -- "$pattern" . 2>/dev/null; then
    printf 'FAIL: matched /%s/\n' "$pattern" >&2
    status=1
  fi
  IFS='
'
done
IFS=$old_ifs

if [ "$status" -eq 0 ]; then
  echo "check-embedded-secrets: clean"
fi
exit "$status"
