"""
Gemini Composer for repairing translated assembly that failed validation.
Config-driven and assembly-agnostic.

Setup requirements before running:
- Run from the Gemini-Transpilation working directory so relative paths resolve.
- A valid config JSON must exist and include compile/link/runtime settings.
- Input experiment directory must contain translated assembly and an *_error_problems.json
  (or pass --error-json explicitly).
- Validation script run_translation_error_json.py must exist.
- GOOGLE_API_KEY or GEMINI_API_KEY must be set for real runs.
"""

from __future__ import annotations

import argparse
import asyncio
import json
import os
import random
import re
import shutil
import subprocess
import sys
import time
from dataclasses import dataclass
from datetime import datetime
from pathlib import Path

try:
	from google import genai
	HAS_GENAI = True
except ImportError:
	HAS_GENAI = False

try:
	from datasets import load_dataset
	HAS_DATASETS = True
except ImportError:
	HAS_DATASETS = False

# ==========================================
# Globals & Constants
# ==========================================
PROMPT_CONFIGS = [
	"base",
	"error_only",
	"cfg_only",
	"dfg_only",
	"error_cfg",
	"error_dfg",
	"cfg_dfg",
	"error_cfg_dfg",
]
RUN_ERROR_JSON_SCRIPT = Path("run_translation_error_json.py").resolve()


@dataclass(frozen=True)
class ComposerRuntimePaths:
	benchmark_asm_input_dir: Path
	input_experiment_dir: Path
	error_json_path: Path
	run_output_dir: Path
	prompts_dir: Path
	raw_output_dir: Path
	original_error_asm_dir: Path
	fixed_asm_dir: Path
	logs_dir: Path
	reports_dir: Path
	cleaned_output_dir: Path
	clean_diagnostics_dir: Path
	compile_probe_dir: Path
	validation_json_dir: Path
	source_language: str
	cfg_language: str
	dfg_language: str


@dataclass
class ProblemSpec:
	name: str
	summary: str
	stderr: str
	source_asm_path: Path
	source_asm_name: str
	cfg_text: str
	dfg_text: str


@dataclass
class ProblemResult:
	name: str
	source_asm_path: Path
	fixed_asm_path: Path
	succeeded: bool
	attempts_used: int
	final_note: str
	attempts: list[dict[str, object]]


@dataclass
class ValidationFeedback:
	status: str
	summary: str
	stderr: str
	errors_count: int
	problems_processed: int
	validator_returncode: int


class QuotaExhaustedError(RuntimeError):
	pass


class ComposerAbortError(RuntimeError):
	pass


def resolve_gemini_api_key() -> tuple[str, str]:
	candidates = ("GOOGLE_API_KEY", "GEMINI_API_KEY")
	smart_quotes = "\u2018\u2019\u201c\u201d"

	for env_name in candidates:
		raw = os.environ.get(env_name)
		if raw is None:
			continue

		value = raw.strip().strip("\"'").strip(smart_quotes)
		if not value:
			continue

		if any(ch in value for ch in smart_quotes):
			raise RuntimeError("Gemini API key contains smart quotes; re-copy the value.")

		try:
			value.encode("ascii")
		except UnicodeEncodeError as exc:
			raise RuntimeError("Gemini API key contains non-ascii characters.") from exc

		return env_name, value

	raise RuntimeError("Gemini API key not found. Set GOOGLE_API_KEY or GEMINI_API_KEY.")


def parse_args() -> argparse.Namespace:
	parser = argparse.ArgumentParser(description="Gemini Composer using JSON config")
	parser.add_argument("input_dir", type=Path, help="Input experiment directory")
	parser.add_argument("--config", type=Path, required=True, help="Path to the config.json")
	parser.add_argument("--prompt-config", help="Override prompt config strategy")
	parser.add_argument("--run-label", help="Optional label used in output naming")
	parser.add_argument("--all-prompt-configs", action="store_true", help="Run once per prompt config")
	parser.add_argument("--resume-checkpoint", type=Path, help="Resume from a saved checkpoint JSON")
	parser.add_argument("--resume-all", action="store_true", help="Resume run-all from checkpoint in results/composer")
	parser.add_argument("--error-json", type=Path, help="Explicit *_error_problems.json path")
	parser.add_argument("--yes", action="store_true", help="Skip interactive confirmation prompt")
	return parser.parse_args()


def _read_config(config_path: Path) -> dict[str, object]:
	try:
		return json.loads(config_path.read_text(encoding="utf-8"))
	except Exception as exc:
		raise RuntimeError(f"Failed to read config JSON: {config_path}") from exc


