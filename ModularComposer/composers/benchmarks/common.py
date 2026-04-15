from __future__ import annotations

import json
import re
import shlex
import subprocess
from dataclasses import dataclass, field
from datetime import datetime
from pathlib import Path

from ..utils import _write_json, _write_text


CONTROL_KEYWORDS = {"if", "for", "while", "switch", "return", "sizeof"}


@dataclass
class CommandResult:
    command: list[str]
    returncode: int
    stdout: str
    stderr: str


@dataclass
class BenchmarkRunResult:
    problem_name: str
    status: str
    summary: str
    command_results: list[CommandResult] = field(default_factory=list)
    stderr: str = ""

    @property
    def passed(self) -> bool:
        return self.status == "passed"


@dataclass(frozen=True)
class FailureDiagnostics:
    failure_stage: str = ""
    failing_command: str = ""
    clean_summary: str = ""
    clean_details: tuple[str, ...] = ()


def execute_command(
    command: list[str],
    *,
    cwd: Path,
    timeout: int,
    env: dict[str, str] | None = None,
) -> CommandResult:
    proc = subprocess.run(
        command,
        cwd=cwd,
        capture_output=True,
        text=True,
        timeout=timeout,
        env=env,
        check=False,
    )
    return CommandResult(
        command=command,
        returncode=proc.returncode,
        stdout=proc.stdout,
        stderr=proc.stderr,
    )


def command_to_string(command: list[str]) -> str:
    return shlex.join(command)


def extract_stderr(result: BenchmarkRunResult) -> str:
    chunks: list[str] = []
    if result.stderr.strip():
        chunks.append(result.stderr.strip())
    for command_result in result.command_results:
        if command_result.stderr.strip():
            chunks.append(command_result.stderr.strip())

    deduped: list[str] = []
    seen: set[str] = set()
    for chunk in chunks:
        if chunk in seen:
            continue
        seen.add(chunk)
        deduped.append(chunk)
    return "\n\n".join(deduped)


def summarize_run_result(result: BenchmarkRunResult) -> FailureDiagnostics:
    if result.passed:
        return FailureDiagnostics()

    failing_result = _find_failing_command_result(result.command_results)
    failing_command = command_to_string(failing_result.command) if failing_result else ""
    failure_stage = _normalize_failure_stage(
        result.status,
        failing_command=failing_command,
        summary=result.summary,
    )
    raw_text = _join_unique_chunks(
        [
            result.stderr,
            failing_result.stderr if failing_result else "",
            failing_result.stdout if failing_result else "",
        ]
    )
    clean_details = _extract_clean_details(raw_text, failure_stage)
    clean_summary = _build_clean_summary(
        failure_stage=failure_stage,
        summary=result.summary,
        clean_details=clean_details,
        failing_result=failing_result,
    )
    return FailureDiagnostics(
        failure_stage=failure_stage,
        failing_command=failing_command,
        clean_summary=clean_summary,
        clean_details=clean_details,
    )


def summarize_error_entry(entry: dict[str, object]) -> FailureDiagnostics:
    commands_payload = entry.get("commands")
    command_results: list[CommandResult] = []
    if isinstance(commands_payload, list):
        for item in commands_payload:
            if not isinstance(item, dict):
                continue
            command_text = str(item.get("command") or "").strip()
            if not command_text:
                continue
            try:
                command = shlex.split(command_text)
            except ValueError:
                command = [command_text]
            command_results.append(
                CommandResult(
                    command=command,
                    returncode=int(item.get("returncode", 0)),
                    stdout=str(item.get("stdout") or ""),
                    stderr=str(item.get("stderr") or ""),
                )
            )

    summary = str(entry.get("summary") or "")
    stderr = str(entry.get("stderr") or entry.get("run_output") or "")
    status = str(entry.get("status") or entry.get("error_stage") or "")
    failing_result = _find_failing_command_result(command_results)
    failing_command = command_to_string(failing_result.command) if failing_result else ""
    failure_stage = _normalize_failure_stage(status, failing_command=failing_command, summary=summary)
    raw_text = _join_unique_chunks(
        [
            stderr,
            failing_result.stderr if failing_result else "",
            failing_result.stdout if failing_result else "",
        ]
    )
    clean_details = _extract_clean_details(raw_text, failure_stage)
    clean_summary = _build_clean_summary(
        failure_stage=failure_stage,
        summary=summary,
        clean_details=clean_details,
        failing_result=failing_result,
    )
    return FailureDiagnostics(
        failure_stage=failure_stage,
        failing_command=failing_command,
        clean_summary=clean_summary,
        clean_details=clean_details,
    )


