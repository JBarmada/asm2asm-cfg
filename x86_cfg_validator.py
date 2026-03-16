import re
import sys
import argparse
import os
import json

# Usage examples:
#   python x86_cfg_validator.py -n 2
#   python x86_cfg_validator.py --all
#   python x86_cfg_validator.py --all --start 1 --end 20
#   python x86_cfg_validator.py --all --config x86_cfg_validator_config.json
#   python x86_cfg_validator.py <asm_file> <cfg_file>


# ---------------------------------------------------------
# LOGGING
# ---------------------------------------------------------

def log(message, msg_type="info", args=None):
    if msg_type in ("summary", "error"):
        print(message)
    elif msg_type == "info":
        if args and args.wrong:
            return
        print(message)


def debug(message, args):
    if args and getattr(args, "debug", False):
        print(f"[DEBUG] {message}")


# ---------------------------------------------------------
# CONFIG
# ---------------------------------------------------------

def resolve_path(path_value, script_dir):
    if not path_value:
        return None
    if os.path.isabs(path_value):
        return path_value
    return os.path.normpath(os.path.join(script_dir, path_value))


def load_config(config_path, script_dir, args):
    defaults = {
        "asm_dir": os.path.join(script_dir, "Compiledown_HumanEval_O2", "x86", "asm"),
        "cfg_dir": os.path.join(script_dir, "Compiledown_HumanEval_O2", "x86", "cfg"),
        "asm_pattern": "problem{n}_O2.s",
        "cfg_pattern": "problem{n}_O2_cfg.txt",
        "problem_start": 1,
        "problem_end": 164,
    }

    if not config_path:
        return defaults

    resolved_config_path = resolve_path(config_path, script_dir)
    if not resolved_config_path or not os.path.exists(resolved_config_path):
        debug(f"Config file not found, using defaults: {resolved_config_path}", args)
        return defaults

    with open(resolved_config_path, "r", encoding="utf-8") as f:
        loaded = json.load(f)

    if not isinstance(loaded, dict):
        raise ValueError("Config JSON must be an object")

    merged = defaults.copy()
    merged.update(loaded)

    for key in ("asm_dir", "cfg_dir"):
        merged[key] = resolve_path(merged.get(key), script_dir)

    return merged


def build_problem_paths(problem_number, cfg):
    asm_file = os.path.join(cfg["asm_dir"], cfg["asm_pattern"].format(n=problem_number))
    cfg_file = os.path.join(cfg["cfg_dir"], cfg["cfg_pattern"].format(n=problem_number))
    return asm_file, cfg_file


# ---------------------------------------------------------
# ASM PARSER
# ---------------------------------------------------------

def parse_asm(asm_text, args):
    log("[INFO] Parsing Assembly file...", "info", args)

    asm_data = {}
    addresses = []

    # Require real instruction text (avoids pure padding byte-only lines)
    asm_regex = re.compile(r'^\s*([0-9a-f]+):\s+(?:[0-9a-f]{2}\s+)+\s*(\S.*)')

    for line in asm_text.strip().split('\n'):
        match = asm_regex.match(line)
        if not match:
            continue

        addr = match.group(1).lstrip('0')
        inst = match.group(2).strip()

        # Remove <func+...> annotations
        inst = re.sub(r'\s*<.*>', '', inst)
        inst = re.sub(r'\s+', ' ', inst)

        addresses.append(addr)

        jump_target = None
        jump_match = re.search(r'j\w+\s+([0-9a-f]+)', inst)
        if jump_match:
            jump_target = jump_match.group(1).lstrip('0')

        asm_data[addr] = {
            'instruction': inst,
            'jump_target': jump_target,
            'next_addr': None
        }

    # Set fallthrough addresses
    for i in range(len(addresses) - 1):
        asm_data[addresses[i]]['next_addr'] = addresses[i + 1]

    if asm_data:
        debug(f"Parsed {len(asm_data)} ASM instructions (objdump format)", args)
        return asm_data

    # Fallback for compiler-generated .s source files.
    instructions = []
    labels = {}

    for raw in asm_text.split('\n'):
        line = raw.strip()
        if not line:
            continue

        # Labels map to the next instruction index.
        label_match = re.match(r'^([.\w$@]+):', line)
        if label_match:
            labels[label_match.group(1)] = len(instructions)
            continue

        # Drop full-line comments and assembler directives.
        if line.startswith('#') or line.startswith('.'):
            continue

        # Remove inline comments, then normalize spacing.
        line = re.sub(r'\s+#.*$', '', line).strip()
        if not line:
            continue

        line = re.sub(r'\s+', ' ', line)
        instructions.append(line)

    debug(f"Parsed {len(instructions)} ASM instructions (.s source format)", args)
    return {
        '__mode': 'source',
        'instructions': instructions,
        'labels': labels,
    }


