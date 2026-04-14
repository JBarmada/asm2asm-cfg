from __future__ import annotations

import shlex
import shutil
import subprocess
from pathlib import Path

from ..utils import (
    ComposerRuntimePaths,
    ProblemSpec,
    ValidationFeedback,
    _is_readable_dir,
    _is_readable_file,
    _remove_path,
    _write_json,
    _write_text,
    extract_errored_entries,
    problem_name_from_entry,
)
from .base import BenchmarkAdapter
from .common import (
    BenchmarkRunResult,
    command_to_string,
    ensure_materialized_json_asm,
    execute_command,
    extract_defined_function_names,
    extract_stderr,
    load_json_payload,
    resolve_problem_name_from_asm_stem,
    resolve_source_asm,
    write_attempt_log,
    write_error_payload,
)


class BringUpBenchmark(BenchmarkAdapter):
    def __init__(
        self,
        *,
        paths: ComposerRuntimePaths,
        cfg: dict[str, object],
        cfg_data: dict[str, str] | None = None,
        dfg_data: dict[str, str] | None = None,
    ) -> None:
        self.benchmark_id = "bringup"
        self.benchmark_display_name = "BringUpBench"
        self.paths = paths
        self.cfg = cfg
        self.cfg_data = cfg_data or {}
        self.dfg_data = dfg_data or {}

    def max_validation_concurrency(self) -> int | None:
        return 1

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

            primary_source = task_dir / f"{problem_name}.c"
            expected_symbols = ()
            if primary_source.exists():
                expected_symbols = extract_defined_function_names(primary_source.read_text(encoding="utf-8"))

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
                    artifact_kind="translation_unit",
                    summary=str(entry.get("summary") or entry.get("run_output") or ""),
                    stderr=str(entry.get("stderr") or entry.get("run_output") or ""),
                    source_asm_path=source_asm,
                    source_asm_name=source_asm.name,
                    benchmark_task_path=task_dir,
                    expected_symbols=expected_symbols,
                    prompt_constraints=self._prompt_constraints(problem_name, expected_symbols),
                    cfg_text=cfg_text,
                    dfg_text=dfg_text,
                    cfg_available=bool(cfg_text),
                    dfg_available=bool(dfg_text),
                    metadata={"primary_source": str(primary_source)},
                )
            )

        if issues:
            detail = "\n".join(f"- {item}" for item in issues)
            raise RuntimeError(f"Preflight validation failed.\n{detail}")

        return specs

    def validate(self, problem: ProblemSpec, candidate_asm: str, attempt: int) -> ValidationFeedback:
        fixed_asm_path = self.paths.fixed_asm_dir / problem.source_asm_name
        _write_text(fixed_asm_path, candidate_asm)

        work_root = self.paths.compile_probe_dir / f"{problem.name}_attempt{attempt}"
        result = self._evaluate_problem(
            asm_file=fixed_asm_path,
            problem_name=problem.name,
            work_root=work_root,
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

        return ValidationFeedback(
            passed=result.passed,
            status=result.status,
            summary=result.summary,
            stderr=extract_stderr(result),
            errors_count=0 if result.passed else 1,
            problems_processed=1,
            validator_returncode=result.command_results[-1].returncode if result.command_results else -1,
        )

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
            results.append(
                self._evaluate_problem(
                    asm_file=asm_file,
                    problem_name=problem_name,
                    work_root=work_root / f"{problem_name}_{attempt_label}",
                )
            )
        return results

    def _evaluate_problem(self, *, asm_file: Path, problem_name: str, work_root: Path) -> BenchmarkRunResult:
        task_source_dir = self.paths.benchmark_root / problem_name
        if not task_source_dir.exists():
            return BenchmarkRunResult(
                problem_name=problem_name,
                status="missing_test",
                summary=f"Benchmark task not found: {task_source_dir}",
            )

        self._prepare_workspace(task_source_dir=task_source_dir, work_root=work_root)
        task_workspace = work_root / problem_name
        target_s_file = task_workspace / f"{problem_name}.s"
        target_s_file.write_text(asm_file.read_text(encoding="utf-8"), encoding="utf-8")

        timeout = int(self.cfg.get("bringup_timeout_seconds", self.cfg.get("timeout_seconds", 120)))
        result = BenchmarkRunResult(problem_name=problem_name, status="pending", summary="")

        try:
            for command in self._make_commands():
                command_result = execute_command(command, cwd=task_workspace, timeout=timeout)
                result.command_results.append(command_result)
                if command_result.returncode != 0:
                    result.status = "runtime_error" if command[-1] == "test" else "build_error"
                    result.summary = "BringUpBench test failed" if result.status == "runtime_error" else "BringUpBench build failed"
                    result.stderr = command_result.stderr or command_result.stdout
                    return result

            result.status = "passed"
            result.summary = "PASS"
            return result
        except subprocess.TimeoutExpired:
            result.status = "timeout"
            result.summary = f"Execution timed out after {timeout} seconds"
            return result
        except Exception as exc:
            result.status = "execution_error"
            result.summary = str(exc)
            return result

    def _prepare_workspace(self, *, task_source_dir: Path, work_root: Path) -> None:
        _remove_path(work_root)
        work_root.mkdir(parents=True, exist_ok=True)

        for name in ["Makefile", "common", "target"]:
            src = self.paths.benchmark_root / name
            if not src.exists():
                continue
            dst = work_root / name
            if src.is_dir():
                shutil.copytree(src, dst, dirs_exist_ok=True)
            else:
                shutil.copy2(src, dst)

        shutil.copytree(task_source_dir, work_root / task_source_dir.name, dirs_exist_ok=True)

    def _make_commands(self) -> list[list[str]]:
        make_target = str(self.cfg.get("make_target", "host"))
        compiler_cmd = self._compiler_command()
        runner_cmd = self._runner_command()
        target_libs = " ".join(str(item) for item in self.cfg.get("link_flags", []))
        cflags = self._cflags()

        assignments = [
            f"TARGET={make_target}",
            f"TARGET_CC={compiler_cmd}",
            f"CC={compiler_cmd}",
            f"TARGET_SIM={runner_cmd}",
            f"TARGET_LIBS={target_libs}",
            f"CFLAGS={cflags}",
        ]

        return [
            ["make", *assignments, "clean"],
            ["make", "-B", *assignments, "build"],
            ["make", *assignments, "test"],
        ]

    def _compiler_command(self) -> str:
        clang_parts = shlex.split(str(self.cfg.get("clang", "clang-17")))
        compile_flags = [str(item) for item in self.cfg.get("compile_flags", [])]
        opt_flags = {"-O0", "-O1", "-O2", "-O3", "-Og", "-Os", "-Oz"}
        compiler_parts = clang_parts + [flag for flag in compile_flags if flag not in opt_flags]
        return " ".join(compiler_parts)

    def _cflags(self) -> str:
        compile_flags = [str(item) for item in self.cfg.get("compile_flags", [])]
        opt_flag = next((flag for flag in compile_flags if flag.startswith("-O")), f"-{self.cfg.get('opt_level', 'O2')}")
        extra = str(self.cfg.get("bringup_extra_cflags", "")).strip()
        base = f"-Wall {opt_flag} -Wno-strict-aliasing -DTARGET_HOST -I../common -I../target"
        return f"{base} {extra}".strip()

    def _runner_command(self) -> str:
        if not bool(self.cfg.get("use_qemu", True)):
            return ""
        return str(self.cfg.get("qemu", "")).strip()

    def _prompt_constraints(self, problem_name: str, expected_symbols: tuple[str, ...]) -> tuple[str, ...]:
        lines = [
            f"Treat the input as a full translation-unit replacement for {problem_name}.c.",
            "Preserve the project-facing symbol behavior expected by the surrounding BringUpBench sources and Makefiles.",
            "Do not collapse the file into a single entrypoint if the original source defined multiple functions.",
        ]
        if expected_symbols:
            lines.append(f"Preserve the symbol set defined by the original C source: {', '.join(expected_symbols)}.")
        return tuple(lines)