def to_error_entry(result: BenchmarkRunResult) -> dict[str, object]:
    diagnostics = summarize_run_result(result)
    return {
        "name": result.problem_name,
        "status": result.status,
        "summary": result.summary,
        "failure_stage": diagnostics.failure_stage,
        "failing_command": diagnostics.failing_command,
        "clean_summary": diagnostics.clean_summary,
        "clean_details": list(diagnostics.clean_details),
        "commands": [
            {
                "command": command_to_string(command_result.command),
                "returncode": command_result.returncode,
            }
            for command_result in result.command_results
        ],
        "stderr": extract_stderr(result),
    }


def write_error_payload(
    *,
    output_path: Path,
    asm_input_dir: Path,
    benchmark_root: Path,
    benchmark_id: str,
    results: list[BenchmarkRunResult],
) -> Path:
    errored = [result for result in results if not result.passed]
    payload = {
        "run_started": datetime.now().isoformat(timespec="seconds"),
        "run_finished": datetime.now().isoformat(timespec="seconds"),
        "benchmark": benchmark_id,
        "asm_input_dir": str(asm_input_dir),
        "benchmark_root": str(benchmark_root),
        "problems_processed": len(results),
        "errored_count": len(errored),
        "errored_problems": [to_error_entry(result) for result in errored],
    }
    _write_json(output_path, payload)
    return output_path


def write_attempt_log(path: Path, command_results: list[CommandResult], extra_lines: list[str] | None = None) -> None:
    lines: list[str] = []
    if extra_lines:
        lines.extend(extra_lines)
        lines.append("")
    for command_result in command_results:
        lines.extend(
            [
                f"command: {command_to_string(command_result.command)}",
                f"returncode: {command_result.returncode}",
                "stdout:",
                command_result.stdout.rstrip(),
                "stderr:",
                command_result.stderr.rstrip(),
                "",
            ]
        )
    _write_text(path, "\n".join(lines).rstrip() + "\n")


def _find_failing_command_result(command_results: list[CommandResult]) -> CommandResult | None:
    for command_result in reversed(command_results):
        if command_result.returncode != 0:
            return command_result
    return command_results[-1] if command_results else None


def _join_unique_chunks(chunks: list[str]) -> str:
    deduped: list[str] = []
    seen: set[str] = set()
    for chunk in chunks:
        text = chunk.strip()
        if not text or text in seen:
            continue
        seen.add(text)
        deduped.append(text)
    return "\n\n".join(deduped)


def _normalize_failure_stage(status: str, *, failing_command: str, summary: str) -> str:
    value = status.strip().lower().replace("-", "_")
    if value in {"timeout", "missing_test", "execution_error"}:
        return value
    if value in {"runtime_error", "runtime", "execution"}:
        return "runtime"
    if value in {"build_error", "build", "compilation"}:
        if _looks_like_link_command(failing_command):
            return "link"
        return "build"
    if value in {"link", "link_error", "linking"}:
        return "link"
    if value in {"assembly", "assembler"}:
        return "build"
    if "timed out" in summary.lower():
        return "timeout"
    if _looks_like_link_command(failing_command):
        return "link"
    if failing_command:
        return "build"
    return value or "build"


