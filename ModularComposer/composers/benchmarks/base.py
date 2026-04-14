from __future__ import annotations

import abc
from pathlib import Path

from ..utils import ProblemSpec, ValidationFeedback


class BenchmarkAdapter(abc.ABC):
    benchmark_id: str
    benchmark_display_name: str

    @abc.abstractmethod
    def bootstrap_error_json(self, asm_dir: Path, output_path: Path) -> Path:
        raise NotImplementedError

    @abc.abstractmethod
    def get_problem_specs(self, prompt_config: str) -> list[ProblemSpec]:
        raise NotImplementedError

    @abc.abstractmethod
    def validate(self, problem: ProblemSpec, candidate_asm: str, attempt: int) -> ValidationFeedback:
        raise NotImplementedError

    @abc.abstractmethod
    def validate_all_outputs(self) -> tuple[Path, int, int]:
        raise NotImplementedError

    def prompt_constraints(self, problem: ProblemSpec) -> tuple[str, ...]:
        return problem.prompt_constraints

    def max_validation_concurrency(self) -> int | None:
        return None
