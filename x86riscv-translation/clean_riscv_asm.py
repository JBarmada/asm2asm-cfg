#!/usr/bin/env python3
"""
Clean invalid RISC-V assembly files by removing malformed directives.

USAGE:
    python clean_riscv_asm.py [directory] [--dry-run] [--verbose]

ARGUMENTS:
    directory       Path to directory containing .s files (default: current directory)
    --dry-run       Show what would be cleaned without modifying files
    --verbose       Print details for each file processed

EXAMPLES:
    # Clean all .s files in current directory
    python clean_riscv_asm.py

    # Clean a specific directory
    python clean_riscv_asm.py ./riscv_asm

    # Preview changes without modifying files
    python clean_riscv_asm.py ./riscv_asm --dry-run

    # Show verbose output
    python clean_riscv_asm.py ./riscv_asm --verbose

WHAT IT DOES:
    Removes invalid 'riscv' directive from the first line of assembly files.
    Many AI-generated RISC-V assembly files start with an invalid bare 'riscv'
    line that is not valid RISC-V assembly syntax. This script cleans those up.

    Before:
        riscv
            .text
            .globl func0

    After:
        .text
        .globl func0
"""

import argparse
import pathlib
import sys
from typing import Tuple


def clean_assembly_file(filepath: pathlib.Path, dry_run: bool = False, verbose: bool = False) -> bool:
    """
    Remove invalid 'riscv' directive from first line of assembly file.
    
    Args:
        filepath: Path to the .s file
        dry_run: If True, don't modify the file
        verbose: If True, print details
        
    Returns:
        True if file was cleaned, False otherwise
    """
    try:
        content = filepath.read_text()
    except Exception as e:
        print(f"ERROR reading {filepath}: {e}")
        return False

    # Check if first line is 'riscv' (with optional whitespace)
    lines = content.splitlines(keepends=True)
    if not lines:
        return False

    first_line = lines[0]
    
    # Match 'riscv' at start with optional whitespace
    if not first_line.strip() == 'riscv':
        if verbose:
            print(f"  {filepath.name}: no 'riscv' directive")
        return False

    # Clean it up
    if verbose:
        print(f"  {filepath.name}: removing invalid 'riscv' directive")

    if not dry_run:
        try:
            cleaned_content = ''.join(lines[1:])
            filepath.write_text(cleaned_content)
        except Exception as e:
            print(f"ERROR writing {filepath}: {e}")
            return False

    return True


def main():
    parser = argparse.ArgumentParser(
        description="Clean invalid RISC-V assembly directives from .s files",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog=__doc__
    )
    parser.add_argument(
        "directory",
        nargs="?",
        default=".",
        help="Directory containing .s files (default: current directory)"
    )
    parser.add_argument(
        "--dry-run",
        action="store_true",
        help="Show what would be cleaned without modifying files"
    )
    parser.add_argument(
        "--verbose",
        action="store_true",
        help="Print details for each file processed"
    )

    args = parser.parse_args()

    # Resolve directory
    target_dir = pathlib.Path(args.directory).resolve()
    if not target_dir.is_dir():
        print(f"ERROR: {target_dir} is not a directory")
        sys.exit(1)

    # Find all .s files
    assembly_files = sorted(target_dir.glob("*.s"))
    if not assembly_files:
        print(f"No .s files found in {target_dir}")
        sys.exit(0)

    if args.verbose:
        print(f"Processing {len(assembly_files)} .s files in {target_dir}\n")

    # Clean each file
    cleaned = 0
    for filepath in assembly_files:
        if clean_assembly_file(filepath, dry_run=args.dry_run, verbose=args.verbose):
            cleaned += 1

    # Report results
    mode = "PREVIEW" if args.dry_run else "CLEANED"
    print(f"\n{mode}: {cleaned}/{len(assembly_files)} files")
    
    if args.dry_run and cleaned > 0:
        print("\nRun without --dry-run to apply changes")

    return 0 if cleaned >= 0 else 1


if __name__ == "__main__":
    sys.exit(main())
