#!/usr/bin/env bash
set -euo pipefail

# Full McEval compose run for qwen0.5b + base prompt.
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
# - /datasets/Qwen-Translations/mceval containing the qwen0.5b McEval eval JSONs
# - /datasets/cpu-transpiler-inference/benchmarks/mceval-c
# - GOOGLE_API_KEY or GEMINI_API_KEY
# - clang-17
# - qemu-aarch64 for armv8-linux targets
# - qemu-riscv64 for riscv targets
#
# Expected preflight:
# - Benchmark: McEval
# - Prompt config: base
# - Input mode: evaluated_json
# - Prompt concurrency and validation concurrency reflect the config/runtime settings

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
RESULTS_ROOT="${RESULTS_ROOT:-$WORK_ROOT/results/composer}"

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

filename_isa_tag() {
  case "$1" in
    x86) echo "x86" ;;
    riscv) echo "riscv" ;;
    armv8-linux) echo "arm_linux" ;;
    armv8.4a-apple) echo "arm_apple" ;;
    *)
      echo "Unsupported ISA for filename mapping: $1" >&2
      exit 2
      ;;
  esac
}

find_latest_json() {
  local source_isa="$1"
  local target_isa="$2"
  local source_tag target_tag pattern
  source_tag="$(filename_isa_tag "$source_isa")"
  target_tag="$(filename_isa_tag "$target_isa")"
  pattern="*_0p5b_full_mceval_${source_tag}_${target_tag}_O2_*.json"
  find "$QWEN_ROOT/mceval" -maxdepth 1 -type f -name "$pattern" 2>/dev/null | sort | tail -n 1 || true
}

skip_reason_for_target() {
  local target="$1"
  if [[ "$target" == "armv8.4a-apple" && "$(uname -s)" != "Darwin" ]]; then
    echo "armv8.4a-apple validation requires a macOS host"
    return
  fi
  echo ""
}

require_runtime_for_target() {
  local target="$1"
  if [[ "$target" == "armv8-linux" ]] && ! command -v qemu-aarch64 >/dev/null 2>&1; then
    echo "Missing qemu-aarch64 for armv8-linux validation" >&2
    exit 1
  fi
  if [[ "$target" == "riscv" ]] && ! command -v qemu-riscv64 >/dev/null 2>&1; then
    echo "Missing qemu-riscv64 for riscv validation" >&2
    exit 1
  fi
}

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
  local input_json
  local skip_reason
  local run_label="geminiComposer/qwen0.5b/mceval/${source_isa}-to-${target_isa}"
  local checkpoint_path="${RESULTS_ROOT}/${run_label}/base/logs/checkpoint_base.json"

  input_json="$(find_latest_json "$source_isa" "$target_isa")"
  skip_reason="$(skip_reason_for_target "$target_isa")"

  echo "Pair: ${source_isa} -> ${target_isa}"
  echo "Input JSON: ${input_json:-<missing>}"
  echo "Run label:  $run_label"
  if [[ -n "$skip_reason" ]]; then
    echo "Skip:       $skip_reason"
  fi

  if [[ $LIST_ONLY -eq 1 ]]; then
    echo ""
    return
  fi

  if [[ -n "$skip_reason" ]]; then
    echo ""
    return
  fi

  if [[ -z "$input_json" || ! -f "$input_json" ]]; then
    echo "Missing input JSON for ${source_isa} -> ${target_isa} under $QWEN_ROOT/mceval" >&2
    exit 1
  fi

  require_runtime_for_target "$target_isa"

  if has_txt_report "$run_label" "base"; then
    echo "Skipping existing report: ${run_label}/base"
    echo ""
    return
  fi

  cmd=(
    python3 compose_gemini.py "$input_json"
    --config configs_runs/qwen0.5b.json
    --benchmark mceval
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

run_one "x86" "armv8-linux"
run_one "x86" "riscv"
run_one "armv8-linux" "x86"
run_one "armv8-linux" "riscv"
run_one "armv8.4a-apple" "x86"
run_one "armv8.4a-apple" "riscv"
run_one "riscv" "armv8-linux"
run_one "riscv" "x86"