# ---------------------------------------------------------
# CFG PARSER
# ---------------------------------------------------------

def parse_cfg(cfg_text, args):
    log("[INFO] Parsing CFG file...", "info", args)

    cfg_blocks = {}
    current_block = None
    in_instructions = False

    for line in cfg_text.split('\n'):
        line = line.strip()

        block_match = re.match(r'^BLOCK (\d+)', line)
        if block_match:
            block_decimal = int(block_match.group(1))
            block_hex = hex(block_decimal)[2:]

            current_block = block_hex
            cfg_blocks[current_block] = {
                'decimal': block_decimal,
                'NO_JUMP': None,
                'JUMP': None,
                'instructions': []
            }
            in_instructions = False
            continue

        if not current_block:
            continue

        if line.startswith("- Instructions:"):
            in_instructions = True
            continue

        if line.startswith("- Edges:"):
            in_instructions = False
            continue

        # -------------------------
        # Instruction extraction
        # -------------------------
        if in_instructions and line:
            clean_text = re.sub(r'\s*<.*>', '', line)
            clean_text = re.sub(r'\s+', ' ', clean_text)
            cfg_blocks[current_block]['instructions'].append(clean_text)

        # -------------------------
        # Edge extraction (FIXED)
        # -------------------------
        no_jump_match = re.match(r'^NO_JUMP -> (\d+)', line)
        jump_match = re.match(r'^JUMP -> (\d+)', line)

        if no_jump_match:
            val = hex(int(no_jump_match.group(1)))[2:]
            cfg_blocks[current_block]['NO_JUMP'] = val
            debug(f"Block 0x{current_block}: parsed NO_JUMP -> 0x{val}", args)

        if jump_match:
            val = hex(int(jump_match.group(1)))[2:]
            cfg_blocks[current_block]['JUMP'] = val
            debug(f"Block 0x{current_block}: parsed JUMP -> 0x{val}", args)

    debug("Final CFG edge table:", args)
    for b, d in cfg_blocks.items():
        debug(f"  Block 0x{b}: JUMP={d['JUMP']} NO_JUMP={d['NO_JUMP']}", args)

    return cfg_blocks


# ---------------------------------------------------------
# VALIDATION
# ---------------------------------------------------------

