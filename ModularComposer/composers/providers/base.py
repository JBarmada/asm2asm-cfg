from __future__ import annotations

import abc
from dataclasses import asdict, dataclass


class QuotaExhaustedError(RuntimeError):
    pass


class FatalProviderError(RuntimeError):
    pass


@dataclass
class ProviderUsageSummary:
    provider_name: str
    successful_requests: int = 0
    prompt_token_count: int = 0
    response_token_count: int = 0
    total_token_count: int = 0
    usage_metadata_requests: int = 0


class ModelProvider(abc.ABC):
    @abc.abstractmethod
    async def generate_repair(self, prompt: str, problem_name: str) -> str:
        raise NotImplementedError

    def get_usage_summary(self) -> ProviderUsageSummary | None:
        return None

    def load_usage_summary(self, payload: dict[str, object]) -> None:
        return None


def provider_usage_summary_to_dict(summary: ProviderUsageSummary) -> dict[str, object]:
    return asdict(summary)


def provider_usage_summary_from_dict(payload: dict[str, object]) -> ProviderUsageSummary:
    return ProviderUsageSummary(
        provider_name=str(payload.get("provider_name", "")),
        successful_requests=int(payload.get("successful_requests", 0)),
        prompt_token_count=int(payload.get("prompt_token_count", 0)),
        response_token_count=int(payload.get("response_token_count", 0)),
        total_token_count=int(payload.get("total_token_count", 0)),
        usage_metadata_requests=int(payload.get("usage_metadata_requests", 0)),
    )
