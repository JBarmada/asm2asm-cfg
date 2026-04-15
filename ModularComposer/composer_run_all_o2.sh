#!/usr/bin/env bash
set -euo pipefail

# Required outside a plain git pull:
# - Translation/eval JSONs. Defaults:
#   qwen0.5b/qwen3b/qwen1.5b -> ../Qwen-Translations
#   gemini -> ../Gemini-Transpilation/results
#   chatgpt -> ../ChatGPT-Transpilation/results
#   You can override all discovery with --input-root.
# - Local benchmark roots under ../cpu-transpiler-inference/benchmarks/{humaneval-c,bringup-bench,mceval-c}
# - For Gemini runs: GOOGLE_API_KEY or GEMINI_API_KEY
# - For OpenAI runs: OPENAI_API_KEY
# - clang-17 plus target support for x86, aarch64-linux, arm64-apple-darwin, riscv64
# - qemu-aarch64 and qemu-riscv64 for non-native ARMv8 Linux and RISC-V validation
# - Graph prompt modes use the default HumanEval graph datasets
# - McEval graph prompts default to:
#   cfg_dataset_id=ryaasabsar/mceval_asm_cfg
#   dfg_dataset_id=ryaasabsar/mceval_asm_dfg
# - BringUp graph prompts default to:
#   cfg_dataset_id=ryaasabsar/bringup_asm_cfg
#   dfg_dataset_id=ryaasabsar/bringup_asm_dfg
# - The default unfiltered sweep is qwen-only and ordered as:
#   qwen0.5b -> qwen3b -> qwen1.5b
# - Run one benchmark per terminal with:
#   --benchmark humaneval
#   --benchmark bringup
#   --benchmark mceval
# - The generic runner applies benchmark-specific concurrency overrides:
#   Humaneval/McEval -> 100 prompt / 100 validation
#   BringUp -> 64 prompt / 16 validation (then BringUp validation safety may clamp lower)
# - HumanEval qwen0.5b error_cfg_dfg is intentionally skipped for the Gemini composer campaign
# - Legacy HumanEval qwen result dirs can be migrated into the canonical
#   qwenX/humaneval/<source>-to-<target> layout with:
#   --migrate-humaneval-legacy
# - armv8.4a-apple target jobs stay available through explicit --target-isa, but this script skips them on non-macOS hosts

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

PROVIDER="gemini"
INPUT_ROOT=""
BENCHMARK_FILTER="all"
TRANSLATION_MODEL_FILTER="all"
SOURCE_FILTER="all"
TARGET_FILTER="all"
PROMPT_FILTER="all"
LIST_ONLY=0
DRY_RUN=0
RESUME=0
YES_FLAG=""
COMPOSER_MODEL=""
TEMP_CONFIGS=()
RESULTS_ROOT="${RESULTS_ROOT:-results/composer}"
MIGRATE_HE_LEGACY=0
declare -A LEGACY_HE_DIRS=()

cleanup() {
  if [[ ${#TEMP_CONFIGS[@]} -gt 0 ]]; then
    rm -f "${TEMP_CONFIGS[@]}"
  fi
}
trap cleanup EXIT

while [[ $# -gt 0 ]]; do
  case "$1" in
    --provider) PROVIDER="$2"; shift 2 ;;
    --input-root) INPUT_ROOT="$2"; shift 2 ;;
    --benchmark) BENCHMARK_FILTER="$2"; shift 2 ;;
    --translation-model) TRANSLATION_MODEL_FILTER="$2"; shift 2 ;;
    --translation-source) TRANSLATION_MODEL_FILTER="$2"; shift 2 ;;
    --model-size) TRANSLATION_MODEL_FILTER="$2"; shift 2 ;;
    --source-isa) SOURCE_FILTER="$2"; shift 2 ;;
    --target-isa) TARGET_FILTER="$2"; shift 2 ;;
    --prompt-config) PROMPT_FILTER="$2"; shift 2 ;;
    --composer-model) COMPOSER_MODEL="$2"; shift 2 ;;
    --migrate-humaneval-legacy) MIGRATE_HE_LEGACY=1; shift ;;
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