def validate_graphs(asm_data, cfg_blocks, args, show_summary=True):
    if show_summary:
        log("\n" + "=" * 50, "summary")
        log("STARTING BLOCK-BY-BLOCK VALIDATION", "summary")
        log("=" * 50, "summary")

    passed_edges = 0
    failed_edges = 0
    failed_blocks = 0

    for block_addr, data in cfg_blocks.items():
        block_dec = data['decimal']
        block_label = f"BLOCK {block_dec} (0x{block_addr})"

        if block_addr not in asm_data:
            log(f"\n[X] {block_label} NOT FOUND IN ASM", "error", args)
            failed_blocks += 1
            continue

        # -------------------------
        # Walk ASM block
        # -------------------------
        curr_addr = block_addr
        walked = []

        while curr_addr:
            inst = asm_data[curr_addr]['instruction']
            walked.append(inst)

            # Only terminators end a block: ret, jmp, and conditional jumps
            # 'call' does NOT end a block—execution continues to next instruction
            is_terminator = (
                inst.startswith(('ret', 'jmp')) or
                asm_data[curr_addr]['jump_target']  # conditional jumps
            )

            next_addr = asm_data[curr_addr]['next_addr']

            if is_terminator or next_addr in cfg_blocks or next_addr is None:
                break

            curr_addr = next_addr

        cfg_insts = data['instructions']

        # -------------------------
        # Instruction validation
        # -------------------------
        if len(walked) != len(cfg_insts):
            log(f"\n[X] {block_label} INSTRUCTION COUNT MISMATCH", "error", args)
            log(f"    ASM count: {len(walked)}", "error", args)
            log(f"    CFG count: {len(cfg_insts)}", "error", args)
            failed_blocks += 1
        else:
            mismatch = False
            for i in range(len(walked)):
                if walked[i] != cfg_insts[i]:
                    log(f"\n[X] {block_label} TEXT MISMATCH at line {i+1}", "error", args)
                    log(f"    ASM: {walked[i]}", "error", args)
                    log(f"    CFG: {cfg_insts[i]}", "error", args)
                    mismatch = True

            if mismatch:
                failed_blocks += 1
            else:
                log(f"[OK] {block_label} instructions match.", "info", args)

        # -------------------------
        # Edge validation
        # -------------------------
        end_inst = asm_data[curr_addr]['instruction']
        expected_jump = asm_data[curr_addr]['jump_target']
        expected_no_jump = (
            asm_data[curr_addr]['next_addr']
            if not end_inst.startswith(('jmp', 'ret'))
            else None
        )

        debug(
            f"{block_label}: "
            f"expected_jump={expected_jump}, "
            f"expected_no_jump={expected_no_jump}, "
            f"CFG_JUMP={data['JUMP']}, "
            f"CFG_NO_JUMP={data['NO_JUMP']}",
            args
        )

        for edge_type, actual, expected in [
            ("JUMP", data['JUMP'], expected_jump),
            ("NO_JUMP", data['NO_JUMP'], expected_no_jump)
        ]:
            if actual or expected:
                if actual == expected:
                    passed_edges += 1
                else:
                    exp_str = f"0x{expected}" if expected else "None"
                    act_str = f"0x{actual}" if actual else "None"

                    log(f"\n[X] {block_label} {edge_type} EDGE MISMATCH", "error", args)
                    log(f"    Expected: {exp_str}", "error", args)
                    log(f"    CFG says: {act_str}", "error", args)

                    failed_edges += 1

    if show_summary:
        log("\n" + "=" * 50, "summary")
        log(
            f"SUMMARY: Edges Passed: {passed_edges}, "
            f"Edges Failed: {failed_edges}, "
            f"Block Failures: {failed_blocks}",
            "summary"
        )

    return {
        "passed_edges": passed_edges,
        "failed_edges": failed_edges,
        "failed_blocks": failed_blocks,
        "ok": failed_edges == 0 and failed_blocks == 0,
    }


