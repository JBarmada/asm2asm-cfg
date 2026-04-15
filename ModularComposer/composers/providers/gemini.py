from __future__ import annotations

import asyncio
from dataclasses import replace
import random
import re

from ..utils import _log, resolve_env_api_key
from .base import FatalProviderError, ModelProvider, ProviderUsageSummary, QuotaExhaustedError

try:
    from google import genai

    HAS_GENAI = True
except ImportError:
    HAS_GENAI = False


class GeminiProvider(ModelProvider):
    def __init__(
        self,
        model_name: str,
        api_key: str | None = None,
        max_api_retries: int = 3,
        retry_base_seconds: float = 2.0,
        retry_jitter_seconds: float = 0.0,
    ) -> None:
        if not HAS_GENAI:
            raise RuntimeError("google-genai is not installed. Install with: pip install google-genai")

        if api_key is None:
            _, api_key = resolve_env_api_key(("GOOGLE_API_KEY", "GEMINI_API_KEY"))

        self.model_name = model_name
        self.api_key = api_key
        self.max_api_retries = max(1, max_api_retries)
        self.retry_base_seconds = max(0.1, retry_base_seconds)
        self.retry_jitter_seconds = max(0.0, retry_jitter_seconds)
        self._usage_summary = ProviderUsageSummary(provider_name="gemini")
        self._aclient = genai.Client(api_key=api_key).aio

    async def close(self) -> None:
        if self._aclient is not None:
            await self._aclient.aclose()
            self._aclient = None

    async def generate_repair(self, prompt: str, problem_name: str) -> str:
        last_error: Exception | None = None

        for attempt in range(1, self.max_api_retries + 1):
            _log(f"{problem_name}: sending API request (provider retry {attempt}/{self.max_api_retries})")
            try:
                response = await self._aclient.models.generate_content(
                    model=self.model_name,
                    contents=prompt,
                )
                self._record_usage(response)
                text = getattr(response, "text", None)
                if not text:
                    detail = _describe_empty_response(response)
                    raise RuntimeError(f"Gemini returned empty text for {problem_name} ({detail})")
                return text
            except Exception as exc:
                error_summary = _format_error_summary(exc)
                if _is_model_not_found_error(exc):
                    raise FatalProviderError(
                        f"Gemini model configuration error for {problem_name}: {error_summary}"
                    ) from exc
                if _is_quota_exhausted_error(exc):
                    raise QuotaExhaustedError(
                        f"Gemini quota/billing exhausted for {problem_name}: {error_summary}"
                    ) from exc

                last_error = exc
                if attempt < self.max_api_retries:
                    delay = _extract_retry_delay_seconds(exc)
                    backoff = float(delay) if delay is not None else self.retry_base_seconds * (2 ** (attempt - 1))
                    sleep_time = backoff + random.uniform(0.0, self.retry_jitter_seconds)
                    _log(
                        f"{problem_name}: provider retry {attempt}/{self.max_api_retries} failed "
                        f"({error_summary}); retrying after {sleep_time:.2f}s"
                    )
                    await asyncio.sleep(sleep_time)
                else:
                    _log(
                        f"{problem_name}: provider retry {attempt}/{self.max_api_retries} failed "
                        f"({error_summary}); no retries remain"
                    )

        if last_error is None:
            raise RuntimeError("Gemini provider failed without an exception")
        raise last_error

    def get_usage_summary(self) -> ProviderUsageSummary | None:
        return replace(self._usage_summary)

    def load_usage_summary(self, payload: dict[str, object]) -> None:
        provider_name = str(payload.get("provider_name", "")).strip().lower()
        if provider_name and provider_name != "gemini":
            return

        self._usage_summary = ProviderUsageSummary(
            provider_name="gemini",
            successful_requests=int(payload.get("successful_requests", 0)),
            prompt_token_count=int(payload.get("prompt_token_count", 0)),
            response_token_count=int(payload.get("response_token_count", 0)),
            total_token_count=int(payload.get("total_token_count", 0)),
            usage_metadata_requests=int(payload.get("usage_metadata_requests", 0)),
        )

    def _record_usage(self, response: object) -> None:
        self._usage_summary.successful_requests += 1

        usage = getattr(response, "usage_metadata", None)
        if usage is None:
            return

        self._usage_summary.usage_metadata_requests += 1
        self._usage_summary.prompt_token_count += int(getattr(usage, "prompt_token_count", 0) or 0)
        self._usage_summary.response_token_count += int(getattr(usage, "response_token_count", 0) or 0)
        self._usage_summary.total_token_count += int(getattr(usage, "total_token_count", 0) or 0)


def _extract_retry_delay_seconds(error: Exception | str) -> float | None:
    error_text = _exception_text(error)
    match = re.search(r"retryDelay[\"']?\s*:\s*[\"']?(\d+(?:\.\d+)?)s", error_text)
    if match:
        return float(match.group(1))
    return None


