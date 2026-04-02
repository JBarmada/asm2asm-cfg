from __future__ import annotations

import abc


class QuotaExhaustedError(RuntimeError):
    pass


class FatalProviderError(RuntimeError):
    pass


class ModelProvider(abc.ABC):
    @abc.abstractmethod
    async def generate_repair(self, prompt: str, problem_name: str) -> str:
        raise NotImplementedError
