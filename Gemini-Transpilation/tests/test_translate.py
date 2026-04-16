from __future__ import annotations

import json
import tempfile
import unittest
from pathlib import Path
from unittest import mock

import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))

import run_translation_error_json
import translate_gemini
from transpilation_runtime import CommandResult, EvalResult, build_output_dirs


class TranslateTests(unittest.TestCase):
    def test_parse_args_supports_split_concurrency_and_checkpoint(self) -> None:
        args = translate_gemini.parse_args(
            [
                "--config",
                "cfg.json",
                "--benchmark",
                "bringup",
                "--source-isa",
                "x86",
                "--target-isa",
                "armv8-linux",
                "--prompt-concurrency",
                "64",
                "--validation-concurrency",
                "16",
                "--resume",
                "--resume-checkpoint",
                "logs/checkpoint.json",
            ]
        )
        self.assertEqual(args.prompt_concurrency, 64)
        self.assertEqual(args.validation_concurrency, 16)
        self.assertTrue(args.resume)
        self.assertEqual(args.resume_checkpoint, Path("logs/checkpoint.json"))

    def test_reconcile_checkpoint_state_marks_existing_artifacts(self) -> None:
        with tempfile.TemporaryDirectory() as tmp_dir:
            root = Path(tmp_dir)
            dirs = build_output_dirs(root)
            record = {"task_name": "ackermann", "source_asm": "mov eax, eax"}
            checkpoint = {
                "tasks": {
                    "ackermann": translate_gemini._default_task_entry("ackermann", dirs),
                    "stale": {"translation_status": "failed", "evaluation_status": "pending", "artifacts": {}},
                }
            }
            Path(checkpoint["tasks"]["ackermann"]["artifacts"]["cleaned_output"]).write_text("ret\n", encoding="utf-8")
            Path(checkpoint["tasks"]["ackermann"]["artifacts"]["translated_asm"]).write_text("ret\n", encoding="utf-8")
            Path(checkpoint["tasks"]["ackermann"]["artifacts"]["validation_json"]).write_text(
                json.dumps({"status": "passed"}) + "\n",
                encoding="utf-8",
            )

            reconciled = translate_gemini._reconcile_checkpoint_state(
                checkpoint,
                records=[record],
                dirs=dirs,
                resume_mode=True,
                action="compile_and_run",
            )
            task = reconciled["tasks"]["ackermann"]
            self.assertEqual(task["translation_status"], "translated")
            self.assertEqual(task["evaluation_status"], "validated")

    def test_reconcile_checkpoint_state_preserves_failed_tasks_without_artifacts(self) -> None:
        with tempfile.TemporaryDirectory() as tmp_dir:
            root = Path(tmp_dir)
            dirs = build_output_dirs(root)
            checkpoint = {
                "tasks": {
                    "ackermann": {
                        **translate_gemini._default_task_entry("ackermann", dirs),
                        "translation_status": "failed",
                        "translation_error": "boom",
                    }
                }
            }
            reconciled = translate_gemini._reconcile_checkpoint_state(
                checkpoint,
                records=[{"task_name": "ackermann", "source_asm": "ret"}],
                dirs=dirs,
                resume_mode=True,
                action="compile_and_run",
            )
            self.assertEqual(reconciled["tasks"]["ackermann"]["translation_status"], "failed")

    def test_eval_only_script_writes_validation_json_schema(self) -> None:
        with tempfile.TemporaryDirectory() as tmp_dir:
            root = Path(tmp_dir)
            asm_dir = root / "translated_asm"
            asm_dir.mkdir(parents=True)
            (asm_dir / "problem1.s").write_text("ret\n", encoding="utf-8")
            config_path = root / "config.json"
            config_path.write_text(json.dumps({"validation_concurrency": 4}), encoding="utf-8")
            error_json = root / "errors.json"
            eval_json = root / "eval.json"
            validation_dir = root / "validation_json"

            result = EvalResult(
                problem_name="problem1",
                status="build_error",
                summary="bad opcode",
                succeeded=False,
                error_stage="assembly",
                runtime_seconds=0.25,
                asm_path=asm_dir / "problem1.s",
                command_results=[CommandResult(["sh", "-lc", "clang -c problem1.s"], 1, "", "bad opcode")],
                stderr="bad opcode",
            )

            def fake_evaluate_records(**kwargs):
                record = kwargs["records"][0]
                kwargs["on_result"](record, result)
                return [(record, result)]

            with mock.patch.object(run_translation_error_json, "evaluate_records", side_effect=fake_evaluate_records):
                rc = run_translation_error_json.main(
                    [
                        str(asm_dir),
                        "--config",
                        str(config_path),
                        "--benchmark",
                        "humaneval",
                        "--target-isa",
                        "x86",
                        "--output",
                        str(error_json),
                        "--eval-json",
                        str(eval_json),
                        "--validation-json-dir",
                        str(validation_dir),
                    ]
                )

            self.assertEqual(rc, 1)
            payload = json.loads((validation_dir / "problem1.json").read_text(encoding="utf-8"))
            self.assertEqual(payload["status"], "build_error")
            self.assertEqual(payload["error_stage"], "assembly")
            self.assertIn("clang -c problem1.s", payload["failing_command"])
            self.assertEqual(payload["commands"][0]["returncode"], 1)
            eval_payload = json.loads(eval_json.read_text(encoding="utf-8"))
            self.assertEqual(eval_payload[0]["file"], "problem1")


if __name__ == "__main__":
    unittest.main()
