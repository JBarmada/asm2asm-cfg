from __future__ import annotations

import argparse
import json
import subprocess
import sys
import time
from pathlib import Path
from typing import Any


def load_config(config_path: Path) -> dict[str, Any]:
    with config_path.open("r", encoding="utf-8") as f:
        return json.load(f)


def run_once(script_path: Path, config_path: Path) -> int:
    cmd = [sys.executable, str(script_path), "--config", str(config_path)]
    completed = subprocess.run(cmd, check=False)
    return completed.returncode


def main() -> int:
    parser = argparse.ArgumentParser(description="Batch translation runner with pause/resume/stop controls.")
    parser.add_argument("--config", type=Path, default=Path(__file__).with_name("translation_config.json"))
    args = parser.parse_args()

    cfg = load_config(args.config)
    batch_cfg = cfg.get("batch_mode", {})
    poll_seconds = int(batch_cfg.get("poll_seconds", 15))
    pause_file = Path(batch_cfg.get("pause_file", ".pause"))
    stop_file = Path(batch_cfg.get("stop_file", ".stop"))

    script_path = Path(__file__).with_name("parallel_translate.py")
    print("Batch runner active. Create .pause to pause, delete .pause to resume, create .stop to stop.")

    while True:
        if stop_file.exists():
            print("Stop file detected. Exiting batch runner.")
            return 0

        if pause_file.exists():
            print("Paused. Waiting...")
            time.sleep(poll_seconds)
            continue

        code = run_once(script_path, args.config)
        if code != 0:
            print(f"parallel_translate exited with code {code}; retrying in {poll_seconds}s")
        else:
            print(f"parallel_translate completed; sleeping {poll_seconds}s before next batch")

        time.sleep(poll_seconds)


if __name__ == "__main__":
    raise SystemExit(main())
