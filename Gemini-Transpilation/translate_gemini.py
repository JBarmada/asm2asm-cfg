from __future__ import annotations

import argparse
import asyncio
import json
import random
import re
from dataclasses import replace
from datetime import datetime
from pathlib import Path
from typing import Any

from transpilation_runtime import (
    ProviderUsageSummary,
    benchmark_display_name,
    benchmark_root_for,
    build_output_dirs,
    clean_model_output,
    evaluate_records,
    isa_dataset_column,
    isa_display_name,
    load_checkpoint,
    load_hf_records,
    normalize_benchmark_id,
    normalize_isa,
    provider_usage_summary_from_dict,
    provider_usage_summary_to_dict,
    resolve_concurrency_settings,
    save_checkpoint,
    validation_payload,
    write_error_json,
    write_eval_results_json,
    write_report,
    write_run_summary_json,
    write_validation_json,
)

try:
    from google import genai

    HAS_GENAI = True
except ImportError:
    HAS_GENAI = False

DEFAULT_PROMPT_TEMPLATE = """Translate the following assembly code from {source_isa} to {target_isa}.

Hard requirements:
- Output only the translated assembly text.
- Do not include markdown fences, comments to the user, or any prose.
- Preserve semantics, including edge cases and calling-convention behavior.
- Keep the result in {target_isa}; do not emit a different ISA or language.

Source assembly:
{source_code}
"""


class QuotaExhaustedError(RuntimeError):
    pass


class FatalProviderError(RuntimeError):
    pass


class TaskTranslationError(RuntimeError):
    def __init__(self, task_name: str, message: str, *, fatal: bool = False, quota: bool = False) -> None:
        super().__init__(message)
        self.task_name = task_name
        self.fatal = fatal
        self.quota = quota


def parse_args(argv: list[str] | None = None) -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Translate benchmark ASM with Gemini and optionally evaluate it.")
    parser.add_argument("--config", type=Path, required=True, help="Path to config JSON.")
    parser.add_argument("--benchmark", required=True, choices=["humaneval", "bringup", "mceval"], help="Benchmark id.")
    parser.add_argument("--source-isa", required=True, help="Canonical or legacy source ISA.")
    parser.add_argument("--target-isa", required=True, help="Canonical or legacy target ISA.")
    parser.add_argument("--benchmark-root", type=Path, help="Benchmark root override.")
    parser.add_argument("--dataset-id", help="Hugging Face dataset id override.")
    parser.add_argument("--run-label", help="Optional run label override.")
    parser.add_argument("--results-root", type=Path, default=Path("results"), help="Root directory for outputs.")
    parser.add_argument("--opt-level", default="O2", choices=["O0", "O2"], help="Dataset/eval optimization split.")
    parser.add_argument("--prompt-concurrency", type=int, help="Override translation concurrency.")
    parser.add_argument("--validation-concurrency", type=int, help="Override evaluation concurrency.")
    parser.add_argument("--max-workers", type=int, help="Backward-compatible alias for prompt/validation concurrency.")
    parser.add_argument("--max-retries", type=int, help="Override API retries.")
    parser.add_argument("--retry-base-seconds", type=float, help="Override API backoff.")
    parser.add_argument("--resume", action="store_true", help="Resume from checkpoint and existing artifacts.")
    parser.add_argument(
        "--resume-checkpoint",
        type=Path,
        help="Checkpoint path. Relative paths are resolved under the run output directory.",
    )
    parser.add_argument("--yes", action="store_true", help="Skip confirmation prompt.")
    return parser.parse_args(argv)


def _resolve_env_api_key() -> str:
    smart_quotes = "\u2018\u2019\u201c\u201d"
    for env_name in ("GOOGLE_API_KEY", "GEMINI_API_KEY"):
        raw = __import__("os").environ.get(env_name)
        if raw is None:
            continue
        value = raw.strip().strip("\"'").strip(smart_quotes)
        if not value:
            continue
        if any(ch in value for ch in smart_quotes):
            raise RuntimeError(f"Environment variable {env_name} contains smart quotes.")
        return value
    raise RuntimeError("Missing Gemini API key. Set GOOGLE_API_KEY or GEMINI_API_KEY.")


def _model_tag(cfg: dict[str, Any], config_path: Path) -> str:
    explicit = str(cfg.get("model_tag") or "").strip()
    if explicit:
        return explicit
    model_name = str(cfg.get("model_name", config_path.stem))
    return re.sub(r"[^A-Za-z0-9._-]+", "-", model_name).strip("-")