def resolve_runtime_paths(args: argparse.Namespace, cfg: dict[str, object]) -> ComposerRuntimePaths:
	input_experiment_dir = args.input_dir.resolve()
	if not input_experiment_dir.exists() or not input_experiment_dir.is_dir():
		raise FileNotFoundError(f"Input directory does not exist: {input_experiment_dir}")

	source_language = str(cfg.get("target_arch", cfg.get("source_language", "arm")))
	cfg_language = str(cfg.get("cfg_dataset_column", cfg.get("source_dataset_column", "x86_64")))
	dfg_language = str(cfg.get("dfg_dataset_column", cfg.get("source_dataset_column", "x86_64")))

	benchmark_asm_input_dir = input_experiment_dir / "translated_asm"
	if not benchmark_asm_input_dir.exists() or not benchmark_asm_input_dir.is_dir():
		benchmark_asm_input_dir = input_experiment_dir / f"{source_language}_asm"
		if not benchmark_asm_input_dir.exists() or not benchmark_asm_input_dir.is_dir():
			benchmark_asm_input_dir = input_experiment_dir / "arm_asm"
			if not benchmark_asm_input_dir.exists() or not benchmark_asm_input_dir.is_dir():
				raise FileNotFoundError(f"Source asm directory not found in {input_experiment_dir}")

	if args.error_json is not None and args.error_json.exists():
		error_json_path = args.error_json.resolve()
	else:
		cfg_error_json = cfg.get("error_json")
		if cfg_error_json:
			candidate = Path(str(cfg_error_json)).expanduser().resolve()
			if candidate.exists():
				error_json_path = candidate
			else:
				raise FileNotFoundError(f"Config error_json not found: {candidate}")
		else:
			json_dir = input_experiment_dir / "jsons"
			candidates = sorted(json_dir.glob("*_error_problems.json"), key=lambda p: p.stat().st_mtime) if json_dir.exists() else []
			if not candidates:
				candidates = sorted(input_experiment_dir.glob("*_error_problems.json"), key=lambda p: p.stat().st_mtime)
				if not candidates:
					raise FileNotFoundError(f"No *_error_problems.json found in {input_experiment_dir}")
			error_json_path = candidates[-1].resolve()

	config_base_name = args.config.stem
	if config_base_name.startswith("config_"):
		config_base_name = config_base_name[7:]

	base_results_dir = Path("results/composer").resolve()
	run_label = args.run_label or input_experiment_dir.name
	run_output_dir = base_results_dir / run_label / config_base_name

	return ComposerRuntimePaths(
		benchmark_asm_input_dir=benchmark_asm_input_dir,
		input_experiment_dir=input_experiment_dir,
		error_json_path=error_json_path,
		run_output_dir=run_output_dir,
		prompts_dir=run_output_dir / "prompts",
		raw_output_dir=run_output_dir / "raw_model_output",
		original_error_asm_dir=run_output_dir / f"original_error_{source_language}_asm",
		fixed_asm_dir=run_output_dir / f"fixed_{source_language}_asm",
		logs_dir=run_output_dir / "logs",
		reports_dir=run_output_dir / "txts",
		cleaned_output_dir=run_output_dir / "cleaned_model_output",
		clean_diagnostics_dir=run_output_dir / "clean_diagnostics",
		compile_probe_dir=run_output_dir / "compile_probe",
		validation_json_dir=run_output_dir / "validation_json",
		source_language=source_language,
		cfg_language=cfg_language,
		dfg_language=dfg_language,
	)


def _log(message: str) -> None:
	now = time.strftime("%H:%M:%S")
	print(f"[{now}] {message}")


def _read_text(path: Path) -> str:
	return path.read_text(encoding="utf-8")


def _write_text(path: Path, content: str) -> None:
	path.parent.mkdir(parents=True, exist_ok=True)
	path.write_text(content, encoding="utf-8")


def _append_text(path: Path, content: str) -> None:
	path.parent.mkdir(parents=True, exist_ok=True)
	with path.open("a", encoding="utf-8") as handle:
		handle.write(content)


def _one_line_error_reason(exc: BaseException) -> str:
	message = str(exc).replace("\n", " ").strip()
	if not message:
		message = exc.__class__.__name__
	if isinstance(exc, QuotaExhaustedError):
		return f"Composer aborted: quota_exhausted ({message})"
	return f"Composer aborted: {message}"


def _is_asm_like_line(line: str) -> bool:
	stripped = line.strip()
	if not stripped:
		return True
	if stripped.startswith((".", "//", "/*", "*", "#")):
		return True
	if re.match(r"^[A-Za-z_.$][\w.$]*:\s*$", stripped):
		return True
	if re.match(r"^b(\.[A-Za-z0-9]+)?\b", stripped):
		return True
	if re.match(r"^[a-z]{2,8}(\.[A-Za-z0-9]+)?\b", stripped):
		return True
	return False


def clean_model_output(text: str) -> tuple[str, dict[str, object]]:
	raw = text or ""
	lines = raw.splitlines()
	without_fences = [line for line in lines if not line.strip().startswith("```")]

	first_idx = 0
	while first_idx < len(without_fences) and not _is_asm_like_line(without_fences[first_idx]):
		first_idx += 1

	last_idx = len(without_fences) - 1
	while last_idx >= first_idx and not _is_asm_like_line(without_fences[last_idx]):
		last_idx -= 1

	if first_idx <= last_idx:
		cleaned_lines = without_fences[first_idx : last_idx + 1]
	else:
		cleaned_lines = []

	cleaned = "\n".join(cleaned_lines).strip()
	diagnostics = {
		"raw_line_count": len(lines),
		"fence_lines_removed": len(lines) - len(without_fences),
		"leading_non_asm_lines_removed": first_idx,
		"trailing_non_asm_lines_removed": max(0, len(without_fences) - last_idx - 1) if without_fences else 0,
		"cleaned_line_count": len(cleaned_lines),
		"is_empty_after_clean": cleaned == "",
	}
	return cleaned, diagnostics


def _load_hf_graph_data(dataset_id: str, column: str, hf_token: str | None) -> dict[str, str]:
	if not HAS_DATASETS:
		raise ImportError("The 'datasets' library is required. Install with: pip install datasets")

	_log(f"Fetching Hugging Face dataset: {dataset_id} (column: {column})")
	ds = load_dataset(dataset_id, split="O2", token=hf_token)

	graph_map: dict[str, str] = {}
	for row in ds:
		task_name = row["task_name"]
		if column not in row:
			raise KeyError(f"Column '{column}' not found in dataset {dataset_id}.")
		graph_map[task_name] = str(row[column])

	return graph_map