def validate_graphs_source(asm_source, cfg_blocks, args, show_summary=True):
    if show_summary:
        log("\n" + "=" * 50, "summary")
        log("STARTING BLOCK-BY-BLOCK VALIDATION", "summary")
        log("=" * 50, "summary")

    asm_insts = asm_source['instructions']
    labels = asm_source['labels']

    block_ranges = {}
    used_starts = set()
    ordered_blocks = sorted(cfg_blocks.items(), key=lambda item: item[1]['decimal'])
    passed_edges = 0
    failed_edges = 0
    failed_blocks = 0

    def find_block_for_index(idx):
        for baddr, (start, end) in block_ranges.items():
            if start <= idx < end:
                return baddr
        return None

    # Match each CFG block by exact instruction sequence in the .s instruction stream.
    min_start = 0
    for block_addr, data in ordered_blocks:
        cfg_insts = data['instructions']
        block_dec = data['decimal']
        block_label = f"BLOCK {block_dec} (0x{block_addr})"

        if not cfg_insts:
            block_ranges[block_addr] = (-1, -1)
            continue

        n = len(cfg_insts)
        candidates = []
        for i in range(0, max(0, len(asm_insts) - n + 1)):
            if asm_insts[i:i + n] == cfg_insts:
                candidates.append(i)

        if not candidates:
            log(f"\n[X] {block_label} INSTRUCTION SEQUENCE NOT FOUND IN ASM", "error", args)
            failed_blocks += 1
            continue

        chosen = None
        for c in candidates:
            if c not in used_starts and c >= min_start:
                chosen = c
                break
        if chosen is None:
            for c in candidates:
                if c not in used_starts:
                    chosen = c
                    break
        if chosen is None:
            chosen = candidates[0]

        used_starts.add(chosen)
        block_ranges[block_addr] = (chosen, chosen + n)
        min_start = chosen + n
        log(f"[OK] {block_label} instructions match.", "info", args)

    debug(f"Source block ranges: {block_ranges}", args)
    debug(f"Source labels: {labels}", args)

    # Validate edges using final instructions, jump labels, and fallthrough mapping.
    for block_addr, data in cfg_blocks.items():
        block_dec = data['decimal']
        block_label = f"BLOCK {block_dec} (0x{block_addr})"

        if block_addr not in block_ranges:
            continue

        start, end = block_ranges[block_addr]
        if start < 0 or end <= start:
            continue

        end_inst = asm_insts[end - 1]
        parts = end_inst.split(None, 1)
        mnemonic = parts[0]
        expected_jump = None
        expected_no_jump = None

        jump_match = re.search(r'^j\w+\s+([^\s,]+)', end_inst)
        if jump_match:
            tgt_label = jump_match.group(1)
            tgt_idx = labels.get(tgt_label)
            if tgt_idx is not None:
                expected_jump = find_block_for_index(tgt_idx)

        is_unconditional_jump = mnemonic == 'jmp' or mnemonic == 'jmpq'
        is_return = mnemonic.startswith('ret')

        if not is_return and not is_unconditional_jump:
            fallthrough_idx = end
            expected_no_jump = find_block_for_index(fallthrough_idx)

        debug(
            f"{block_label}: "
            f"expected_jump={expected_jump}, "
            f"expected_no_jump={expected_no_jump}, "
            f"CFG_JUMP={data['JUMP']}, "
            f"CFG_NO_JUMP={data['NO_JUMP']}, "
            f"end_inst={end_inst}",
            args
        )

        for edge_type, actual, expected in [
            ("JUMP", data['JUMP'], expected_jump),
            ("NO_JUMP", data['NO_JUMP'], expected_no_jump)
        ]:
            if actual or expected:
                if actual == expected:
                    passed_edges += 1
                else:
                    exp_str = f"0x{expected}" if expected else "None"
                    act_str = f"0x{actual}" if actual else "None"
                    log(f"\n[X] {block_label} {edge_type} EDGE MISMATCH", "error", args)
                    log(f"    Expected: {exp_str}", "error", args)
                    log(f"    CFG says: {act_str}", "error", args)
                    failed_edges += 1

    if show_summary:
        log("\n" + "=" * 50, "summary")
        log(
            f"SUMMARY: Edges Passed: {passed_edges}, "
            f"Edges Failed: {failed_edges}, "
            f"Block Failures: {failed_blocks}",
            "summary"
        )

    return {
        "passed_edges": passed_edges,
        "failed_edges": failed_edges,
        "failed_blocks": failed_blocks,
        "ok": failed_edges == 0 and failed_blocks == 0,
    }


