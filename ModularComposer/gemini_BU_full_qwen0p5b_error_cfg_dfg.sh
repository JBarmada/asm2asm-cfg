#!/usr/bin/env bash
set -euo pipefail

# Full BringUpBench compose run for qwen0.5b + error_cfg_dfg prompt.
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
# - uses these BringUpBench graph datasets by default:
#   CFG: ryaaabsar/bringup_asm_cfg
#   DFG: ryaaabsar/bringup_asm_dfg
# - you can still override those defaults with flags or environment variables
#
# Required outside a plain git pull:
# - /datasets/ModularComposer mounted to this repo, or run from the repo directly
# - /datasets/Qwen-Translations/bringup containing the qwen0.5b BringUpBench eval JSONs
# - /datasets/cpu-transpiler-inference/benchmarks/bringup-bench
# - GOOGLE_API_KEY or GEMINI_API_KEY
# - clang-17
# - qemu-aarch64 for armv8-linux targets
# - qemu-riscv64 for riscv targets
# - optional graph dataset overrides via either:
#   --cfg-dataset-id <hf-dataset>
#   --dfg-dataset-id <hf-dataset>
#   or environment variables:
#   BRINGUP_CFG_DATASET_ID
#   BRINGUP_DFG_DATASET_ID
#
# Expected preflight:
# - Benchmark: BringUpBench
# - Prompt config: error_cfg_dfg
# - explicit CFG/DFG dataset ids shown

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
CFG_DATASET_ID="${BRINGUP_CFG_DATASET_ID:-ryaasabsar/bringup_asm_cfg}"
DFG_DATASET_ID="${BRINGUP_DFG_DATASET_ID:-ryaasabsar/bringup_asm_dfg}"
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
    --cfg-dataset-id) CFG_DATASET_ID="$2"; shift 2 ;;
    --dfg-dataset-id) DFG_DATASET_ID="$2"; shift 2 ;;
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
  pattern="*_0p5b_full_bringup_${source_tag}_${target_tag}_O2_*.json"
  find "$QWEN_ROOT/bringup" -maxdepth 1 -type f -name "$pattern" 2>/dev/null | sort | tail -n 1 || true
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

ensure_temp_config() {
  if [[ -n "$TEMP_CONFIG" ]]; then
    return
  fi

  TEMP_CONFIG="$(mktemp "${TMPDIR:-/tmp}/bringup-qwen0.5b-errorcfgdfg-XXXXXX.json")"
  BASE_CONFIG="$WORK_ROOT/configs_runs/qwen0.5b.json" CFG_DATASET_ID="$CFG_DATASET_ID" DFG_DATASET_ID="$DFG_DATASET_ID" OUTPUT_CONFIG="$TEMP_CONFIG" python3 - <<'PY'
import json
import os
from pathlib import Path

base = Path(os.environ["BASE_CONFIG"])
out = Path(os.environ["OUTPUT_CONFIG"])
cfg = json.loads(base.read_text(encoding="utf-8"))
cfg["cfg_dataset_id"] = os.environ["CFG_DATASET_ID"]
cfg["dfg_dataset_id"] = os.environ["DFG_DATASET_ID"]
out.write_text(json.dumps(cfg, indent=2) + "\n", encoding="utf-8")
PY
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
  local run_label="geminiComposer/qwen0.5b/bringup/${source_isa}-to-${target_isa}"
  local checkpoint_path="${RESULTS_ROOT}/${run_label}/error_cfg_dfg/logs/checkpoint_error_cfg_dfg.json"

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
    echo "Missing input JSON for ${source_isa} -> ${target_isa} under $QWEN_ROOT/bringup" >&2
    exit 1
  fi

  require_runtime_for_target "$target_isa"
  ensure_temp_config

  if has_txt_report "$run_label" "error_cfg_dfg"; then
    echo "Skipping existing report: ${run_label}/error_cfg_dfg"
    echo ""
    return
  fi

  cmd=(
    python3 compose_gemini.py "$input_json"
    --config "$TEMP_CONFIG"
    --benchmark bringup
    --source-isa "$source_isa"
    --target-isa "$target_isa"
    --prompt-config error_cfg_dfg
    --run-label "$run_label"
  )

  if [[ -f "$checkpoint_path" ]]; then
    echo "Resuming from checkpoint: $checkpoint_path"
    cmd+=(--resume-checkpoint "$checkpoint_path")
  else
    echo "Starting fresh run for ${run_label}/error_cfg_dfg"
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
