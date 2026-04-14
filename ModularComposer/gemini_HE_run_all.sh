FILES=(
  # Active runs only. armv8 here corresponds to the arm_linux translations.

  # qwen0.5b
  Qwen-Translations/x86/0.5b/adpretko_armv8_to_x86_qwen25coder_0p5b_full_humaneval_arm_linux_x86_O2_20260331-143011.json
  Qwen-Translations/x86/0.5b/adpretko_riscv_to_x86_qwen25coder_0p5b_full_humaneval_riscv_x86_O2_20260331-143617.json
  Qwen-Translations/armv8/0.5b/adpretko_riscv_to_armv8_qwen25coder_0p5b_full_humaneval_riscv_arm_linux_O2_20260331-135816.json

  # qwen3b
  Qwen-Translations/x86/3b/adpretko_armv8_to_x86_qwen25coder_3p0b_full_humaneval_arm_linux_x86_O2_20260331-160636.json
  Qwen-Translations/riscv/3b/adpretko_armv8_to_riscv_qwen25coder_3p0b_full_humaneval_arm_linux_riscv_O2_20260331-154438.json
  Qwen-Translations/x86/3b/adpretko_riscv_to_x86_qwen25coder_3p0b_full_humaneval_riscv_x86_O2_20260331-161839.json
  Qwen-Translations/armv8/3b/adpretko_riscv_to_armv8_qwen25coder_3p0b_full_humaneval_riscv_arm_linux_O2_20260331-153230.json

  # Unused for this run (kept for quick re-enable)
  # Qwen-Translations/riscv/0.5b/adpretko_armv8_to_riscv_qwen25coder_0p5b_full_humaneval_arm_linux_riscv_O2_20260331-142240.json
  # Qwen-Translations/riscv/1.5b/adpretko_armv8_to_riscv_qwen25coder_1p5b_full_humaneval_arm_linux_riscv_O2_20260331-145727.json
  # Qwen-Translations/x86/1.5b/adpretko_armv8_to_x86_qwen25coder_1p5b_full_humaneval_arm_linux_x86_O2_20260331-150828.json
  # Qwen-Translations/x86/1.5b/adpretko_riscv_to_x86_qwen25coder_1p5b_full_humaneval_riscv_x86_O2_20260331-151621.json
  # Qwen-Translations/armv8/1.5b/adpretko_riscv_to_armv8_qwen25coder_1p5b_full_humaneval_riscv_arm_linux_O2_20260331-144754.json
  # Qwen-Translations/armv8/3b/adpretko_x86_to_armv8_qwen25coder_3p0b_full_humaneval_x86_arm_linux_O2_20260331-153810.json
  # Qwen-Translations/riscv/3b/adpretko_x86_to_riscv_qwen25coder_3p0b_full_humaneval_x86_riscv_O2_20260331-160132.json
  # Qwen-Translations/armv8/0.5b/adpretko_x86_to_armv8_qwen25coder_0p5b_full_humaneval_x86_arm_linux_O2_20260331-141942.json
  # Qwen-Translations/riscv/1.5b/adpretko_x86_to_riscv_qwen25coder_1p5b_full_humaneval_x86_riscv_O2_20260331-150501.json
  # Qwen-Translations/armv8/1.5b/adpretko_x86_to_armv8_qwen25coder_1p5b_full_humaneval_x86_arm_linux_O2_20260331-141942.json
)

CONFIGS=(
  # Requested prompt configs only.
  base
  error_cfg_dfg

  # Unused for this run (kept for quick re-enable)
  # error_only
  # cfg_only
  # dfg_only
  # error_cfg
  # error_dfg
  # cfg_dfg
)

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Prefer the dataset mount when available so outputs land in /datasets/ModularComposer/results/composer.
if [[ -d "/datasets/ModularComposer" ]]; then
  WORK_ROOT="/datasets/ModularComposer"
else
  WORK_ROOT="$SCRIPT_DIR"
fi

cd "$WORK_ROOT" || {
  echo "Failed to change directory to $WORK_ROOT"
  exit 1
}

# Allow override, but default to the new directory structure.
RESULTS_ROOT="${RESULTS_ROOT:-$WORK_ROOT/results/composer}"

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

