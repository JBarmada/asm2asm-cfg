from __future__ import annotations

from pathlib import Path

from ..benchmarks import load_graph_data
from ..benchmarks.standard_c import StandardCBenchmark
from ..utils import read_config


class HumanEvalEvaluator(StandardCBenchmark):
    def __init__(
        self,
        *,
        paths,
        config_path: Path,
        validator_script: Path | None = None,
        cfg_data: dict[str, str] | None = None,
        dfg_data: dict[str, str] | None = None,
    ) -> None:
        cfg = read_config(config_path.resolve())
        super().__init__(
            benchmark_id="humaneval",
            benchmark_display_name="HumanEval",
            paths=paths,
            cfg=cfg,
            cfg_data=cfg_data,
            dfg_data=dfg_data,
        )
        self.config_path = config_path.resolve()
        self.validator_script = validator_script.resolve() if validator_script is not None else None


__all__ = ["HumanEvalEvaluator", "load_graph_data"]
