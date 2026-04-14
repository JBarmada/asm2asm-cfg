#!/usr/bin/env bash
set -euo pipefail

# Mini BringUpBench smoke run for qwen0.5b + base prompt.
#
# What this script does:
# - filters each full BringUpBench qwen0.5b eval JSON down to 7 small tasks
# - runs ModularComposer with Gemini on those mini JSONs
# - uses the benchmark-aware composer path, not the legacy HumanEval-only script
#
# Required outside a plain git pull:
# - /datasets/ModularComposer mounted to this repo, or run from the repo directly
# - /datasets/Qwen-Translations/bringup containing the qwen0.5b BringUpBench eval JSONs
# - /datasets/cpu-transpiler-inference/benchmarks/bringup-bench
# - GOOGLE_API_KEY or GEMINI_API_KEY
# - clang-17
# - qemu-aarch64 for armv8-linux targets
# - qemu-riscv64 for riscv targets
#
# Important current behavior:
# - BringUpBench allows prompt concurrency, but validation concurrency is clamped to 1 for safety.
# - With a high default worker setting, preflight should show a high prompt concurrency and
#   "Validation concurrency: 1".
#
# Quick checks before the full BringUpBench sweep:
# - preflight shows "Benchmark: BringUpBench"
# - preflight shows "Prompt config: base"
# - preflight shows "Input mode: evaluated_json"
# - preflight shows "Prompt concurrency: ..." and "Validation concurrency: 1"
# - final_error_problems.json is produced
# - failures are task-specific, not the same global toolchain/make error for every task

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ -d "/datasets/ModularComposer" ]]; then
  WORK_ROOT="/datasets/ModularComposer"
else
  WORK_ROOT="$SCRIPT_DIR"
fi

if [[ -d "/datasets/Qwen-Translations" ]]; then
  QWEN_ROOT="/datasets/Qwen-Translations"
else
  QWEN_ROOT="$(cd "$WORK_ROOT/.." && pwd)/Qwen-Translations"
fi

cd "$WORK_ROOT"

DRY_RUN=0
LIST_ONLY=0
YES_FLAG="--yes"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --dry-run) DRY_RUN=1; shift ;;
    --list) LIST_ONLY=1; shift ;;
    --no-yes) YES_FLAG=""; shift ;;
    *)
      echo "Unknown argument: $1" >&2
      exit 2
      ;;
  esac
done

KEEP_TASKS=(
  ackermann
  bubble-sort
  gcd-list
  hanoi
  kadane
  sieve
  weekday
)

KEEP_TASKS_CSV="$(IFS=,; echo "${KEEP_TASKS[*]}")"
MINI_INPUT_DIR="$WORK_ROOT/results/composer/mini_inputs/bringup-mini7/qwen0.5b"
mkdir -p "$MINI_INPUT_DIR"

TASKS_PRETTY="$(printf '%s, ' "${KEEP_TASKS[@]}")"
TASKS_PRETTY="${TASKS_PRETTY%, }"
echo "Mini BringUpBench task set: $TASKS_PRETTY"
echo ""

make_mini_json() {
  local src_json="$1"
  local dst_json="$2"

  INPUT_JSON="$src_json" OUTPUT_JSON="$dst_json" KEEP_TASKS_CSV="$KEEP_TASKS_CSV" python3 - <<'PY'
import json
import os
from pathlib import Path

src = Path(os.environ["INPUT_JSON"])
dst = Path(os.environ["OUTPUT_JSON"])
keep = {item for item in os.environ["KEEP_TASKS_CSV"].split(",") if item}

data = json.loads(src.read_text(encoding="utf-8"))
if not isinstance(data, list):
    raise SystemExit(f"Expected a flat eval-result JSON list: {src}")

def task_name_from_row(row: dict) -> str:
    raw = str(row.get("file", "")).replace("\\", "/").rstrip("/")
    if not raw:
        return ""
    parts = [part for part in raw.split("/") if part]
    candidate = parts[-1]
    stem = Path(candidate).stem
    if stem in {"code", "test", "pred"} and len(parts) >= 2:
        return parts[-2]
    return stem

filtered = [row for row in data if task_name_from_row(row) in keep]
if len(filtered) != len(keep):
    found = sorted({task_name_from_row(row) for row in filtered})
    missing = sorted(keep - set(found))
    raise SystemExit(f"Mini JSON missing tasks from {src}: {missing}")

dst.parent.mkdir(parents=True, exist_ok=True)
dst.write_text(json.dumps(filtered, indent=2) + "\n", encoding="utf-8")
print(f"Wrote {dst} with {len(filtered)} tasks")
PY
}

