#!/usr/bin/env bash
set -euo pipefail

# Mini McEval smoke run for qwen0.5b + base prompt.
#
# What this script does:
# - filters two full McEval qwen0.5b eval JSONs down to a fixed 7-task subset
# - runs ModularComposer with Gemini on one standard pair and one armv8.4a-source pair
# - gives a quick harness check before launching the full McEval sweep
#
# Smoke pairs:
# - x86 -> riscv
# - armv8.4a-apple -> x86
#
# Fixed task subset:
# - C_1
# - C_2
# - C_3
# - C_4
# - C_5
# - C_6
# - C_7
#
# Required outside a plain git pull:
# - /datasets/ModularComposer mounted to this repo, or run from the repo directly
# - /datasets/Qwen-Translations/mceval containing the qwen0.5b McEval eval JSONs
# - /datasets/cpu-transpiler-inference/benchmarks/mceval-c
# - GOOGLE_API_KEY or GEMINI_API_KEY
# - clang-17
# - qemu-riscv64 for the riscv target smoke pair
#
# What to inspect after each smoke run:
# - preflight correctness
# - validation_json/final_error_problems.json
# - compile_probe/*.log
# - whether failures are prediction-side or repeated wrapper-side build issues

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
  C_1
  C_2
  C_3
  C_4
  C_5
  C_6
  C_7
)
KEEP_TASKS_CSV="$(IFS=,; echo "${KEEP_TASKS[*]}")"
MINI_INPUT_DIR="$WORK_ROOT/results/composer/mini_inputs/mceval-mini7/qwen0.5b"
mkdir -p "$MINI_INPUT_DIR"

TASKS_PRETTY="$(printf '%s, ' "${KEEP_TASKS[@]}")"
TASKS_PRETTY="${TASKS_PRETTY%, }"
echo "Mini McEval task set: $TASKS_PRETTY"
echo ""

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
    return Path(raw).stem

filtered = [row for row in data if task_name_from_row(row) in keep]
found = {task_name_from_row(row) for row in filtered}
missing = sorted(keep - found)
if missing:
    raise SystemExit(f"Mini JSON missing tasks from {src}: {missing}")

dst.parent.mkdir(parents=True, exist_ok=True)
dst.write_text(json.dumps(filtered, indent=2) + "\n", encoding="utf-8")
print(f"Wrote {dst} with {len(filtered)} tasks")
PY
}

run_one() {
  local source_isa="$1"
  local target_isa="$2"
  local mini_json="$3"
  local input_json
  local run_label="geminiComposer/qwen0.5b/mceval-mini7/${source_isa}-to-${target_isa}"

  input_json="$(find_latest_json "$source_isa" "$target_isa")"
  if [[ -z "$input_json" ]]; then
    echo "Missing input JSON for ${source_isa} -> ${target_isa} under $QWEN_ROOT/mceval" >&2
    exit 1
  fi

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
    --benchmark mceval
    --source-isa "$source_isa"
    --target-isa "$target_isa"
    --prompt-config base
    --run-label "$run_label"
  )
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
  "riscv" \
  "$MINI_INPUT_DIR/x86-to-riscv_mini7.json"

run_one \
  "armv8.4a-apple" \
  "x86" \
  "$MINI_INPUT_DIR/armv8.4a-apple-to-x86_mini7.json"
