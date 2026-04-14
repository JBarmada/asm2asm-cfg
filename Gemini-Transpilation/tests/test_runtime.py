from __future__ import annotations

import tempfile
import unittest
from pathlib import Path

import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))

from transpilation_runtime import (
    default_dataset_id_for,
    detect_unsupported_target,
    load_asm_records_from_dir,
    normalize_benchmark_id,
    normalize_isa,
    resolve_toolchain,
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
