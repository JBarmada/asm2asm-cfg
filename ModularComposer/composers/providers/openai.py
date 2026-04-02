from __future__ import annotations

import asyncio
import importlib
import importlib.util
import random

from ..utils import resolve_env_api_key
from .base import ModelProvider, QuotaExhaustedError

HAS_OPENAI = importlib.util.find_spec("openai") is not None


class OpenAIProvider(ModelProvider):
    def __init__(
        self,
        model_name: str,
        api_key: str | None = None,
        max_api_retries: int = 3,
        retry_base_seconds: float = 2.0,
        retry_jitter_seconds: float = 0.0,
    ) -> None:
        if not HAS_OPENAI:
            raise RuntimeError("openai is not installed. Install with: pip install openai")

        openai_module = importlib.import_module("openai")
        async_openai_cls = getattr(openai_module, "AsyncOpenAI", None)
        if async_openai_cls is None:
            raise RuntimeError("openai package is installed but AsyncOpenAI is unavailable")

        if api_key is None:
            _, api_key = resolve_env_api_key(("OPENAI_API_KEY",))

        self.model_name = model_name
        self.max_api_retries = max(1, max_api_retries)
        self.retry_base_seconds = max(0.1, retry_base_seconds)
        self.retry_jitter_seconds = max(0.0, retry_jitter_seconds)
        self._openai_module = openai_module
        self._aclient = async_openai_cls(api_key=api_key)

    async def close(self) -> None:
        close_fn = getattr(self._aclient, "close", None)
        if callable(close_fn):
            maybe_coro = close_fn()
            if asyncio.iscoroutine(maybe_coro):
                await maybe_coro

    async def generate_repair(self, prompt: str, problem_name: str) -> str:
        last_error: Exception | None = None

        for attempt in range(1, self.max_api_retries + 1):
            try:
                response = await self._aclient.responses.create(
                    model=self.model_name,
                    input=prompt,
                    timeout=120,
                )
                text = getattr(response, "output_text", None)
                if not text:
                    raise RuntimeError(f"OpenAI returned empty text for {problem_name}")
                return text
            except Exception as exc:
                last_error = exc
                message = str(exc).lower()
                if "insufficient_quota" in message:
                    raise QuotaExhaustedError(
                        f"OpenAI quota exhausted for {problem_name}: {exc}"
                    ) from exc

                is_retryable = (
                    isinstance(exc, getattr(self._openai_module, "RateLimitError", Exception))
                    or "rate limit" in message
                    or "timeout" in message
                    or "temporarily unavailable" in message
                )
                if attempt < self.max_api_retries and is_retryable:
                    await asyncio.sleep(
                        self.retry_base_seconds * (2 ** (attempt - 1))
                        + random.uniform(0.0, self.retry_jitter_seconds)
                    )
                elif attempt < self.max_api_retries:
                    await asyncio.sleep(self.retry_base_seconds + random.uniform(0.0, self.retry_jitter_seconds))

        if last_error is None:
            raise RuntimeError("OpenAI provider failed without an exception")
        raise last_error
