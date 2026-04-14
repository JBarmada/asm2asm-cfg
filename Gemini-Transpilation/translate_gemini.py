from __future__ import annotations

import argparse
import asyncio
import json
import random
import re
from dataclasses import dataclass
from datetime import datetime
from pathlib import Path
from typing import Any

from transpilation_runtime import (
    benchmark_display_name,
    benchmark_root_for,
    build_output_dirs,
    clean_model_output,
    default_dataset_id_for,
    detect_unsupported_target,
    eval_record_payload,
    evaluate_records,
    isa_dataset_column,
    isa_display_name,
    load_hf_records,
    normalize_benchmark_id,
    normalize_isa,
    write_error_json,
    write_eval_results_json,
    write_report,
)

try:
    from google import genai

    HAS_GENAI = True
except ImportError:
    HAS_GENAI = False


@dataclass
class GeminiErrorSummary:
    code: int | None
    status: str
    message: str


def parse_args() -> argparse.Namespace:
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
    parser.add_argument("--max-workers", type=int, help="Override max workers.")
    parser.add_argument("--max-retries", type=int, help="Override API retries.")
    parser.add_argument("--retry-base-seconds", type=float, help="Override API backoff.")
    parser.add_argument("--resume", action="store_true", help="Skip already translated asm files.")
    parser.add_argument("--yes", action="store_true", help="Skip confirmation prompt.")
    return parser.parse_args()


def _resolve_env_api_key() -> str:
    for env_name in ("GOOGLE_API_KEY", "GEMINI_API_KEY"):
        raw = __import__("os").environ.get(env_name)
        if raw and raw.strip():
            return raw.strip().strip("\"'")
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


