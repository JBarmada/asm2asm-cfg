#!/usr/bin/env bash
set -euo pipefail

# Required outside a plain git pull:
# - Translation/eval JSONs. Default discovery targets ../Qwen-Translations, but --input-root can point elsewhere.
# - Local benchmark roots under ../cpu-transpiler-inference/benchmarks/{humaneval-c,bringup-bench,mceval-c}
# - For Gemini runs: GOOGLE_API_KEY or GEMINI_API_KEY
# - For OpenAI runs: OPENAI_API_KEY
# - clang-17 plus target support for x86, aarch64-linux, arm64-apple-darwin, riscv64
# - qemu-aarch64 and qemu-riscv64 for non-native ARMv8 Linux and RISC-V validation
# - Graph prompt modes use the default HumanEval graph datasets; McEval/BringUp need explicit dataset ids in config before enabling graph prompts
# - armv8.4a-apple target jobs stay visible in the manifest, but this script skips them on non-macOS hosts

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

PROVIDER="gemini"
INPUT_ROOT="../Qwen-Translations"
BENCHMARK_FILTER="all"
MODEL_FILTER="all"
SOURCE_FILTER="all"
TARGET_FILTER="all"
PROMPT_FILTER="all"
LIST_ONLY=0
DRY_RUN=0
RESUME=0
YES_FLAG=""
COMPOSER_MODEL=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --provider) PROVIDER="$2"; shift 2 ;;
    --input-root) INPUT_ROOT="$2"; shift 2 ;;
    --benchmark) BENCHMARK_FILTER="$2"; shift 2 ;;
    --model-size) MODEL_FILTER="$2"; shift 2 ;;
    --source-isa) SOURCE_FILTER="$2"; shift 2 ;;
    --target-isa) TARGET_FILTER="$2"; shift 2 ;;
    --prompt-config) PROMPT_FILTER="$2"; shift 2 ;;
    --composer-model) COMPOSER_MODEL="$2"; shift 2 ;;
    --list) LIST_ONLY=1; shift ;;
    --dry-run) DRY_RUN=1; shift ;;
    --resume) RESUME=1; shift ;;
    --yes) YES_FLAG="--yes"; shift ;;
    *)
      echo "Unknown argument: $1" >&2
      exit 2
      ;;
  esac
done

canon_benchmark() {
  case "$1" in
    humaneval|humaneval-c) echo "humaneval" ;;
    bringup|bringup-bench|bringupbench) echo "bringup" ;;
    mceval|mceval-c) echo "mceval" ;;
    all) echo "all" ;;
    *) echo "$1" ;;
  esac
}

canon_isa() {
  case "$1" in
    x86|x86_64|x86-64) echo "x86" ;;
    armv8|arm_linux|arm-linux|armv8-linux|aarch64|aarch64_linux) echo "armv8-linux" ;;
    armv8.4a|arm_apple|arm-apple|armv8mac|armv8.4a-apple|mac-armv8|aarch64_apple) echo "armv8.4a-apple" ;;
    riscv|riscv64) echo "riscv" ;;
    all) echo "all" ;;
    *) echo "$1" ;;
  esac
}

matches() {
  local filter="$1"
  local value="$2"
  [[ "$filter" == "all" || "$filter" == "$value" ]]
}

skip_reason_for_target() {
  local target="$1"
  if [[ "$target" == "armv8.4a-apple" && "$(uname -s)" != "Darwin" ]]; then
    echo "armv8.4a-apple validation requires a macOS host"
    return
  fi
  if [[ "$target" == "armv8-linux" ]] && ! command -v qemu-aarch64 >/dev/null 2>&1; then
    echo "qemu-aarch64 is missing"
    return
  fi
  if [[ "$target" == "riscv" ]] && ! command -v qemu-riscv64 >/dev/null 2>&1; then
    echo "qemu-riscv64 is missing"
    return
  fi
  echo ""
}

target_dir_name() {
  case "$1" in
    x86) echo "x86" ;;
    riscv) echo "riscv" ;;
    armv8-linux) echo "armv8" ;;
    armv8.4a-apple) echo "mac-armv8" ;;
  esac
}

filename_isa_tag() {
  case "$1" in
    x86) echo "x86" ;;
    riscv) echo "riscv" ;;
    armv8-linux) echo "arm_linux" ;;
    armv8.4a-apple) echo "arm_apple" ;;
  esac
}

size_tag() {
  case "$1" in
    0.5b) echo "0p5b" ;;
    1.5b) echo "1p5b" ;;
    3b) echo "3p0b" ;;
  esac
}

config_for_size() {
  case "$1" in
    0.5b) echo "configs_runs/qwen0.5b.json" ;;
    1.5b) echo "configs_runs/qwen1.5b.json" ;;
    3b) echo "configs_runs/qwen3b.json" ;;
    *) return 1 ;;
  esac
}