def _output_root(args: argparse.Namespace, cfg: dict[str, Any], benchmark_id: str, source_isa: str, target_isa: str) -> Path:
    run_label = args.run_label
    if run_label:
        return args.results_root.resolve() / run_label
    return (
        args.results_root.resolve()
        / benchmark_id
        / _model_tag(cfg, args.config)
        / f"{source_isa}-to-{target_isa}"
        / args.opt_level
    )


def _resolve_checkpoint_path(output_root: Path, checkpoint_arg: Path | None) -> Path:
    if checkpoint_arg is None:
        return output_root / "logs" / "checkpoint.json"
    if checkpoint_arg.is_absolute():
        return checkpoint_arg
    return output_root / checkpoint_arg


def _print_preflight(
    *,
    config_path: Path,
    benchmark_id: str,
    benchmark_root: Path,
    dataset_id: str,
    source_isa: str,
    target_isa: str,
    output_root: Path,
    checkpoint_path: Path,
    unsupported_reason: str | None,
    cfg: dict[str, Any],
) -> None:
    print("Preflight summary:")
    print(f"Config: {config_path.resolve()}")
    print(f"Benchmark: {benchmark_display_name(benchmark_id)}")
    print(f"Benchmark root: {benchmark_root.resolve()}")
    print(f"Dataset: {dataset_id}")
    print(f"HF split: {cfg.get('opt_level', 'O2')}")
    print(f"Source ISA: {isa_display_name(source_isa)} ({isa_dataset_column(source_isa)})")
    print(f"Target ISA: {isa_display_name(target_isa)}")
    print(f"Model: {cfg.get('model_name', 'gemini-3-flash-preview')}")
    print(f"Action: {cfg.get('action', 'compile_and_run')}")
    print(f"Prompt concurrency: {cfg.get('prompt_concurrency')}")
    print(f"Validation concurrency: {cfg.get('validation_concurrency')}")
    print(f"Output root: {output_root}")
    print(f"Checkpoint: {checkpoint_path}")
    if unsupported_reason:
        print(f"Skip reason: {unsupported_reason}")


def _confirm_or_exit(yes: bool) -> None:
    if yes:
        return
    answer = input("Continue? [y/N]: ").strip().lower()
    if answer not in {"y", "yes"}:
        raise SystemExit(0)


def _artifact_paths(dirs: dict[str, Path], task_name: str) -> dict[str, str]:
    return {
        "prompt": str(dirs["prompts"] / f"{task_name}.txt"),
        "raw_output": str(dirs["raw_model_output"] / f"{task_name}.txt"),
        "cleaned_output": str(dirs["cleaned_model_output"] / f"{task_name}.txt"),
        "clean_diagnostics": str(dirs["clean_diagnostics"] / f"{task_name}.json"),
        "translated_asm": str(dirs["translated_asm"] / f"{task_name}.s"),
        "validation_json": str(dirs["validation_json"] / f"{task_name}.json"),
    }


def _default_task_entry(task_name: str, dirs: dict[str, Path]) -> dict[str, object]:
    return {
        "task_name": task_name,
        "translation_status": "pending",
        "evaluation_status": "pending",
        "translation_resumed": False,
        "evaluation_resumed": False,
        "translation_error": "",
        "evaluation_error": "",
        "artifacts": _artifact_paths(dirs, task_name),
    }


def _build_checkpoint_payload(
    *,
    args: argparse.Namespace,
    cfg: dict[str, Any],
    benchmark_id: str,
    source_isa: str,
    target_isa: str,
    dataset_id: str,
    benchmark_root: Path,
    output_root: Path,
    checkpoint_path: Path,
    dirs: dict[str, Path],
    records: list[dict[str, str]],
) -> dict[str, object]:
    return {
        "run_started": datetime.now().isoformat(timespec="seconds"),
        "run_finished": None,
        "status": "running",
        "resume_mode": bool(args.resume),
        "config_path": str(args.config.resolve()),
        "checkpoint_path": str(checkpoint_path.resolve()),
        "output_root": str(output_root.resolve()),
        "benchmark": benchmark_id,
        "benchmark_root": str(benchmark_root.resolve()),
        "dataset_id": dataset_id,
        "source_isa": source_isa,
        "target_isa": target_isa,
        "opt_level": str(cfg.get("opt_level", args.opt_level)),
        "model_name": str(cfg.get("model_name", "gemini-3-flash-preview")),
        "action": str(cfg.get("action", "compile_and_run")),
        "prompt_concurrency": int(cfg.get("prompt_concurrency", 1)),
        "validation_concurrency": int(cfg.get("validation_concurrency", 1)),
        "provider_usage": None,
        "tasks": {record["task_name"]: _default_task_entry(record["task_name"], dirs) for record in records},
    }


