#!/usr/bin/env bash

# ARMv8.4-A Apple prioritized Gemini run script.
#
# What must exist outside of a plain `git pull`:
# 1. Benchmark checkout:
#    - /datasets/cpu-transpiler-inference/benchmarks/humaneval-c
#    - /datasets/cpu-transpiler-inference/benchmarks/mceval-c
#    - /datasets/cpu-transpiler-inference/benchmarks/bringup-bench
#    If your paths differ, edit `benchmark_root` in `configs_armv84a_apple/*.json`.
#
# 2. eval.py result JSONs for the ARMv8.4-A Apple source/target experiments.
#    This script auto-discovers them under the candidate roots below:
#    - $TRANSLATIONS_ROOT
#    - $TRANSLATIONS_ROOT_ALT
#    - /datasets/Qwen-Translations
#    - /datasets/Qwen-Translations-Apple
#    If your naming/layout differs, adjust `resolve_input_json()`.
#
# 3. Apple-target validation note:
#    The shipped Apple-target configs preserve the `arm64-apple-darwin` target.
#    On a Linux Docker host, running Darwin binaries is not provided by this repo.
#    ARMv8.4-A Apple as a *target* may require your own working Apple-capable
#    compile/link/runtime setup outside of what the repo alone installs.
#
# 4. McEval / BringUp graph prompts:
#    This script defaults those benchmarks to `base` only.
#    If you want `error_cfg_dfg` there too, first add explicit
#    `cfg_dataset_id` and `dfg_dataset_id` to the matching
#    `configs_armv84a_apple/mceval_*.json` and `bringup_*.json`,
#    then extend `MCEVAL_PROMPTS` / `BRINGUP_PROMPTS` below.

set -u

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ -d "/datasets/ModularComposer" ]]; then
  WORK_ROOT="/datasets/ModularComposer"
else
  WORK_ROOT="$SCRIPT_DIR"
fi

cd "$WORK_ROOT" || {
  echo "Failed to change directory to $WORK_ROOT"
  exit 1
}

RESULTS_ROOT="${RESULTS_ROOT:-$WORK_ROOT/results/composer}"
TRANSLATIONS_ROOT="${TRANSLATIONS_ROOT:-/datasets/Qwen-Translations}"
TRANSLATIONS_ROOT_ALT="${TRANSLATIONS_ROOT_ALT:-/datasets/Qwen-Translations-Apple}"
MAX_CONCURRENCY="${MAX_CONCURRENCY:-5}"
STRICT_MISSING="${STRICT_MISSING:-0}"

HUMANEVAL_PROMPTS=(base error_cfg_dfg)
MCEVAL_PROMPTS=(base)
BRINGUP_PROMPTS=(base)

PAIRS=(
  armapple-to-x86
  armapple-to-riscv
  x86-to-armapple
  riscv-to-armapple
)

candidate_translation_roots() {
  printf '%s\n' \
    "$TRANSLATIONS_ROOT" \
    "$TRANSLATIONS_ROOT_ALT" \
    "$WORK_ROOT/../Qwen-Translations" \
    "$WORK_ROOT/../Qwen-Translations-Apple"
}

ensure_output_tree() {
  local run_label="$1"
  local prompt_config="$2"
  local base_dir="${RESULTS_ROOT}/${run_label}/${prompt_config}"

  mkdir -p \
    "${base_dir}" \
    "${base_dir}/json_input_asm" \
    "${base_dir}/full_validation_input_asm" \
    "${base_dir}/prompts" \
    "${base_dir}/raw_model_output" \
    "${base_dir}/logs" \
    "${base_dir}/txts" \
    "${base_dir}/cleaned_model_output" \
    "${base_dir}/clean_diagnostics" \
    "${base_dir}/compile_probe" \
    "${base_dir}/validation_json"
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

lower() {
  echo "$1" | tr '[:upper:]' '[:lower:]'
}

has_any_token() {
  local text="$1"
  shift
  local token
  for token in "$@"; do
    [[ "$text" == *"$token"* ]] && return 0
  done
  return 1
}

pair_matches_name() {
  local name="$1"
  local pair="$2"

  case "$pair" in
    armapple-to-x86)
      has_any_token "$name" "arm_apple" "armv8.4a" "armv84a" "macarm" "mac_arm" "arm64-apple" &&
      has_any_token "$name" "to_x86" "_x86_" "x86_" "_x86"
      ;;
    armapple-to-riscv)
      has_any_token "$name" "arm_apple" "armv8.4a" "armv84a" "macarm" "mac_arm" "arm64-apple" &&
      has_any_token "$name" "to_riscv" "_riscv_" "riscv_" "_riscv"
      ;;
    x86-to-armapple)
      has_any_token "$name" "x86_to" "x86_" "_x86_" &&
      has_any_token "$name" "arm_apple" "armv8.4a" "armv84a" "macarm" "mac_arm" "arm64-apple"
      ;;
    riscv-to-armapple)
      has_any_token "$name" "riscv_to" "riscv_" "_riscv_" &&
      has_any_token "$name" "arm_apple" "armv8.4a" "armv84a" "macarm" "mac_arm" "arm64-apple"
      ;;
    *)
      return 1
      ;;
  esac
}

