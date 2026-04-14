#!/usr/bin/env bash
set -euo pipefail

# Required outside a plain git pull:
# - Local benchmark roots under ../cpu-transpiler-inference/benchmarks/{humaneval-c,bringup-bench,mceval-c}
# - Hugging Face access if the benchmark datasets are private or rate-limited
# - GOOGLE_API_KEY or GEMINI_API_KEY
# - clang-17 plus target support for x86, aarch64-linux, arm64-apple-darwin, riscv64
# - qemu-aarch64 and qemu-riscv64 for non-native ARMv8 Linux and RISC-V runs
# - armv8.4a-apple target jobs stay in the manifest, but this script skips them on non-macOS hosts

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

BENCHMARK_FILTER="all"
MODEL_FILTER="all"
SOURCE_FILTER="all"
TARGET_FILTER="all"
LIST_ONLY=0
DRY_RUN=0
RESUME=0
YES_FLAG=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --benchmark) BENCHMARK_FILTER="$2"; shift 2 ;;
    --model-size) MODEL_FILTER="$2"; shift 2 ;;
    --source-isa) SOURCE_FILTER="$2"; shift 2 ;;
    --target-isa) TARGET_FILTER="$2"; shift 2 ;;
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
    echo "armv8.4a-apple execution requires a macOS host"
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

BENCHMARK_FILTER="$(canon_benchmark "$BENCHMARK_FILTER")"
SOURCE_FILTER="$(canon_isa "$SOURCE_FILTER")"
TARGET_FILTER="$(canon_isa "$TARGET_FILTER")"

MANIFEST="$(cat <<'EOF'
humaneval|flash|x86|riscv|configs/config_gemini_flash.json
humaneval|flash|x86|armv8-linux|configs/config_gemini_flash.json
humaneval|flash|x86|armv8.4a-apple|configs/config_gemini_flash.json
humaneval|flash|riscv|x86|configs/config_gemini_flash.json
humaneval|flash|riscv|armv8-linux|configs/config_gemini_flash.json
humaneval|flash|riscv|armv8.4a-apple|configs/config_gemini_flash.json
humaneval|flash|armv8-linux|riscv|configs/config_gemini_flash.json
humaneval|flash|armv8-linux|x86|configs/config_gemini_flash.json
humaneval|flash|armv8.4a-apple|riscv|configs/config_gemini_flash.json
humaneval|flash|armv8.4a-apple|x86|configs/config_gemini_flash.json
bringup|flash|x86|riscv|configs/config_gemini_flash.json
bringup|flash|x86|armv8-linux|configs/config_gemini_flash.json
bringup|flash|x86|armv8.4a-apple|configs/config_gemini_flash.json
bringup|flash|riscv|x86|configs/config_gemini_flash.json
bringup|flash|riscv|armv8-linux|configs/config_gemini_flash.json
bringup|flash|riscv|armv8.4a-apple|configs/config_gemini_flash.json
bringup|flash|armv8-linux|riscv|configs/config_gemini_flash.json
bringup|flash|armv8-linux|x86|configs/config_gemini_flash.json
bringup|flash|armv8.4a-apple|riscv|configs/config_gemini_flash.json
bringup|flash|armv8.4a-apple|x86|configs/config_gemini_flash.json
mceval|flash|x86|riscv|configs/config_gemini_flash.json
mceval|flash|x86|armv8-linux|configs/config_gemini_flash.json
mceval|flash|x86|armv8.4a-apple|configs/config_gemini_flash.json
mceval|flash|riscv|x86|configs/config_gemini_flash.json
mceval|flash|riscv|armv8-linux|configs/config_gemini_flash.json
mceval|flash|riscv|armv8.4a-apple|configs/config_gemini_flash.json
mceval|flash|armv8-linux|riscv|configs/config_gemini_flash.json
mceval|flash|armv8-linux|x86|configs/config_gemini_flash.json
mceval|flash|armv8.4a-apple|riscv|configs/config_gemini_flash.json
mceval|flash|armv8.4a-apple|x86|configs/config_gemini_flash.json
EOF
)"

printf "%-10s %-8s %-15s %-15s %-8s %s\n" "benchmark" "model" "source" "target" "status" "detail"
printf "%-10s %-8s %-15s %-15s %-8s %s\n" "---------" "-----" "------" "------" "------" "------"

while IFS='|' read -r benchmark model source target config_path; do
  [[ -z "$benchmark" ]] && continue
  matches "$BENCHMARK_FILTER" "$benchmark" || continue
  matches "$MODEL_FILTER" "$model" || continue
  matches "$SOURCE_FILTER" "$source" || continue
  matches "$TARGET_FILTER" "$target" || continue

  skip_reason="$(skip_reason_for_target "$target")"
  status="run"
  if [[ -n "$skip_reason" ]]; then
    status="skip"
  fi
  printf "%-10s %-8s %-15s %-15s %-8s %s\n" "$benchmark" "$model" "$source" "$target" "$status" "${skip_reason:-$config_path}"

  [[ $LIST_ONLY -eq 1 ]] && continue
  [[ -n "$skip_reason" ]] && continue

  cmd=(python3 translate_gemini.py --config "$config_path" --benchmark "$benchmark" --source-isa "$source" --target-isa "$target" --opt-level O2)
  [[ -n "$YES_FLAG" ]] && cmd+=("$YES_FLAG")
  [[ $RESUME -eq 1 ]] && cmd+=(--resume)

  if [[ $DRY_RUN -eq 1 ]]; then
    printf 'DRY RUN:'
    printf ' %q' "${cmd[@]}"
    printf '\n'
    continue
  fi

  "${cmd[@]}"
done <<< "$MANIFEST"
