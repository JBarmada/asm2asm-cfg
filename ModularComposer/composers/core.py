from __future__ import annotations

import asyncio
import json
import random
import shutil
from datetime import datetime
from pathlib import Path

from .evaluators import BaseEvaluator
from .providers import (
    FatalProviderError,
    ModelProvider,
    ProviderUsageSummary,
    QuotaExhaustedError,
    provider_usage_summary_to_dict,
)
from .utils import (
    ComposerRuntimePaths,
    ProblemResult,
    ProblemSpec,
    _log,
    _remove_path,
    _read_text,
    _write_text,
    clean_model_output,
    load_checkpoint,
    problem_result_from_dict,
    problem_result_to_dict,
    save_checkpoint,
)


class ComposerEngine:
    def __init__(
        self,
        provider: ModelProvider,
        evaluator: BaseEvaluator,
        paths: ComposerRuntimePaths,
        prompt_config: str,
        max_retries: int,
        prompt_concurrency: int,
        validation_concurrency: int,
        model_name: str,
        run_label: str,
        checkpoint_path: Path,
        startup_jitter_seconds: float = 0.0,
    ) -> None:
        self.provider = provider
        self.evaluator = evaluator
        self.paths = paths
        self.prompt_config = prompt_config
        self.max_retries = max_retries
        self.prompt_concurrency = max(1, prompt_concurrency)
        self.validation_concurrency = max(1, validation_concurrency)
        self.model_name = model_name
        self.run_label = run_label
        self.checkpoint_path = checkpoint_path
        self.startup_jitter_seconds = max(0.0, startup_jitter_seconds)

        self._result_lock = asyncio.Lock()
        self._progress_lock = asyncio.Lock()
        self._results: list[ProblemResult] = []
        self._progress = {"done": 0, "total": 0}
        self._prompt_semaphore = asyncio.Semaphore(self.prompt_concurrency)
        self._validation_semaphore = asyncio.Semaphore(self.validation_concurrency)

    async def run(self, problems: list[ProblemSpec], resume_checkpoint: Path | None = None) -> tuple[list[ProblemResult], Exception | None]:
        _log(
            f"Starting composer run for {len(problems)} problems "
            f"(resume checkpoint: {resume_checkpoint if resume_checkpoint else 'none'})"
        )
        self._prepare_run_directories(resume_enabled=resume_checkpoint is not None)

        if resume_checkpoint and resume_checkpoint.exists():
            _log(f"Loading checkpoint: {resume_checkpoint}")
            resumed = load_checkpoint(resume_checkpoint)
            previous = resumed.get("results", [])
            if isinstance(previous, list):
                self._results = [problem_result_from_dict(item) for item in previous if isinstance(item, dict)]
            usage_loader = getattr(self.provider, "load_usage_summary", None)
            usage_payload = resumed.get("provider_usage")
            if callable(usage_loader) and isinstance(usage_payload, dict):
                usage_loader(usage_payload)
            _log(f"Checkpoint restored with {len(self._results)} completed problems.")

        completed_names = {item.name for item in self._results}
        pending = [p for p in problems if p.name not in completed_names]

        if pending:
            _log(f"Resuming with {len(pending)} pending problems and {len(self._results)} already completed.")
        else:
            _log("All problems are already complete in the checkpoint. Skipping worker phase and moving to final validation.")

        self._progress = {"done": len(self._results), "total": len(problems)}
        queue: asyncio.Queue[ProblemSpec] = asyncio.Queue()
        for problem in pending:
            queue.put_nowait(problem)

        stop_event = asyncio.Event()
        progress_task = asyncio.create_task(self._periodic_progress_updates(stop_event))
        worker_count = max(1, min(self.prompt_concurrency, len(pending) if pending else 1))
        tasks = [asyncio.create_task(self._worker(queue, stop_event)) for _ in range(worker_count)]

        error: Exception | None = None
        try:
            queue_join_task = asyncio.create_task(queue.join())
            done, pending_tasks = await asyncio.wait(
                [queue_join_task, *tasks],
                return_when=asyncio.FIRST_COMPLETED,
            )

            if queue_join_task in done and queue_join_task.exception() is None:
                stop_event.set()
            else:
                for task in done:
                    if task is queue_join_task or task.cancelled():
                        continue
                    exc = task.exception()
                    if exc is not None:
                        error = exc
                        break

                stop_event.set()
                for task in pending_tasks:
                    task.cancel()

            await asyncio.gather(queue_join_task, return_exceptions=True)
        except Exception as exc:
            error = exc
        finally:
            checkpoint_status = "completed" if error is None else "terminated"
            if error is not None:
                if isinstance(error, QuotaExhaustedError):
                    checkpoint_status = "terminated_quota_exhausted"
                elif isinstance(error, FatalProviderError):
                    checkpoint_status = "terminated_fatal_provider_error"
                _log(f"Run terminated due to error: {error}")

            self._save_checkpoint(status=checkpoint_status)
            stop_event.set()
            for task in tasks:
                task.cancel()
            await asyncio.gather(*tasks, return_exceptions=True)
            progress_task.cancel()
            await asyncio.gather(progress_task, return_exceptions=True)
            close_fn = getattr(self.provider, "close", None)
            if callable(close_fn):
                maybe_coro = close_fn()
                if asyncio.iscoroutine(maybe_coro):
                    await maybe_coro

        return sorted(self._results, key=lambda item: item.name), error

    async def _worker(self, queue: asyncio.Queue[ProblemSpec], stop_event: asyncio.Event) -> None:
        if self.startup_jitter_seconds > 0:
            await asyncio.sleep(random.uniform(0.0, self.startup_jitter_seconds))

        while not stop_event.is_set():
            try:
                problem = await asyncio.wait_for(queue.get(), timeout=0.5)
            except asyncio.TimeoutError:
                continue

            try:
                await self._process_one_problem(problem)
            except (QuotaExhaustedError, FatalProviderError):
                stop_event.set()
                raise
            finally:
                queue.task_done()

    async def _process_one_problem(self, problem: ProblemSpec) -> None:
        _log(f"{problem.name}: starting repair attempt loop")
        source_asm = await asyncio.to_thread(_read_text, problem.source_asm_path)
        original_copy_path = self.paths.original_error_asm_dir / problem.source_asm_name
        if not original_copy_path.exists():
            await asyncio.to_thread(shutil.copy2, problem.source_asm_path, original_copy_path)

        fixed_asm_path = self.paths.fixed_asm_dir / problem.source_asm_name
        attempt_records: list[dict[str, object]] = []
        retry_context: dict[str, str] | None = None
        final_note = "Unknown"
        succeeded = False

        for attempt in range(1, self.max_retries + 1):
            _log(f"{problem.name}: preparing attempt {attempt}/{self.max_retries}")
            prompt = build_prompt(
                problem=problem,
                source_asm=source_asm,
                prompt_config=self.prompt_config,
                target_isa=self.paths.target_isa_display,
                cfg_language=self.paths.cfg_language,
                dfg_language=self.paths.dfg_language,
                retry_context=retry_context,
            )
            prompt_path = self.paths.prompts_dir / f"{problem.name}_attempt{attempt}.txt"
            await asyncio.to_thread(_write_text, prompt_path, prompt)

            _log(f"{problem.name}: requesting model output for attempt {attempt}")
            async with self._prompt_semaphore:
                raw_output = await self.provider.generate_repair(prompt, problem.name)
            raw_path = self.paths.raw_output_dir / f"{problem.name}_attempt{attempt}.txt"
            await asyncio.to_thread(_write_text, raw_path, raw_output)

            cleaned, diagnostics = clean_model_output(raw_output)
            cleaned_path = self.paths.cleaned_output_dir / f"{problem.name}_attempt{attempt}.txt"
            diagnostics_path = self.paths.clean_diagnostics_dir / f"{problem.name}_attempt{attempt}.json"
            await asyncio.to_thread(_write_text, cleaned_path, cleaned)
            await asyncio.to_thread(_write_text, diagnostics_path, json.dumps(diagnostics, indent=2) + "\n")
            await asyncio.to_thread(_write_text, fixed_asm_path, cleaned)

            _log(f"{problem.name}: validating attempt {attempt}")
            async with self._validation_semaphore:
                feedback = await asyncio.to_thread(
                    self.evaluator.validate,
                    problem,
                    cleaned,
                    attempt,
                )

            note = feedback.clean_summary or feedback.summary or feedback.status
            if not feedback.clean_summary and feedback.stderr:
                first_line = feedback.stderr.splitlines()[0].strip()
                if first_line:
                    note = f"{note} | {first_line}"

            attempt_records.append(
                {
                    "attempt": attempt,
                    "status": "passed" if feedback.passed else "failed",
                    "note": note,
                    "prompt_path": str(prompt_path),
                    "raw_output_path": str(raw_path),
                    "cleaned_output_path": str(cleaned_path),
                    "clean_diagnostics_path": str(diagnostics_path),
                    "validation_status": feedback.status,
                    "validation_summary": feedback.summary,
                    "validation_stderr": feedback.stderr,
                    "clean_summary": feedback.clean_summary,
                    "clean_details": list(feedback.clean_details),
                    "failing_command": feedback.failing_command,
                    "failure_stage": feedback.failure_stage,
                    "previous_code": cleaned,
                }
            )
            final_note = note

            if feedback.passed:
                succeeded = True
                break

            retry_context = {
                "attempt": str(attempt),
                "validation_status": feedback.status,
                "validation_summary": feedback.summary,
                "validation_stderr": feedback.stderr or "(no stderr provided)",
                "clean_summary": feedback.clean_summary or feedback.summary or "(no summary provided)",
                "clean_details": "\n".join(feedback.clean_details) if feedback.clean_details else "(no cleaned details provided)",
                "failing_command": feedback.failing_command or "(no failing command identified)",
                "failure_stage": feedback.failure_stage or feedback.status,
                "previous_code": cleaned,
            }

        result = ProblemResult(
            name=problem.name,
            source_asm_path=problem.source_asm_path,
            fixed_asm_path=fixed_asm_path,
            succeeded=succeeded,
            attempts_used=len(attempt_records),
            final_note=final_note,
            attempts=attempt_records,
        )

        async with self._result_lock:
            self._results = [item for item in self._results if item.name != result.name]
            self._results.append(result)
            self._save_checkpoint(status="running")

        async with self._progress_lock:
            self._progress["done"] += 1
            print(f"[{self._progress['done']}/{self._progress['total']}] {'OK' if succeeded else 'FAIL'} {problem.name} | {final_note}")

    async def _periodic_progress_updates(self, stop_event: asyncio.Event, interval_seconds: float = 30.0) -> None:
        while not stop_event.is_set():
            await asyncio.sleep(interval_seconds)
            async with self._progress_lock:
                _log(f"Progress: {self._progress['done']}/{self._progress['total']} completed")

    def _save_checkpoint(self, status: str) -> None:
        payload = {
            "status": status,
            "run_label": self.run_label,
            "prompt_config": self.prompt_config,
            "model_name": self.model_name,
            "results": [problem_result_to_dict(item) for item in sorted(self._results, key=lambda r: r.name)],
        }
        usage_getter = getattr(self.provider, "get_usage_summary", None)
        usage_summary = usage_getter() if callable(usage_getter) else None
        if usage_summary is not None:
            payload["provider_usage"] = provider_usage_summary_to_dict(usage_summary)
        save_checkpoint(self.checkpoint_path, payload)

    def write_reports(
        self,
        problems: list[ProblemSpec],
        results: list[ProblemResult],
        started_at: datetime,
        finished_at: datetime,
        final_validation_path: Path,
        final_validation_error_count: int,
        total_problems: int,
    ) -> Path:
        success_count = sum(1 for result in results if result.succeeded)
        fail_count = len(problems) - success_count
        overall_successful = total_problems - final_validation_error_count
        success_rate = (overall_successful / total_problems * 100.0) if total_problems else 0.0

        lines = [
            f"Run started: {started_at.isoformat(timespec='seconds')}",
            f"Run finished: {finished_at.isoformat(timespec='seconds')}",
            f"Input experiment dir: {self.paths.input_experiment_dir}",
            f"Run label: {self.run_label}",
            f"Benchmark: {self.paths.benchmark_id}",
            f"Target ISA: {self.paths.target_isa_display}",
            f"Model: {self.model_name}",
            f"Prompt config: {self.prompt_config}",
            f"Total problems in experiment: {total_problems}",
            f"Errored problems processed: {len(problems)}",
            f"Composer succeeded: {success_count}",
            f"Composer failed: {fail_count}",
            f"Global Total Overall problems successfully passed: {overall_successful}/{total_problems} ({success_rate:.1f}%)",
            f"Final validation JSON: {final_validation_path}",
        ]

        usage_getter = getattr(self.provider, "get_usage_summary", None)
        usage_summary = usage_getter() if callable(usage_getter) else None
        if usage_summary is not None:
            lines.extend(self._usage_report_lines(usage_summary))

        lines.extend(
            [
                "",
                "Failed problems (Post-Composer):",
            ]
        )

        for result in sorted(results, key=lambda item: item.name):
            if not result.succeeded:
                lines.append(f"- {result.name}: {result.final_note}")
        if fail_count == 0:
            lines.append("- none")

        report_path = self.paths.reports_dir / f"{finished_at.strftime('%Y%m%d_%H%M%S')}_report.txt"
        _write_text(report_path, "\n".join(lines) + "\n")
        return report_path

    def _usage_report_lines(self, usage_summary: ProviderUsageSummary) -> list[str]:
        return [
            "",
            f"Provider usage ({usage_summary.provider_name}):",
            f"- Successful model requests: {usage_summary.successful_requests}",
            f"- Requests with usage metadata: {usage_summary.usage_metadata_requests}",
            f"- Prompt tokens: {usage_summary.prompt_token_count}",
            f"- Response tokens: {usage_summary.response_token_count}",
            f"- Total tokens: {usage_summary.total_token_count}",
        ]

    def _prepare_run_directories(self, resume_enabled: bool) -> None:
        managed_dirs = [
            self.paths.prompts_dir,
            self.paths.raw_output_dir,
            self.paths.original_error_asm_dir,
            self.paths.fixed_asm_dir,
            self.paths.logs_dir,
            self.paths.reports_dir,
            self.paths.cleaned_output_dir,
            self.paths.clean_diagnostics_dir,
            self.paths.compile_probe_dir,
            self.paths.validation_json_dir,
            self.paths.full_validation_input_dir,
        ]
        for directory in managed_dirs:
            directory.mkdir(parents=True, exist_ok=True)
            if resume_enabled:
                continue
            for stale in directory.glob("*"):
                _remove_path(stale)