def _print_preflight(
    *,
    config_path: Path,
    benchmark_id: str,
    benchmark_root: Path,
    dataset_id: str,
    source_isa: str,
    target_isa: str,
    output_root: Path,
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
    print(f"Output root: {output_root}")
    if unsupported_reason:
        print(f"Skip reason: {unsupported_reason}")


def _confirm_or_exit(yes: bool) -> None:
    if yes:
        return
    answer = input("Continue? [y/N]: ").strip().lower()
    if answer not in {"y", "yes"}:
        raise SystemExit(0)


def _exception_summary(error: Exception) -> GeminiErrorSummary:
    code = getattr(error, "code", None)
    status = str(getattr(error, "status", "") or "")
    message = str(getattr(error, "message", "") or str(error))
    if code is None:
        match = re.search(r"'code':\s*(\d+)", message)
        if match:
            code = int(match.group(1))
    if not status:
        match = re.search(r"'status':\s*'([^']+)'", message)
        if match:
            status = match.group(1)
    return GeminiErrorSummary(code=code if isinstance(code, int) else None, status=status, message=message)


def _is_quota_error(summary: GeminiErrorSummary) -> bool:
    lowered = summary.message.lower()
    return (
        "prepayment credits are depleted" in lowered
        or "billing" in lowered
        or ("quota" in lowered and summary.code == 429)
    )


async def _generate_one(
    client: Any,
    *,
    model_name: str,
    prompt: str,
    task_name: str,
    max_retries: int,
    retry_base_seconds: float,
) -> str:
    last_error: Exception | None = None
    for attempt in range(1, max_retries + 1):
        try:
            response = await asyncio.to_thread(client.models.generate_content, model=model_name, contents=prompt)
            text = getattr(response, "text", None)
            if not text:
                raise RuntimeError(f"Gemini returned empty text for {task_name}")
            return text
        except Exception as exc:
            summary = _exception_summary(exc)
            if _is_quota_error(summary):
                raise RuntimeError(f"Gemini quota exhausted: {summary.message}") from exc
            last_error = exc
            if attempt == max_retries:
                break
            delay = retry_base_seconds * (2 ** (attempt - 1)) + random.uniform(0.0, 0.5)
            print(
                f"[{datetime.now().strftime('%H:%M:%S')}] {task_name}: attempt {attempt}/{max_retries} failed "
                f"({summary.code or ''} {summary.status} {summary.message}); retrying after {delay:.2f}s"
            )
            await asyncio.sleep(delay)
    if last_error is None:
        raise RuntimeError(f"Gemini failed without an exception for {task_name}")
    raise last_error


async def _translate_all(
    *,
    cfg: dict[str, Any],
    records: list[dict[str, str]],
    dirs: dict[str, Path],
    resume: bool,
) -> list[dict[str, str]]:
    if not HAS_GENAI:
        raise RuntimeError("google-genai is not installed. Install with: pip install google-genai")

    client = genai.Client(api_key=_resolve_env_api_key())
    semaphore = asyncio.Semaphore(int(cfg.get("max_workers", 4)))
    model_name = str(cfg.get("model_name", "gemini-3-flash-preview"))
    prompt_template = str(
        cfg.get(
            "prompt_template",
            "Translate the following assembly code from {source_isa} to {target_isa}. Return ONLY assembly code.\n\n{source_code}",
        )
    )
    max_retries = int(cfg.get("max_retries", 3))
    retry_base_seconds = float(cfg.get("retry_base_seconds", 2.0))
    translated: list[dict[str, str]] = []
    translated_map: dict[str, dict[str, str]] = {}

    async def _work(record: dict[str, str]) -> None:
        task_name = record["task_name"]
        target_path = dirs["translated_asm"] / f"{task_name}.s"
        if resume and target_path.exists():
            translated_map[task_name] = {"task_name": task_name, "pred": target_path.read_text(encoding="utf-8")}
            return

        prompt = prompt_template.format(
            source_isa=cfg["source_isa"],
            target_isa=cfg["target_isa"],
            source_code=record["source_asm"],
        )
        (dirs["prompts"] / f"{task_name}.txt").write_text(prompt, encoding="utf-8")

        async with semaphore:
            raw = await _generate_one(
                client,
                model_name=model_name,
                prompt=prompt,
                task_name=task_name,
                max_retries=max_retries,
                retry_base_seconds=retry_base_seconds,
            )
        (dirs["raw_model_output"] / f"{task_name}.txt").write_text(raw, encoding="utf-8")
        cleaned = clean_model_output(raw)
        target_path.write_text(cleaned, encoding="utf-8")
        translated_map[task_name] = {"task_name": task_name, "pred": cleaned}

    await asyncio.gather(*[_work(record) for record in records])
    for record in records:
        translated.append(translated_map[record["task_name"]])
    return translated


def main() -> int:
    args = parse_args()
    cfg = json.loads(args.config.read_text(encoding="utf-8"))
    benchmark_id = normalize_benchmark_id(args.benchmark)
    source_isa = normalize_isa(args.source_isa)
    target_isa = normalize_isa(args.target_isa)

    cfg["benchmark"] = benchmark_id
    cfg["source_isa"] = source_isa
    cfg["target_isa"] = target_isa
    cfg["opt_level"] = args.opt_level
    if args.max_workers is not None:
        cfg["max_workers"] = args.max_workers
    if args.max_retries is not None:
        cfg["max_retries"] = args.max_retries
    if args.retry_base_seconds is not None:
        cfg["retry_base_seconds"] = args.retry_base_seconds

    benchmark_root = benchmark_root_for(benchmark_id, args.benchmark_root)
    dataset_id = args.dataset_id or str(cfg.get("dataset_id") or default_dataset_id_for(benchmark_id))
    output_root = _output_root(args, cfg, benchmark_id, source_isa, target_isa)
    dirs = build_output_dirs(output_root)
    unsupported_reason = detect_unsupported_target(target_isa) if cfg.get("action", "compile_and_run") == "compile_and_run" else None

    _print_preflight(
        config_path=args.config,
        benchmark_id=benchmark_id,
        benchmark_root=benchmark_root,
        dataset_id=dataset_id,
        source_isa=source_isa,
        target_isa=target_isa,
        output_root=output_root,
        unsupported_reason=unsupported_reason,
        cfg=cfg,
    )
    _confirm_or_exit(args.yes)

    if unsupported_reason:
        print(f"Skipped: {unsupported_reason}")
        return 0

    started_at = datetime.now()
    records = load_hf_records(
        benchmark_id=benchmark_id,
        source_isa=source_isa,
        split=args.opt_level,
        dataset_id=dataset_id,
        hf_token=str(cfg.get("hf_token", "") or ""),
    )
    translated_records = asyncio.run(_translate_all(cfg=cfg, records=records, dirs=dirs, resume=args.resume))

    results_payload: list[dict[str, Any]] = []
    eval_results = []
    if cfg.get("action", "compile_and_run") == "compile_and_run":
        evaluated = evaluate_records(
            benchmark_id=benchmark_id,
            benchmark_root=benchmark_root,
            records=translated_records,
            cfg=cfg,
            target_isa=target_isa,
            work_root=dirs["eval_temp"],
            num_workers=int(cfg.get("max_workers", 4)),
        )
        for record, result in evaluated:
            eval_results.append(result)
            results_payload.append(eval_record_payload(record["task_name"], record["pred"], result))
    else:
        for record in translated_records:
            results_payload.append({"file": record["task_name"], "pred": record["pred"], "success": None})

    eval_json_path = write_eval_results_json(dirs["jsons"] / "eval_results.json", results_payload)
    if eval_results:
        write_error_json(
            dirs["jsons"] / "error_problems.json",
            benchmark_id=benchmark_id,
            benchmark_root=benchmark_root,
            asm_input_dir=dirs["translated_asm"],
            results=eval_results,
        )
        report_path = write_report(
            dirs["txts"] / f"{datetime.now().strftime('%Y%m%d_%H%M%S')}_report.txt",
            benchmark_id=benchmark_id,
            source_isa=source_isa,
            target_isa=target_isa,
            model_name=str(cfg.get("model_name", "gemini-3-flash-preview")),
            results=eval_results,
            started_at=started_at,
        )
        print(f"Report written: {report_path}")
    print(f"Eval JSON written: {eval_json_path}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
