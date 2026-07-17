#!/usr/bin/env bash
# 委 yudane — clj-native test runner (babashka).
set -uo pipefail
cd "$(dirname "$0")"

SUITES=(
  "test/yudane/methods/test_yudane_edn.cljc"
  "test/yudane/methods/test_analyze.cljc"
  "test/yudane/methods/test_kotoba.cljc"
  "test/yudane/methods/test_autorun.cljc"
  "test/yudane/methods/test_claim.cljc"
)

fail=0
for s in "${SUITES[@]}"; do
  echo "== $s =="
  if bb --classpath src:test "$s"; then :; else echo "FAILED: $s"; fail=1; fi
done
exit $fail