resolve_input_json() {
  local root="$1"
  local benchmark="$2"
  local size="$3"
  local source="$4"
  local target="$5"
  local source_tag target_tag target_dir size_qwen pattern repo_path

  repo_path="$(find "$root" -type f -path "*/${benchmark}/${size}/${source}-to-${target}/O2/jsons/eval_results.json" 2>/dev/null | sort | tail -n 1 || true)"
  if [[ -n "$repo_path" ]]; then
    echo "$repo_path"
    return
  fi

  source_tag="$(filename_isa_tag "$source")"
  target_tag="$(filename_isa_tag "$target")"
  size_qwen="$(size_tag "$size")"
  if [[ "$benchmark" == "humaneval" ]]; then
    target_dir="$(target_dir_name "$target")"
    pattern="*_${benchmark}_${source_tag}_${target_tag}_O2_*.json"
    find "$root/$target_dir/$size" -maxdepth 1 -type f -name "$pattern" 2>/dev/null | sort | tail -n 1 || true
    return
  fi
  pattern="*_${size_qwen}_full_${benchmark}_${source_tag}_${target_tag}_O2_*.json"
  find "$root/$benchmark" -maxdepth 1 -type f -name "$pattern" 2>/dev/null | sort | tail -n 1 || true
}

BENCHMARK_FILTER="$(canon_benchmark "$BENCHMARK_FILTER")"
SOURCE_FILTER="$(canon_isa "$SOURCE_FILTER")"
TARGET_FILTER="$(canon_isa "$TARGET_FILTER")"

if [[ "$PROVIDER" == "gemini" ]]; then
  RUNNER=(python3 compose_gemini.py)
elif [[ "$PROVIDER" == "openai" ]]; then
  RUNNER=(python3 compose_openai.py)
else
  echo "Unsupported provider: $PROVIDER" >&2
  exit 2
fi

printf "%-10s %-6s %-15s %-15s %-14s %-8s %s\n" "benchmark" "size" "source" "target" "prompt" "status" "detail"
printf "%-10s %-6s %-15s %-15s %-14s %-8s %s\n" "---------" "----" "------" "------" "------" "------" "------"

for benchmark in humaneval bringup mceval; do
  matches "$BENCHMARK_FILTER" "$benchmark" || continue
  if [[ "$benchmark" == "humaneval" ]]; then
    prompt_list=(base error_cfg_dfg)
  else
    prompt_list=(base)
  fi

  for size in 0.5b 1.5b 3b; do
    matches "$MODEL_FILTER" "$size" || continue
    config_path="$(config_for_size "$size")"
    for pair in \
      "x86:riscv" \
      "x86:armv8-linux" \
      "x86:armv8.4a-apple" \
      "riscv:x86" \
      "riscv:armv8-linux" \
      "riscv:armv8.4a-apple" \
      "armv8-linux:riscv" \
      "armv8-linux:x86" \
      "armv8.4a-apple:riscv" \
      "armv8.4a-apple:x86"
    do
      source="${pair%%:*}"
      target="${pair##*:}"
      matches "$SOURCE_FILTER" "$source" || continue
      matches "$TARGET_FILTER" "$target" || continue
      input_json="$(resolve_input_json "$INPUT_ROOT" "$benchmark" "$size" "$source" "$target")"
      skip_reason="$(skip_reason_for_target "$target")"
      if [[ -z "$skip_reason" && -z "$input_json" ]]; then
        skip_reason="input JSON not found under $INPUT_ROOT"
      fi
      for prompt in "${prompt_list[@]}"; do
        matches "$PROMPT_FILTER" "$prompt" || continue
        status="run"
        detail="$config_path"
        if [[ -n "$skip_reason" ]]; then
          status="skip"
          detail="$skip_reason"
        else
          detail="$input_json"
        fi
        printf "%-10s %-6s %-15s %-15s %-14s %-8s %s\n" "$benchmark" "$size" "$source" "$target" "$prompt" "$status" "$detail"

        [[ $LIST_ONLY -eq 1 ]] && continue
        [[ -n "$skip_reason" ]] && continue

        run_label="${PROVIDER}Composer/${size}/${benchmark}/${source}-to-${target}"
        cmd=("${RUNNER[@]}" "$input_json" --config "$config_path" --benchmark "$benchmark" --source-isa "$source" --target-isa "$target" --prompt-config "$prompt" --run-label "$run_label")
        [[ -n "$YES_FLAG" ]] && cmd+=("$YES_FLAG")
        [[ -n "$COMPOSER_MODEL" ]] && cmd+=(--model "$COMPOSER_MODEL")
        if [[ $RESUME -eq 1 ]]; then
          checkpoint="results/composer/${run_label}/${prompt}/logs/checkpoint_${prompt}.json"
          if [[ -f "$checkpoint" ]]; then
            cmd+=(--resume-checkpoint "$checkpoint")
          fi
        fi

        if [[ $DRY_RUN -eq 1 ]]; then
          printf 'DRY RUN:'
          printf ' %q' "${cmd[@]}"
          printf '\n'
          continue
        fi

        "${cmd[@]}"
      done
    done
  done
done
