from __future__ import annotations

import json
import sys
import tempfile
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))

from composers.benchmarks.bringup import BringUpBenchmark
from composers.benchmarks.standard_c import StandardCBenchmark
from composers.core import build_prompt
from composers.utils import ComposerRuntimePaths


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
                            {"name": "ackermann", "status": "build_error", "summary": "failed", "stderr": "bad"}
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
            self.assertEqual(benchmark.max_validation_concurrency(), 1)


if __name__ == "__main__":
    unittest.main()
