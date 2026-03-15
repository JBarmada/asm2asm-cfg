import re
import sys
import argparse
import os


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

    debug(f"Parsed {len(asm_data)} ASM instructions", args)

    return asm_data


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

def validate_graphs(asm_data, cfg_blocks, args):
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

    log("\n" + "=" * 50, "summary")
    log(
        f"SUMMARY: Edges Passed: {passed_edges}, "
        f"Edges Failed: {failed_edges}, "
        f"Block Failures: {failed_blocks}",
        "summary"
    )


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
    parser.add_argument("-w", "--wrong", action="store_true")
    parser.add_argument("-d", "--debug", action="store_true",
                        help="Enable debug output")

    args = parser.parse_args()

    script_dir = os.path.dirname(os.path.abspath(__file__))
    base = os.path.join(script_dir, "HEO2_asm_cfg", "HumanEval_O2", "x86")

    # Allow: x86_cfg_validator.py -n 2
    #    or: x86_cfg_validator.py 2       (positional shorthand)
    prob = args.number
    if prob is None and args.asm_file and args.asm_file.isdigit():
        prob = int(args.asm_file)

    if prob is not None:
        asm_file = os.path.join(base, "dumped_asm", f"problem{prob}_func0.asm")
        cfg_file = os.path.join(base, "cfg", f"problem{prob}_func0_cfg.txt")
    elif args.asm_file and args.cfg_file:
        asm_file = args.asm_file
        cfg_file = args.cfg_file
    else:
        parser.error("Provide both asm_file and cfg_file, or use -n <number>")

    with open(asm_file, 'r') as f:
        asm_text = f.read()

    with open(cfg_file, 'r') as f:
        cfg_text = f.read()

    asm_data = parse_asm(asm_text, args)
    cfg_blocks = parse_cfg(cfg_text, args)
    validate_graphs(asm_data, cfg_blocks, args)


if __name__ == "__main__":
    main()