def _reconcile_checkpoint_state(
    checkpoint: dict[str, object],
    *,
    records: list[dict[str, str]],
    dirs: dict[str, Path],
    resume_mode: bool,
    action: str,
) -> dict[str, object]:
    tasks = checkpoint.setdefault("tasks", {})
    for record in records:
        task_name = record["task_name"]
        entry = tasks.setdefault(task_name, _default_task_entry(task_name, dirs))
        entry["artifacts"] = _artifact_paths(dirs, task_name)
        if resume_mode:
            artifacts = entry["artifacts"]
            cleaned_path = Path(str(artifacts["cleaned_output"]))
            asm_path = Path(str(artifacts["translated_asm"]))
            validation_path = Path(str(artifacts["validation_json"]))
            if cleaned_path.exists() and asm_path.exists():
                entry["translation_status"] = "translated"
                entry["translation_resumed"] = True
                entry["translation_error"] = ""
            if action == "compile_and_run":
                if validation_path.exists():
                    entry["evaluation_status"] = "validated"
                    entry["evaluation_resumed"] = True
                    entry["evaluation_error"] = ""
                elif entry.get("evaluation_status") == "validated":
                    entry["evaluation_status"] = "pending"
                    entry["evaluation_resumed"] = False
            else:
                entry["evaluation_status"] = "pending"
                entry["evaluation_resumed"] = False
        elif action != "compile_and_run":
            entry["evaluation_status"] = "pending"
            entry["evaluation_resumed"] = False
    return checkpoint


def _persist_checkpoint(
    checkpoint_path: Path,
    checkpoint: dict[str, object],
    *,
    provider: "GeminiProvider | None" = None,
    status: str | None = None,
    finished_at: datetime | None = None,
) -> None:
    if status is not None:
        checkpoint["status"] = status
    if finished_at is not None:
        checkpoint["run_finished"] = finished_at.isoformat(timespec="seconds")
    if provider is not None:
        checkpoint["provider_usage"] = provider_usage_summary_to_dict(provider.get_usage_summary())
    save_checkpoint(checkpoint_path, checkpoint)


def _load_validation_payload(path: Path) -> dict[str, Any]:
    return json.loads(path.read_text(encoding="utf-8"))


def _translation_failure_payload(task_name: str, message: str, asm_path: str) -> dict[str, Any]:
    return {
        "file": task_name,
        "pred": "",
        "success": 0,
        "success_bool": False,
        "runtime_seconds": 0.0,
        "run_output": message,
        "error_stage": "translation",
        "status": "translation_failed",
        "summary": message,
        "stdout": "",
        "stderr": message,
        "failing_command": "",
        "asm_path": asm_path,
        "output_dir": "",
        "commands": [],
    }


def _translated_only_payload(task_name: str, pred: str, asm_path: str) -> dict[str, Any]:
    return {
        "file": task_name,
        "pred": pred,
        "success": None,
        "success_bool": None,
        "runtime_seconds": 0.0,
        "run_output": "",
        "error_stage": None,
        "status": "translated",
        "summary": "Translation produced without evaluation",
        "stdout": "",
        "stderr": "",
        "failing_command": "",
        "asm_path": asm_path,
        "output_dir": "",
        "commands": [],
    }


def _summarize_counts(
    *,
    total_records: int,
    translated_records: int,
    evaluated_payloads: dict[str, dict[str, Any]],
    checkpoint: dict[str, object],
) -> dict[str, int]:
    tasks = checkpoint.get("tasks", {})
    translation_failed = sum(1 for item in tasks.values() if item.get("translation_status") == "failed")
    translation_resumed = sum(1 for item in tasks.values() if item.get("translation_resumed"))
    evaluation_resumed = sum(1 for item in tasks.values() if item.get("evaluation_resumed"))
    passed = sum(1 for payload in evaluated_payloads.values() if payload.get("success_bool") is True)
    failed = sum(1 for payload in evaluated_payloads.values() if payload.get("success_bool") is False)
    return {
        "total_records": total_records,
        "translated_records": translated_records,
        "translation_failed": translation_failed,
        "translation_resumed": translation_resumed,
        "evaluated_records": len(evaluated_payloads),
        "evaluation_resumed": evaluation_resumed,
        "evaluation_passed": passed,
        "evaluation_failed": failed,
    }


