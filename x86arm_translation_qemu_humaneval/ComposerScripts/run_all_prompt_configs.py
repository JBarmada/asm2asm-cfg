"""Run GeminiComposer.py across all prompt configs in one command.

Run all 8 with shared options
python run_all_prompt_configs.py exp01.1 --source-language arm --model gemini-3-flash-preview --max-concurrency 10 --max-retries 3

Add distinct labels per config
python run_all_prompt_configs.py exp01.1 --run-label-prefix exp01_all8 --source-language arm

Stop immediately on first failure
python run_all_prompt_configs.py exp01.1 --stop-on-error --source-language arm

Preview commands only
python run_all_prompt_configs.py exp01.1 --dry-run --source-language arm

"""

from __future__ import annotations

import argparse
import subprocess
import sys
import time
from pathlib import Path

# DEFAULT_PROMPT_CONFIGS = [
#     "base",
#     "error_only",
#     "cfg_only",
#     "dfg_only",
#     "error_cfg",
#     "error_dfg",
#     "cfg_dfg",
#     "error_cfg_dfg",
# ]
DEFAULT_PROMPT_CONFIGS = [
    "error_only",
    "cfg_only",
    "dfg_only",
    "error_cfg",
    "error_dfg",
    "cfg_dfg",
    "error_cfg_dfg",
]


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        description=(
            "Run GeminiComposer.py for multiple prompt configs in sequence. "
            "Any unknown flags are forwarded to GeminiComposer.py."
        )
    )
    parser.add_argument("input_dir", type=Path, help="Input experiment directory")
    parser.add_argument(
        "--python-exe",
        default=sys.executable,
        help="Python executable used to run GeminiComposer.py",
    )
    parser.add_argument(
        "--composer-script",
        type=Path,
        default=Path(__file__).with_name("GeminiComposer.py"),
        help="Path to GeminiComposer.py",
    )
    parser.add_argument(
        "--prompt-configs",
        nargs="+",
        default=DEFAULT_PROMPT_CONFIGS,
        help="Prompt configs to run (default: all 8)",
    )
    parser.add_argument(
        "--run-label-prefix",
        default="",
        help=(
            "Optional run-label prefix. If set, each run gets "
            "<prefix>_<prompt_config>."
        ),
    )
    parser.add_argument(
        "--delay-seconds",
        type=float,
        default=0.0,
        help="Optional sleep between runs",
    )
    parser.add_argument(
        "--stop-on-error",
        action="store_true",
        help="Stop after the first non-zero exit code",
    )
    parser.add_argument(
        "--dry-run",
        action="store_true",
        help="Print commands without executing",
    )
    return parser


def main() -> int:
    parser = build_parser()
    args, passthrough = parser.parse_known_args()

    if any(flag == "--prompt-config" for flag in passthrough):
        print(
            "Do not pass --prompt-config in passthrough args. "
            "Use --prompt-configs on this wrapper.",
            file=sys.stderr,
        )
        return 2

    composer_script = args.composer_script.resolve()
    if not composer_script.exists():
        print(f"Composer script not found: {composer_script}", file=sys.stderr)
        return 2

    input_dir = args.input_dir.resolve()
    if not input_dir.exists():
        print(f"Input dir not found: {input_dir}", file=sys.stderr)
        return 2

    results: list[tuple[str, int]] = []

    for index, prompt_config in enumerate(args.prompt_configs, start=1):
        cmd = [
            args.python_exe,
            str(composer_script),
            str(input_dir),
            "--prompt-config",
            prompt_config,
        ]

        if args.run_label_prefix:
            cmd.extend(["--run-label", f"{args.run_label_prefix}_{prompt_config}"])

        cmd.extend(passthrough)

        print(f"\n[{index}/{len(args.prompt_configs)}] Running: {prompt_config}")
        print("Command:", " ".join(cmd))

        if args.dry_run:
            results.append((prompt_config, 0))
            continue

        completed = subprocess.run(cmd, check=False)
        results.append((prompt_config, completed.returncode))

        if completed.returncode != 0 and args.stop_on_error:
            print("Stopping early due to --stop-on-error")
            break

        if args.delay_seconds > 0 and index < len(args.prompt_configs):
            time.sleep(args.delay_seconds)

    print("\nSummary:")
    failed = 0
    for cfg, rc in results:
        status = "OK" if rc == 0 else f"FAIL (rc={rc})"
        print(f"- {cfg}: {status}")
        if rc != 0:
            failed += 1

    return 0 if failed == 0 else 1


if __name__ == "__main__":
    raise SystemExit(main())
