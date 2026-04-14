from __future__ import annotations

import json
import runpy
import sys
import tempfile
import unittest
from pathlib import Path
from types import SimpleNamespace
from unittest import mock

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))

import compose_gemini
from composers.benchmarks.bringup import BringUpBenchmark
from composers.benchmarks.common import CommandResult
from composers.benchmarks.standard_c import StandardCBenchmark
from composers.runner import execute_pipeline
from composers.utils import ComposerRuntimePaths


class DummyProvider:
    async def generate_repair(self, prompt: str, problem_name: str) -> str:
        return ".globl func0\nfunc0:\n ret\n"


def make_paths(
    root: Path,
    *,
    benchmark_id: str,
    benchmark_root: Path,
    asm_input_dir: Path,
    error_json_path: Path,
    input_mode: str,
    bootstrap: bool = False,
) -> ComposerRuntimePaths:
    run_output_dir = root / "results" / "composer" / "run0" / "base"
    return ComposerRuntimePaths(
        benchmark_id=benchmark_id,
        benchmark_root=benchmark_root,
        input_mode=input_mode,
        input_path=error_json_path if error_json_path.suffix == ".json" else asm_input_dir,
        input_experiment_dir=asm_input_dir.parent,
        asm_input_dir=asm_input_dir,
        error_json_path=error_json_path,
        error_json_will_be_bootstrapped=bootstrap,
        run_output_dir=run_output_dir,
        full_validation_input_dir=run_output_dir / "full_validation_input_asm",
        prompts_dir=run_output_dir / "prompts",
        raw_output_dir=run_output_dir / "raw_model_output",
        original_error_asm_dir=run_output_dir / "original_error_x86_asm",
        fixed_asm_dir=run_output_dir / "fixed_x86_asm",
        logs_dir=run_output_dir / "logs",
        reports_dir=run_output_dir / "txts",
        cleaned_output_dir=run_output_dir / "cleaned_model_output",
        clean_diagnostics_dir=run_output_dir / "clean_diagnostics",
        compile_probe_dir=run_output_dir / "compile_probe",
        validation_json_dir=run_output_dir / "validation_json",
        target_isa="x86",
        target_isa_display="x86-64",
        source_isa="armv8-linux",
        source_isa_display="ARMv8 Linux (AArch64)",
        cfg_language="x86_64",
        dfg_language="x86_64",
        graph_split="O2",
    )