def _make_run_summary(
    *,
    started_at: datetime,
    finished_at: datetime,
    run_status: str,
    checkpoint: dict[str, object],
    counts: dict[str, int],
) -> dict[str, object]:
    payload: dict[str, object] = {
        "run_started": started_at.isoformat(timespec="seconds"),
        "run_finished": finished_at.isoformat(timespec="seconds"),
        "run_status": run_status,
        "benchmark": checkpoint.get("benchmark"),
        "dataset_id": checkpoint.get("dataset_id"),
        "source_isa": checkpoint.get("source_isa"),
        "target_isa": checkpoint.get("target_isa"),
        "opt_level": checkpoint.get("opt_level"),
        "model_name": checkpoint.get("model_name"),
        "action": checkpoint.get("action"),
        "resume_mode": checkpoint.get("resume_mode"),
        "prompt_concurrency": checkpoint.get("prompt_concurrency"),
        "validation_concurrency": checkpoint.get("validation_concurrency"),
        "counts": counts,
    }
    usage_summary = provider_usage_summary_from_dict(checkpoint.get("provider_usage"))
    usage_payload = provider_usage_summary_to_dict(usage_summary)
    if usage_payload is not None:
        payload["provider_usage"] = usage_payload
    return payload


class GeminiProvider:
    def __init__(
        self,
        *,
        model_name: str,
        api_key: str | None = None,
        max_api_retries: int = 3,
        retry_base_seconds: float = 2.0,
        retry_jitter_seconds: float = 0.5,
    ) -> None:
        if not HAS_GENAI:
            raise RuntimeError("google-genai is not installed. Install with: pip install google-genai")
        self.model_name = model_name
        self.api_key = api_key or _resolve_env_api_key()
        self.max_api_retries = max(1, max_api_retries)
        self.retry_base_seconds = max(0.1, retry_base_seconds)
        self.retry_jitter_seconds = max(0.0, retry_jitter_seconds)
        self._usage_summary = ProviderUsageSummary(provider_name="gemini")
        self._aclient = genai.Client(api_key=self.api_key).aio

    async def close(self) -> None:
        if self._aclient is not None:
            await self._aclient.aclose()
            self._aclient = None

    async def generate_translation(self, prompt: str, task_name: str) -> str:
        last_error: Exception | None = None
        for attempt in range(1, self.max_api_retries + 1):
            try:
                response = await self._aclient.models.generate_content(model=self.model_name, contents=prompt)
                self._record_usage(response)
                text = getattr(response, "text", None)
                if not text:
                    raise RuntimeError(f"Gemini returned empty text for {task_name}")
                return text
            except Exception as exc:
                if _is_model_not_found_error(exc):
                    raise FatalProviderError(_format_error_summary(exc)) from exc
                if _is_quota_exhausted_error(exc):
                    raise QuotaExhaustedError(_format_error_summary(exc)) from exc
                last_error = exc
                if attempt < self.max_api_retries:
                    delay = _extract_retry_delay_seconds(exc)
                    backoff = float(delay) if delay is not None else self.retry_base_seconds * (2 ** (attempt - 1))
                    sleep_time = backoff + random.uniform(0.0, self.retry_jitter_seconds)
                    print(
                        f"[{datetime.now().strftime('%H:%M:%S')}] {task_name}: provider retry {attempt}/{self.max_api_retries} "
                        f"failed ({_format_error_summary(exc)}); retrying after {sleep_time:.2f}s"
                    )
                    await asyncio.sleep(sleep_time)
                else:
                    print(
                        f"[{datetime.now().strftime('%H:%M:%S')}] {task_name}: provider retry {attempt}/{self.max_api_retries} "
                        f"failed ({_format_error_summary(exc)}); no retries remain"
                    )
        if last_error is None:
            raise RuntimeError("Gemini provider failed without an exception")
        raise last_error

    def get_usage_summary(self) -> ProviderUsageSummary | None:
        return replace(self._usage_summary)

    def load_usage_summary(self, payload: dict[str, object] | None) -> None:
        summary = provider_usage_summary_from_dict(payload)
        if summary is not None:
            self._usage_summary = summary

    def _record_usage(self, response: object) -> None:
        self._usage_summary.successful_requests += 1
        usage = getattr(response, "usage_metadata", None)
        if usage is None:
            return
        self._usage_summary.usage_metadata_requests += 1
        self._usage_summary.prompt_token_count += int(getattr(usage, "prompt_token_count", 0) or 0)
        self._usage_summary.response_token_count += int(getattr(usage, "response_token_count", 0) or 0)
        self._usage_summary.total_token_count += int(getattr(usage, "total_token_count", 0) or 0)


def _exception_text(error: Exception | str) -> str:
    return str(error)