canon_translation_model() {
  case "$1" in
    0.5b|qwen0.5b|qwen-0.5b|qwen_0.5b) echo "qwen0.5b" ;;
    1.5b|qwen1.5b|qwen-1.5b|qwen_1.5b) echo "qwen1.5b" ;;
    3b|qwen3b|qwen-3b|qwen_3b) echo "qwen3b" ;;
    gemini|gemini-translations) echo "gemini" ;;
    chatgpt|chatgpt-translations) echo "chatgpt" ;;
    all) echo "all" ;;
    *) echo "$1" ;;
  esac
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

qwen_size_dir() {
  case "$1" in
    qwen0.5b) echo "0.5b" ;;
    qwen1.5b) echo "1.5b" ;;
    qwen3b) echo "3b" ;;
  esac
}

qwen_size_tag() {
  case "$1" in
    qwen0.5b) echo "0p5b" ;;
    qwen1.5b) echo "1p5b" ;;
    qwen3b) echo "3p0b" ;;
  esac
}

config_for_translation_model() {
  case "$1" in
    qwen0.5b) echo "configs_runs/qwen0.5b.json" ;;
    qwen1.5b) echo "configs_runs/qwen1.5b.json" ;;
    qwen3b) echo "configs_runs/qwen3b.json" ;;
    gemini) echo "configs_runs/gemini.json" ;;
    chatgpt) echo "configs_runs/chatgpt.json" ;;
    *) return 1 ;;
  esac
}

default_input_root_for_model() {
  case "$1" in
    qwen0.5b|qwen1.5b|qwen3b) echo "../Qwen-Translations" ;;
    gemini) echo "../Gemini-Transpilation/results" ;;
    chatgpt) echo "../ChatGPT-Transpilation/results" ;;
    *) echo "../Qwen-Translations" ;;
  esac
}

requires_cfg_dataset() {
  case "$1" in
    cfg_only|error_cfg|cfg_dfg|error_cfg_dfg) return 0 ;;
    *) return 1 ;;
  esac
}

requires_dfg_dataset() {
  case "$1" in
    dfg_only|error_dfg|cfg_dfg|error_cfg_dfg) return 0 ;;
    *) return 1 ;;
  esac
}

special_skip_reason() {
  local benchmark="$1"
  local translation_model="$2"
  local prompt="$3"

  if [[ "$PROVIDER" == "gemini" && "$benchmark" == "humaneval" && "$translation_model" == "qwen0.5b" && "$prompt" == "error_cfg_dfg" ]]; then
    echo "campaign skip: humaneval qwen0.5b error_cfg_dfg"
    return
  fi

  echo ""
}

effective_config_for_job() {
  local base_config="$1"
  local benchmark="$2"
  local prompt="$3"

  local temp_config
  temp_config="$(mktemp "${TMPDIR:-/tmp}/composer-run-${benchmark}-XXXXXX.json")"
  TEMP_CONFIGS+=("$temp_config")
  BASE_CONFIG="$base_config" OUTPUT_CONFIG="$temp_config" BENCHMARK_ID="$benchmark" PROMPT_CONFIG="$prompt" python3 - <<'PY'
import json
import os
from pathlib import Path

base = Path(os.environ["BASE_CONFIG"])
out = Path(os.environ["OUTPUT_CONFIG"])
benchmark = os.environ["BENCHMARK_ID"]
prompt_config = os.environ["PROMPT_CONFIG"]
cfg = json.loads(base.read_text(encoding="utf-8"))

if benchmark == "bringup":
    cfg["max_workers"] = 64
    cfg["prompt_concurrency"] = 64
    cfg["validation_concurrency"] = 16
else:
    cfg["max_workers"] = 100
    cfg["prompt_concurrency"] = 100
    cfg["validation_concurrency"] = 100

cfg_prompt_modes = {"cfg_only", "error_cfg", "cfg_dfg", "error_cfg_dfg"}
dfg_prompt_modes = {"dfg_only", "error_dfg", "cfg_dfg", "error_cfg_dfg"}
if prompt_config in cfg_prompt_modes or prompt_config in dfg_prompt_modes:
    defaults = {
        "mceval": ("ryaasabsar/mceval_asm_cfg", "ryaasabsar/mceval_asm_dfg"),
        "bringup": ("ryaasabsar/bringup_asm_cfg", "ryaasabsar/bringup_asm_dfg"),
    }
    if benchmark in defaults:
        cfg_default, dfg_default = defaults[benchmark]
        cfg.setdefault("cfg_dataset_id", cfg_default)
        cfg.setdefault("dfg_dataset_id", dfg_default)

out.write_text(json.dumps(cfg, indent=2) + "\n", encoding="utf-8")
PY
  echo "$temp_config"
}