def _load_graph_data(cfg: dict[str, object], column: str, graph_kind: str) -> dict[str, str]:
	source = str(cfg.get("graph_source", "hf")).lower()
	if source in {"none", "off", "disabled"}:
		return {}
	if source != "hf":
		raise RuntimeError(f"Unsupported graph_source: {source}")

	hf_token = cfg.get("hf_token") or os.environ.get("HF_TOKEN") or os.environ.get("HUGGINGFACE_HUB_TOKEN")
	dataset_key = "cfg_dataset_id" if graph_kind == "cfg" else "dfg_dataset_id"
	default_id = "ryaasabsar/humaneval_asm_cfg" if graph_kind == "cfg" else "ryaasabsar/humaneval_asm_dfg"
	dataset_id = str(cfg.get(dataset_key, default_id))
	return _load_hf_graph_data(dataset_id, column, hf_token)


def _is_readable_file(path: Path) -> bool:
	if not path.exists() or not path.is_file():
		return False
	try:
		with path.open("r", encoding="utf-8"):
			return True
	except OSError:
		return False


def _is_readable_dir(path: Path) -> bool:
	if not path.exists() or not path.is_dir():
		return False
	try:
		next(path.iterdir(), None)
		return True
	except OSError:
		return False


def _extract_errored_entries(payload: dict[str, object]) -> list[dict[str, object]]:
	if "errored_problems" in payload and isinstance(payload["errored_problems"], list):
		return payload["errored_problems"]
	if isinstance(payload.get("problems"), list):
		return payload["problems"]
	return []


def load_problem_specs(
	paths: ComposerRuntimePaths,
	args: argparse.Namespace,
	cfg_data: dict[str, str],
	dfg_data: dict[str, str],
) -> list[ProblemSpec]:
	issues: list[str] = []
	require_cfg = args.prompt_config in {"cfg_only", "error_cfg", "cfg_dfg", "error_cfg_dfg"}
	require_dfg = args.prompt_config in {"dfg_only", "error_dfg", "cfg_dfg", "error_cfg_dfg"}

	if not _is_readable_file(paths.error_json_path):
		issues.append(f"Cannot read error JSON: {paths.error_json_path}")
	if not _is_readable_dir(paths.benchmark_asm_input_dir):
		issues.append(f"source asm directory is not readable: {paths.benchmark_asm_input_dir}")
	if not _is_readable_file(RUN_ERROR_JSON_SCRIPT):
		issues.append(f"validation script is missing/unreadable: {RUN_ERROR_JSON_SCRIPT}")

	try:
		payload = json.loads(paths.error_json_path.read_text(encoding="utf-8"))
	except Exception as exc:
		raise RuntimeError(f"Failed to parse error JSON {paths.error_json_path}: {exc}") from exc

	errored = _extract_errored_entries(payload)
	specs: list[ProblemSpec] = []

	for entry in errored:
		problem_name = str(entry.get("name", "")).strip()
		if not problem_name:
			continue

		source_matches = sorted(paths.benchmark_asm_input_dir.glob(f"{problem_name}_*.s"))
		if not source_matches:
			issues.append(f"missing source asm for {problem_name} in {paths.benchmark_asm_input_dir}")
			continue
		source_asm = source_matches[0]

		cfg_text = cfg_data.get(problem_name, "")
		if require_cfg and not cfg_text:
			issues.append(f"missing CFG for {problem_name}")

		dfg_text = dfg_data.get(problem_name, "")
		if require_dfg and not dfg_text:
			issues.append(f"missing DFG for {problem_name}")

		specs.append(
			ProblemSpec(
				name=problem_name,
				summary=str(entry.get("summary", "")),
				stderr=str(entry.get("stderr", "")),
				source_asm_path=source_asm,
				source_asm_name=source_asm.name,
				cfg_text=cfg_text,
				dfg_text=dfg_text,
			)
		)

	if issues:
		detail = "\n".join(f"- {item}" for item in issues)
		raise RuntimeError(f"Preflight validation failed. Terminating before execution.\n{detail}")

	return specs


def build_prompt(
	problem: ProblemSpec,
	source_asm: str,
	prompt_config: str,
	source_language: str,
	cfg_language: str,
	dfg_language: str,
	retry_context: dict[str, str] | None = None,
) -> str:
	sections: list[str] = [
		f"Repair the following translated {source_language} assembly function.",
		"",
		"Goal:",
		f"Produce a corrected {source_language} assembly function that preserves behavior",
		"",
		"Hard requirements:",
		"- Output only assembly text. No markdown fences. No prose.",
		"- Keep function signature/name expectations used by the harness (func0 unless explicitly required otherwise).",
		"- Keep the same target ISA/language as input; do not translate to a different ISA.",
		"- Preserve exact semantics and edge cases.",
		"- If CFG/DFG are provided, treat them as semantic guidance only",
		"",
	]

	if prompt_config in {"error_only", "error_cfg", "error_dfg", "error_cfg_dfg"}:
		sections.extend(
			[
				"Known failure summary from prior validation:",
				problem.summary or "(no summary provided)",
				"",
				"Known stderr from prior validation:",
				problem.stderr or "(no stderr provided)",
				"",
			]
		)

	sections.extend([f"Input {source_language} Assembly:", source_asm, ""])

	if prompt_config in {"cfg_only", "error_cfg", "cfg_dfg", "error_cfg_dfg"}:
		sections.extend(
			[
				f"CFG ({cfg_language} semantic graph; target output remains {source_language} assembly):",
				problem.cfg_text or "(CFG data not found)",
				"",
			]
		)

	if prompt_config in {"dfg_only", "error_dfg", "cfg_dfg", "error_cfg_dfg"}:
		sections.extend(
			[
				f"DFG ({dfg_language} semantic graph; target output remains {source_language} assembly):",
				problem.dfg_text or "(DFG data not found)",
				"",
			]
		)

	if retry_context and prompt_config.startswith("error_"):
		sections.extend(
			[
				"Previous failed attempt feedback (use this to fix the next output):",
				f"Attempt: {retry_context.get('attempt', '')}",
				f"Validation status: {retry_context.get('validation_status', '')}",
				"Validation summary:",
				retry_context.get("validation_summary", "(no summary provided)"),
				"",
				"Validation stderr:",
				retry_context.get("validation_stderr", "(no stderr provided)"),
				"",
				"Previous candidate assembly that failed:",
				retry_context.get("previous_code", ""),
				"",
				"Repair the previous candidate using the feedback above.",
				"",
			]
		)

	sections.append("Return only the final corrected assembly text.")
	return "\n".join(sections)