class SmokeAndRunnerTests(unittest.TestCase):
    def test_humaneval_eval_json_input_smoke(self) -> None:
        with tempfile.TemporaryDirectory() as tmp_dir:
            root = Path(tmp_dir)
            benchmark_root = root / "humaneval-c"
            task_dir = benchmark_root / "problem1"
            task_dir.mkdir(parents=True)
            (task_dir / "code.c").write_text("int func0(void) { return 0; }\n", encoding="utf-8")
            (task_dir / "test.c").write_text("int func0(void);\nint main(void) { return func0(); }\n", encoding="utf-8")

            eval_json = root / "results.json"
            eval_json.write_text(
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

            paths = make_paths(
                root,
                benchmark_id="humaneval",
                benchmark_root=benchmark_root,
                asm_input_dir=root / "results" / "composer" / "run0" / "base" / "json_input_asm",
                error_json_path=eval_json,
                input_mode="evaluated_json",
            )
            benchmark = StandardCBenchmark(
                benchmark_id="humaneval",
                benchmark_display_name="HumanEval",
                paths=paths,
                cfg={"clang": "clang-17", "compile_flags": [], "link_flags": [], "use_qemu": False, "timeout_seconds": 5},
            )

            specs = benchmark.get_problem_specs("base")
            self.assertTrue((paths.asm_input_dir / "problem1.s").exists())

            command_results = [
                CommandResult(["clang"], 0, "", ""),
                CommandResult(["clang"], 0, "", ""),
                CommandResult(["clang"], 0, "", ""),
                CommandResult(["test_bin"], 0, "", ""),
            ]
            with mock.patch("composers.benchmarks.standard_c.execute_command", side_effect=command_results):
                feedback = benchmark.validate(specs[0], ".globl func0\nfunc0:\n ret\n", 1)
            self.assertTrue(feedback.passed)

    def test_mceval_asm_dir_existing_error_json_smoke(self) -> None:
        with tempfile.TemporaryDirectory() as tmp_dir:
            root = Path(tmp_dir)
            benchmark_root = root / "mceval-c"
            task_dir = benchmark_root / "C_1"
            task_dir.mkdir(parents=True)
            (task_dir / "code.c").write_text("char *hello_mmcodeeval(){ return \"hi\"; }\n", encoding="utf-8")
            (task_dir / "test.c").write_text(
                "char *hello_mmcodeeval();\nint main(void) { return hello_mmcodeeval()[0] == 'h' ? 0 : 1; }\n",
                encoding="utf-8",
            )

            asm_dir = root / "experiment" / "translated_asm"
            asm_dir.mkdir(parents=True)
            (asm_dir / "C_1.s").write_text(".globl hello_mmcodeeval\nhello_mmcodeeval:\n ret\n", encoding="utf-8")
            error_json = root / "experiment" / "jsons" / "errors.json"
            error_json.parent.mkdir(parents=True)
            error_json.write_text(
                json.dumps({"errored_problems": [{"name": "C_1", "status": "runtime_error", "summary": "failed"}]}),
                encoding="utf-8",
            )

            paths = make_paths(
                root,
                benchmark_id="mceval",
                benchmark_root=benchmark_root,
                asm_input_dir=asm_dir,
                error_json_path=error_json,
                input_mode="asm_dir",
            )
            benchmark = StandardCBenchmark(
                benchmark_id="mceval",
                benchmark_display_name="McEval",
                paths=paths,
                cfg={"clang": "clang-17", "compile_flags": [], "link_flags": [], "use_qemu": False, "timeout_seconds": 5},
            )

            specs = benchmark.get_problem_specs("base")
            self.assertEqual(specs[0].expected_symbols, ("hello_mmcodeeval",))

    def test_bringup_bootstrap_smoke(self) -> None:
        with tempfile.TemporaryDirectory() as tmp_dir:
            root = Path(tmp_dir)
            benchmark_root = root / "bringup-bench"
            task_dir = benchmark_root / "ackermann"
            task_dir.mkdir(parents=True)
            (benchmark_root / "common").mkdir()
            (benchmark_root / "target").mkdir()
            (benchmark_root / "Makefile").write_text("all:\n\t@echo ok\n", encoding="utf-8")
            (task_dir / "Makefile").write_text("include ../Makefile\n", encoding="utf-8")
            (task_dir / "ackermann.c").write_text("unsigned ack(unsigned x, unsigned y) { return x + y; }\n", encoding="utf-8")

            asm_dir = root / "experiment" / "translated_asm"
            asm_dir.mkdir(parents=True)
            (asm_dir / "ackermann.s").write_text(".globl ack\nack:\n ret\n", encoding="utf-8")

            error_json = root / "results" / "composer" / "run0" / "base" / "validation_json" / "bootstrap_error_problems.json"
            paths = make_paths(
                root,
                benchmark_id="bringup",
                benchmark_root=benchmark_root,
                asm_input_dir=asm_dir,
                error_json_path=error_json,
                input_mode="asm_dir",
                bootstrap=True,
            )
            benchmark = BringUpBenchmark(
                paths=paths,
                cfg={"clang": "clang-17", "compile_flags": ["-O2"], "link_flags": ["-lm"], "use_qemu": False, "timeout_seconds": 5},
            )

            command_results = [
                CommandResult(["make", "clean"], 0, "", ""),
                CommandResult(["make", "build"], 0, "", ""),
                CommandResult(["make", "test"], 1, "FAIL", ""),
            ]
            with mock.patch("composers.benchmarks.bringup.execute_command", side_effect=command_results):
                benchmark.bootstrap_error_json(asm_dir, error_json)

            self.assertTrue(error_json.exists())
            specs = benchmark.get_problem_specs("base")
            self.assertEqual(len(specs), 1)
            self.assertEqual(specs[0].name, "ackermann")

    def test_graph_prompt_fails_fast_for_mceval_without_dataset_id(self) -> None:
        with tempfile.TemporaryDirectory() as tmp_dir:
            root = Path(tmp_dir)
            benchmark_root = root / "mceval-c"
            task_dir = benchmark_root / "C_1"
            task_dir.mkdir(parents=True)
            (task_dir / "code.c").write_text("char *hello_mmcodeeval(){ return \"hi\"; }\n", encoding="utf-8")
            (task_dir / "test.c").write_text("char *hello_mmcodeeval();\nint main(void) { return 0; }\n", encoding="utf-8")
            input_json = root / "results.json"
            input_json.write_text(
                json.dumps([{"file": "C_1", "pred": "ret", "success": 0, "error_stage": "execution"}]),
                encoding="utf-8",
            )
            config_path = root / "config.json"
            config_path.write_text(
                json.dumps(
                    {
                        "benchmark": "mceval",
                        "benchmark_root": str(benchmark_root),
                        "target_isa": "x86",
                        "composer_prompt_config": "cfg_only",
                    }
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
                prompt_config="cfg_only",
                run_label="run0",
                model=None,
                max_concurrency=2,
                max_retries=1,
                retry_base_seconds=None,
                retry_jitter_seconds=None,
                startup_jitter_seconds=0.0,
                resume_checkpoint=None,
            )
            cfg = json.loads(config_path.read_text(encoding="utf-8"))

            with self.assertRaises(RuntimeError):
                execute_pipeline(args, cfg, DummyProvider(), "dummy-model")

    def test_bringup_concurrency_is_clamped_in_runner(self) -> None:
        with tempfile.TemporaryDirectory() as tmp_dir:
            root = Path(tmp_dir)
            benchmark_root = root / "bringup-bench"
            task_dir = benchmark_root / "ackermann"
            task_dir.mkdir(parents=True)
            (benchmark_root / "common").mkdir()
            (benchmark_root / "target").mkdir()
            (benchmark_root / "Makefile").write_text("all:\n\t@echo ok\n", encoding="utf-8")
            (task_dir / "Makefile").write_text("include ../Makefile\n", encoding="utf-8")
            (task_dir / "ackermann.c").write_text("int main(void) { return 0; }\n", encoding="utf-8")

            experiment_dir = root / "experiment"
            asm_dir = experiment_dir / "translated_asm"
            asm_dir.mkdir(parents=True)
            (asm_dir / "ackermann.s").write_text(".globl main\nmain:\n ret\n", encoding="utf-8")
            error_json = experiment_dir / "jsons" / "errors.json"
            error_json.parent.mkdir(parents=True)
            error_json.write_text(
                json.dumps({"errored_problems": [{"name": "ackermann", "status": "build_error", "summary": "failed"}]}),
                encoding="utf-8",
            )
            config_path = root / "config.json"
            config_path.write_text(
                json.dumps(
                    {
                        "benchmark": "bringup",
                        "benchmark_root": str(benchmark_root),
                        "target_isa": "x86",
                        "composer_prompt_config": "base",
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
                prompt_config="base",
                run_label="run0",
                model=None,
                max_concurrency=8,
                max_retries=1,
                retry_base_seconds=None,
                retry_jitter_seconds=None,
                startup_jitter_seconds=0.0,
                resume_checkpoint=None,
            )
            cfg = json.loads(config_path.read_text(encoding="utf-8"))
            captured: dict[str, int] = {}

            class FakeBenchmark:
                def max_validation_concurrency(self) -> int:
                    return 1

                def get_problem_specs(self, prompt_config: str):
                    return []

                def validate_all_outputs(self):
                    return root / "final.json", 0, 0

                def bootstrap_error_json(self, asm_dir: Path, output_path: Path):
                    output_path.parent.mkdir(parents=True, exist_ok=True)
                    output_path.write_text(json.dumps({"errored_problems": []}), encoding="utf-8")
                    return output_path

            class FakeEngine:
                def __init__(self, *, max_concurrency: int, **kwargs):
                    captured["max_concurrency"] = max_concurrency

                async def run(self, problems, resume_checkpoint=None):
                    return [], None

                def write_reports(self, **kwargs):
                    report_path = root / "report.txt"
                    report_path.write_text("ok\n", encoding="utf-8")
                    return report_path

            with mock.patch("composers.runner.prompt_auto_confirm", return_value=True), mock.patch(
                "composers.runner.create_benchmark_adapter",
                return_value=FakeBenchmark(),
            ), mock.patch("composers.runner.ComposerEngine", FakeEngine):
                result = execute_pipeline(args, cfg, DummyProvider(), "dummy-model")

            self.assertEqual(result, 0)
            self.assertEqual(captured["max_concurrency"], 1)

    def test_humaneval_wrapper_dispatches_to_unified_entrypoint(self) -> None:
        wrapper_path = Path(__file__).resolve().parents[1] / "humaneval_compose_gemini.py"
        with mock.patch.object(compose_gemini, "main", return_value=7):
            with self.assertRaises(SystemExit) as ctx:
                runpy.run_path(str(wrapper_path), run_name="__main__")
        self.assertEqual(ctx.exception.code, 7)


if __name__ == "__main__":
    unittest.main()
