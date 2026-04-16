from __future__ import annotations

import tempfile
import unittest
from pathlib import Path

import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))

from transpilation_runtime import (
    build_output_dirs,
    clean_model_output,
    default_dataset_id_for,
    detect_unsupported_target,
    load_asm_records_from_dir,
    load_checkpoint,
    normalize_benchmark_id,
    normalize_isa,
    resolve_concurrency_settings,
    resolve_toolchain,
    save_checkpoint,
)


class RuntimeTests(unittest.TestCase):
    def test_normalize_aliases(self) -> None:
        self.assertEqual(normalize_benchmark_id("bringup-bench"), "bringup")
        self.assertEqual(normalize_isa("arm_linux"), "armv8-linux")
        self.assertEqual(normalize_isa("armv8mac"), "armv8.4a-apple")
        self.assertEqual(normalize_isa("x86_64"), "x86")

    def test_default_dataset_ids(self) -> None:
        self.assertEqual(default_dataset_id_for("humaneval"), "murodbek/humaneval_asm")
        self.assertEqual(default_dataset_id_for("bringup"), "murodbek/bringup_asm")
        self.assertEqual(default_dataset_id_for("mceval"), "murodbek/mceval_asm")

    def test_resolve_toolchain_defaults(self) -> None:
        toolchain = resolve_toolchain({}, "riscv")
        self.assertIn("riscv64-linux-gnu", " ".join(toolchain["compile_flags"]))
        self.assertTrue(toolchain["use_qemu"])

    def test_build_output_dirs_includes_new_artifacts(self) -> None:
        with tempfile.TemporaryDirectory() as tmp_dir:
            dirs = build_output_dirs(Path(tmp_dir))
            self.assertIn("cleaned_model_output", dirs)
            self.assertIn("clean_diagnostics", dirs)
            self.assertIn("validation_json", dirs)
            self.assertTrue(dirs["validation_json"].exists())

    def test_clean_model_output_returns_diagnostics(self) -> None:
        cleaned, diagnostics = clean_model_output(
            "Here is the translation\n```asm\n.globl foo\nfoo:\n ret\n```\nThanks\n"
        )
        self.assertEqual(cleaned, ".globl foo\nfoo:\n ret")
        self.assertEqual(diagnostics["fence_lines_removed"], 2)
        self.assertEqual(diagnostics["leading_non_asm_lines_removed"], 1)
        self.assertEqual(diagnostics["trailing_non_asm_lines_removed"], 1)
        self.assertTrue(diagnostics["changed_from_raw"])

    def test_resolve_concurrency_settings_clamps_bringup(self) -> None:
        prompt, validation = resolve_concurrency_settings(
            cfg={"max_workers": 64},
            benchmark_id="bringup",
            prompt_override=64,
            validation_override=32,
        )
        self.assertEqual(prompt, 64)
        self.assertEqual(validation, 16)

    def test_resolve_concurrency_settings_uses_max_workers_as_alias(self) -> None:
        prompt, validation = resolve_concurrency_settings(
            cfg={"max_workers": 7},
            benchmark_id="humaneval",
        )
        self.assertEqual(prompt, 7)
        self.assertEqual(validation, 7)

    def test_checkpoint_round_trip(self) -> None:
        with tempfile.TemporaryDirectory() as tmp_dir:
            checkpoint_path = Path(tmp_dir) / "checkpoint.json"
            save_checkpoint(checkpoint_path, {"status": "running"})
            payload = load_checkpoint(checkpoint_path)
            self.assertEqual(payload["status"], "running")
            self.assertIn("updated_at", payload)

    def test_load_asm_records_from_dir(self) -> None:
        with tempfile.TemporaryDirectory() as tmp_dir:
            root = Path(tmp_dir)
            (root / "problem1.s").write_text("ret\n", encoding="utf-8")
            (root / "problem2_O2.s").write_text("ret\n", encoding="utf-8")
            records = load_asm_records_from_dir(root)
            self.assertEqual([record["task_name"] for record in records], ["problem1", "problem2"])

    def test_detect_unsupported_target(self) -> None:
        reason = detect_unsupported_target("armv8.4a-apple")
        if sys.platform == "darwin":
            self.assertIsNone(reason)
        else:
            self.assertIsNotNone(reason)


if __name__ == "__main__":
    unittest.main()