def _extract_retry_delay_seconds(error_text: str) -> int | None:
	match = re.search(r"retryDelay'\s*:\s*'(\d+)s'", error_text)
	if match:
		return int(match.group(1))
	return None


def _is_daily_quota_exhausted(error_text: str) -> bool:
	return (
		"RESOURCE_EXHAUSTED" in error_text
		and (
			"generate_requests_per_model_per_day" in error_text
			or "GenerateRequestsPerDayPerProjectPerModel" in error_text
		)
	)


async def call_gemini_with_retry(
	aclient: genai.client.AsyncClient,
	prompt: str,
	problem_name: str,
	model_name: str,
	max_retries: int,
	retry_base_seconds: float,
) -> str:
	last_error: Exception | None = None

	for attempt in range(1, max_retries + 1):
		try:
			_log(f"{problem_name}: sending request (attempt {attempt}/{max_retries})")
			response = await aclient.models.generate_content(model=model_name, contents=prompt)
			_log(f"{problem_name}: response received")
			return response.text if response.text else ""
		except Exception as exc:
			error_text = str(exc)
			if _is_daily_quota_exhausted(error_text):
				retry_delay = _extract_retry_delay_seconds(error_text)
				message = f"quota_exhausted: retryDelay={retry_delay}s" if retry_delay else "quota_exhausted"
				raise QuotaExhaustedError(message) from exc

			last_error = exc
			if attempt == max_retries:
				break

			backoff = retry_base_seconds * (2 ** (attempt - 1)) + random.uniform(0.0, 0.25)
			_log(
				f"{problem_name}: attempt {attempt}/{max_retries} failed ({exc}); "
				f"retrying after {backoff:.2f}s"
			)
			await asyncio.sleep(backoff)

	if last_error is None:
		raise RuntimeError(f"Unknown model error while processing {problem_name}")
	raise last_error


def validate_single_problem(
	paths: ComposerRuntimePaths,
	args: argparse.Namespace,
	problem_name: str,
	asm_filter_name: str,
	attempt: int,
) -> tuple[bool, str, ValidationFeedback]:
	validation_json_path = paths.validation_json_dir / f"{problem_name}_attempt{attempt}.json"
	probe_log_path = paths.compile_probe_dir / f"{problem_name}_attempt{attempt}.log"

	command = [
		sys.executable,
		str(RUN_ERROR_JSON_SCRIPT),
		str(paths.fixed_asm_dir),
		"--config",
		str(args.config.resolve()),
		"--problems",
		problem_name,
		asm_filter_name,
		"--output",
		str(validation_json_path),
	]

	completed = subprocess.run(command, capture_output=True, text=True, check=False)
	_write_text(
		probe_log_path,
		"\n".join(
			[
				f"command: {' '.join(command)}",
				f"returncode: {completed.returncode}",
				"stdout:\n" + completed.stdout,
				"stderr:\n" + completed.stderr,
			]
		),
	)

	if not validation_json_path.exists():
		note = f"Validation JSON was not generated (validator rc={completed.returncode})"
		return False, note, ValidationFeedback(
			status="validation_json_missing",
			summary=note,
			stderr=completed.stderr.strip(),
			errors_count=-1,
			problems_processed=0,
			validator_returncode=completed.returncode,
		)

	payload = json.loads(validation_json_path.read_text(encoding="utf-8"))
	errored_count = int(payload.get("errored_count", 0))
	problems_processed = int(payload.get("problems_processed", 0))
	if errored_count == 0 and problems_processed > 0:
		return True, "Passed validation", ValidationFeedback(
			status="passed",
			summary="Passed validation",
			stderr="",
			errors_count=0,
			problems_processed=problems_processed,
			validator_returncode=completed.returncode,
		)

	if problems_processed == 0:
		available = ", ".join(sorted(path.stem for path in paths.fixed_asm_dir.glob("*.s"))[:8])
		if not available:
			available = "(none)"
		note = (
			"Validation processed 0 files. "
			f"filters=[{problem_name}, {asm_filter_name}] "
			f"validator_rc={completed.returncode} "
			f"available_stems={available}"
		)
		return False, note, ValidationFeedback(
			status="no_files_processed",
			summary=note,
			stderr=completed.stderr.strip(),
			errors_count=errored_count,
			problems_processed=problems_processed,
			validator_returncode=completed.returncode,
		)

	errored_problems = payload.get("errored_problems", [])
	if errored_problems:
		first = errored_problems[0]
		status = str(first.get("status", "error"))
		summary = str(first.get("summary", "")).strip()
		stderr_text = str(first.get("stderr", "")).strip()
		stderr_short = stderr_text.splitlines()[0] if stderr_text else ""
		note = f"{status}: {summary}".strip()
		if stderr_short:
			note = f"{note} | stderr: {stderr_short}"
		return False, note, ValidationFeedback(
			status=status,
			summary=summary,
			stderr=stderr_text,
			errors_count=errored_count,
			problems_processed=problems_processed,
			validator_returncode=completed.returncode,
		)

	note = f"Validation inconclusive: processed={problems_processed}, errors={errored_count}, validator_rc={completed.returncode}"
	return False, note, ValidationFeedback(
		status="inconclusive",
		summary=note,
		stderr=completed.stderr.strip(),
		errors_count=errored_count,
		problems_processed=problems_processed,
		validator_returncode=completed.returncode,
	)


