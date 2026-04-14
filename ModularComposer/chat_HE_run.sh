


python3 humaneval_compose_openai.py \
../oldTranslations/x86arm_translation_qemu_humaneval/results/gemini-translations_x86_arm-x86-macArm/geminiflash-x86-arm/exp01.1-x86-arm-parallel/arm_asm \
--config configs_compose/config_qwen3b-x86-to-arm.json \
--prompt-config base \
--max-concurrency 10 \
--model gpt-5-mini-2025-08-07 \
--run-label chatgptComposer/qwen/3b/x86-to-armv8

python3 humaneval_compose_openai.py \
../oldTranslations/x86arm_translation_qemu_humaneval/results/gemini-translations_x86_arm-x86-macArm/geminiflash-x86-arm/exp01.1-x86-arm-parallel/arm_asm \
--config configs_compose/config_qwen3b-x86-to-arm.json \
--prompt-config error_cfg_dfg \
--max-concurrency 10 \
--model gpt-5-mini-2025-08-07 \
--run-label chatgptComposer/gemini/x86-to-armv8 \
--error-json ../oldTranslations/x86arm_translation_qemu_humaneval/results/gemini-translations_x86_arm-x86-macArm/geminiflash-x86-arm/exp01.1-x86-arm-parallel/jsons/errors.json