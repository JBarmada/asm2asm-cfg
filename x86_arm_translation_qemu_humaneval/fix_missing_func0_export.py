from __future__ import annotations

import argparse
import re
from dataclasses import dataclass
from pathlib import Path


# Usage examples:
#   Dry-run across all exp01 translated ARM assembly files:
#   python x86_arm_translation_qemu_humaneval/fix_missing_func0_export.py \
#       x86_arm_translation_qemu_humaneval/results/exp01/arm_asm \
#       --dry-run
#
#   Actually patch all exp01 translated ARM assembly files in place:
#   python x86_arm_translation_qemu_humaneval/fix_missing_func0_export.py \
#       x86_arm_translation_qemu_humaneval/results/exp01/arm_asm
#
#   Patch one specific file only:
#   python x86_arm_translation_qemu_humaneval/fix_missing_func0_export.py \
#       x86_arm_translation_qemu_humaneval/results/exp01/arm_asm/problem44_O2.s
#
# What this script changes:
# 1. Looks for a func0: label in each .s file.
# 2. If func0 exists but is not exported, inserts .globl func0.
# 3. Also inserts .type func0,@function when it is missing.
# 4. Leaves files unchanged if func0 is already exported or absent.


FUNC0_LABEL_RE = re.compile(r"^\s*func0:\s*(?:[#;].*)?$", re.MULTILINE)
FUNC0_GLOBL_RE = re.compile(r"^\s*\.(?:globl|global)\s+func0\b", re.MULTILINE)
FUNC0_TYPE_RE = re.compile(r"^\s*\.type\s+func0\s*,\s*@function\b", re.MULTILINE)


@dataclass
class FixResult:
    path: Path
    changed: bool
    reason: str


def parse_args() -> argparse.Namespace:
    # target can be either one assembly file or a whole directory such as:
    # x86_arm_translation_qemu_humaneval/results/exp01/arm_asm
    parser = argparse.ArgumentParser(
        description="Insert missing func0 export directives in ARM assembly files."
    )
    parser.add_argument(
        "target",
        type=Path,
        help="File or directory containing .s files",
    )
    parser.add_argument(
        "--dry-run",
        action="store_true",
        help="Show which files would change without writing to disk",
    )
    return parser.parse_args()


def iter_asm_files(target: Path) -> list[Path]:
    # Directory input lets you fix an entire experiment result folder at once.
    if target.is_file():
        return [target] if target.suffix == ".s" else []
    return sorted(p for p in target.rglob("*.s") if p.is_file())


def detect_newline(text: str) -> str:
    return "\r\n" if "\r\n" in text else "\n"


def fix_file_text(text: str) -> tuple[bool, str, str]:
    if not FUNC0_LABEL_RE.search(text):
        return False, text, "no_func0_label"

    if FUNC0_GLOBL_RE.search(text):
        return False, text, "already_exported"

    newline = detect_newline(text)
    lines = text.splitlines(keepends=True)

    label_index = -1
    for idx, line in enumerate(lines):
        if FUNC0_LABEL_RE.match(line.rstrip("\r\n")):
            label_index = idx
            break

    if label_index < 0:
        return False, text, "no_func0_label"

    insert_lines = [f".globl func0{newline}"]
    if not FUNC0_TYPE_RE.search(text):
        insert_lines.append(f".type func0,@function{newline}")

    lines[label_index:label_index] = insert_lines
    new_text = "".join(lines)
    return True, new_text, "patched"


def process_file(path: Path, dry_run: bool) -> FixResult:
    # In dry-run mode we compute the patch decision but do not write the file.
    text = path.read_text(encoding="utf-8")
    changed, new_text, reason = fix_file_text(text)
    if changed and not dry_run:
        path.write_text(new_text, encoding="utf-8")
    return FixResult(path=path, changed=changed, reason=reason)


def main() -> int:
    # Typical exp01 usage:
    # python x86_arm_translation_qemu_humaneval/fix_missing_func0_export.py \
    #     x86_arm_translation_qemu_humaneval/results/exp01/arm_asm --dry-run
    args = parse_args()
    target = args.target.resolve()

    if not target.exists():
        print(f"Target not found: {target}")
        return 2

    asm_files = iter_asm_files(target)
    if not asm_files:
        print("No .s files found")
        return 1

    changed_count = 0
    for path in asm_files:
        result = process_file(path, dry_run=args.dry_run)
        if result.changed:
            changed_count += 1
            action = "would patch" if args.dry_run else "patched"
            print(f"[{action}] {result.path}")

    print(
        f"Done. scanned={len(asm_files)} changed={changed_count} "
        f"mode={'dry-run' if args.dry_run else 'write'}"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