run_one() {
  local source_isa="$1"
  local target_isa="$2"
  local input_json="$3"
  local mini_json="$4"
  local run_label="geminiComposer/qwen0.5b/bringup-mini7/${source_isa}-to-${target_isa}"

  echo "Pair: ${source_isa} -> ${target_isa}"
  echo "Input JSON: $input_json"
  echo "Mini JSON:  $mini_json"

  if [[ $LIST_ONLY -eq 1 ]]; then
    echo ""
    return
  fi

  make_mini_json "$input_json" "$mini_json"

  cmd=(
    python3 compose_gemini.py "$mini_json"
    --config configs_runs/qwen0.5b.json
    --benchmark bringup
    --source-isa "$source_isa"
    --target-isa "$target_isa"
    --prompt-config base
    --run-label "$run_label"
    "$YES_FLAG"
  )

  if [[ -z "$YES_FLAG" ]]; then
    cmd=(
      python3 compose_gemini.py "$mini_json"
      --config configs_runs/qwen0.5b.json
      --benchmark bringup
      --source-isa "$source_isa"
      --target-isa "$target_isa"
      --prompt-config base
      --run-label "$run_label"
    )
  fi

  if [[ $DRY_RUN -eq 1 ]]; then
    printf 'DRY RUN:'
    printf ' %q' "${cmd[@]}"
    printf '\n\n'
    return
  fi

  "${cmd[@]}"
  echo ""
}

run_one \
  "x86" \
  "armv8-linux" \
  "$QWEN_ROOT/bringup/adpretko_x86_to_armv8_qwen25coder_0p5b_full_bringup_x86_arm_linux_O2_20260405-224152.json" \
  "$MINI_INPUT_DIR/x86-to-armv8-linux_mini7.json"

run_one \
  "x86" \
  "riscv" \
  "$QWEN_ROOT/bringup/adpretko_x86_to_riscv_qwen25coder_0p5b_full_bringup_x86_riscv_O2_20260405-225206.json" \
  "$MINI_INPUT_DIR/x86-to-riscv_mini7.json"

run_one \
  "armv8-linux" \
  "x86" \
  "$QWEN_ROOT/bringup/adpretko_armv8_to_x86_qwen25coder_0p5b_full_bringup_arm_linux_x86_O2_20260405-225622.json" \
  "$MINI_INPUT_DIR/armv8-linux-to-x86_mini7.json"

run_one \
  "armv8-linux" \
  "riscv" \
  "$QWEN_ROOT/bringup/adpretko_armv8_to_riscv_qwen25coder_0p5b_full_bringup_arm_linux_riscv_O2_20260405-230209.json" \
  "$MINI_INPUT_DIR/armv8-linux-to-riscv_mini7.json"

run_one \
  "armv8.4a-apple" \
  "x86" \
  "$QWEN_ROOT/bringup/adpretko_armv8mac_to_x86_qwen25coder_0p5b_full_bringup_arm_apple_x86_O2_20260405-230702.json" \
  "$MINI_INPUT_DIR/armv8.4a-apple-to-x86_mini7.json"

run_one \
  "armv8.4a-apple" \
  "riscv" \
  "$QWEN_ROOT/bringup/adpretko_armv8mac_to_riscv_qwen25coder_0p5b_full_bringup_arm_apple_riscv_O2_20260405-231305.json" \
  "$MINI_INPUT_DIR/armv8.4a-apple-to-riscv_mini7.json"

run_one \
  "riscv" \
  "armv8-linux" \
  "$QWEN_ROOT/bringup/adpretko_riscv_to_armv8_qwen25coder_0p5b_full_bringup_riscv_arm_linux_O2_20260405-232320.json" \
  "$MINI_INPUT_DIR/riscv-to-armv8-linux_mini7.json"

run_one \
  "riscv" \
  "x86" \
  "$QWEN_ROOT/bringup/adpretko_riscv_to_x86_qwen25coder_0p5b_full_bringup_riscv_x86_O2_20260405-231811.json" \
  "$MINI_INPUT_DIR/riscv-to-x86_mini7.json"