def run_single_problem(asm_file, cfg_file, args, show_summary=True):
    with open(asm_file, 'r', encoding='utf-8') as f:
        asm_text = f.read()

    with open(cfg_file, 'r', encoding='utf-8') as f:
        cfg_text = f.read()

    asm_data = parse_asm(asm_text, args)
    cfg_blocks = parse_cfg(cfg_text, args)
    if isinstance(asm_data, dict) and asm_data.get('__mode') == 'source':
        return validate_graphs_source(asm_data, cfg_blocks, args, show_summary=show_summary)
    return validate_graphs(asm_data, cfg_blocks, args, show_summary=show_summary)


# ---------------------------------------------------------
# MAIN
# ---------------------------------------------------------

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("asm_file", nargs='?', default=None,
                        help="Path to ASM file (or problem number if -n is used)")
    parser.add_argument("cfg_file", nargs='?', default=None,
                        help="Path to CFG file")
    parser.add_argument("-n", "--number", type=int, default=None,
                        help="Problem number (uses default paths)")
    parser.add_argument("--all", action="store_true",
                        help="Validate all configured problems")
    parser.add_argument("--start", type=int, default=None,
                        help="Start problem number for --all")
    parser.add_argument("--end", type=int, default=None,
                        help="End problem number for --all")
    parser.add_argument("--config", default="x86_cfg_validator_config.json",
                        help="Path to JSON config file")
    parser.add_argument("--asm-dir", default=None,
                        help="Override ASM directory from config")
    parser.add_argument("--cfg-dir", default=None,
                        help="Override CFG directory from config")
    parser.add_argument("-w", "--wrong", action="store_true")
    parser.add_argument("-d", "--debug", action="store_true",
                        help="Enable debug output")

    args = parser.parse_args()

    script_dir = os.path.dirname(os.path.abspath(__file__))
    cfg = load_config(args.config, script_dir, args)

    if args.asm_dir:
        cfg["asm_dir"] = resolve_path(args.asm_dir, script_dir)
    if args.cfg_dir:
        cfg["cfg_dir"] = resolve_path(args.cfg_dir, script_dir)

    if not cfg.get("asm_dir") or not cfg.get("cfg_dir"):
        parser.error("ASM/CFG directories are not configured")

    # Allow: x86_cfg_validator.py -n 2
    #    or: x86_cfg_validator.py 2       (positional shorthand)
    prob = args.number
    if prob is None and args.asm_file and args.asm_file.isdigit():
        prob = int(args.asm_file)

    if args.all:
        start = args.start if args.start is not None else int(cfg.get("problem_start", 1))
        end = args.end if args.end is not None else int(cfg.get("problem_end", 164))

        if start > end:
            parser.error("--start cannot be greater than --end")

        batch_args = argparse.Namespace(**vars(args))
        if not batch_args.debug and not batch_args.wrong:
            batch_args.wrong = True

        total_pass = 0
        total_fail = 0

        print("\n########################################")
        print(f"# x86 - problems {start}..{end}")
        print("########################################")

        for p in range(start, end + 1):
            asm_file, cfg_file = build_problem_paths(p, cfg)

            try:
                result = run_single_problem(asm_file, cfg_file, batch_args, show_summary=False)
            except Exception as exc:
                print(f"===== problem{p} ===== FAIL")
                print(f"[X] Exception: {exc}")
                total_fail += 1
                continue

            if result["ok"]:
                total_pass += 1
            else:
                print(f"===== problem{p} ===== FAIL")
                total_fail += 1

        print("")
        print(f"--- x86 totals: {total_pass} passed, {total_fail} failed out of {end - start + 1} ---")
        return

    if prob is not None:
        asm_file, cfg_file = build_problem_paths(prob, cfg)
    elif args.asm_file and args.cfg_file:
        asm_file = args.asm_file
        cfg_file = args.cfg_file
    else:
        parser.error("Provide both asm_file and cfg_file, use -n <number>, or use --all")

    run_single_problem(asm_file, cfg_file, args, show_summary=True)


if __name__ == "__main__":
    main()