get_config() {
  local file="$1"
  local size
  local pair

  # model size
  if [[ "$file" == *"0p5b"* ]]; then size="0.5b"
  elif [[ "$file" == *"1p5b"* ]]; then size="1.5b"
  else size="3b"
  fi

  # source → target
  if [[ "$file" == *"x86_to_riscv"* ]]; then pair="x86-to-riscv"
  elif [[ "$file" == *"x86_to_armv8"* ]]; then pair="x86-to-arm"
  elif [[ "$file" == *"riscv_to_x86"* ]]; then pair="riscv-to-x86"
  elif [[ "$file" == *"riscv_to_armv8"* ]]; then pair="riscv-to-arm"
  elif [[ "$file" == *"armv8_to_x86"* ]]; then pair="arm-to-x86"
  elif [[ "$file" == *"armv8_to_riscv"* ]]; then pair="arm-to-riscv"
  else
    echo "Unknown mapping for $file"
    exit 1
  fi

  echo "configs_compose/config_qwen${size}-${pair}.json"
}

get_run_label() {
  local file="$1"
  local size
  local pair
  local run_size

  if [[ "$file" == *"0p5b"* ]]; then size="q05b"
  elif [[ "$file" == *"1p5b"* ]]; then size="q15b"
  else size="q3b"
  fi

  # source → target
  if [[ "$file" == *"x86_to_riscv"* ]]; then pair="x86-to-riscv"
  elif [[ "$file" == *"x86_to_armv8"* ]]; then pair="x86-to-arm"
  elif [[ "$file" == *"riscv_to_x86"* ]]; then pair="riscv-to-x86"
  elif [[ "$file" == *"riscv_to_armv8"* ]]; then pair="riscv-to-arm"
  elif [[ "$file" == *"armv8_to_x86"* ]]; then pair="arm-to-x86"
  elif [[ "$file" == *"armv8_to_riscv"* ]]; then pair="arm-to-riscv"
  else
    echo "Unknown mapping for $file"
    exit 1
  fi

  if [[ "$size" == "q05b" ]]; then run_size="qwen0.5b"
  elif [[ "$size" == "q15b" ]]; then run_size="qwen1.5b"
  else run_size="qwen3b"
  fi

  echo "${run_size}-${pair}"
}

has_txt_report() {
  local run_label="$1"
  local prompt_config="$2"

  local root="$RESULTS_ROOT"
  local label_candidates=("$run_label")
  local cfg_candidates=("$prompt_config")

  # Legacy run label: qwenX-x86-riscv (missing "-to-")
  local legacy_run_label="${run_label/-to-/-}"
  if [[ "$legacy_run_label" != "$run_label" ]]; then
    label_candidates+=("$legacy_run_label")
  fi

  # Legacy config folder: "config" used where "base" is now expected
  if [[ "$prompt_config" == "base" ]]; then
    cfg_candidates+=("config")
  elif [[ "$prompt_config" == "config" ]]; then
    cfg_candidates+=("base")
  fi

  local candidate_label
  local candidate_cfg
  for candidate_label in "${label_candidates[@]}"; do
    for candidate_cfg in "${cfg_candidates[@]}"; do
      local report_dir="${root}/${candidate_label}/${candidate_cfg}"

      # Primary location in current structure
      if ls "${report_dir}/txts"/*.txt >/dev/null 2>&1; then
        return 0
      fi

      # Fallback: allow direct txt drops in the config directory
      if ls "${report_dir}"/*.txt >/dev/null 2>&1; then
        return 0
      fi
    done
  done

  return 1
}

for file in "${FILES[@]}"; do
  config=$(get_config "$file")
  run_label=$(get_run_label "$file")
  composer_run_label="geminiComposer/${run_label}"

  # Prefer repo-local path under /datasets/ModularComposer first; fall back to parent path layout.
  if [[ -f "$file" ]]; then
    input_json="$file"
  elif [[ -f "../$file" ]]; then
    input_json="../$file"
  else
    echo "Input JSON not found: $file"
    exit 1
  fi

  for cfg in "${CONFIGS[@]}"; do
    ensure_output_tree "$composer_run_label" "$cfg"

    # Only pass run_label and cfg, drop the config path!
    if has_txt_report "$composer_run_label" "$cfg"; then
      echo "Skipping existing report: ${composer_run_label}/${cfg}"
      continue
    fi

    python3 compose_gemini.py "$input_json" \
      --config "$config" \
      --max-concurrency 5 \
      --run-label "$composer_run_label" \
      --prompt-config "$cfg"

  done
done