legacy_humaneval_isa() {
  case "$1" in
    x86|x86_64|x86-64) echo "x86" ;;
    arm|armv8|arm_linux|arm-linux|armv8-linux|aarch64) echo "armv8-linux" ;;
    armv8.4a|arm_apple|arm-apple|armv8mac|armv8.4a-apple|mac-armv8|aarch64_apple) echo "armv8.4a-apple" ;;
    riscv|riscv64) echo "riscv" ;;
    *) return 1 ;;
  esac
}

parse_legacy_humaneval_dir_name() {
  local name="$1"
  local model rest source_tag target_tag source_isa target_isa

  if [[ "$name" =~ ^(qwen0\.5b|qwen1\.5b|qwen3b)-(.*)$ ]]; then
    model="${BASH_REMATCH[1]}"
    rest="${BASH_REMATCH[2]}"
  else
    return 1
  fi

  if [[ "$rest" == *-to-* ]]; then
    source_tag="${rest%%-to-*}"
    target_tag="${rest##*-to-}"
  else
    IFS='-' read -r source_tag target_tag extra <<< "$rest"
    if [[ -n "${extra:-}" || -z "${source_tag:-}" || -z "${target_tag:-}" ]]; then
      return 1
    fi
  fi

  source_isa="$(legacy_humaneval_isa "$source_tag")" || return 1
  target_isa="$(legacy_humaneval_isa "$target_tag")" || return 1
  printf '%s|%s|%s\n' "$model" "$source_isa" "$target_isa"
}

index_legacy_humaneval_dirs() {
  local provider_root="${RESULTS_ROOT}/${PROVIDER}Composer"
  local legacy_path name key

  [[ -d "$provider_root" ]] || return

  while IFS= read -r legacy_path; do
    name="$(basename "$legacy_path")"
    key="$(parse_legacy_humaneval_dir_name "$name" || true)"
    [[ -n "$key" ]] || continue
    LEGACY_HE_DIRS["$key"]="$legacy_path"
  done < <(find "$provider_root" -mindepth 1 -maxdepth 1 -type d 2>/dev/null | sort)
}

legacy_humaneval_run_dir_for_job() {
  local translation_model="$1"
  local source_isa="$2"
  local target_isa="$3"
  local key="${translation_model}|${source_isa}|${target_isa}"
  printf '%s\n' "${LEGACY_HE_DIRS[$key]:-}"
}

