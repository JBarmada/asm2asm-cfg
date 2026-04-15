#!/usr/bin/env bash
set -euo pipefail

# Full BringUpBench compose run for qwen0.5b + base prompt.
#
# What this script does:
# - runs the full errored-problem JSONs produced by eval.py
# - targets exactly these 8 pairs:
#   x86 -> armv8-linux, riscv
#   armv8-linux -> x86, riscv
#   armv8.4a-apple -> x86, riscv
#   riscv -> armv8-linux, x86
# - skips runs that already have a report
# - resumes from checkpoint when a partial run exists
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
# Expected preflight:
# - Benchmark: BringUpBench
# - Prompt config: base
# - Input mode: evaluated_json
# - Prompt concurrency: high/default setting
# - Validation concurrency: 1

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

if command -v python3 >/dev/null 2>&1; then
  PYTHON_BIN="python3"
elif command -v python >/dev/null 2>&1; then
  PYTHON_BIN="python"
else
  echo "Missing python3/python in PATH" >&2
  exit 1
fi

cd "$WORK_ROOT"

DRY_RUN=0
LIST_ONLY=0
YES_FLAG="--yes"
VALIDATION_CONCURRENCY_LIMIT="${BRINGUP_VALIDATION_CONCURRENCY_LIMIT:-1}"
SKIP_CLEAN="${BRINGUP_SKIP_CLEAN:-0}"
FORCE_REBUILD="${BRINGUP_FORCE_REBUILD:-1}"
RUN_LABEL_SUFFIX="${BRINGUP_RUN_LABEL_SUFFIX:-}"
TEMP_CONFIG=""

cleanup() {
  if [[ -n "$TEMP_CONFIG" && -f "$TEMP_CONFIG" ]]; then
    rm -f "$TEMP_CONFIG"
  fi
}
trap cleanup EXIT

while [[ $# -gt 0 ]]; do
  case "$1" in
    --dry-run) DRY_RUN=1; shift ;;
    --list) LIST_ONLY=1; shift ;;
    --no-yes) YES_FLAG=""; shift ;;
    --validation-concurrency-limit) VALIDATION_CONCURRENCY_LIMIT="$2"; shift 2 ;;
    --skip-clean) SKIP_CLEAN=1; shift ;;
    --no-force-rebuild) FORCE_REBUILD=0; shift ;;
    --run-label-suffix) RUN_LABEL_SUFFIX="$2"; shift 2 ;;
    *)
      echo "Unknown argument: $1" >&2
      exit 2
      ;;
  esac
done

RESULTS_ROOT="${RESULTS_ROOT:-$WORK_ROOT/results/composer}"

