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


def to_error_entry(result: BenchmarkRunResult) -> dict[str, object]:
    return {
        "name": result.problem_name,
        "status": result.status,
        "summary": result.summary,
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
