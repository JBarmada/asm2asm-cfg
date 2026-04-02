from __future__ import annotations

import abc
from pathlib import Path

from ..utils import ProblemSpec, ValidationFeedback


class BaseEvaluator(abc.ABC):
    @abc.abstractmethod
    def get_problem_specs(self, prompt_config: str) -> list[ProblemSpec]:
        raise NotImplementedError

    @abc.abstractmethod
    def validate(self, problem_name: str, candidate_asm: str, attempt: int, source_asm_name: str) -> ValidationFeedback:
        raise NotImplementedError

    @abc.abstractmethod
    def validate_all_outputs(self) -> tuple[Path, int, int]:
        raise NotImplementedError