has_txt_report() {
  local run_label="$1"
  local prompt_config="$2"
  local report_dir="${RESULTS_ROOT}/${run_label}/${prompt_config}"

  if ls "${report_dir}/txts"/*.txt >/dev/null 2>&1; then
    return 0
  fi
  if ls "${report_dir}"/*.txt >/dev/null 2>&1; then
    return 0
  fi
  return 1
}

ensure_config() {
  if [[ -n "$TEMP_CONFIG" ]]; then
    return
  fi

  if [[ "$VALIDATION_CONCURRENCY_LIMIT" == "1" && "$SKIP_CLEAN" == "0" && "$FORCE_REBUILD" == "1" ]]; then
    TEMP_CONFIG="configs_runs/qwen0.5b.json"
    return
  fi

  TEMP_CONFIG="$(mktemp "${TMPDIR:-/tmp}/bringup-qwen0.5b-base-speed-XXXXXX.json")"
  BASE_CONFIG="$WORK_ROOT/configs_runs/qwen0.5b.json" OUTPUT_CONFIG="$TEMP_CONFIG" VALIDATION_CONCURRENCY_LIMIT="$VALIDATION_CONCURRENCY_LIMIT" SKIP_CLEAN="$SKIP_CLEAN" FORCE_REBUILD="$FORCE_REBUILD" "$PYTHON_BIN" - <<'PY'
import json
import os
from pathlib import Path

base = Path(os.environ["BASE_CONFIG"])
out = Path(os.environ["OUTPUT_CONFIG"])
cfg = json.loads(base.read_text(encoding="utf-8"))
cfg["bringup_validation_concurrency_limit"] = int(os.environ["VALIDATION_CONCURRENCY_LIMIT"])
cfg["bringup_skip_clean"] = os.environ["SKIP_CLEAN"] == "1"
cfg["bringup_force_rebuild"] = os.environ["FORCE_REBUILD"] == "1"
cfg["validation_concurrency"] = int(os.environ["VALIDATION_CONCURRENCY_LIMIT"])
out.write_text(json.dumps(cfg, indent=2) + "\n", encoding="utf-8")
PY
}

run_one() {
  local source_isa="$1"
  local target_isa="$2"
  local input_json="$3"
  local run_label="geminiComposer/qwen0.5b/bringup/${source_isa}-to-${target_isa}"
  if [[ -n "$RUN_LABEL_SUFFIX" ]]; then
    run_label="${run_label}-${RUN_LABEL_SUFFIX}"
  fi
  local checkpoint_path="${RESULTS_ROOT}/${run_label}/base/logs/checkpoint_base.json"

  echo "Pair: ${source_isa} -> ${target_isa}"
  echo "Input JSON: $input_json"
  echo "Run label:  $run_label"

  if [[ $LIST_ONLY -eq 1 ]]; then
    echo ""
    return
  fi

  if [[ ! -f "$input_json" ]]; then
    echo "Missing input JSON: $input_json" >&2
    exit 1
  fi

  ensure_config

  if has_txt_report "$run_label" "base"; then
    echo "Skipping existing report: ${run_label}/base"
    echo ""
    return
  fi

  cmd=(
    "$PYTHON_BIN" compose_gemini.py "$input_json"
    --config "$TEMP_CONFIG"
    --benchmark bringup
    --source-isa "$source_isa"
    --target-isa "$target_isa"
    --prompt-config base
    --run-label "$run_label"
  )

  if [[ -f "$checkpoint_path" ]]; then
    echo "Resuming from checkpoint: $checkpoint_path"
    cmd+=(--resume-checkpoint "$checkpoint_path")
  else
    echo "Starting fresh run for ${run_label}/base"
  fi

  if [[ -n "$YES_FLAG" ]]; then
    cmd+=("$YES_FLAG")
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
  "$QWEN_ROOT/bringup/adpretko_x86_to_armv8_qwen25coder_0p5b_full_bringup_x86_arm_linux_O2_20260405-224152.json"

run_one \
  "x86" \
  "riscv" \
  "$QWEN_ROOT/bringup/adpretko_x86_to_riscv_qwen25coder_0p5b_full_bringup_x86_riscv_O2_20260405-225206.json"

run_one \
  "armv8-linux" \
  "x86" \
  "$QWEN_ROOT/bringup/adpretko_armv8_to_x86_qwen25coder_0p5b_full_bringup_arm_linux_x86_O2_20260405-225622.json"

run_one \
  "armv8-linux" \
  "riscv" \
  "$QWEN_ROOT/bringup/adpretko_armv8_to_riscv_qwen25coder_0p5b_full_bringup_arm_linux_riscv_O2_20260405-230209.json"

run_one \
  "armv8.4a-apple" \
  "x86" \
  "$QWEN_ROOT/bringup/adpretko_armv8mac_to_x86_qwen25coder_0p5b_full_bringup_arm_apple_x86_O2_20260405-230702.json"

run_one \
  "armv8.4a-apple" \
  "riscv" \
  "$QWEN_ROOT/bringup/adpretko_armv8mac_to_riscv_qwen25coder_0p5b_full_bringup_arm_apple_riscv_O2_20260405-231305.json"

run_one \
  "riscv" \
  "armv8-linux" \
  "$QWEN_ROOT/bringup/adpretko_riscv_to_armv8_qwen25coder_0p5b_full_bringup_riscv_arm_linux_O2_20260405-232320.json"

run_one \
  "riscv" \
  "x86" \
  "$QWEN_ROOT/bringup/adpretko_riscv_to_x86_qwen25coder_0p5b_full_bringup_riscv_x86_O2_20260405-231811.json"