has_txt_report_dir() {
  local run_dir="$1"
  local prompt_config="$2"

  [[ -n "$run_dir" && -d "$run_dir/$prompt_config" ]] || return 1

  if ls "$run_dir/$prompt_config/txts"/*.txt >/dev/null 2>&1; then
    return 0
  fi
  if ls "$run_dir/$prompt_config"/*.txt >/dev/null 2>&1; then
    return 0
  fi
  return 1
}

existing_report_dir_for_job() {
  local canonical_dir="$1"
  local legacy_dir="$2"
  local prompt_config="$3"

  if has_txt_report_dir "$canonical_dir" "$prompt_config"; then
    printf '%s\n' "$canonical_dir"
    return
  fi
  if has_txt_report_dir "$legacy_dir" "$prompt_config"; then
    printf '%s\n' "$legacy_dir"
    return
  fi
  printf '\n'
}

checkpoint_path_for_dir() {
  local run_dir="$1"
  local prompt_config="$2"
  local checkpoint="$run_dir/$prompt_config/logs/checkpoint_${prompt_config}.json"
  if [[ -n "$run_dir" && -f "$checkpoint" ]]; then
    printf '%s\n' "$checkpoint"
    return
  fi
  printf '\n'
}

existing_checkpoint_for_job() {
  local canonical_dir="$1"
  local legacy_dir="$2"
  local prompt_config="$3"
  local canonical_checkpoint legacy_checkpoint

  canonical_checkpoint="$(checkpoint_path_for_dir "$canonical_dir" "$prompt_config")"
  if [[ -n "$canonical_checkpoint" ]]; then
    printf '%s\n' "$canonical_checkpoint"
    return
  fi

  legacy_checkpoint="$(checkpoint_path_for_dir "$legacy_dir" "$prompt_config")"
  printf '%s\n' "$legacy_checkpoint"
}

migrate_humaneval_legacy_dir_if_needed() {
  local benchmark="$1"
  local translation_model="$2"
  local source_isa="$3"
  local target_isa="$4"
  local canonical_dir="$5"
  local legacy_dir key results_root_abs canonical_parent canonical_abs legacy_abs

  [[ "$benchmark" == "humaneval" ]] || return

  legacy_dir="$(legacy_humaneval_run_dir_for_job "$translation_model" "$source_isa" "$target_isa")"
  [[ -n "$legacy_dir" && -d "$legacy_dir" ]] || return

  if [[ -e "$canonical_dir" ]]; then
    echo "Warning: keeping canonical HumanEval dir and leaving legacy dir untouched: $legacy_dir" >&2
    return
  fi

  mkdir -p "$RESULTS_ROOT"
  results_root_abs="$(cd "$RESULTS_ROOT" && pwd -P)"
  canonical_parent="$(dirname "$canonical_dir")"
  mkdir -p "$canonical_parent"
  canonical_abs="$(cd "$canonical_parent" && pwd -P)/$(basename "$canonical_dir")"
  legacy_abs="$(cd "$(dirname "$legacy_dir")" && pwd -P)/$(basename "$legacy_dir")"

  case "$canonical_abs" in
    "$results_root_abs"/*) ;;
    *)
      echo "Refusing to migrate HumanEval results outside $results_root_abs: $canonical_abs" >&2
      exit 1
      ;;
  esac
  case "$legacy_abs" in
    "$results_root_abs"/*) ;;
    *)
      echo "Refusing to migrate HumanEval results outside $results_root_abs: $legacy_abs" >&2
      exit 1
      ;;
  esac

  mv "$legacy_dir" "$canonical_dir"
  key="${translation_model}|${source_isa}|${target_isa}"
  LEGACY_HE_DIRS["$key"]=""
  echo "Migrated legacy HumanEval results: ${legacy_dir#${RESULTS_ROOT}/} -> ${canonical_dir#${RESULTS_ROOT}/}" >&2
}

canonical_humaneval_run_dir() {
  local translation_model="$1"
  local source_isa="$2"
  local target_isa="$3"
  printf '%s\n' "${RESULTS_ROOT}/${PROVIDER}Composer/${translation_model}/humaneval/${source_isa}-to-${target_isa}"
}

migrate_all_humaneval_legacy_dirs() {
  local key translation_model source_isa target_isa canonical_dir migrated_count=0

  for key in "${!LEGACY_HE_DIRS[@]}"; do
    [[ -n "${LEGACY_HE_DIRS[$key]:-}" ]] || continue
    IFS='|' read -r translation_model source_isa target_isa <<< "$key"
    canonical_dir="$(canonical_humaneval_run_dir "$translation_model" "$source_isa" "$target_isa")"
    if [[ -d "$canonical_dir" ]]; then
      echo "Warning: keeping canonical HumanEval dir and leaving legacy dir untouched: ${LEGACY_HE_DIRS[$key]}" >&2
      continue
    fi
    migrate_humaneval_legacy_dir_if_needed "humaneval" "$translation_model" "$source_isa" "$target_isa" "$canonical_dir"
    migrated_count=$((migrated_count + 1))
  done

  if [[ $migrated_count -gt 0 ]]; then
    echo "Migrated $migrated_count legacy HumanEval result director$( [[ $migrated_count -eq 1 ]] && printf 'y' || printf 'ies' )." >&2
  fi
}

translation_models_for_filter() {
  case "$1" in
    all) printf '%s\n' "qwen0.5b" "qwen3b" "qwen1.5b" ;;
    qwen0.5b|qwen1.5b|qwen3b|gemini|chatgpt) printf '%s\n' "$1" ;;
    *)
      echo "Unsupported translation model filter: $1" >&2
      exit 2
      ;;
  esac
}

emit_pair_manifest() {
  if [[ "$TARGET_FILTER" == "armv8.4a-apple" ]]; then
    printf '%s\n' \
      "x86:armv8.4a-apple" \
      "riscv:armv8.4a-apple"
    return
  fi

  printf '%s\n' \
    "x86:armv8-linux" \
    "x86:riscv" \
    "armv8-linux:x86" \
    "armv8-linux:riscv" \
    "armv8.4a-apple:x86" \
    "armv8.4a-apple:riscv" \
    "riscv:armv8-linux" \
    "riscv:x86"
}

resolve_input_json() {
  local translation_model="$1"
  local root="$2"
  local benchmark="$3"
  local source="$4"
  local target="$5"
  local source_tag target_tag target_dir qwen_dir qwen_tag pattern

  case "$translation_model" in
    gemini)
      find "$root" -type f -path "*/${benchmark}/flash/${source}-to-${target}/O2/jsons/eval_results.json" 2>/dev/null | sort | tail -n 1 || true
      return
      ;;
    chatgpt)
      find "$root" -type f -path "*/${benchmark}/gpt5mini/${source}-to-${target}/O2/jsons/eval_results.json" 2>/dev/null | sort | tail -n 1 || true
      return
      ;;
  esac

  source_tag="$(filename_isa_tag "$source")"
  target_tag="$(filename_isa_tag "$target")"
  qwen_dir="$(qwen_size_dir "$translation_model")"
  qwen_tag="$(qwen_size_tag "$translation_model")"
  if [[ -z "$qwen_dir" || -z "$qwen_tag" ]]; then
    echo ""
    return
  fi

  if [[ "$benchmark" == "humaneval" ]]; then
    target_dir="$(target_dir_name "$target")"
    pattern="*_${benchmark}_${source_tag}_${target_tag}_O2_*.json"
    find "$root/$target_dir/$qwen_dir" -maxdepth 1 -type f -name "$pattern" 2>/dev/null | sort | tail -n 1 || true
    return
  fi
  pattern="*_${qwen_tag}_full_${benchmark}_${source_tag}_${target_tag}_O2_*.json"
  find "$root/$benchmark" -maxdepth 1 -type f -name "$pattern" 2>/dev/null | sort | tail -n 1 || true
}

