from __future__ import annotations

import asyncio
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
from composers.core import ComposerEngine
from composers.providers.base import ProviderUsageSummary
from composers.runner import execute_pipeline
from composers.utils import ComposerRuntimePaths, ProblemResult


class DummyProvider:
    async def generate_repair(self, prompt: str, problem_name: str) -> str:
        return ".globl func0\nfunc0:\n ret\n"


class DummyUsageProvider(DummyProvider):
    def __init__(self) -> None:
        self.summary = ProviderUsageSummary(
            provider_name="gemini",
            successful_requests=3,
            prompt_token_count=300,
            response_token_count=75,
            total_token_count=375,
            usage_metadata_requests=3,
        )

    def get_usage_summary(self):
        return ProviderUsageSummary(**self.summary.__dict__)

    def load_usage_summary(self, payload: dict[str, object]) -> None:
        self.summary = ProviderUsageSummary(
            provider_name=str(payload.get("provider_name", "gemini")),
            successful_requests=int(payload.get("successful_requests", 0)),
            prompt_token_count=int(payload.get("prompt_token_count", 0)),
            response_token_count=int(payload.get("response_token_count", 0)),
            total_token_count=int(payload.get("total_token_count", 0)),
            usage_metadata_requests=int(payload.get("usage_metadata_requests", 0)),
        )


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

    def test_standard_c_feedback_includes_clean_summary_and_raw_stderr(self) -> None:
        with tempfile.TemporaryDirectory() as tmp_dir:
            root = Path(tmp_dir)
            benchmark_root = root / "humaneval-c"
            task_dir = benchmark_root / "problem1"
            task_dir.mkdir(parents=True)
            (task_dir / "code.c").write_text("int func0(void) { return 0; }\n", encoding="utf-8")
            (task_dir / "test.c").write_text("int func0(void);\nint main(void) { return func0(); }\n", encoding="utf-8")

            eval_json = root / "results.json"
            eval_json.write_text(
                json.dumps([{"file": "problem1", "pred": ".globl func0\nfunc0:\n ret\n", "success": 0, "error_stage": "execution"}]),
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
            spec = benchmark.get_problem_specs("base")[0]

            command_results = [
                CommandResult(
                    ["clang-17", "-c", "problem1.s", "-o", "problem1.o"],
                    1,
                    "",
                    "clang-17: warning: argument unused during compilation: '-lm'\nproblem1.s:12:7: error: invalid operand for instruction\n",
                )
            ]
            with mock.patch("composers.benchmarks.standard_c.execute_command", side_effect=command_results):
                feedback = benchmark.validate(spec, ".globl func0\nfunc0:\n ret\n", 1)

            self.assertFalse(feedback.passed)
            self.assertIn("invalid operand for instruction", feedback.clean_summary)
            self.assertIn("argument unused during compilation", feedback.stderr)

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
                source_isa=None,
                prompt_config="cfg_only",
                run_label="run0",
                model=None,
                max_concurrency=2,
                prompt_concurrency=None,
                validation_concurrency=None,
                max_retries=1,
                retry_base_seconds=None,
                retry_jitter_seconds=None,
                startup_jitter_seconds=0.0,
                resume_checkpoint=None,
                yes=False,
            )
            cfg = json.loads(config_path.read_text(encoding="utf-8"))

            with self.assertRaises(RuntimeError):
                execute_pipeline(args, cfg, DummyProvider(), "dummy-model")

    def test_bringup_concurrency_is_split_and_clamped_in_runner(self) -> None:
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
                source_isa=None,
                input_mode="auto",
                bootstrap_errors=None,
                error_json=None,
                prompt_config="base",
                run_label="run0",
                model=None,
                max_concurrency=8,
                prompt_concurrency=None,
                validation_concurrency=None,
                max_retries=1,
                retry_base_seconds=None,
                retry_jitter_seconds=None,
                startup_jitter_seconds=0.0,
                resume_checkpoint=None,
                yes=False,
            )
            cfg = json.loads(config_path.read_text(encoding="utf-8"))
            captured: dict[str, object] = {}

            class FakeBenchmark:
                def max_prompt_concurrency(self):
                    return None

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
                def __init__(self, *, prompt_concurrency: int, validation_concurrency: int, **kwargs):
                    captured["prompt_concurrency"] = prompt_concurrency
                    captured["validation_concurrency"] = validation_concurrency

                async def run(self, problems, resume_checkpoint=None):
                    return [], None

                def write_reports(self, **kwargs):
                    report_path = root / "report.txt"
                    report_path.write_text("ok\n", encoding="utf-8")
                    return report_path

            def _capture_preflight(lines, auto_yes=False, timeout_seconds=60):
                captured["preflight_lines"] = list(lines)
                return True

            with mock.patch("composers.runner.prompt_auto_confirm", side_effect=_capture_preflight), mock.patch(
                "composers.runner.create_benchmark_adapter",
                return_value=FakeBenchmark(),
            ), mock.patch("composers.runner.ComposerEngine", FakeEngine):
                result = execute_pipeline(args, cfg, DummyProvider(), "dummy-model")

            self.assertEqual(result, 0)
            self.assertEqual(captured["prompt_concurrency"], 8)
            self.assertEqual(captured["validation_concurrency"], 1)
            self.assertIn("Prompt concurrency: 8", captured["preflight_lines"])
            self.assertIn("Validation concurrency: 1", captured["preflight_lines"])

    def test_humaneval_preflight_reports_split_concurrency(self) -> None:
        with tempfile.TemporaryDirectory() as tmp_dir:
            root = Path(tmp_dir)
            benchmark_root = root / "humaneval-c"
            task_dir = benchmark_root / "problem1"
            task_dir.mkdir(parents=True)
            (task_dir / "code.c").write_text("int func0(void) { return 0; }\n", encoding="utf-8")
            (task_dir / "test.c").write_text("int func0(void);\nint main(void) { return func0(); }\n", encoding="utf-8")
            input_json = root / "results.json"
            input_json.write_text(
                json.dumps([{"file": "problem1", "pred": "ret", "success": 0, "error_stage": "execution"}]),
                encoding="utf-8",
            )
            config_path = root / "config.json"
            config_path.write_text(
                json.dumps(
                    {
                        "benchmark": "humaneval",
                        "benchmark_root": str(benchmark_root),
                        "target_isa": "x86",
                        "composer_prompt_config": "base",
                        "prompt_concurrency": 50,
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
                source_isa=None,
                input_mode="auto",
                bootstrap_errors=None,
                error_json=None,
                prompt_config="base",
                run_label="run0",
                model=None,
                max_concurrency=None,
                prompt_concurrency=None,
                validation_concurrency=None,
                max_retries=1,
                retry_base_seconds=None,
                retry_jitter_seconds=None,
                startup_jitter_seconds=0.0,
                resume_checkpoint=None,
                yes=False,
            )
            cfg = json.loads(config_path.read_text(encoding="utf-8"))
            captured: dict[str, object] = {}

            class FakeBenchmark:
                def max_prompt_concurrency(self):
                    return None

                def max_validation_concurrency(self):
                    return None

                def get_problem_specs(self, prompt_config: str):
                    return []

                def validate_all_outputs(self):
                    return root / "final.json", 0, 0

            class FakeEngine:
                def __init__(self, *, prompt_concurrency: int, validation_concurrency: int, **kwargs):
                    captured["prompt_concurrency"] = prompt_concurrency
                    captured["validation_concurrency"] = validation_concurrency

                async def run(self, problems, resume_checkpoint=None):
                    return [], None

                def write_reports(self, **kwargs):
                    report_path = root / "report.txt"
                    report_path.write_text("ok\n", encoding="utf-8")
                    return report_path

            def _capture_preflight(lines, auto_yes=False, timeout_seconds=60):
                captured["preflight_lines"] = list(lines)
                return True

            with mock.patch("composers.runner.prompt_auto_confirm", side_effect=_capture_preflight), mock.patch(
                "composers.runner.create_benchmark_adapter",
                return_value=FakeBenchmark(),
            ), mock.patch("composers.runner.ComposerEngine", FakeEngine):
                result = execute_pipeline(args, cfg, DummyProvider(), "dummy-model")

            self.assertEqual(result, 0)
            self.assertEqual(captured["prompt_concurrency"], 50)
            self.assertEqual(captured["validation_concurrency"], 50)
            self.assertIn("Prompt concurrency: 50", captured["preflight_lines"])
            self.assertIn("Validation concurrency: 50", captured["preflight_lines"])

    def test_engine_allows_parallel_prompts_with_serial_validation(self) -> None:
        with tempfile.TemporaryDirectory() as tmp_dir:
            root = Path(tmp_dir)
            benchmark_root = root / "bringup-bench"
            benchmark_root.mkdir(parents=True)
            asm_dir = root / "results" / "composer" / "run0" / "base" / "json_input_asm"
            asm_dir.mkdir(parents=True, exist_ok=True)
            error_json = root / "results.json"
            error_json.write_text("[]", encoding="utf-8")
            paths = make_paths(
                root,
                benchmark_id="bringup",
                benchmark_root=benchmark_root,
                asm_input_dir=asm_dir,
                error_json_path=error_json,
                input_mode="evaluated_json",
            )
            source_a = asm_dir / "ackermann.s"
            source_b = asm_dir / "weekday.s"
            source_a.write_text(".globl main\nmain:\n ret\n", encoding="utf-8")
            source_b.write_text(".globl main\nmain:\n ret\n", encoding="utf-8")

            problems = [
                SimpleNamespace(
                    name="ackermann",
                    source_asm_path=source_a,
                    source_asm_name=source_a.name,
                    expected_symbols=("main",),
                    prompt_constraints=(),
                    artifact_kind="translation_unit",
                    benchmark_id="bringup",
                    cfg_text="",
                    dfg_text="",
                    summary="",
                    stderr="",
                ),
                SimpleNamespace(
                    name="weekday",
                    source_asm_path=source_b,
                    source_asm_name=source_b.name,
                    expected_symbols=("main",),
                    prompt_constraints=(),
                    artifact_kind="translation_unit",
                    benchmark_id="bringup",
                    cfg_text="",
                    dfg_text="",
                    summary="",
                    stderr="",
                ),
            ]

            class TrackingProvider:
                def __init__(self) -> None:
                    self.inflight = 0
                    self.max_inflight = 0

                async def generate_repair(self, prompt: str, problem_name: str) -> str:
                    self.inflight += 1
                    self.max_inflight = max(self.max_inflight, self.inflight)
                    await asyncio.sleep(0.05)
                    self.inflight -= 1
                    return ".globl main\nmain:\n ret\n"

            class TrackingEvaluator:
                def __init__(self) -> None:
                    self.inflight = 0
                    self.max_inflight = 0
                    self.attempts: dict[str, list[int]] = {}

                def validate(self, problem, candidate_asm: str, attempt: int):
                    import time

                    self.attempts.setdefault(problem.name, []).append(attempt)
                    self.inflight += 1
                    self.max_inflight = max(self.max_inflight, self.inflight)
                    time.sleep(0.05)
                    self.inflight -= 1
                    passed = attempt >= 2
                    from composers.utils import ValidationFeedback

                    return ValidationFeedback(
                        passed=passed,
                        status="passed" if passed else "runtime_error",
                        summary="PASS" if passed else "retry",
                        stderr="",
                        errors_count=0 if passed else 1,
                        problems_processed=1,
                        validator_returncode=0 if passed else 1,
                    )

            provider = TrackingProvider()
            evaluator = TrackingEvaluator()
            engine = ComposerEngine(
                provider=provider,
                evaluator=evaluator,
                paths=paths,
                prompt_config="base",
                max_retries=2,
                prompt_concurrency=2,
                validation_concurrency=1,
                model_name="dummy-model",
                run_label="run0",
                checkpoint_path=paths.logs_dir / "checkpoint_base.json",
            )

            results, error = asyncio.run(engine.run(problems))
            self.assertIsNone(error)
            self.assertEqual(provider.max_inflight, 2)
            self.assertEqual(evaluator.max_inflight, 1)
            self.assertEqual(evaluator.attempts["ackermann"], [1, 2])
            self.assertEqual(evaluator.attempts["weekday"], [1, 2])
            self.assertTrue(all(result.succeeded for result in results))

    def test_humaneval_wrapper_dispatches_to_unified_entrypoint(self) -> None:
        wrapper_path = Path(__file__).resolve().parents[1] / "humaneval_compose_gemini.py"
        with mock.patch.object(compose_gemini, "main", return_value=7):
            with self.assertRaises(SystemExit) as ctx:
                runpy.run_path(str(wrapper_path), run_name="__main__")
        self.assertEqual(ctx.exception.code, 7)

    def test_checkpoint_persists_and_restores_provider_usage(self) -> None:
        with tempfile.TemporaryDirectory() as tmp_dir:
            root = Path(tmp_dir)
            benchmark_root = root / "humaneval-c"
            benchmark_root.mkdir(parents=True)
            asm_dir = root / "results" / "composer" / "run0" / "base" / "json_input_asm"
            error_json = root / "results.json"
            error_json.write_text("[]", encoding="utf-8")
            paths = make_paths(
                root,
                benchmark_id="humaneval",
                benchmark_root=benchmark_root,
                asm_input_dir=asm_dir,
                error_json_path=error_json,
                input_mode="evaluated_json",
            )

            provider = DummyUsageProvider()
            checkpoint_path = paths.logs_dir / "checkpoint_base.json"
            engine = ComposerEngine(
                provider=provider,
                evaluator=mock.Mock(),
                paths=paths,
                prompt_config="base",
                max_retries=1,
                prompt_concurrency=1,
                validation_concurrency=1,
                model_name="dummy-model",
                run_label="run0",
                checkpoint_path=checkpoint_path,
            )

            engine._save_checkpoint(status="running")
            payload = json.loads(checkpoint_path.read_text(encoding="utf-8"))
            self.assertEqual(payload["provider_usage"]["total_token_count"], 375)

            restored_provider = DummyUsageProvider()
            restored_provider.summary = ProviderUsageSummary(provider_name="gemini")
            restored_engine = ComposerEngine(
                provider=restored_provider,
                evaluator=mock.Mock(),
                paths=paths,
                prompt_config="base",
                max_retries=1,
                prompt_concurrency=1,
                validation_concurrency=1,
                model_name="dummy-model",
                run_label="run0",
                checkpoint_path=checkpoint_path,
            )

            results, error = asyncio.run(restored_engine.run([], resume_checkpoint=checkpoint_path))
            self.assertIsNone(error)
            self.assertEqual(results, [])
            self.assertEqual(restored_provider.summary.total_token_count, 375)
            self.assertEqual(restored_provider.summary.prompt_token_count, 300)

    def test_problem_result_round_trip_preserves_clean_diagnostic_attempt_fields(self) -> None:
        with tempfile.TemporaryDirectory() as tmp_dir:
            root = Path(tmp_dir)
            result = ProblemResult(
                name="problem1",
                source_asm_path=root / "problem1.s",
                fixed_asm_path=root / "fixed_problem1.s",
                succeeded=False,
                attempts_used=1,
                final_note="Build failed: invalid operand for instruction",
                attempts=[
                    {
                        "attempt": 1,
                        "status": "failed",
                        "clean_summary": "Build failed: invalid operand for instruction",
                        "clean_details": ["problem1.s:12:7: error: invalid operand for instruction"],
                        "failing_command": "clang-17 -c problem1.s -o problem1.o",
                        "failure_stage": "build",
                    }
                ],
            )

            from composers.utils import problem_result_from_dict, problem_result_to_dict

            payload = problem_result_to_dict(result)
            restored = problem_result_from_dict(payload)
            self.assertEqual(restored.attempts[0]["clean_summary"], "Build failed: invalid operand for instruction")
            self.assertEqual(restored.attempts[0]["failure_stage"], "build")


if __name__ == "__main__":
    unittest.main()
