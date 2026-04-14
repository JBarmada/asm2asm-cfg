from __future__ import annotations

try:
    from datasets import load_dataset

    HAS_DATASETS = True
except ImportError:
    HAS_DATASETS = False

from ..utils import benchmark_display_name, default_graph_dataset_id, normalize_benchmark_id
from .base import BenchmarkAdapter
from .bringup import BringUpBenchmark
from .standard_c import StandardCBenchmark


def create_benchmark_adapter(
    benchmark_id: str,
    *,
    paths,
    cfg: dict[str, object],
    cfg_data: dict[str, str] | None = None,
    dfg_data: dict[str, str] | None = None,
) -> BenchmarkAdapter:
    benchmark_id = normalize_benchmark_id(benchmark_id)
    if benchmark_id == "bringup":
        return BringUpBenchmark(paths=paths, cfg=cfg, cfg_data=cfg_data, dfg_data=dfg_data)

    return StandardCBenchmark(
        benchmark_id=benchmark_id,
        benchmark_display_name=benchmark_display_name(benchmark_id),
        paths=paths,
        cfg=cfg,
        cfg_data=cfg_data,
        dfg_data=dfg_data,
    )


def load_graph_data(
    cfg: dict[str, object],
    *,
    benchmark_id: str,
    column: str,
    graph_kind: str,
    split: str,
) -> dict[str, str]:
    source = str(cfg.get("graph_source", "hf")).lower()
    if source in {"none", "off", "disabled"}:
        return {}
    if source != "hf":
        raise RuntimeError(f"Unsupported graph_source: {source}")

    if not HAS_DATASETS:
        raise RuntimeError("CFG/DFG loading requires datasets package. Install with: pip install datasets")

    dataset_key = "cfg_dataset_id" if graph_kind == "cfg" else "dfg_dataset_id"
    dataset_id = cfg.get(dataset_key)
    if dataset_id is None:
        dataset_id = default_graph_dataset_id(benchmark_id, graph_kind)
    if dataset_id is None:
        raise RuntimeError(
            f"{benchmark_display_name(benchmark_id)} does not have a default {graph_kind.upper()} dataset. "
            f"Set '{dataset_key}' explicitly in config."
        )

    hf_token = cfg.get("hf_token")
    if hf_token is None:
        import os

        hf_token = os.environ.get("HF_TOKEN") or os.environ.get("HUGGINGFACE_HUB_TOKEN")

    ds = load_dataset(str(dataset_id), split=split, token=hf_token)
    graph_map: dict[str, str] = {}
    for row in ds:
        task_name = row.get("task_name")
        if not task_name or column not in row:
            continue
        graph_map[str(task_name)] = str(row[column])
    return graph_map


__all__ = [
    "BenchmarkAdapter",
    "BringUpBenchmark",
    "StandardCBenchmark",
    "create_benchmark_adapter",
    "load_graph_data",
]