def build_prompt(
    problem: ProblemSpec,
    source_asm: str,
    prompt_config: str,
    target_isa: str,
    cfg_language: str,
    dfg_language: str,
    retry_context: dict[str, str] | None = None,
) -> str:
    artifact_label = "assembly function" if problem.artifact_kind == "single_function" else "assembly translation unit"
    sections: list[str] = [
        f"Repair the following translated {target_isa} {artifact_label}.",
        "",
        "Goal:",
        f"Produce a corrected {target_isa} {artifact_label} that preserves behavior.",
        "",
        "Hard requirements:",
        "- Output only assembly text. No markdown fences. No prose.",
        "- Keep the same target ISA/language as input; do not translate to a different ISA.",
        "- Preserve exact semantics and edge cases.",
        "- If CFG/DFG are provided, treat them as semantic guidance only.",
    ]

    if problem.expected_symbols:
        sections.append(f"- Preserve the benchmark-required symbol set exactly: {', '.join(problem.expected_symbols)}.")
    if problem.prompt_constraints:
        sections.extend(f"- {line}" for line in problem.prompt_constraints)
    sections.append("")

    if prompt_config in {"error_only", "error_cfg", "error_dfg", "error_cfg_dfg"}:
        detail_block = "\n".join(problem.clean_details) if problem.clean_details else "(no cleaned details provided)"
        sections.extend(
            [
                "Known toolchain/runtime failure summary from prior validation:",
                problem.clean_summary or problem.summary or "(no summary provided)",
                "",
                f"Failure stage: {problem.failure_stage or '(unknown)'}",
                f"Failing command: {problem.failing_command or '(not available)'}",
                "",
                "Key diagnostic lines from prior validation:",
                detail_block,
                "",
            ]
        )

    sections.extend([f"Input {target_isa} Assembly:", source_asm, ""])

    if prompt_config in {"cfg_only", "error_cfg", "cfg_dfg", "error_cfg_dfg"}:
        sections.extend(
            [
                f"CFG ({cfg_language} semantic graph; output remains {target_isa} assembly):",
                problem.cfg_text or "(CFG data not found)",
                "",
            ]
        )

    if prompt_config in {"dfg_only", "error_dfg", "cfg_dfg", "error_cfg_dfg"}:
        sections.extend(
            [
                f"DFG ({dfg_language} semantic graph; output remains {target_isa} assembly):",
                problem.dfg_text or "(DFG data not found)",
                "",
            ]
        )

    if retry_context and prompt_config.startswith("error_"):
        sections.extend(
            [
                "Previous failed attempt feedback (toolchain/runtime only):",
                f"Attempt: {retry_context.get('attempt', '')}",
                f"Failure stage: {retry_context.get('failure_stage', '')}",
                f"Validation status: {retry_context.get('validation_status', '')}",
                f"Failing command: {retry_context.get('failing_command', '(not available)')}",
                "Cleaned validation summary:",
                retry_context.get("clean_summary", "(no summary provided)"),
                "",
                "Key diagnostic lines:",
                retry_context.get("clean_details", "(no cleaned details provided)"),
                "",
                "Previous candidate assembly that failed:",
                retry_context.get("previous_code", ""),
                "",
            ]
        )

    sections.append("Return only the final corrected assembly text.")
    return "\n".join(sections)
