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

run_one() {
  local source_isa="$1"
  local target_isa="$2"
  local input_json="$3"
  local run_label="geminiComposer/qwen0.5b/bringup/${source_isa}-to-${target_isa}"
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

  if has_txt_report "$run_label" "base"; then
    echo "Skipping existing report: ${run_label}/base"
    echo ""
    return
  fi

  cmd=(
    python3 compose_gemini.py "$input_json"
    --config configs_runs/qwen0.5b.json
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
