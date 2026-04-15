from __future__ import annotations

import json
import sys
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT))


class CampaignRunnerTests(unittest.TestCase):
    def test_qwen_run_configs_default_to_100_split(self) -> None:
        for config_name in ("qwen0.5b.json", "qwen3b.json", "qwen1.5b.json"):
            payload = json.loads((ROOT / "configs_runs" / config_name).read_text(encoding="utf-8"))
            self.assertEqual(payload["max_workers"], 100)
            self.assertEqual(payload["prompt_concurrency"], 100)
            self.assertEqual(payload["validation_concurrency"], 100)

    def test_generic_runner_documents_qwen_campaign_defaults(self) -> None:
        script = (ROOT / "composer_run_all_o2.sh").read_text(encoding="utf-8")

        self.assertIn('RESULTS_ROOT="${RESULTS_ROOT:-results/composer}"', script)
        self.assertIn('qwen0.5b -> qwen3b -> qwen1.5b', script)
        self.assertIn('all) printf \'%s\\n\' "qwen0.5b" "qwen3b" "qwen1.5b"', script)
        self.assertIn('prompt_list=(base error_cfg_dfg)', script)
        self.assertIn('campaign skip: humaneval qwen0.5b error_cfg_dfg', script)
        self.assertIn('cfg["prompt_concurrency"] = 100', script)
        self.assertIn('cfg["validation_concurrency"] = 100', script)
        self.assertIn('cfg["prompt_concurrency"] = 64', script)
        self.assertIn('cfg["validation_concurrency"] = 16', script)

    def test_generic_runner_has_requested_pair_matrix_and_explicit_apple_target_support(self) -> None:
        script = (ROOT / "composer_run_all_o2.sh").read_text(encoding="utf-8")

        for pair in (
            '"x86:armv8-linux"',
            '"x86:riscv"',
            '"armv8-linux:x86"',
            '"armv8-linux:riscv"',
            '"armv8.4a-apple:x86"',
            '"armv8.4a-apple:riscv"',
            '"riscv:armv8-linux"',
            '"riscv:x86"',
        ):
            self.assertIn(pair, script)

        self.assertIn('if [[ "$TARGET_FILTER" == "armv8.4a-apple" ]]; then', script)
        self.assertIn('"x86:armv8.4a-apple"', script)
        self.assertIn('"riscv:armv8.4a-apple"', script)

    def test_generic_runner_has_bringup_and_mceval_graph_defaults_and_humaneval_migration_hooks(self) -> None:
        script = (ROOT / "composer_run_all_o2.sh").read_text(encoding="utf-8")

        self.assertIn('"mceval": ("ryaasabsar/mceval_asm_cfg", "ryaasabsar/mceval_asm_dfg")', script)
        self.assertIn('"bringup": ("ryaasabsar/bringup_asm_cfg", "ryaasabsar/bringup_asm_dfg")', script)
        self.assertIn("--migrate-humaneval-legacy", script)
        self.assertIn("parse_legacy_humaneval_dir_name()", script)
        self.assertIn("index_legacy_humaneval_dirs()", script)
        self.assertIn("migrate_humaneval_legacy_dir_if_needed()", script)
        self.assertIn("migrate_all_humaneval_legacy_dirs()", script)
        self.assertIn('if [[ $MIGRATE_HE_LEGACY -eq 1 || ( $LIST_ONLY -eq 0 && $DRY_RUN -eq 0 ) ]]; then', script)
        self.assertIn('Migrated legacy HumanEval results:', script)

    def test_readme_documents_generic_runner_defaults(self) -> None:
        readme = (ROOT / "README.md").read_text(encoding="utf-8")

        self.assertIn("The default unfiltered sweep is qwen-only", readme)
        self.assertIn("HumanEval `qwen0.5b` `error_cfg_dfg` is intentionally skipped", readme)
        self.assertIn("The shared qwen config defaults are:", readme)
        self.assertIn("HumanEval: `100/100`", readme)
        self.assertIn("McEval: `100/100`", readme)
        self.assertIn("BringUpBench: `64/16`", readme)
        self.assertIn("BringUp CFG: `ryaasabsar/bringup_asm_cfg`", readme)
        self.assertIn("BringUp DFG: `ryaasabsar/bringup_asm_dfg`", readme)
        self.assertIn("Legacy HumanEval qwen run directories are migrated", readme)
        self.assertIn("--migrate-humaneval-legacy", readme)


if __name__ == "__main__":
    unittest.main()
