#!/usr/bin/env bash
# 委 yudane — clj-native test runner (babashka).
set -uo pipefail
cd "$(dirname "$0")"

SUITES=(
  "test/yudane/methods/test_yudane_edn.cljk"
  "test/yudane/methods/test_analyze.cljk"
  "test/yudane/methods/test_kotoba.cljk"
  "test/yudane/methods/test_autorun.cljk"
  "test/yudane/methods/test_claim.cljk"
)

fail=0
for s in "${SUITES[@]}"; do
  echo "== $s =="
  if kbb --classpath src:test "$s"; then :; else echo "FAILED: $s"; fail=1; fi
done
exit $fail