def validate_all_fixed_outputs(paths: ComposerRuntimePaths, args: argparse.Namespace) -> tuple[Path, int]:
	final_json_path = paths.validation_json_dir / "final_error_problems.json"
	command = [
		sys.executable,
		str(RUN_ERROR_JSON_SCRIPT),
		str(paths.fixed_asm_dir),
		"--config",
		str(args.config.resolve()),
		"--output",
		str(final_json_path),
	]

	subprocess.run(command, capture_output=True, text=True, check=False)
	if not final_json_path.exists():
		return final_json_path, -1

	payload = json.loads(final_json_path.read_text(encoding="utf-8"))
	return final_json_path, int(payload.get("errored_count", 0))


async def process_one_problem(
	problem: ProblemSpec,
	paths: ComposerRuntimePaths,
	args: argparse.Namespace,
	aclient: genai.client.AsyncClient,
	results: list[ProblemResult],
	result_lock: asyncio.Lock,
	progress: dict[str, int],
	progress_lock: asyncio.Lock,
	resume_state: dict[str, dict[str, object]] | None = None,
) -> None:
	problem_name = problem.name
	source_asm = await asyncio.to_thread(_read_text, problem.source_asm_path)

	original_copy_path = paths.original_error_asm_dir / problem.source_asm_name
	if not original_copy_path.exists():
		await asyncio.to_thread(shutil.copy2, problem.source_asm_path, original_copy_path)

	fixed_asm_path = paths.fixed_asm_dir / problem.source_asm_name
	attempt_records: list[dict[str, object]] = []
	final_note = "Unknown"
	succeeded = False
	retry_context: dict[str, str] | None = None
	start_attempt = 1

	if resume_state and problem_name in resume_state:
		state = resume_state[problem_name]
		previous_attempts = list(state.get("attempts", []))
		attempt_records.extend(previous_attempts)
		succeeded = bool(state.get("succeeded", False))
		final_note = str(state.get("final_note", final_note))
		attempts_used = int(state.get("attempts_used", len(previous_attempts)))

		if succeeded or attempts_used >= args.max_retries:
			async with result_lock:
				results.append(
					ProblemResult(
						name=problem_name,
						source_asm_path=problem.source_asm_path,
						fixed_asm_path=fixed_asm_path,
						succeeded=succeeded,
						attempts_used=attempts_used,
						final_note=final_note,
						attempts=attempt_records,
					)
				)
			async with progress_lock:
				progress["done"] += 1
				print(f"[{progress['done']}/{progress['total']}] {'OK' if succeeded else 'SKIP'} {problem_name} | {final_note}")
			return

		if previous_attempts:
			last = previous_attempts[-1]
			if last.get("status") != "passed":
				retry_context = {
					"attempt": str(last.get("attempt", "")),
					"validation_status": str(last.get("validation_status", "")),
					"validation_summary": str(last.get("validation_summary", "")),
					"validation_stderr": str(last.get("validation_stderr", "")) or "(no stderr provided)",
					"previous_code": str(last.get("previous_code", "")),
				}
		start_attempt = attempts_used + 1

	for attempt in range(start_attempt, args.max_retries + 1):
		prompt = build_prompt(
			problem=problem,
			source_asm=source_asm,
			prompt_config=args.prompt_config,
			source_language=paths.source_language,
			cfg_language=paths.cfg_language,
			dfg_language=paths.dfg_language,
			retry_context=retry_context,
		)
		prompt_path = paths.prompts_dir / f"{problem_name}_attempt{attempt}.txt"
		await asyncio.to_thread(_write_text, prompt_path, prompt)

		try:
			raw_output = await call_gemini_with_retry(
				aclient=aclient,
				prompt=prompt,
				problem_name=problem_name,
				model_name=args.model,
				max_retries=args.max_retries,
				retry_base_seconds=args.retry_base_seconds,
			)
		except Exception as exc:
			attempt_records.append({"attempt": attempt, "status": "model_error", "note": str(exc)})
			final_note = str(exc)
			if isinstance(exc, QuotaExhaustedError):
				raise
			break

		raw_path = paths.raw_output_dir / f"{problem_name}_attempt{attempt}.txt"
		await asyncio.to_thread(_write_text, raw_path, raw_output)

		cleaned, diagnostics = clean_model_output(raw_output)
		cleaned_path = paths.cleaned_output_dir / f"{problem_name}_attempt{attempt}.txt"
		diag_path = paths.clean_diagnostics_dir / f"{problem_name}_attempt{attempt}.json"
		await asyncio.to_thread(_write_text, cleaned_path, cleaned)
		await asyncio.to_thread(_write_text, diag_path, json.dumps(diagnostics, indent=2) + "\n")

		await asyncio.to_thread(_write_text, fixed_asm_path, cleaned)
		asm_filter_name = Path(problem.source_asm_name).stem
		passed, note, feedback = await asyncio.to_thread(
			validate_single_problem,
			paths,
			args,
			problem_name,
			asm_filter_name,
			attempt,
		)

		attempt_records.append(
			{
				"attempt": attempt,
				"status": "passed" if passed else "failed",
				"note": note,
				"prompt_path": str(prompt_path),
				"raw_output_path": str(raw_path),
				"cleaned_output_path": str(cleaned_path),
				"clean_diagnostics_path": str(diag_path),
				"validation_status": feedback.status,
				"validation_summary": feedback.summary,
				"validation_stderr": feedback.stderr,
				"previous_code": cleaned,
			}
		)
		final_note = note

		if passed:
			succeeded = True
			break

		retry_context = {
			"attempt": str(attempt),
			"validation_status": feedback.status,
			"validation_summary": feedback.summary,
			"validation_stderr": feedback.stderr or "(no stderr provided)",
			"previous_code": cleaned,
		}

	async with result_lock:
		results.append(
			ProblemResult(
				name=problem_name,
				source_asm_path=problem.source_asm_path,
				fixed_asm_path=fixed_asm_path,
				succeeded=succeeded,
				attempts_used=len(attempt_records),
				final_note=final_note,
				attempts=attempt_records,
			)
		)
	async with progress_lock:
		progress["done"] += 1
		print(f"[{progress['done']}/{progress['total']}] {'OK' if succeeded else 'FAIL'} {problem_name} | {final_note}")