def _exception_code(error: Exception | str) -> int | None:
    if isinstance(error, Exception):
        code = getattr(error, "code", None)
        if isinstance(code, int):
            return code
        if isinstance(code, str) and code.isdigit():
            return int(code)
    match = re.search(r"'code':\s*(\d+)", _exception_text(error))
    return int(match.group(1)) if match else None


def _exception_status(error: Exception | str) -> str:
    if isinstance(error, Exception):
        status = getattr(error, "status", None)
        if isinstance(status, str) and status.strip():
            return status.strip()
    match = re.search(r"'status':\s*'([^']+)'", _exception_text(error))
    return match.group(1).strip() if match else ""


def _exception_message(error: Exception | str) -> str:
    if isinstance(error, Exception):
        message = getattr(error, "message", None)
        if isinstance(message, str) and message.strip():
            return message.strip()
    return _exception_text(error).strip()


def _format_error_summary(error: Exception | str) -> str:
    code = _exception_code(error)
    status = _exception_status(error)
    message = _exception_message(error)
    prefix = " ".join(item for item in [str(code) if code is not None else "", status] if item)
    if prefix and message:
        return f"{prefix}: {message}"
    return prefix or message


def _extract_retry_delay_seconds(error: Exception | str) -> float | None:
    match = re.search(r"retryDelay[\"']?\s*:\s*[\"']?(\d+(?:\.\d+)?)s", _exception_text(error))
    return float(match.group(1)) if match else None


def _is_quota_exhausted_error(error: Exception | str) -> bool:
    code = _exception_code(error)
    status = _exception_status(error).lower()
    lowered = _exception_message(error).lower()
    quota_markers = (
        "prepayment credits are depleted",
        "manage your project and billing",
        "exceeded your current quota",
        "check your plan and billing details",
        "generate_requests_per_model_per_day",
        "generaterequestsperdayperprojectpermodel",
        "rate limits are set lower",
        "daily limit",
        "daily quota",
    )
    if any(marker in lowered for marker in quota_markers):
        return True
    return code == 429 and status == "resource_exhausted" and any(
        marker in lowered for marker in ("quota", "billing", "credits")
    )


def _is_model_not_found_error(error: Exception | str) -> bool:
    code = _exception_code(error)
    status = _exception_status(error).lower()
    lowered = _exception_message(error).lower()
    return code == 404 and status == "not_found" and (
        "is not found for api version" in lowered or "not supported for generatecontent" in lowered or "models/" in lowered
    )


async def _translate_all(
    *,
    cfg: dict[str, Any],
    records: list[dict[str, str]],
    dirs: dict[str, Path],
    checkpoint: dict[str, object],
    checkpoint_path: Path,
    provider: GeminiProvider,
    resume: bool,
) -> dict[str, dict[str, str]]:
    semaphore = asyncio.Semaphore(int(cfg.get("prompt_concurrency", 4)))
    prompt_template = str(cfg.get("prompt_template", DEFAULT_PROMPT_TEMPLATE))
    translated_map: dict[str, dict[str, str]] = {}
    tasks_state = checkpoint["tasks"]
    pending: list[dict[str, str]] = []

    for record in records:
        task_name = record["task_name"]
        task_state = tasks_state[task_name]
        artifacts = task_state["artifacts"]
        cleaned_path = Path(str(artifacts["cleaned_output"]))
        asm_path = Path(str(artifacts["translated_asm"]))
        if resume and task_state.get("translation_status") == "translated" and cleaned_path.exists() and asm_path.exists():
            task_state["translation_resumed"] = True
            translated_map[task_name] = {"task_name": task_name, "pred": asm_path.read_text(encoding="utf-8")}
            continue
        pending.append(record)

    async def _work(record: dict[str, str]) -> tuple[str, str]:
        task_name = record["task_name"]
        task_state = tasks_state[task_name]
        artifacts = task_state["artifacts"]
        prompt = prompt_template.format(
            source_isa=cfg["source_isa"],
            target_isa=cfg["target_isa"],
            source_code=record["source_asm"],
        )
        Path(str(artifacts["prompt"])).write_text(prompt, encoding="utf-8")
        try:
            async with semaphore:
                raw = await provider.generate_translation(prompt, task_name)
            Path(str(artifacts["raw_output"])).write_text(raw, encoding="utf-8")
            cleaned, diagnostics = clean_model_output(raw)
            Path(str(artifacts["cleaned_output"])).write_text(cleaned, encoding="utf-8")
            Path(str(artifacts["translated_asm"])).write_text(cleaned, encoding="utf-8")
            Path(str(artifacts["clean_diagnostics"])).write_text(json.dumps(diagnostics, indent=2) + "\n", encoding="utf-8")
            return task_name, cleaned
        except QuotaExhaustedError as exc:
            raise TaskTranslationError(task_name, f"Gemini quota exhausted: {exc}", quota=True) from exc
        except FatalProviderError as exc:
            raise TaskTranslationError(task_name, str(exc), fatal=True) from exc
        except Exception as exc:
            raise TaskTranslationError(task_name, str(exc)) from exc

    futures = [asyncio.create_task(_work(record)) for record in pending]
    for future in asyncio.as_completed(futures):
        try:
            task_name, cleaned = await future
            tasks_state[task_name]["translation_status"] = "translated"
            tasks_state[task_name]["translation_resumed"] = False
            tasks_state[task_name]["translation_error"] = ""
            translated_map[task_name] = {"task_name": task_name, "pred": cleaned}
        except TaskTranslationError as exc:
            tasks_state[exc.task_name]["translation_status"] = "failed"
            tasks_state[exc.task_name]["translation_resumed"] = False
            tasks_state[exc.task_name]["translation_error"] = str(exc)
            _persist_checkpoint(checkpoint_path, checkpoint, provider=provider)
            if exc.quota:
                raise QuotaExhaustedError(str(exc)) from exc
            if exc.fatal:
                raise FatalProviderError(str(exc)) from exc
        _persist_checkpoint(checkpoint_path, checkpoint, provider=provider)
    return translated_map


