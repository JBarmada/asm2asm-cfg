from __future__ import annotations

import shlex
import subprocess
from pathlib import Path

from ..utils import (
    ComposerRuntimePaths,
    ProblemSpec,
    ValidationFeedback,
    _is_readable_dir,
    _is_readable_file,
    _write_json,
    _write_text,
    extract_errored_entries,
    problem_name_from_entry,
)
from .base import BenchmarkAdapter
from .common import (
    BenchmarkRunResult,
    CommandResult,
    command_to_string,
    ensure_materialized_json_asm,
    execute_command,
    extract_defined_function_names,
    extract_function_like_names,
    extract_stderr,
    load_json_payload,
    resolve_problem_name_from_asm_stem,
    resolve_source_asm,
    to_error_entry,
    write_attempt_log,
    write_error_payload,
)


class StandardCBenchmark(BenchmarkAdapter):
    def __init__(
        self,
        *,
        benchmark_id: str,
        benchmark_display_name: str,
        paths: ComposerRuntimePaths,
        cfg: dict[str, object],
        cfg_data: dict[str, str] | None = None,
        dfg_data: dict[str, str] | None = None,
    ) -> None:
        self.benchmark_id = benchmark_id
        self.benchmark_display_name = benchmark_display_name
        self.paths = paths
        self.cfg = cfg
        self.cfg_data = cfg_data or {}
        self.dfg_data = dfg_data or {}

    def bootstrap_error_json(self, asm_dir: Path, output_path: Path) -> Path:
        results = self._evaluate_asm_dir(
            asm_dir=asm_dir,
            work_root=self.paths.compile_probe_dir / "bootstrap_eval",
            attempt_label="bootstrap",
        )
        return write_error_payload(
            output_path=output_path,
            asm_input_dir=asm_dir,
            benchmark_root=self.paths.benchmark_root,
            benchmark_id=self.benchmark_id,
            results=results,
        )

    def get_problem_specs(self, prompt_config: str) -> list[ProblemSpec]:
        issues: list[str] = []
        require_cfg = prompt_config in {"cfg_only", "error_cfg", "cfg_dfg", "error_cfg_dfg"}
        require_dfg = prompt_config in {"dfg_only", "error_dfg", "cfg_dfg", "error_cfg_dfg"}

        if not _is_readable_file(self.paths.error_json_path):
            issues.append(f"Cannot read error JSON: {self.paths.error_json_path}")
        if not _is_readable_dir(self.paths.benchmark_root):
            issues.append(f"Benchmark root is missing/unreadable: {self.paths.benchmark_root}")

        payload = load_json_payload(self.paths.error_json_path)
        if self.paths.input_mode == "evaluated_json":
            ensure_materialized_json_asm(payload, self.paths.asm_input_dir)

        errored = extract_errored_entries(payload)
        specs: list[ProblemSpec] = []

        for entry in errored:
            problem_name = problem_name_from_entry(entry)
            if not problem_name:
                issues.append("Found an errored entry without 'name' or 'file'.")
                continue

            source_asm = resolve_source_asm(self.paths.asm_input_dir, problem_name)
            if source_asm is None:
                issues.append(f"Source asm not found for {problem_name} in {self.paths.asm_input_dir}")
                continue

            task_dir = self.paths.benchmark_root / problem_name
            if not task_dir.exists():
                issues.append(f"Benchmark task directory not found: {task_dir}")
                continue

            expected_symbols = self._expected_symbols(task_dir)
            cfg_text = self.cfg_data.get(problem_name, "")
            dfg_text = self.dfg_data.get(problem_name, "")

            if require_cfg and not cfg_text:
                issues.append(f"Missing CFG for {problem_name}")
            if require_dfg and not dfg_text:
                issues.append(f"Missing DFG for {problem_name}")

            specs.append(
                ProblemSpec(
                    name=problem_name,
                    benchmark_id=self.benchmark_id,
                    artifact_kind="single_function",
                    summary=str(entry.get("summary") or entry.get("run_output") or ""),
                    stderr=str(entry.get("stderr") or entry.get("run_output") or ""),
                    source_asm_path=source_asm,
                    source_asm_name=source_asm.name,
                    benchmark_task_path=task_dir,
                    expected_symbols=expected_symbols,
                    prompt_constraints=self._prompt_constraints(expected_symbols),
                    cfg_text=cfg_text,
                    dfg_text=dfg_text,
                    cfg_available=bool(cfg_text),
                    dfg_available=bool(dfg_text),
                    metadata={"test_file": str(task_dir / "test.c")},
                )
            )

        if issues:
            detail = "\n".join(f"- {item}" for item in issues)
            raise RuntimeError(f"Preflight validation failed.\n{detail}")

        return specs

    def validate(self, problem: ProblemSpec, candidate_asm: str, attempt: int) -> ValidationFeedback:
        fixed_asm_path = self.paths.fixed_asm_dir / problem.source_asm_name
        _write_text(fixed_asm_path, candidate_asm)

        work_dir = self.paths.compile_probe_dir / f"{problem.name}_attempt{attempt}"
        result = self._evaluate_problem(
            asm_file=fixed_asm_path,
            problem_name=problem.name,
            work_dir=work_dir,
        )

        validation_json_path = self.paths.validation_json_dir / f"{problem.name}_attempt{attempt}.json"
        _write_json(
            validation_json_path,
            {
                "benchmark": self.benchmark_id,
                "problem": problem.name,
                "attempt": attempt,
                "passed": result.passed,
                "status": result.status,
                "summary": result.summary,
                "stderr": extract_stderr(result),
                "commands": [
                    {
                        "command": command_to_string(command_result.command),
                        "returncode": command_result.returncode,
                    }
                    for command_result in result.command_results
                ],
            },
        )

        write_attempt_log(
            self.paths.compile_probe_dir / f"{problem.name}_attempt{attempt}.log",
            result.command_results,
            extra_lines=[
                f"benchmark: {self.benchmark_id}",
                f"problem: {problem.name}",
                f"status: {result.status}",
                f"summary: {result.summary}",
                f"stderr: {extract_stderr(result)}",
            ],
        )

        return self._validation_feedback_from_result(result)

    def validate_all_outputs(self) -> tuple[Path, int, int]:
        self.paths.full_validation_input_dir.mkdir(parents=True, exist_ok=True)
        for stale in self.paths.full_validation_input_dir.glob("*"):
            if stale.is_file():
                stale.unlink()

        if _is_readable_dir(self.paths.asm_input_dir):
            for src in self.paths.asm_input_dir.glob("*.s"):
                target = self.paths.full_validation_input_dir / src.name
                target.write_text(src.read_text(encoding="utf-8"), encoding="utf-8")

        if _is_readable_dir(self.paths.fixed_asm_dir):
            for fixed in self.paths.fixed_asm_dir.glob("*.s"):
                target = self.paths.full_validation_input_dir / fixed.name
                target.write_text(fixed.read_text(encoding="utf-8"), encoding="utf-8")

        results = self._evaluate_asm_dir(
            asm_dir=self.paths.full_validation_input_dir,
            work_root=self.paths.compile_probe_dir / "final_validation",
            attempt_label="final",
        )
        final_json_path = self.paths.validation_json_dir / "final_error_problems.json"
        write_error_payload(
            output_path=final_json_path,
            asm_input_dir=self.paths.full_validation_input_dir,
            benchmark_root=self.paths.benchmark_root,
            benchmark_id=self.benchmark_id,
            results=results,
        )
        total_inputs = len(list(self.paths.full_validation_input_dir.glob("*.s")))
        errored_count = len([result for result in results if not result.passed])
        return final_json_path, errored_count, total_inputs

    def _evaluate_asm_dir(self, *, asm_dir: Path, work_root: Path, attempt_label: str) -> list[BenchmarkRunResult]:
        results: list[BenchmarkRunResult] = []
        for asm_file in sorted(asm_dir.glob("*.s")):
            problem_name = resolve_problem_name_from_asm_stem(asm_file.stem, self.paths.benchmark_root)
            work_dir = work_root / f"{problem_name}_{attempt_label}"
            results.append(self._evaluate_problem(asm_file=asm_file, problem_name=problem_name, work_dir=work_dir))
        return results

    def _evaluate_problem(self, *, asm_file: Path, problem_name: str, work_dir: Path) -> BenchmarkRunResult:
        task_dir = self.paths.benchmark_root / problem_name
        test_file = task_dir / "test.c"
        if not test_file.exists():
            return BenchmarkRunResult(
                problem_name=problem_name,
                status="missing_test",
                summary=f"No test at {test_file}",
            )

        work_dir.mkdir(parents=True, exist_ok=True)
        asm_object = work_dir / f"{asm_file.stem}.o"
        test_object = work_dir / "test.o"
        executable_path = work_dir / f"{asm_file.stem}_exe"

        result = BenchmarkRunResult(problem_name=problem_name, status="pending", summary="")
        timeout = int(self.cfg.get("standard_timeout_seconds", self.cfg.get("timeout_seconds", 30)))

        try:
            for command in self._build_commands(
                asm_file=asm_file,
                asm_object=asm_object,
                test_file=test_file,
                test_object=test_object,
                executable_path=executable_path,
            ):
                command_result = execute_command(command, cwd=work_dir, timeout=timeout)
                result.command_results.append(command_result)
                if command_result.returncode != 0:
                    result.status = "build_error"
                    result.summary = "Compilation/Link failed"
                    result.stderr = command_result.stderr
                    return result

            run_command = self._run_command(executable_path)
            command_result = execute_command(run_command, cwd=work_dir, timeout=timeout)
            result.command_results.append(command_result)
            result.stderr = command_result.stderr
            result.status = "passed" if command_result.returncode == 0 else "runtime_error"
            result.summary = "PASS" if result.status == "passed" else f"Exited with code {command_result.returncode}"
            return result
        except subprocess.TimeoutExpired:
            result.status = "timeout"
            result.summary = f"Execution timed out after {timeout} seconds"
            return result
        except Exception as exc:
            result.status = "execution_error"
            result.summary = str(exc)
            return result

    def _build_commands(
        self,
        *,
        asm_file: Path,
        asm_object: Path,
        test_file: Path,
        test_object: Path,
        executable_path: Path,
    ) -> list[list[str]]:
        clang_parts = shlex.split(str(self.cfg.get("clang", "clang-17")))
        compile_flags = [str(item) for item in self.cfg.get("compile_flags", [])]
        link_flags = [str(item) for item in self.cfg.get("link_flags", [])]
        return [
            clang_parts + ["-c", str(asm_file), "-o", str(asm_object)] + compile_flags,
            clang_parts + ["-c", str(test_file), "-o", str(test_object), "-O2"] + compile_flags,
            clang_parts + [str(asm_object), str(test_object), "-o", str(executable_path)] + link_flags,
        ]

    def _run_command(self, executable_path: Path) -> list[str]:
        use_qemu = bool(self.cfg.get("use_qemu", True))
        qemu_raw = str(self.cfg.get("qemu", "")).strip()
        if use_qemu and qemu_raw:
            return shlex.split(qemu_raw) + [str(executable_path)]
        return [str(executable_path)]

    def _expected_symbols(self, task_dir: Path) -> tuple[str, ...]:
        test_file = task_dir / "test.c"
        code_file = task_dir / "code.c"

        test_symbols = extract_function_like_names(test_file.read_text(encoding="utf-8")) if test_file.exists() else ()
        if test_symbols:
            return test_symbols

        code_symbols = extract_defined_function_names(code_file.read_text(encoding="utf-8")) if code_file.exists() else ()
        if code_symbols:
            return code_symbols

        if self.benchmark_id == "humaneval":
            return ("func0",)
        return tuple()

    def _prompt_constraints(self, expected_symbols: tuple[str, ...]) -> tuple[str, ...]:
        lines = [
            "Treat the input as one benchmark function, not as a whole project.",
            "Preserve the existing assembler syntax and calling convention for the target ISA.",
        ]
        if expected_symbols:
            joined = ", ".join(expected_symbols)
            lines.append(f"Preserve the exact benchmark symbol contract: {joined}.")
        return tuple(lines)

    def _validation_feedback_from_result(self, result: BenchmarkRunResult) -> ValidationFeedback:
        validator_returncode = result.command_results[-1].returncode if result.command_results else -1
        stderr_text = extract_stderr(result)
        return ValidationFeedback(
            passed=result.passed,
            status=result.status,
            summary=result.summary,
            stderr=stderr_text,
            errors_count=0 if result.passed else 1,
            problems_processed=1,
            validator_returncode=validator_returncode,
        )