def _exception_text(error: Exception | str) -> str:
    if isinstance(error, str):
        return error
    return str(error)


def _exception_code(error: Exception | str) -> int | None:
    if isinstance(error, Exception):
        code = getattr(error, "code", None)
        if isinstance(code, int):
            return code
        if isinstance(code, str) and code.isdigit():
            return int(code)

    match = re.search(r"'code':\s*(\d+)", _exception_text(error))
    if match:
        return int(match.group(1))
    return None


def _exception_status(error: Exception | str) -> str:
    if isinstance(error, Exception):
        status = getattr(error, "status", None)
        if isinstance(status, str) and status.strip():
            return status.strip()

    match = re.search(r"'status':\s*'([^']+)'", _exception_text(error))
    if match:
        return match.group(1).strip()
    return ""


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

    prefix_parts: list[str] = []
    if code is not None:
        prefix_parts.append(str(code))
    if status:
        prefix_parts.append(status)

    prefix = " ".join(prefix_parts)
    if prefix and message:
        return f"{prefix}: {message}"
    if prefix:
        return prefix
    return message


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

    return (
        code == 429
        and status == "resource_exhausted"
        and any(marker in lowered for marker in ("quota", "billing", "credits"))
    )


def _is_model_not_found_error(error: Exception | str) -> bool:
    code = _exception_code(error)
    status = _exception_status(error).lower()
    lowered = _exception_message(error).lower()
    return (
        code == 404
        and status == "not_found"
        and (
            "is not found for api version" in lowered
            or "not supported for generatecontent" in lowered
            or "models/" in lowered
        )
    )


def _describe_empty_response(response: object) -> str:
    details: list[str] = []

    candidates = getattr(response, "candidates", None)
    if candidates is None:
        details.append("candidates=unknown")
    else:
        details.append(f"candidates={len(candidates)}")
        if candidates:
            details.extend(_describe_candidate(candidates[0]))

    prompt_feedback = getattr(response, "prompt_feedback", None)
    if prompt_feedback is not None:
        details.extend(_describe_prompt_feedback(prompt_feedback))

    usage = getattr(response, "usage_metadata", None)
    if usage is not None:
        prompt_tokens = int(getattr(usage, "prompt_token_count", 0) or 0)
        total_tokens = int(getattr(usage, "total_token_count", 0) or 0)
        details.append(f"prompt_tokens={prompt_tokens}")
        details.append(f"total_tokens={total_tokens}")

    filtered = [item for item in details if item]
    return ", ".join(filtered) if filtered else "no response metadata"


def _describe_candidate(candidate: object) -> list[str]:
    details: list[str] = []

    finish_reason = getattr(candidate, "finish_reason", None)
    if finish_reason not in (None, "", "FINISH_REASON_UNSPECIFIED"):
        details.append(f"finish_reason={finish_reason}")

    finish_message = getattr(candidate, "finish_message", None)
    if isinstance(finish_message, str) and finish_message.strip():
        details.append(f"finish_message={finish_message.strip()}")

    content = getattr(candidate, "content", None)
    if content is not None:
        parts = getattr(content, "parts", None)
        if parts is None:
            details.append("parts=unknown")
        else:
            details.append(f"parts={len(parts)}")
            if parts:
                details.append(f"part_kinds={_describe_part_kinds(parts)}")

    safety_ratings = getattr(candidate, "safety_ratings", None)
    if safety_ratings:
        details.append(f"candidate_safety={len(safety_ratings)}")

    return details


def _describe_prompt_feedback(prompt_feedback: object) -> list[str]:
    details: list[str] = []

    block_reason = getattr(prompt_feedback, "block_reason", None)
    if block_reason not in (None, "", "BLOCK_REASON_UNSPECIFIED"):
        details.append(f"prompt_block_reason={block_reason}")

    block_reason_message = getattr(prompt_feedback, "block_reason_message", None)
    if isinstance(block_reason_message, str) and block_reason_message.strip():
        details.append(f"prompt_block_reason_message={block_reason_message.strip()}")

    safety_ratings = getattr(prompt_feedback, "safety_ratings", None)
    if safety_ratings:
        details.append(f"prompt_safety={len(safety_ratings)}")

    return details


def _describe_part_kinds(parts: object) -> str:
    kinds: list[str] = []
    for part in list(parts)[:3]:
        if getattr(part, "text", None):
            kinds.append("text")
        elif getattr(part, "inline_data", None) is not None:
            kinds.append("inline_data")
        elif getattr(part, "function_call", None) is not None:
            kinds.append("function_call")
        elif getattr(part, "function_response", None) is not None:
            kinds.append("function_response")
        else:
            kinds.append(type(part).__name__)
    return "|".join(kinds) if kinds else "none"