async def worker_loop(
	worker_id: int,
	queue: asyncio.Queue[ProblemSpec],
	paths: ComposerRuntimePaths,
	args: argparse.Namespace,
	aclient: genai.client.AsyncClient,
	results: list[ProblemResult],
	result_lock: asyncio.Lock,
	progress: dict[str, int],
	progress_lock: asyncio.Lock,
	stop_event: asyncio.Event,
	resume_state: dict[str, dict[str, object]] | None = None,
) -> None:
	while not stop_event.is_set():
		try:
			problem = queue.get_nowait()
		except asyncio.QueueEmpty:
			return
		try:
			await process_one_problem(
				problem=problem,
				paths=paths,
				args=args,
				aclient=aclient,
				results=results,
				result_lock=result_lock,
				progress=progress,
				progress_lock=progress_lock,
				resume_state=resume_state,
			)
		except QuotaExhaustedError as exc:
			stop_event.set()
			await asyncio.to_thread(
				_append_text,
				paths.logs_dir / "failures.log",
				f"GLOBAL: {exc}\n",
			)
			raise
		except Exception as exc:
			await asyncio.to_thread(
				_append_text,
				paths.logs_dir / "failures.log",
				f"{problem.name}: unhandled worker error: {exc}\n",
			)
		finally:
			queue.task_done()


async def periodic_progress_updates(
	progress: dict[str, int],
	progress_lock: asyncio.Lock,
	stop_event: asyncio.Event,
	interval_seconds: float = 30.0,
) -> None:
	while not stop_event.is_set():
		await asyncio.sleep(interval_seconds)
		if stop_event.is_set():
			return
		async with progress_lock:
			done = progress.get("done", 0)
			total = progress.get("total", 0)
		if done >= total:
			return
		_log(f"Progress update: completed={done}/{total}, remaining={max(total - done, 0)}")


def write_reports(
	args: argparse.Namespace,
	paths: ComposerRuntimePaths,
	problems: list[ProblemSpec],
	results: list[ProblemResult],
	started_at: datetime,
	finished_at: datetime,
	final_validation_path: Path,
	final_validation_error_count: int,
) -> None:
	by_name = {result.name: result for result in results}
	processed_count = len(results)
	success_count = sum(1 for result in results if result.succeeded)
	fail_count = len(problems) - success_count

	total_problems = len(list(paths.benchmark_asm_input_dir.glob("*.s")))
	overall_successful = total_problems - final_validation_error_count
	success_rate = (overall_successful / total_problems * 100) if total_problems > 0 else 0

	lines = [
		f"Run started: {started_at.isoformat(timespec='seconds')}",
		f"Run finished: {finished_at.isoformat(timespec='seconds')}",
		f"Input experiment dir: {paths.input_experiment_dir.absolute()}",
		f"Run label: {args.run_label or paths.input_experiment_dir.name}",
		f"Source language: {paths.source_language}",
		f"Model: {args.model}",
		f"Prompt config: {args.prompt_config}",
		f"Translator: Multi-pass Composer ({args.prompt_config} iterative refinement)",
		f"Total problems in experiment: {total_problems}",
		f"Errored problems processed: {len(problems)}",
		f"Composer processed: {processed_count}",
		f"Composer succeeded: {success_count}",
		f"Composer failed: {fail_count}",
		f"Global Total Overall problems successfully passed: {overall_successful}/{total_problems} ({success_rate:.1f}%)",
		f"Final validation JSON: {final_validation_path}",
		"",
		"Failed problems (Post-Composer):",
	]
	for result in sorted(results, key=lambda item: item.name):
		if not result.succeeded:
			lines.append(f"- {result.name}: {result.final_note}")
	if fail_count == 0:
		lines.append("- none")

	if results:
		lines.extend(["", "========================================", "--- Per Problem Details ---", "========================================"])
		for problem in sorted(problems, key=lambda item: item.name):
			lines.extend(["", f"Problem: {problem.name}", f"Source asm: {problem.source_asm_path}"])
			result = by_name.get(problem.name)
			if not result:
				lines.append("Result: missing")
				continue
			lines.extend(
				[
					f"Succeeded: {result.succeeded}",
					f"Attempts used: {result.attempts_used}",
					f"Final note: {result.final_note}",
					f"Fixed asm path: {result.fixed_asm_path}",
					"Attempts:",
				]
			)
			for attempt in result.attempts:
				lines.append(f"  - attempt {attempt.get('attempt')}: {attempt.get('status')} | {attempt.get('note')}")

	timestamp = finished_at.strftime("%Y%m%d_%H%M%S")
	report_path = paths.reports_dir / f"{timestamp}_report.txt"
	_write_text(report_path, "\n".join(lines) + "\n")
	_log(f"Report written to {report_path}")