def _looks_like_link_command(command_text: str) -> bool:
    if not command_text:
        return False
    if " make " in f" {command_text} ":
        return False
    if " -c " in f" {command_text} ":
        return False
    return ".o" in command_text or "ld" in command_text or " -o " in f" {command_text} "


def _extract_clean_details(raw_text: str, failure_stage: str, *, max_lines: int = 3) -> tuple[str, ...]:
    candidates: list[tuple[int, str]] = []
    seen: set[str] = set()
    for raw_line in raw_text.splitlines():
        line = raw_line.strip()
        if not line:
            continue
        if _is_ignorable_diagnostic_line(line):
            continue
        normalized = _normalize_detail_line(line)
        if not normalized or normalized in seen:
            continue
        seen.add(normalized)
        candidates.append((_diagnostic_priority(normalized, failure_stage), normalized))

    if not candidates:
        fallback = _fallback_details(raw_text)
        return fallback[:max_lines]

    candidates.sort(key=lambda item: (-item[0], item[1]))
    selected = [line for _, line in candidates[:max_lines]]
    return tuple(selected)


def _fallback_details(raw_text: str) -> tuple[str, ...]:
    lines: list[str] = []
    for raw_line in raw_text.splitlines():
        line = raw_line.strip()
        if not line:
            continue
        normalized = _normalize_detail_line(line)
        if normalized:
            lines.append(normalized)
        if len(lines) >= 2:
            break
    return tuple(lines)


def _normalize_detail_line(line: str) -> str:
    text = re.sub(r"^\s*(?:stderr|stdout):\s*", "", line, flags=re.I).strip()
    text = re.sub(r"^\+\s*", "", text)
    return text


def _is_ignorable_diagnostic_line(line: str) -> bool:
    lowered = line.lower()
    ignored_prefixes = (
        "make: entering directory",
        "make: leaving directory",
        "assembler messages:",
        "stderr:",
        "stdout:",
    )
    if lowered.startswith(ignored_prefixes):
        return True
    ignored_substrings = (
        "warning: argument unused during compilation",
        "modification time in the future",
        "clock skew detected",
        "nothing to be done for",
    )
    return any(part in lowered for part in ignored_substrings)


def _diagnostic_priority(line: str, failure_stage: str) -> int:
    lowered = line.lower()
    score = 0
    if "error:" in lowered:
        score += 6
    if "undefined reference" in lowered:
        score += 7
    if "relocation" in lowered or "pie" in lowered:
        score += 6
    if "linker command failed with exit code" in lowered:
        score -= 3
    if "segmentation fault" in lowered or "segfault" in lowered or "core dumped" in lowered:
        score += 7
    if "qemu:" in lowered:
        score += 6
    if "invalid" in lowered or "unsupported" in lowered or "out of range" in lowered:
        score += 5
    if "fatal" in lowered:
        score += 5
    if "failed" in lowered:
        score += 2
    if lowered.startswith("make: ***"):
        score -= 1
    if failure_stage == "runtime" and ("exit" in lowered or "returned" in lowered):
        score += 3
    return score


def _build_clean_summary(
    *,
    failure_stage: str,
    summary: str,
    clean_details: tuple[str, ...],
    failing_result: CommandResult | None,
) -> str:
    detail = clean_details[0] if clean_details else ""
    if failure_stage == "timeout":
        return summary or "Validation timed out"
    if failure_stage == "missing_test":
        return summary or "Benchmark task is missing its test harness"
    if failure_stage == "link":
        prefix = "Link failed"
    elif failure_stage == "runtime":
        prefix = "Runtime failed"
    elif failure_stage == "execution_error":
        prefix = "Validation execution failed"
    else:
        prefix = "Build failed"

    if detail:
        return f"{prefix}: {detail}"
    if summary:
        return summary
    if failing_result is not None:
        return f"{prefix}: command exited with code {failing_result.returncode}"
    return prefix


def load_json_payload(path: Path) -> object:
    return json.loads(path.read_text(encoding="utf-8"))