def _load_translated_records(
    *,
    records: list[dict[str, str]],
    checkpoint: dict[str, object],
) -> dict[str, dict[str, str]]:
    translated: dict[str, dict[str, str]] = {}
    for record in records:
        task_name = record["task_name"]
        task_state = checkpoint["tasks"][task_name]
        if task_state.get("translation_status") != "translated":
            continue
        asm_path = Path(str(task_state["artifacts"]["translated_asm"]))
        if asm_path.exists():
            translated[task_name] = {"task_name": task_name, "pred": asm_path.read_text(encoding="utf-8")}
    return translated


def main(argv: list[str] | None = None) -> int:
    args = parse_args(argv)
    cfg = json.loads(args.config.read_text(encoding="utf-8"))
    benchmark_id = normalize_benchmark_id(args.benchmark)
    source_isa = normalize_isa(args.source_isa)
    target_isa = normalize_isa(args.target_isa)

    cfg["benchmark"] = benchmark_id
    cfg["source_isa"] = source_isa
    cfg["target_isa"] = target_isa
    cfg["opt_level"] = args.opt_level
    if args.max_retries is not None:
        cfg["max_retries"] = args.max_retries
    if args.retry_base_seconds is not None:
        cfg["retry_base_seconds"] = args.retry_base_seconds

    prompt_concurrency, validation_concurrency = resolve_concurrency_settings(
        cfg=cfg,
        benchmark_id=benchmark_id,
        prompt_override=args.prompt_concurrency,
        validation_override=args.validation_concurrency,
        max_workers_override=args.max_workers,
    )
    cfg["prompt_concurrency"] = prompt_concurrency
    cfg["validation_concurrency"] = validation_concurrency
    if args.max_workers is not None and args.prompt_concurrency is None and args.validation_concurrency is None:
        cfg["max_workers"] = args.max_workers

    benchmark_root = benchmark_root_for(benchmark_id, args.benchmark_root)
    dataset_id = args.dataset_id or str(cfg.get("dataset_id") or "")
    if not dataset_id:
        dataset_id = {
            "humaneval": "murodbek/humaneval_asm",
            "bringup": "murodbek/bringup_asm",
            "mceval": "murodbek/mceval_asm",
        }[benchmark_id]
    output_root = _output_root(args, cfg, benchmark_id, source_isa, target_isa)
    dirs = build_output_dirs(output_root)
    checkpoint_path = _resolve_checkpoint_path(output_root, args.resume_checkpoint)
    unsupported_reason = None
    if cfg.get("action", "compile_and_run") == "compile_and_run":
        from transpilation_runtime import detect_unsupported_target

        unsupported_reason = detect_unsupported_target(target_isa)

    _print_preflight(
        config_path=args.config,
        benchmark_id=benchmark_id,
        benchmark_root=benchmark_root,
        dataset_id=dataset_id,
        source_isa=source_isa,
        target_isa=target_isa,
        output_root=output_root,
        checkpoint_path=checkpoint_path,
        unsupported_reason=unsupported_reason,
        cfg=cfg,
    )
    _confirm_or_exit(args.yes)

    if unsupported_reason:
        print(f"Skipped: {unsupported_reason}")
        return 0

    started_at = datetime.now()
    provider: GeminiProvider | None = None
    checkpoint: dict[str, object] | None = None
    records: list[dict[str, str]] = []
    run_status = "completed"
    exit_code = 0

    try:
        records = load_hf_records(
            benchmark_id=benchmark_id,
            source_isa=source_isa,
            split=args.opt_level,
            dataset_id=dataset_id,
            hf_token=str(cfg.get("hf_token", "") or ""),
        )
        if args.resume and checkpoint_path.exists():
            checkpoint = load_checkpoint(checkpoint_path)
        else:
            checkpoint = _build_checkpoint_payload(
                args=args,
                cfg=cfg,
                benchmark_id=benchmark_id,
                source_isa=source_isa,
                target_isa=target_isa,
                dataset_id=dataset_id,
                benchmark_root=benchmark_root,
                output_root=output_root,
                checkpoint_path=checkpoint_path,
                dirs=dirs,
                records=records,
            )
        checkpoint["resume_mode"] = bool(args.resume)
        checkpoint["prompt_concurrency"] = prompt_concurrency
        checkpoint["validation_concurrency"] = validation_concurrency
        checkpoint = _reconcile_checkpoint_state(
            checkpoint,
            records=records,
            dirs=dirs,
            resume_mode=bool(args.resume),
            action=str(cfg.get("action", "compile_and_run")),
        )

        provider = GeminiProvider(
            model_name=str(cfg.get("model_name", "gemini-3-flash-preview")),
            max_api_retries=int(cfg.get("max_retries", 3)),
            retry_base_seconds=float(cfg.get("retry_base_seconds", 2.0)),
        )
        provider.load_usage_summary(checkpoint.get("provider_usage"))
        _persist_checkpoint(checkpoint_path, checkpoint, provider=provider, status="running")

        asyncio.run(
            _translate_all(
                cfg=cfg,
                records=records,
                dirs=dirs,
                checkpoint=checkpoint,
                checkpoint_path=checkpoint_path,
                provider=provider,
                resume=bool(args.resume),
            )
        )
        translated_records = _load_translated_records(records=records, checkpoint=checkpoint)

        validation_payloads: dict[str, dict[str, Any]] = {}
        eval_results = []
        if cfg.get("action", "compile_and_run") == "compile_and_run":
            pending_eval_records: list[dict[str, str]] = []
            for task_name, record in translated_records.items():
                task_state = checkpoint["tasks"][task_name]
                validation_path = Path(str(task_state["artifacts"]["validation_json"]))
                if args.resume and task_state.get("evaluation_status") == "validated" and validation_path.exists():
                    task_state["evaluation_resumed"] = True
                    validation_payloads[task_name] = _load_validation_payload(validation_path)
                    continue
                pending_eval_records.append(record)

            def _on_eval(record: dict[str, str], result: Any) -> None:
                task_name = record["task_name"]
                task_state = checkpoint["tasks"][task_name]
                payload = validation_payload(task_name, record["pred"], result)
                write_validation_json(Path(str(task_state["artifacts"]["validation_json"])), payload)
                task_state["evaluation_status"] = "validated"
                task_state["evaluation_resumed"] = False
                task_state["evaluation_error"] = ""
                validation_payloads[task_name] = payload
                _persist_checkpoint(checkpoint_path, checkpoint, provider=provider)

            evaluated = evaluate_records(
                benchmark_id=benchmark_id,
                benchmark_root=benchmark_root,
                records=pending_eval_records,
                cfg=cfg,
                target_isa=target_isa,
                work_root=dirs["eval_temp"],
                num_workers=validation_concurrency,
                on_result=_on_eval,
            )
            for _, result in evaluated:
                eval_results.append(result)
            existing_eval_names = {result.problem_name for result in eval_results}
            if validation_payloads:
                from transpilation_runtime import CommandResult, EvalResult

                for task_name, payload in validation_payloads.items():
                    if task_name in existing_eval_names:
                        continue
                    command_results = [
                        CommandResult(
                            command=["sh", "-lc", str(item.get("command", ""))],
                            returncode=int(item.get("returncode", 0)),
                            stdout=str(item.get("stdout", "")),
                            stderr=str(item.get("stderr", "")),
                        )
                        for item in payload.get("commands", [])
                    ]
                    eval_results.append(
                        EvalResult(
                            problem_name=task_name,
                            status=str(payload.get("status", "")),
                            summary=str(payload.get("summary", payload.get("run_output", ""))),
                            succeeded=bool(payload.get("success_bool", False)),
                            error_stage=str(payload.get("error_stage")) if payload.get("error_stage") is not None else None,
                            runtime_seconds=float(payload.get("runtime_seconds", 0.0)),
                            asm_path=Path(str(payload.get("asm_path", ""))) if payload.get("asm_path") else None,
                            command_results=command_results,
                            stdout=str(payload.get("stdout", "")),
                            stderr=str(payload.get("stderr", "")),
                        )
                    )

        results_payload: list[dict[str, Any]] = []
        for record in records:
            task_name = record["task_name"]
            task_state = checkpoint["tasks"][task_name]
            asm_path = str(task_state["artifacts"]["translated_asm"])
            if task_name in validation_payloads:
                results_payload.append(validation_payloads[task_name])
            elif task_state.get("translation_status") == "translated":
                pred = translated_records[task_name]["pred"]
                if cfg.get("action", "compile_and_run") == "compile_and_run":
                    results_payload.append(
                        {
                            "file": task_name,
                            "pred": pred,
                            "success": None,
                            "success_bool": None,
                            "runtime_seconds": 0.0,
                            "run_output": "",
                            "error_stage": "evaluation",
                            "status": "evaluation_pending",
                            "summary": "Evaluation not completed",
                            "stdout": "",
                            "stderr": "",
                            "failing_command": "",
                            "asm_path": asm_path,
                            "output_dir": "",
                            "commands": [],
                        }
                    )
                else:
                    results_payload.append(_translated_only_payload(task_name, pred, asm_path))
            else:
                results_payload.append(_translation_failure_payload(task_name, str(task_state.get("translation_error", "")), asm_path))
        results_payload.sort(key=lambda item: str(item["file"]))

        finished_at = datetime.now()
        counts = _summarize_counts(
            total_records=len(records),
            translated_records=len(translated_records),
            evaluated_payloads=validation_payloads,
            checkpoint=checkpoint,
        )
        checkpoint["provider_usage"] = provider_usage_summary_to_dict(provider.get_usage_summary()) if provider else None
        checkpoint["status"] = run_status
        checkpoint["run_finished"] = finished_at.isoformat(timespec="seconds")

        eval_json_path = write_eval_results_json(dirs["jsons"] / "eval_results.json", results_payload)
        if cfg.get("action", "compile_and_run") == "compile_and_run":
            write_error_json(
                dirs["jsons"] / "error_problems.json",
                benchmark_id=benchmark_id,
                benchmark_root=benchmark_root,
                asm_input_dir=dirs["translated_asm"],
                results=eval_results,
                started_at=started_at,
                finished_at=finished_at,
                usage_summary=provider.get_usage_summary() if provider else None,
                run_status=run_status,
                counts=counts,
            )
        write_run_summary_json(
            dirs["jsons"] / "run_summary.json",
            _make_run_summary(
                started_at=started_at,
                finished_at=finished_at,
                run_status=run_status,
                checkpoint=checkpoint,
                counts=counts,
            ),
        )
        report_path = write_report(
            dirs["txts"] / f"{datetime.now().strftime('%Y%m%d_%H%M%S')}_report.txt",
            benchmark_id=benchmark_id,
            source_isa=source_isa,
            target_isa=target_isa,
            model_name=str(cfg.get("model_name", "gemini-3-flash-preview")),
            results=eval_results,
            started_at=started_at,
            finished_at=finished_at,
            run_status=run_status,
            counts=counts,
            usage_summary=provider.get_usage_summary() if provider else None,
            prompt_concurrency=prompt_concurrency,
            validation_concurrency=validation_concurrency,
        )
        _persist_checkpoint(checkpoint_path, checkpoint, provider=provider, status=run_status, finished_at=finished_at)
        print(f"Report written: {report_path}")
        print(f"Eval JSON written: {eval_json_path}")
    except QuotaExhaustedError as exc:
        run_status = "quota_exhausted"
        exit_code = 1
        print(f"Stopped: {exc}")
        if checkpoint is not None:
            _persist_checkpoint(checkpoint_path, checkpoint, provider=provider, status=run_status, finished_at=datetime.now())
    except KeyboardInterrupt:
        run_status = "interrupted"
        exit_code = 130
        print("Stopped: interrupted")
        if checkpoint is not None:
            _persist_checkpoint(checkpoint_path, checkpoint, provider=provider, status=run_status, finished_at=datetime.now())
    except Exception as exc:
        run_status = "failed"
        exit_code = 1
        print(f"Stopped: {exc}")
        if checkpoint is not None:
            _persist_checkpoint(checkpoint_path, checkpoint, provider=provider, status=run_status, finished_at=datetime.now())
    finally:
        if provider is not None:
            asyncio.run(provider.close())
    return exit_code


if __name__ == "__main__":
    raise SystemExit(main())
