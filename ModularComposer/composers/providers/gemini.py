from __future__ import annotations

import asyncio
import random
import re

from ..utils import _log, resolve_env_api_key
from .base import FatalProviderError, ModelProvider, QuotaExhaustedError

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
        self._aclient = genai.Client(api_key=api_key).aio

    async def close(self) -> None:
        if self._aclient is not None:
            await self._aclient.aclose()
            self._aclient = None

    async def generate_repair(self, prompt: str, problem_name: str) -> str:
        last_error: Exception | None = None

        for attempt in range(1, self.max_api_retries + 1):
            _log(f"{problem_name}: sending request (attempt {attempt}/{self.max_api_retries})")
            try:
                response = await self._aclient.models.generate_content(
                    model=self.model_name,
                    contents=prompt,
                )
                text = getattr(response, "text", None)
                if not text:
                    raise RuntimeError(f"Gemini returned empty text for {problem_name}")
                return text
            except Exception as exc:
                message = str(exc)
                if _is_model_not_found_error(message):
                    raise FatalProviderError(
                        f"Gemini model configuration error for {problem_name}: {message}"
                    ) from exc
                if _is_daily_quota_exhausted(message):
                    raise QuotaExhaustedError(
                        f"Gemini daily quota exhausted for {problem_name}: {message}"
                    ) from exc

                last_error = exc
                if attempt < self.max_api_retries:
                    delay = _extract_retry_delay_seconds(message)
                    backoff = float(delay) if delay is not None else self.retry_base_seconds * (2 ** (attempt - 1))
                    sleep_time = backoff + random.uniform(0.0, self.retry_jitter_seconds)
                    _log(
                        f"{problem_name}: attempt {attempt}/{self.max_api_retries} failed ({exc}); retrying after {sleep_time:.2f}s"
                    )
                    await asyncio.sleep(sleep_time)

        if last_error is None:
            raise RuntimeError("Gemini provider failed without an exception")
        raise last_error


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


def _is_model_not_found_error(error_text: str) -> bool:
    lowered = error_text.lower()
    return (
        "404" in lowered
        and "not_found" in lowered
        and "models/" in lowered
        and (
            "is not found for api version" in lowered
            or "not supported for generatecontent" in lowered
        )
    )