resolve_input_json() {
  local benchmark="$1"
  local size_dir="$2"
  local size_token="$3"
  local pair="$4"
  local -a matches=()
  local root

  while IFS= read -r root; do
    [[ -d "$root" ]] || continue

    while IFS= read -r -d '' candidate; do
      local base_name
      base_name="$(lower "$(basename "$candidate")")"
      [[ "$base_name" == *"$benchmark"* ]] || continue
      [[ "$base_name" == *"qwen"* ]] || continue
      [[ "$base_name" == *"$size_token"* ]] || continue
      pair_matches_name "$base_name" "$pair" || continue
      matches+=("$candidate")
    done < <(find "$root" -type f -path "*/${size_dir}/*.json" -print0 2>/dev/null)
  done < <(candidate_translation_roots)

  if [[ "${#matches[@]}" -eq 1 ]]; then
    echo "${matches[0]}"
    return 0
  fi

  if [[ "${#matches[@]}" -gt 1 ]]; then
    echo "AMBIGUOUS:${matches[*]}"
    return 2
  fi

  return 1
}

config_for() {
  local benchmark="$1"
  local pair="$2"
  echo "configs_armv84a_apple/${benchmark}_${pair}.json"
}

run_label_for() {
  local benchmark="$1"
  local size_dir="$2"
  local pair="$3"
  echo "geminiComposer/${benchmark}/qwen${size_dir}-${pair}"
}

run_jobs_for() {
  local benchmark="$1"
  local size_dir="$2"
  local size_token="$3"
  local -a prompts=()

  case "$benchmark" in
    humaneval) prompts=("${HUMANEVAL_PROMPTS[@]}") ;;
    mceval) prompts=("${MCEVAL_PROMPTS[@]}") ;;
    bringup) prompts=("${BRINGUP_PROMPTS[@]}") ;;
    *)
      echo "Unknown benchmark: $benchmark"
      exit 1
      ;;
  esac

  local pair
  for pair in "${PAIRS[@]}"; do
    local input_json
    if ! input_json="$(resolve_input_json "$benchmark" "$size_dir" "$size_token" "$pair")"; then
      echo "Missing input JSON for ${benchmark} ${size_dir} ${pair}"
      if [[ "$STRICT_MISSING" == "1" ]]; then
        exit 1
      fi
      continue
    fi

    if [[ "$input_json" == AMBIGUOUS:* ]]; then
      echo "Ambiguous input JSON for ${benchmark} ${size_dir} ${pair}"
      echo "Candidates: ${input_json#AMBIGUOUS:}"
      if [[ "$STRICT_MISSING" == "1" ]]; then
        exit 1
      fi
      continue
    fi

    local config
    config="$(config_for "$benchmark" "$pair")"
    local run_label
    run_label="$(run_label_for "$benchmark" "$size_dir" "$pair")"
    local prompt_config

    for prompt_config in "${prompts[@]}"; do
      ensure_output_tree "$run_label" "$prompt_config"
      if has_txt_report "$run_label" "$prompt_config"; then
        echo "Skipping existing report: ${run_label}/${prompt_config}"
        continue
      fi

      echo "Running ${benchmark} ${size_dir} ${pair} ${prompt_config}"
      python3 compose_gemini.py "$input_json" \
        --config "$config" \
        --max-concurrency "$MAX_CONCURRENCY" \
        --run-label "$run_label" \
        --prompt-config "$prompt_config"
    done
  done
}

echo "Priority 1: HumanEval, Qwen 0.5b and 3b"
run_jobs_for humaneval 0.5b 0p5b
run_jobs_for humaneval 3b 3p0b

echo "Priority 2: BringUpBench and McEval, Qwen 0.5b and 3b"
run_jobs_for bringup 0.5b 0p5b
run_jobs_for mceval 0.5b 0p5b
run_jobs_for bringup 3b 3p0b
run_jobs_for mceval 3b 3p0b

echo "Priority 3: All benchmarks, Qwen 1.5b"
run_jobs_for humaneval 1.5b 1p5b
run_jobs_for bringup 1.5b 1p5b
run_jobs_for mceval 1.5b 1p5b
