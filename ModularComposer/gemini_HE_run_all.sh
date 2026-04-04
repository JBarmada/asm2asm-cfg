FILES=(
Qwen-Translations/riscv/0.5b/adpretko_armv8_to_riscv_qwen25coder_0p5b_full_humaneval_arm_linux_riscv_O2_20260331-142240.json
Qwen-Translations/riscv/1.5b/adpretko_armv8_to_riscv_qwen25coder_1p5b_full_humaneval_arm_linux_riscv_O2_20260331-145727.json
Qwen-Translations/riscv/1.5b/adpretko_x86_to_riscv_qwen25coder_1p5b_full_humaneval_x86_riscv_O2_20260331-150501.json
Qwen-Translations/riscv/3b/adpretko_x86_to_riscv_qwen25coder_3p0b_full_humaneval_x86_riscv_O2_20260331-160132.json
Qwen-Translations/riscv/3b/adpretko_armv8_to_riscv_qwen25coder_3p0b_full_humaneval_arm_linux_riscv_O2_20260331-154438.json
Qwen-Translations/x86/0.5b/adpretko_armv8_to_x86_qwen25coder_0p5b_full_humaneval_arm_linux_x86_O2_20260331-143011.json
Qwen-Translations/x86/0.5b/adpretko_riscv_to_x86_qwen25coder_0p5b_full_humaneval_riscv_x86_O2_20260331-143617.json
Qwen-Translations/x86/1.5b/adpretko_armv8_to_x86_qwen25coder_1p5b_full_humaneval_arm_linux_x86_O2_20260331-150828.json
Qwen-Translations/x86/1.5b/adpretko_riscv_to_x86_qwen25coder_1p5b_full_humaneval_riscv_x86_O2_20260331-151621.json
Qwen-Translations/x86/3b/adpretko_armv8_to_x86_qwen25coder_3p0b_full_humaneval_arm_linux_x86_O2_20260331-160636.json
Qwen-Translations/x86/3b/adpretko_riscv_to_x86_qwen25coder_3p0b_full_humaneval_riscv_x86_O2_20260331-161839.json
Qwen-Translations/armv8/0.5b/adpretko_riscv_to_armv8_qwen25coder_0p5b_full_humaneval_riscv_arm_linux_O2_20260331-135816.json
Qwen-Translations/armv8/0.5b/adpretko_x86_to_armv8_qwen25coder_0p5b_full_humaneval_x86_arm_linux_O2_20260331-141942.json
Qwen-Translations/armv8/1.5b/adpretko_riscv_to_armv8_qwen25coder_1p5b_full_humaneval_riscv_arm_linux_O2_20260331-144754.json
Qwen-Translations/armv8/1.5b/adpretko_x86_to_armv8_qwen25coder_1p5b_full_humaneval_x86_arm_linux_O2_20260331-141942.json
Qwen-Translations/armv8/3b/adpretko_riscv_to_armv8_qwen25coder_3p0b_full_humaneval_riscv_arm_linux_O2_20260331-153230.json
Qwen-Translations/armv8/3b/adpretko_x86_to_armv8_qwen25coder_3p0b_full_humaneval_x86_arm_linux_O2_20260331-153810.json
)

CONFIGS=(
base
error_only
cfg_only
dfg_only
error_cfg
error_dfg
cfg_dfg
error_cfg_dfg
)

get_config() {
  local file="$1"

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

  local report_dir="results/composer/${run_label}/${prompt_config}/txts"
  
  # Safely check if any .txt files exist in this directory
  if ls "${report_dir}"/*.txt >/dev/null 2>&1; then
    return 0
  fi

  # Check legacy label just in case
  local legacy_run_label="${run_label/-to-/-}"
  if [[ "$legacy_run_label" != "$run_label" ]]; then
    report_dir="results/composer/${legacy_run_label}/${prompt_config}/txts"
    if ls "${report_dir}"/*.txt >/dev/null 2>&1; then
      return 0
    fi
  fi

  return 1
}

for file in "${FILES[@]}"; do
  config=$(get_config "$file")
  run_label=$(get_run_label "$file")

  for cfg in "${CONFIGS[@]}"; do
    # Only pass run_label and cfg, drop the config path!
    if has_txt_report "$run_label" "$cfg"; then
      echo "Skipping existing report: ${run_label}/${cfg}"
      continue
    fi

    python3 humaneval_compose_gemini.py "../$file" \
      --config "$config" \
      --run-label "$run_label" \
      --prompt-config "$cfg"
  done
done

for file in "${FILES[@]}"; do
  config=$(get_config "$file")
  run_label=$(get_run_label "$file")

  for cfg in "${CONFIGS[@]}"; do
    if has_txt_report "$run_label" "$config" "$cfg"; then
      echo "Skipping existing report: ${run_label}/${config}/${cfg}"
      continue
    fi

    python3 humaneval_compose_gemini.py "../$file" \
      --config "$config" \
      --run-label "$run_label" \
      --prompt-config "$cfg"
  done
done