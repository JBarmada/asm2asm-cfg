from __future__ import annotations

import sys
import unittest
from pathlib import Path
from types import SimpleNamespace
from unittest import mock

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))

from composers.providers.base import FatalProviderError, ProviderUsageSummary, QuotaExhaustedError
from composers.providers.gemini import (
    GeminiProvider,
    _format_error_summary,
    _is_model_not_found_error,
    _is_quota_exhausted_error,
)


class FakeAPIError(RuntimeError):
    def __init__(self, *, code: int, message: str, status: str) -> None:
        super().__init__(message)
        self.code = code
        self.message = message
        self.status = status

    def __str__(self) -> str:
        return (
            "{'error': {'code': "
            f"{self.code}, 'message': '{self.message}', 'status': '{self.status}'"
            "}}"
        )


class FakeModels:
    def __init__(self, responses):
        self._responses = list(responses)
        self.calls = 0

    async def generate_content(self, *, model: str, contents: str):
        self.calls += 1
        response = self._responses.pop(0)
        if isinstance(response, Exception):
            raise response
        return response


class GeminiProviderTests(unittest.IsolatedAsyncioTestCase):
    def _provider(self, responses, *, retries: int = 3) -> tuple[GeminiProvider, FakeModels]:
        provider = object.__new__(GeminiProvider)
        provider.model_name = "gemini-3-flash-preview"
        provider.api_key = "test-key"
        provider.max_api_retries = retries
        provider.retry_base_seconds = 2.0
        provider.retry_jitter_seconds = 0.0
        provider._usage_summary = ProviderUsageSummary(provider_name="gemini")
        models = FakeModels(responses)
        provider._aclient = SimpleNamespace(models=models)
        return provider, models

    async def test_generate_repair_fails_fast_on_depleted_credits(self) -> None:
        provider, models = self._provider(
            [
                FakeAPIError(
                    code=429,
                    status="RESOURCE_EXHAUSTED",
                    message=(
                        "Your prepayment credits are depleted. Please go to AI Studio at "
                        "https://ai.studio/projects to manage your project and billing."
                    ),
                )
            ]
        )

        with self.assertRaises(QuotaExhaustedError) as ctx:
            await provider.generate_repair("repair this", "problem57")

        self.assertIn("quota/billing exhausted", str(ctx.exception))
        self.assertEqual(models.calls, 1)

    async def test_generate_repair_retries_retryable_rate_limit_then_succeeds(self) -> None:
        provider, models = self._provider(
            [
                FakeAPIError(
                    code=429,
                    status="RESOURCE_EXHAUSTED",
                    message="Rate limit reached for this model. retryDelay': '4s'",
                ),
                SimpleNamespace(text=".globl func0\nfunc0:\n ret\n"),
            ],
            retries=2,
        )

        with mock.patch("composers.providers.gemini.asyncio.sleep", new=mock.AsyncMock()) as sleep_mock:
            result = await provider.generate_repair("repair this", "problem1")

        self.assertIn("func0", result)
        self.assertEqual(models.calls, 2)
        sleep_mock.assert_awaited_once_with(4.0)
        usage = provider.get_usage_summary()
        self.assertIsNotNone(usage)
        self.assertEqual(usage.successful_requests, 1)

    async def test_generate_repair_fails_fast_on_model_not_found(self) -> None:
        provider, models = self._provider(
            [
                FakeAPIError(
                    code=404,
                    status="NOT_FOUND",
                    message="models/gemini-does-not-exist is not found for API version v1beta",
                )
            ]
        )

        with self.assertRaises(FatalProviderError) as ctx:
            await provider.generate_repair("repair this", "problem1")

        self.assertIn("model configuration error", str(ctx.exception))
        self.assertEqual(models.calls, 1)

    def test_error_helpers_use_structured_fields(self) -> None:
        quota_error = FakeAPIError(
            code=429,
            status="RESOURCE_EXHAUSTED",
            message="Your prepayment credits are depleted.",
        )
        model_error = FakeAPIError(
            code=404,
            status="NOT_FOUND",
            message="models/foo is not found for API version v1beta",
        )

        self.assertEqual(
            _format_error_summary(quota_error),
            "429 RESOURCE_EXHAUSTED: Your prepayment credits are depleted.",
        )
        self.assertTrue(_is_quota_exhausted_error(quota_error))
        self.assertTrue(_is_model_not_found_error(model_error))

    async def test_generate_repair_accumulates_usage_metadata(self) -> None:
        provider, _ = self._provider(
            [
                SimpleNamespace(
                    text=".globl func0\nfunc0:\n ret\n",
                    usage_metadata=SimpleNamespace(
                        prompt_token_count=123,
                        response_token_count=45,
                        total_token_count=168,
                    ),
                )
            ],
            retries=1,
        )

        await provider.generate_repair("repair this", "problem1")
        usage = provider.get_usage_summary()
        self.assertIsNotNone(usage)
        self.assertEqual(usage.successful_requests, 1)
        self.assertEqual(usage.usage_metadata_requests, 1)
        self.assertEqual(usage.prompt_token_count, 123)
        self.assertEqual(usage.response_token_count, 45)
        self.assertEqual(usage.total_token_count, 168)

    def test_load_usage_summary_restores_counts(self) -> None:
        provider, _ = self._provider([], retries=1)
        provider.load_usage_summary(
            {
                "provider_name": "gemini",
                "successful_requests": 7,
                "prompt_token_count": 700,
                "response_token_count": 140,
                "total_token_count": 840,
                "usage_metadata_requests": 6,
            }
        )

        usage = provider.get_usage_summary()
        self.assertIsNotNone(usage)
        self.assertEqual(usage.successful_requests, 7)
        self.assertEqual(usage.prompt_token_count, 700)
        self.assertEqual(usage.response_token_count, 140)
        self.assertEqual(usage.total_token_count, 840)
        self.assertEqual(usage.usage_metadata_requests, 6)


if __name__ == "__main__":
    unittest.main()