async def run_async(
	args: argparse.Namespace,
	paths: ComposerRuntimePaths,
	problems: list[ProblemSpec],
	api_key: str,
	resume_state: dict[str, dict[str, object]] | None = None,
) -> tuple[list[ProblemResult], Exception | None]:
	queue: asyncio.Queue[ProblemSpec] = asyncio.Queue()
	for p in problems:
		queue.put_nowait(p)

	results: list[ProblemResult] = []
	result_lock = asyncio.Lock()
	progress_lock = asyncio.Lock()
	progress = {"done": 0, "total": len(problems)}
	stop_event = asyncio.Event()

	worker_count = max(1, min(args.max_concurrency, len(problems)))
	_log(f"Opening async Gemini client with {worker_count} workers")
	async with genai.Client(api_key=api_key).aio as aclient:
		progress_task = asyncio.create_task(periodic_progress_updates(progress, progress_lock, stop_event))
		tasks = [
			asyncio.create_task(
				worker_loop(
					worker_id=i,
					queue=queue,
					paths=paths,
					args=args,
					aclient=aclient,
					results=results,
					result_lock=result_lock,
					progress=progress,
					progress_lock=progress_lock,
					stop_event=stop_event,
					resume_state=resume_state,
				)
			)
			for i in range(1, worker_count + 1)
		]
		error: Exception | None = None
		try:
			await asyncio.gather(*tasks)
		except Exception as exc:
			error = exc
			stop_event.set()
			for task in tasks:
				if not task.done():
					task.cancel()
			await asyncio.gather(*tasks, return_exceptions=True)
		finally:
			stop_event.set()
			if not progress_task.done():
				progress_task.cancel()
			await asyncio.gather(progress_task, return_exceptions=True)

	return results, error


def _checkpoint_path(paths: ComposerRuntimePaths, prompt_config: str) -> Path:
	return paths.logs_dir / f"checkpoint_{prompt_config}.json"


def _run_all_checkpoint_path() -> Path:
	return Path("results/composer/run_all_checkpoint.json").resolve()


def save_checkpoint(
	paths: ComposerRuntimePaths,
	args: argparse.Namespace,
	prompt_config: str,
	started_at: datetime,
	status: str,
	results: list[ProblemResult],
	error_reason: str | None,
	current_config_index: int | None = None,
) -> Path:
	payload = {
		"status": status,
		"run_started": started_at.isoformat(timespec="seconds"),
		"run_updated": datetime.now().isoformat(timespec="seconds"),
		"prompt_config": prompt_config,
		"config_path": str(args.config.resolve()),
		"input_dir": str(args.input_dir.resolve()),
		"run_output_dir": str(paths.run_output_dir.resolve()),
		"max_retries": args.max_retries,
		"error_reason": error_reason,
		"results": [
			{
				"name": r.name,
				"source_asm_path": str(r.source_asm_path),
				"fixed_asm_path": str(r.fixed_asm_path),
				"succeeded": r.succeeded,
				"attempts_used": r.attempts_used,
				"final_note": r.final_note,
				"attempts": r.attempts,
			}
			for r in results
		],
	}
	if current_config_index is not None:
		payload["current_config_index"] = current_config_index
		payload["prompt_configs"] = PROMPT_CONFIGS

	checkpoint_path = _checkpoint_path(paths, prompt_config)
	_write_text(checkpoint_path, json.dumps(payload, indent=2) + "\n")
	return checkpoint_path


def load_checkpoint(checkpoint_path: Path) -> dict[str, object]:
	return json.loads(checkpoint_path.read_text(encoding="utf-8"))


def build_resume_state_from_checkpoint(payload: dict[str, object]) -> dict[str, dict[str, object]]:
	resume: dict[str, dict[str, object]] = {}
	results = payload.get("results", [])
	if isinstance(results, list):
		for entry in results:
			if not isinstance(entry, dict):
				continue
			name = str(entry.get("name", "")).strip()
			if not name:
				continue
			resume[name] = {
				"succeeded": bool(entry.get("succeeded", False)),
				"attempts_used": int(entry.get("attempts_used", 0)),
				"final_note": str(entry.get("final_note", "")),
				"attempts": list(entry.get("attempts", [])),
			}
	return resume


def _configure_args_from_config(args: argparse.Namespace, cfg: dict[str, object], prompt_config: str) -> None:
	args.source_language = str(cfg.get("target_arch", cfg.get("source_language", "arm")))
	args.cfg_language = str(cfg.get("cfg_dataset_column", cfg.get("source_dataset_column", "x86_64")))
	args.dfg_language = str(cfg.get("dfg_dataset_column", cfg.get("source_dataset_column", "x86_64")))

	args.model = str(cfg.get("composer_model", cfg.get("model_name", "gemini-2.5-flash")))
	args.prompt_config = prompt_config
	args.max_concurrency = int(cfg.get("max_workers", 20))
	args.max_retries = int(cfg.get("max_retries", 3))
	args.retry_base_seconds = float(cfg.get("retry_base_seconds", 2.0))


