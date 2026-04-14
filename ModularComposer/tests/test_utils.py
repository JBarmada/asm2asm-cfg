from __future__ import annotations

import json
import sys
import tempfile
import unittest
from pathlib import Path
from types import SimpleNamespace

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))

from unittest import mock

from composers.utils import normalize_isa, resolve_runtime_paths


class RuntimePathTests(unittest.TestCase):
    def test_normalize_isa_aliases(self) -> None:
        self.assertEqual(normalize_isa("armv8"), "armv8-linux")
        self.assertEqual(normalize_isa("arm_linux"), "armv8-linux")
        self.assertEqual(normalize_isa("armv8.4a"), "armv8.4a-apple")
        self.assertEqual(normalize_isa("arm_apple"), "armv8.4a-apple")
        self.assertEqual(normalize_isa("riscv64"), "riscv")
        self.assertEqual(normalize_isa("x86_64"), "x86")

    def test_resolve_runtime_paths_for_eval_json(self) -> None:
        with tempfile.TemporaryDirectory() as tmp_dir:
            root = Path(tmp_dir)
            config_path = root / "config.json"
            input_json = root / "results.json"
            benchmark_root = root / "humaneval-c"
            (benchmark_root / "problem1").mkdir(parents=True)
            config_path.write_text(
                json.dumps(
                    {
                        "benchmark": "humaneval",
                        "benchmark_root": str(benchmark_root),
                        "target_isa": "armv8",
                    }
                ),
                encoding="utf-8",
            )
            input_json.write_text(
                json.dumps(
                    [
                        {
                            "file": "problem1",
                            "pred": ".globl func0\nfunc0:\n ret\n",
                            "success": 0,
                            "error_stage": "execution",
                        }
                    ]
                ),
                encoding="utf-8",
            )

            args = SimpleNamespace(
                input_path=input_json,
                config=config_path,
                benchmark=None,
                benchmark_root=None,
                target_isa=None,
                input_mode="auto",
                bootstrap_errors=None,
                error_json=None,
                run_label="run0",
                prompt_config="base",
            )
            cfg = json.loads(config_path.read_text(encoding="utf-8"))
            paths = resolve_runtime_paths(args, cfg)

            self.assertEqual(paths.input_mode, "evaluated_json")
            self.assertEqual(paths.target_isa, "armv8-linux")
            self.assertTrue(str(paths.asm_input_dir).endswith("json_input_asm"))
            self.assertEqual(paths.error_json_path, input_json)
            self.assertFalse(paths.error_json_will_be_bootstrapped)

    def test_resolve_runtime_paths_for_asm_dir_bootstrap(self) -> None:
        with tempfile.TemporaryDirectory() as tmp_dir:
            root = Path(tmp_dir)
            experiment_dir = root / "experiment"
            asm_dir = experiment_dir / "translated_asm"
            asm_dir.mkdir(parents=True)
            (asm_dir / "ackermann.s").write_text(".globl ack\nack:\n ret\n", encoding="utf-8")

            benchmark_root = root / "bringup-bench"
            (benchmark_root / "ackermann").mkdir(parents=True)
            config_path = root / "config.json"
            config_path.write_text(
                json.dumps(
                    {
                        "benchmark": "bringup",
                        "benchmark_root": str(benchmark_root),
                        "target_isa": "x86",
                        "bootstrap_errors": True,
                    }
                ),
                encoding="utf-8",
            )

            args = SimpleNamespace(
                input_path=experiment_dir,
                config=config_path,
                benchmark=None,
                benchmark_root=None,
                target_isa=None,
                input_mode="auto",
                bootstrap_errors=None,
                error_json=None,
                run_label="bringup-run",
                prompt_config="base",
            )
            cfg = json.loads(config_path.read_text(encoding="utf-8"))
            paths = resolve_runtime_paths(args, cfg)

            self.assertEqual(paths.input_mode, "asm_dir")
            self.assertEqual(paths.asm_input_dir, asm_dir.resolve())
            self.assertTrue(paths.error_json_will_be_bootstrapped)
            self.assertEqual(paths.error_json_path.name, "bootstrap_error_problems.json")

    def test_resolve_runtime_paths_prefers_sibling_repo_benchmark_root_when_present(self) -> None:
        with tempfile.TemporaryDirectory() as tmp_dir:
            datasets_root = Path(tmp_dir) / "datasets"
            modular_root = datasets_root / "ModularComposer"
            config_dir = modular_root / "configs_compose"
            input_dir = modular_root / "Qwen-Translations"
            benchmark_root = datasets_root / "cpu-transpiler-inference" / "benchmarks" / "humaneval-c"

            config_dir.mkdir(parents=True)
            input_dir.mkdir(parents=True)
            (benchmark_root / "problem1").mkdir(parents=True)

            config_path = config_dir / "config.json"
            config_path.write_text(
                json.dumps(
                    {
                        "benchmark": "humaneval",
                        "benchmark_root": "../cpu-transpiler-inference/benchmarks/humaneval-c",
                        "target_isa": "x86",
                    }
                ),
                encoding="utf-8",
            )

            input_json = input_dir / "results.json"
            input_json.write_text("[]", encoding="utf-8")

            args = SimpleNamespace(
                input_path=input_json,
                config=config_path,
                benchmark=None,
                benchmark_root=None,
                target_isa=None,
                input_mode="auto",
                bootstrap_errors=None,
                error_json=None,
                run_label="run0",
                prompt_config="base",
            )
            cfg = json.loads(config_path.read_text(encoding="utf-8"))

            with mock.patch("composers.utils.workspace_root", return_value=modular_root):
                paths = resolve_runtime_paths(args, cfg)

            self.assertEqual(paths.benchmark_root, benchmark_root.resolve())


if __name__ == "__main__":
    unittest.main()