BENCHMARK_FILTER="$(canon_benchmark "$BENCHMARK_FILTER")"
TRANSLATION_MODEL_FILTER="$(canon_translation_model "$TRANSLATION_MODEL_FILTER")"
SOURCE_FILTER="$(canon_isa "$SOURCE_FILTER")"
TARGET_FILTER="$(canon_isa "$TARGET_FILTER")"
index_legacy_humaneval_dirs

if [[ "$BENCHMARK_FILTER" == "humaneval" || "$BENCHMARK_FILTER" == "all" ]]; then
  if [[ $MIGRATE_HE_LEGACY -eq 1 || ( $LIST_ONLY -eq 0 && $DRY_RUN -eq 0 ) ]]; then
    migrate_all_humaneval_legacy_dirs
  fi
fi

if [[ "$PROVIDER" == "gemini" ]]; then
  RUNNER=(python3 compose_gemini.py)
elif [[ "$PROVIDER" == "openai" ]]; then
  RUNNER=(python3 compose_openai.py)
else
  echo "Unsupported provider: $PROVIDER" >&2
  exit 2
fi

printf "%-10s %-12s %-15s %-15s %-14s %-8s %s\n" "benchmark" "translation" "source" "target" "prompt" "status" "detail"
printf "%-10s %-12s %-15s %-15s %-14s %-8s %s\n" "---------" "-----------" "------" "------" "------" "------" "------"