def main() -> int:
	args = parse_args()
	if not HAS_GENAI:
		print("Install google-genai package: pip install google-genai", file=sys.stderr)
		return 2

	def run_single_config(prompt_config: str) -> int:
		try:
			api_key_source, api_key = resolve_gemini_api_key()
			cfg = _read_config(args.config)
			_configure_args_from_config(args, cfg, prompt_config)

			paths = resolve_runtime_paths(args, cfg)

			resume_state: dict[str, dict[str, object]] | None = None
			if args.resume_checkpoint:
				payload = load_checkpoint(args.resume_checkpoint)
				resume_state = build_resume_state_from_checkpoint(payload)
				if payload.get("prompt_config") and payload.get("prompt_config") != prompt_config:
					raise RuntimeError("Checkpoint prompt_config does not match requested prompt_config")

			require_cfg = args.prompt_config in {"cfg_only", "error_cfg", "cfg_dfg", "error_cfg_dfg"}
			require_dfg = args.prompt_config in {"dfg_only", "error_dfg", "cfg_dfg", "error_cfg_dfg"}

			cfg_data = _load_graph_data(cfg, args.cfg_language, "cfg") if require_cfg else {}
			dfg_data = _load_graph_data(cfg, args.dfg_language, "dfg") if require_dfg else {}

			problems = load_problem_specs(paths, args, cfg_data, dfg_data)

			if resume_state:
				problems = [
					p
					for p in problems
					if not (
						resume_state.get(p.name, {}).get("succeeded")
						or int(resume_state.get(p.name, {}).get("attempts_used", 0)) >= args.max_retries
					)
				]

		except Exception as exc:
			print(str(exc), file=sys.stderr)
			return 2

		print("\n" + "=" * 60)
		print(" COMPOSER PIPELINE CONFIGURATION")
		print("=" * 60)
		print(f"Benchmark ASM input: {paths.benchmark_asm_input_dir}")
		print(f"Config JSON: {args.config.absolute()}")
		print(f"Error JSON: {paths.error_json_path}")
		print(f"Validation Script: {RUN_ERROR_JSON_SCRIPT}")
		print(f"Run output dir: {paths.run_output_dir}")
		print(f"Model: {args.model}")
		print(f"Prompt Config: {args.prompt_config}")
		print(f"Problems to repair: {len(problems)}")
		print(f"API key source: {api_key_source}")
		print("=" * 60 + "\n")

		if not args.yes:
			confirm = input("Directories and config verified. Do you want to proceed with this run? [y/N]: ").strip().lower()
			if confirm not in ["y", "yes"]:
				print("Run cancelled by user. Exiting.")
				sys.exit(0)

		print("\nStarting execution...")

		paths.prompts_dir.mkdir(parents=True, exist_ok=True)
		paths.raw_output_dir.mkdir(parents=True, exist_ok=True)
		paths.original_error_asm_dir.mkdir(parents=True, exist_ok=True)
		paths.fixed_asm_dir.mkdir(parents=True, exist_ok=True)
		paths.logs_dir.mkdir(parents=True, exist_ok=True)
		paths.reports_dir.mkdir(parents=True, exist_ok=True)
		paths.cleaned_output_dir.mkdir(parents=True, exist_ok=True)
		paths.clean_diagnostics_dir.mkdir(parents=True, exist_ok=True)
		paths.compile_probe_dir.mkdir(parents=True, exist_ok=True)
		paths.validation_json_dir.mkdir(parents=True, exist_ok=True)

		started_at = datetime.now()

		if not problems:
			finished_at = datetime.now()
			final_validation_path, final_validation_error_count = validate_all_fixed_outputs(paths, args)
			write_reports(args, paths, problems, [], started_at, finished_at, final_validation_path, final_validation_error_count)
			print("No errored problems found in input JSON.")
			return 0

		results, error = asyncio.run(run_async(args, paths, problems, api_key, resume_state))

		finished_at = datetime.now()
		final_validation_path, final_validation_error_count = validate_all_fixed_outputs(paths, args)
		write_reports(args, paths, problems, results, started_at, finished_at, final_validation_path, final_validation_error_count)

		if error is not None:
			reason = _one_line_error_reason(error)
			checkpoint_path = save_checkpoint(paths, args, prompt_config, started_at, "aborted", results, reason)
			_append_text(paths.logs_dir / "failures.log", reason + "\n")
			print(reason, file=sys.stderr)
			print(f"Checkpoint saved: {checkpoint_path}")
			return 2

		success_count = sum(1 for result in results if result.succeeded)
		fail_count = len(results) - success_count
		print(f"Composer finished. success={success_count} fail={fail_count}")
		checkpoint_path = save_checkpoint(paths, args, prompt_config, started_at, "completed", results, None)
		print(f"Checkpoint saved: {checkpoint_path}")
		return 0 if fail_count == 0 and final_validation_error_count == 0 else 1

	if args.all_prompt_configs:
		exit_code = 0
		start_index = 0
		run_all_checkpoint = _run_all_checkpoint_path()
		if args.resume_all and run_all_checkpoint.exists():
			payload = load_checkpoint(run_all_checkpoint)
			start_index = int(payload.get("current_config_index", 0))
		for index, prompt_config in enumerate(PROMPT_CONFIGS):
			if index < start_index:
				continue
			print("\n" + "=" * 60)
			print(f" RUNNING PROMPT CONFIG: {prompt_config}")
			print("=" * 60)
			exit_code = max(exit_code, run_single_config(prompt_config))
			_write_text(
				run_all_checkpoint,
				json.dumps({"current_config_index": index + 1, "prompt_configs": PROMPT_CONFIGS}, indent=2) + "\n",
			)
		return exit_code

	prompt_config = args.prompt_config or "base"
	return run_single_config(prompt_config)


if __name__ == "__main__":
	raise SystemExit(main())
