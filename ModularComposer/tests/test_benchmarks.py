from __future__ import annotations

import json
import sys
import tempfile
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))

from composers.benchmarks.bringup import BringUpBenchmark
from composers.benchmarks.common import BenchmarkRunResult, CommandResult, summarize_error_entry, summarize_run_result
from composers.benchmarks.standard_c import StandardCBenchmark
from composers.core import build_prompt
from composers.utils import ComposerRuntimePaths, ProblemSpec


def make_paths(root: Path, *, benchmark_id: str, benchmark_root: Path, asm_input_dir: Path, error_json_path: Path, input_mode: str) -> ComposerRuntimePaths:
    run_output_dir = root / "results" / "composer" / "run0" / "base"
    return ComposerRuntimePaths(
        benchmark_id=benchmark_id,
        benchmark_root=benchmark_root,
        input_mode=input_mode,
        input_path=error_json_path if error_json_path.suffix == ".json" else asm_input_dir,
        input_experiment_dir=asm_input_dir.parent,
        asm_input_dir=asm_input_dir,
        error_json_path=error_json_path,
        error_json_will_be_bootstrapped=False,
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


class BenchmarkAdapterTests(unittest.TestCase):
    def test_summarize_run_result_extracts_assembler_error(self) -> None:
        result = BenchmarkRunResult(
            problem_name="problem1",
            status="build_error",
            summary="Compilation/Link failed",
            command_results=[
                CommandResult(
                    ["clang-17", "-c", "problem1.s", "-o", "problem1.o"],
                    1,
                    "",
                    "clang-17: warning: argument unused during compilation: '-lm'\nproblem1.s:12:7: error: invalid operand for instruction\n",
                )
            ],
            stderr="clang-17: warning: argument unused during compilation: '-lm'\nproblem1.s:12:7: error: invalid operand for instruction\n",
        )

        diagnostics = summarize_run_result(result)
        self.assertEqual(diagnostics.failure_stage, "build")
        self.assertIn("invalid operand for instruction", diagnostics.clean_summary)
        self.assertNotIn("argument unused", "\n".join(diagnostics.clean_details))

    def test_summarize_run_result_extracts_link_failure(self) -> None:
        result = BenchmarkRunResult(
            problem_name="problem1",
            status="build_error",
            summary="Compilation/Link failed",
            command_results=[
                CommandResult(["clang-17", "-c", "problem1.s", "-o", "problem1.o"], 0, "", ""),
                CommandResult(
                    ["clang-17", "problem1.o", "test.o", "-o", "problem1_exe"],
                    1,
                    "",
                    "/usr/bin/ld: problem1.o: in function `func0': undefined reference to `helper'\nclang-17: error: linker command failed with exit code 1\n",
                ),
            ],
            stderr="/usr/bin/ld: problem1.o: in function `func0': undefined reference to `helper'\n",
        )

        diagnostics = summarize_run_result(result)
        self.assertEqual(diagnostics.failure_stage, "link")
        self.assertIn("undefined reference", diagnostics.clean_summary)
        self.assertTrue(diagnostics.failing_command.startswith("clang-17"))

    def test_summarize_run_result_extracts_runtime_failure(self) -> None:
        result = BenchmarkRunResult(
            problem_name="problem1",
            status="runtime_error",
            summary="Exited with code 139",
            command_results=[
                CommandResult(["qemu-riscv64", "./problem1_exe"], 139, "", "qemu-riscv64: Segmentation fault (core dumped)\n"),
            ],
            stderr="qemu-riscv64: Segmentation fault (core dumped)\n",
        )

        diagnostics = summarize_run_result(result)
        self.assertEqual(diagnostics.failure_stage, "runtime")
        self.assertIn("Segmentation fault", diagnostics.clean_summary)

    def test_summarize_error_entry_filters_make_noise(self) -> None:
        diagnostics = summarize_error_entry(
            {
                "name": "ackermann",
                "status": "runtime_error",
                "summary": "BringUpBench test failed",
                "stderr": (
                    "make: Warning: File 'host' has modification time in the future\n"
                    "make: warning: Clock skew detected. Your build may be incomplete.\n"
                    "FAIL: expected 7 got 8\n"
                    "make: *** [Makefile:12: test] Error 1\n"
                ),
                "commands": [{"command": "make TARGET=host test", "returncode": 2}],
            }
        )

        self.assertEqual(diagnostics.failure_stage, "runtime")
        self.assertIn("FAIL: expected 7 got 8", diagnostics.clean_summary)
        self.assertNotIn("Clock skew", "\n".join(diagnostics.clean_details))

    def test_summarize_run_result_timeout_keeps_summary(self) -> None:
        diagnostics = summarize_run_result(
            BenchmarkRunResult(
                problem_name="problem1",
                status="timeout",
                summary="Execution timed out after 30 seconds",
            )
        )
        self.assertEqual(diagnostics.failure_stage, "timeout")
        self.assertEqual(diagnostics.clean_summary, "Execution timed out after 30 seconds")

    def test_mceval_symbol_extraction_and_prompt(self) -> None:
        with tempfile.TemporaryDirectory() as tmp_dir:
            root = Path(tmp_dir)
            benchmark_root = root / "mceval-c"
            task_dir = benchmark_root / "C_1"
            task_dir.mkdir(parents=True)
            (task_dir / "code.c").write_text(
                'char *hello_mmcodeeval(){ return "hi"; }\n',
                encoding="utf-8",
            )
            (task_dir / "test.c").write_text(
                'char *hello_mmcodeeval();\nint main(){ return hello_mmcodeeval()[0] == \'h\' ? 0 : 1; }\n',
                encoding="utf-8",
            )

            asm_dir = root / "experiment" / "translated_asm"
            asm_dir.mkdir(parents=True)
            (asm_dir / "C_1.s").write_text(".globl hello_mmcodeeval\nhello_mmcodeeval:\n ret\n", encoding="utf-8")

            error_json = root / "experiment" / "jsons" / "errors.json"
            error_json.parent.mkdir(parents=True)
            error_json.write_text(
                json.dumps(
                    {
                        "errored_problems": [
                            {"name": "C_1", "status": "runtime_error", "summary": "failed", "stderr": "bad"}
                        ]
                    }
                ),
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
            self.assertEqual(len(specs), 1)
            self.assertEqual(specs[0].expected_symbols, ("hello_mmcodeeval",))

            prompt = build_prompt(
                problem=specs[0],
                source_asm=".globl hello_mmcodeeval\nhello_mmcodeeval:\n ret\n",
                prompt_config="base",
                target_isa=paths.target_isa_display,
                cfg_language=paths.cfg_language,
                dfg_language=paths.dfg_language,
            )
            self.assertIn("hello_mmcodeeval", prompt)
            self.assertNotIn("func0 unless explicitly required otherwise", prompt)

    def test_error_prompt_uses_cleaned_diagnostics_only(self) -> None:
        problem = ProblemSpec(
            name="problem1",
            benchmark_id="humaneval",
            artifact_kind="single_function",
            summary="Compilation/Link failed",
            stderr="raw stderr that should not appear",
            source_asm_path=Path("problem1.s"),
            source_asm_name="problem1.s",
            benchmark_task_path=Path("problem1"),
            expected_symbols=("func0",),
            prompt_constraints=(),
            cfg_text="",
            dfg_text="",
            cfg_available=False,
            dfg_available=False,
            clean_summary="Build failed: problem1.s:12:7: error: invalid operand for instruction",
            clean_details=("problem1.s:12:7: error: invalid operand for instruction",),
            failing_command="clang-17 -c problem1.s -o problem1.o",
            failure_stage="build",
        )

        prompt = build_prompt(
            problem=problem,
            source_asm=".globl func0\nfunc0:\n ret\n",
            prompt_config="error_only",
            target_isa="x86-64",
            cfg_language="x86_64",
            dfg_language="x86_64",
            retry_context={
                "attempt": "1",
                "validation_status": "build_error",
                "validation_summary": "Compilation/Link failed",
                "validation_stderr": "raw retry stderr",
                "clean_summary": "Build failed: invalid operand for instruction",
                "clean_details": "problem1.s:12:7: error: invalid operand for instruction",
                "failing_command": "clang-17 -c problem1.s -o problem1.o",
                "failure_stage": "build",
                "previous_code": ".globl func0\nfunc0:\n ret\n",
            },
        )

        self.assertIn("Known toolchain/runtime failure summary from prior validation", prompt)
        self.assertIn("Build failed: problem1.s:12:7: error: invalid operand for instruction", prompt)
        self.assertIn("Failing command: clang-17 -c problem1.s -o problem1.o", prompt)
        self.assertNotIn("raw stderr that should not appear", prompt)
        self.assertNotIn("raw retry stderr", prompt)

    def test_base_prompt_remains_pure_without_error_feedback(self) -> None:
        problem = ProblemSpec(
            name="problem1",
            benchmark_id="humaneval",
            artifact_kind="single_function",
            summary="Compilation/Link failed",
            stderr="raw stderr",
            source_asm_path=Path("problem1.s"),
            source_asm_name="problem1.s",
            benchmark_task_path=Path("problem1"),
            expected_symbols=("func0",),
            prompt_constraints=(),
            cfg_text="",
            dfg_text="",
            cfg_available=False,
            dfg_available=False,
            clean_summary="Build failed: invalid operand",
            clean_details=("invalid operand",),
            failing_command="clang-17 -c problem1.s -o problem1.o",
            failure_stage="build",
        )

        prompt = build_prompt(
            problem=problem,
            source_asm=".globl func0\nfunc0:\n ret\n",
            prompt_config="base",
            target_isa="x86-64",
            cfg_language="x86_64",
            dfg_language="x86_64",
        )

        self.assertNotIn("Known toolchain/runtime failure summary from prior validation", prompt)
        self.assertNotIn("Previous failed attempt feedback", prompt)

    def test_bringup_translation_unit_metadata(self) -> None:
        with tempfile.TemporaryDirectory() as tmp_dir:
            root = Path(tmp_dir)
            benchmark_root = root / "bringup-bench"
            task_dir = benchmark_root / "ackermann"
            task_dir.mkdir(parents=True)
            (benchmark_root / "common").mkdir()
            (benchmark_root / "target").mkdir()
            (benchmark_root / "Makefile").write_text("all:\n\t@echo ok\n", encoding="utf-8")
            (task_dir / "Makefile").write_text("include ../Makefile\n", encoding="utf-8")
            (task_dir / "ackermann.c").write_text(
                "unsigned ack(unsigned x, unsigned y) { return x + y; }\nint main(void) { return 0; }\n",
                encoding="utf-8",
            )
            asm_dir = root / "experiment" / "translated_asm"
            asm_dir.mkdir(parents=True)
            (asm_dir / "ackermann.s").write_text(".globl ack\nack:\n ret\n", encoding="utf-8")
            error_json = root / "experiment" / "jsons" / "errors.json"
            error_json.parent.mkdir(parents=True)
            error_json.write_text(
                json.dumps(
                    {
                        "errored_problems": [
                            {
                                "name": "ackermann",
                                "status": "build_error",
                                "summary": "failed",
                                "stderr": (
                                    "make: Warning: File 'host' has modification time in the future\n"
                                    "ackermann.s:12:7: error: invalid operand for instruction\n"
                                ),
                                "commands": [{"command": "make TARGET=host build", "returncode": 2}],
                            }
                        ]
                    }
                ),
                encoding="utf-8",
            )

            paths = make_paths(
                root,
                benchmark_id="bringup",
                benchmark_root=benchmark_root,
                asm_input_dir=asm_dir,
                error_json_path=error_json,
                input_mode="asm_dir",
            )
            benchmark = BringUpBenchmark(
                paths=paths,
                cfg={"clang": "clang-17", "compile_flags": ["-O2"], "link_flags": ["-lm"], "use_qemu": False, "timeout_seconds": 5},
            )
            specs = benchmark.get_problem_specs("base")
            self.assertEqual(specs[0].artifact_kind, "translation_unit")
            self.assertEqual(specs[0].expected_symbols, ("ack", "main"))
            self.assertIn("invalid operand", specs[0].clean_summary)
            self.assertNotIn("modification time", "\n".join(specs[0].clean_details))
            self.assertIsNone(benchmark.max_prompt_concurrency())
            self.assertEqual(benchmark.max_validation_concurrency(), 1)

            tuned = BringUpBenchmark(
                paths=paths,
                cfg={
                    "clang": "clang-17",
                    "compile_flags": ["-O2"],
                    "link_flags": ["-lm"],
                    "use_qemu": False,
                    "timeout_seconds": 5,
                    "bringup_validation_concurrency_limit": 4,
                },
            )
            self.assertEqual(tuned.max_validation_concurrency(), 4)

    def test_bringup_make_commands_preserve_target_cflags(self) -> None:
        with tempfile.TemporaryDirectory() as tmp_dir:
            root = Path(tmp_dir)
            benchmark_root = root / "bringup-bench"
            benchmark_root.mkdir(parents=True)
            asm_dir = root / "experiment" / "translated_asm"
            asm_dir.mkdir(parents=True)
            error_json = root / "experiment" / "jsons" / "errors.json"
            error_json.parent.mkdir(parents=True)
            error_json.write_text(json.dumps({"errored_problems": []}), encoding="utf-8")

            paths = make_paths(
                root,
                benchmark_id="bringup",
                benchmark_root=benchmark_root,
                asm_input_dir=asm_dir,
                error_json_path=error_json,
                input_mode="asm_dir",
            )
            benchmark = BringUpBenchmark(
                paths=paths,
                cfg={
                    "clang": "clang-17",
                    "compile_flags": ["-target", "x86_64-unknown-linux-gnu", "-O2"],
                    "link_flags": ["-lm"],
                    "bringup_extra_cflags": "-fno-pie",
                    "use_qemu": False,
                    "timeout_seconds": 5,
                },
            )

            commands = benchmark._make_commands()
            build_command = commands[1]

            self.assertIn("OPT_CFLAGS=-O2", build_command)
            self.assertIn("LOCAL_CFLAGS=-fno-pie", build_command)
            self.assertFalse(any(item.startswith("CFLAGS=") for item in build_command))

    def test_bringup_make_commands_allow_experimental_speed_flags(self) -> None:
        with tempfile.TemporaryDirectory() as tmp_dir:
            root = Path(tmp_dir)
            benchmark_root = root / "bringup-bench"
            benchmark_root.mkdir(parents=True)
            asm_dir = root / "experiment" / "translated_asm"
            asm_dir.mkdir(parents=True)
            error_json = root / "experiment" / "jsons" / "errors.json"
            error_json.parent.mkdir(parents=True)
            error_json.write_text(json.dumps({"errored_problems": []}), encoding="utf-8")

            paths = make_paths(
                root,
                benchmark_id="bringup",
                benchmark_root=benchmark_root,
                asm_input_dir=asm_dir,
                error_json_path=error_json,
                input_mode="asm_dir",
            )
            benchmark = BringUpBenchmark(
                paths=paths,
                cfg={
                    "clang": "clang-17",
                    "compile_flags": ["-target", "x86_64-unknown-linux-gnu", "-O2"],
                    "link_flags": ["-lm"],
                    "use_qemu": False,
                    "timeout_seconds": 5,
                    "bringup_skip_clean": True,
                    "bringup_force_rebuild": False,
                },
            )

            commands = benchmark._make_commands()
            self.assertEqual(len(commands), 2)
            self.assertEqual(commands[0][0], "make")
            self.assertNotIn("-B", commands[0])
            self.assertEqual(commands[0][-1], "build")
            self.assertEqual(commands[1][-1], "test")


if __name__ == "__main__":
    unittest.main()