for benchmark in humaneval bringup mceval; do
  matches "$BENCHMARK_FILTER" "$benchmark" || continue
  prompt_list=(base error_cfg_dfg)

  while IFS= read -r translation_model; do
    config_path="$(config_for_translation_model "$translation_model")"
    input_root="${INPUT_ROOT:-$(default_input_root_for_model "$translation_model")}"
    while IFS= read -r pair; do
      source="${pair%%:*}"
      target="${pair##*:}"
      matches "$SOURCE_FILTER" "$source" || continue
      matches "$TARGET_FILTER" "$target" || continue
      run_label="${PROVIDER}Composer/${translation_model}/${benchmark}/${source}-to-${target}"
      canonical_run_dir="${RESULTS_ROOT}/${run_label}"
      legacy_run_dir=""
      if [[ "$benchmark" == "humaneval" ]]; then
        legacy_run_dir="$(legacy_humaneval_run_dir_for_job "$translation_model" "$source" "$target")"
      fi
      for prompt in "${prompt_list[@]}"; do
        matches "$PROMPT_FILTER" "$prompt" || continue
        existing_report_dir="$(existing_report_dir_for_job "$canonical_run_dir" "$legacy_run_dir" "$prompt")"
        existing_checkpoint="$(existing_checkpoint_for_job "$canonical_run_dir" "$legacy_run_dir" "$prompt")"
        input_json=""
        skip_reason="$(special_skip_reason "$benchmark" "$translation_model" "$prompt")"
        if [[ -z "$skip_reason" && -z "$existing_report_dir" ]]; then
          skip_reason="$(skip_reason_for_target "$target")"
        fi
        if [[ -z "$skip_reason" && -z "$existing_report_dir" ]]; then
          input_json="$(resolve_input_json "$translation_model" "$input_root" "$benchmark" "$source" "$target")"
          if [[ -z "$input_json" ]]; then
            skip_reason="input JSON not found under $input_root"
          fi
        elif [[ -z "$input_json" ]]; then
          input_json="$(resolve_input_json "$translation_model" "$input_root" "$benchmark" "$source" "$target")"
        fi
        effective_config="$(effective_config_for_job "$config_path" "$benchmark" "$prompt")"
        status="run"
        detail="$effective_config"
        if [[ -n "$existing_report_dir" ]]; then
          status="skip"
          detail="existing report under ${existing_report_dir#${RESULTS_ROOT}/}"
        elif [[ -n "$skip_reason" ]]; then
          status="skip"
          detail="$skip_reason"
        else
          detail="$input_json | config=$effective_config"
          if [[ $RESUME -eq 1 && -n "$existing_checkpoint" ]]; then
            detail="$detail | resume=${existing_checkpoint#${RESULTS_ROOT}/}"
          fi
        fi
        printf "%-10s %-12s %-15s %-15s %-14s %-8s %s\n" "$benchmark" "$translation_model" "$source" "$target" "$prompt" "$status" "$detail"

        [[ $LIST_ONLY -eq 1 ]] && continue
        [[ -n "$existing_report_dir" ]] && continue
        [[ -n "$skip_reason" ]] && continue

        cmd=("${RUNNER[@]}" "$input_json" --config "$effective_config" --benchmark "$benchmark" --source-isa "$source" --target-isa "$target" --prompt-config "$prompt" --run-label "$run_label")
        [[ -n "$YES_FLAG" ]] && cmd+=("$YES_FLAG")
        [[ -n "$COMPOSER_MODEL" ]] && cmd+=(--model "$COMPOSER_MODEL")
        if [[ $RESUME -eq 1 ]]; then
          checkpoint="${RESULTS_ROOT}/${run_label}/${prompt}/logs/checkpoint_${prompt}.json"
          if [[ -f "$checkpoint" ]]; then
            cmd+=(--resume-checkpoint "$checkpoint")
          elif [[ -n "$existing_checkpoint" ]]; then
            cmd+=(--resume-checkpoint "$existing_checkpoint")
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
    done < <(emit_pair_manifest)
  done < <(translation_models_for_filter "$TRANSLATION_MODEL_FILTER")
done