def ensure_materialized_json_asm(payload: object, asm_input_dir: Path) -> None:
    entries = []
    if isinstance(payload, list):
        entries = [entry for entry in payload if isinstance(entry, dict)]
    elif isinstance(payload, dict):
        errored = payload.get("errored_problems")
        if isinstance(errored, list):
            entries = [entry for entry in errored if isinstance(entry, dict)]

    asm_input_dir.mkdir(parents=True, exist_ok=True)
    for entry in entries:
        problem_name = str(entry.get("name") or entry.get("file") or "").strip()
        pred = str(entry.get("pred") or "")
        if not problem_name or not pred:
            continue
        out_path = asm_input_dir / f"{normalize_problem_name(problem_name)}.s"
        _write_text(out_path, pred)


def normalize_problem_name(value: str) -> str:
    text = value.strip().replace("\\", "/").rstrip("/")
    if not text:
        return ""
    parts = [part for part in text.split("/") if part]
    candidate = parts[-1]
    stem = Path(candidate).stem
    if stem in {"code", "test", "pred"} and len(parts) >= 2:
        return parts[-2]
    return stem


def _candidate_task_names(stem: str) -> list[str]:
    candidates: list[str] = [stem]
    for pattern in [r"_(O0|O2)$", r"_func\d+$", r"__func\d+$", r"_attempt\d+$"]:
        updated: list[str] = []
        for candidate in candidates:
            stripped = re.sub(pattern, "", candidate)
            if stripped != candidate:
                updated.append(stripped)
        candidates.extend(updated)

    deduped: list[str] = []
    seen: set[str] = set()
    for candidate in candidates:
        if candidate in seen:
            continue
        seen.add(candidate)
        deduped.append(candidate)
    return deduped


def resolve_problem_name_from_asm_stem(stem: str, benchmark_root: Path) -> str:
    for candidate in _candidate_task_names(stem):
        if (benchmark_root / candidate).exists():
            return candidate
    return _candidate_task_names(stem)[-1]


def resolve_source_asm(asm_input_dir: Path, problem_name: str) -> Path | None:
    exact = asm_input_dir / f"{problem_name}.s"
    if exact.exists():
        return exact

    for candidate in _candidate_task_names(problem_name):
        candidate_path = asm_input_dir / f"{candidate}.s"
        if candidate_path.exists():
            return candidate_path

    matches = sorted(asm_input_dir.glob(f"{problem_name}_*.s"))
    if matches:
        return matches[0]

    return None


def strip_c_comments(text: str) -> str:
    without_block = re.sub(r"/\*.*?\*/", "", text, flags=re.S)
    return re.sub(r"//.*", "", without_block)


def extract_function_like_names(text: str) -> tuple[str, ...]:
    cleaned = strip_c_comments(text)
    pattern = re.compile(
        r"^\s*(?:static\s+)?(?:inline\s+)?(?:extern\s+)?"
        r"[_A-Za-z][\w\s\*\[\],]*?\b([_A-Za-z]\w*)\s*\([^;{}]*\)\s*(?:;|\{)",
        re.M,
    )
    names: list[str] = []
    for match in pattern.finditer(cleaned):
        name = match.group(1)
        if name in CONTROL_KEYWORDS or name == "main":
            continue
        if name not in names:
            names.append(name)
    return tuple(names)


def extract_defined_function_names(text: str) -> tuple[str, ...]:
    cleaned = strip_c_comments(text)
    pattern = re.compile(
        r"^\s*(?:static\s+)?(?:inline\s+)?"
        r"[_A-Za-z][\w\s\*\[\],]*?\b([_A-Za-z]\w*)\s*\([^;{}]*\)\s*\{",
        re.M,
    )
    names: list[str] = []
    for match in pattern.finditer(cleaned):
        name = match.group(1)
        if name in CONTROL_KEYWORDS:
            continue
        if name not in names:
            names.append(name)
    return tuple(names)
