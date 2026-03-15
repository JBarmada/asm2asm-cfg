"""
Module to parse raw compiled assembly (.s) and draw Control Flow Graphs (CFGs).
"""

import re
import sys
import tempfile
from pathlib import Path

from graphviz import Digraph

def escape(instruction):
    """Escape dot graph characters for correct display."""
    for char, rep in [('<', r'\<'), ('>', r'\>'), ('|', r'\|'), ('{', r'\{'), ('}', r'\}'), ('\t', ' ')]:
        instruction = instruction.replace(char, rep)
    return instruction

class BasicBlock:
    """Represents a node in the CFG containing straight-line code."""
    def __init__(self, key):
        self.key = key
        self.instructions = []
        self.jump_edge = None
        self.no_jump_edge = None

    def add_instruction(self, instruction):
        self.instructions.append(instruction)

    def add_jump_edge(self, target_key):
        self.jump_edge = target_key.key if isinstance(target_key, BasicBlock) else target_key

    def add_no_jump_edge(self, target_key):
        self.no_jump_edge = target_key.key if isinstance(target_key, BasicBlock) else target_key

    def get_label(self):
        label = r'\l'.join([escape(i.text) for i in self.instructions]) + r'\l'
        if self.jump_edge:
            if self.no_jump_edge:
                label += '|{<s0>No Jump|<s1>Jump}'
            else:
                label += '|{<s1>Jump}'
        return '{' + label + '}'

class X86TargetInfo:
    def comment_chars(self): return ['#']
    def is_call(self, opcode): return 'call' in opcode
    def is_jump(self, opcode): return opcode.startswith('j')
    def is_unconditional_jump(self, opcode): return opcode.startswith('jmp')
    def is_sink(self, opcode): return opcode.startswith('ret')
    def target_op_index(self): return 0

class ARMTargetInfo:
    def comment_chars(self): return [';', '//', '@']
    def is_call(self, opcode): return opcode in ('bl', 'blr')
    def is_jump(self, opcode):
        if self.is_call(opcode): return False
        # Matches b, b.lt, b.eq, b.pl, cbz, cbnz, tbz, tbnz
        return opcode.startswith('b') or opcode in ('cbz', 'cbnz', 'tbz', 'tbnz')
    def is_unconditional_jump(self, opcode): return opcode == 'b'
    def is_sink(self, opcode): return opcode == 'ret'
    def target_op_index(self): return -1  # Target is usually the last operand in ARM

class RISCVTargetInfo:
    def comment_chars(self): return ['#']
    def is_call(self, opcode):
        return opcode in ('call', 'jal', 'jalr', 'c.jal', 'c.jalr')
    def is_jump(self, opcode):
        branch_ops = {'beq', 'bne', 'blt', 'bge', 'bltu', 'bgeu', 'beqz', 'bnez', 'blez', 'bgez', 'bltz', 'bgtz', 'c.beqz', 'c.bnez'}
        return opcode in branch_ops or self.is_unconditional_jump(opcode)
    def is_unconditional_jump(self, opcode):
        return opcode in ('j', 'tail', 'c.j')
    def is_sink(self, opcode):
        return opcode in ('ret', 'ebreak', 'ecall', 'unimp', 'c.ebreak')
    def target_op_index(self): return -1

class Instruction:
    def __init__(self, text, pc, opcode, ops, target_info):
        self.text = text
        self.pc = pc
        self.opcode = opcode
        self.ops = ops
        self.target_pc = None
        self.info = target_info

    def is_call(self): return self.info.is_call(self.opcode)
    def is_jump(self): return self.info.is_jump(self.opcode)
    def is_sink(self): return self.info.is_sink(self.opcode)
    def is_unconditional_jump(self): return self.info.is_unconditional_jump(self.opcode)

class JumpTable:
    def __init__(self, instructions):
        self.sources = {}
        self.destinations = set()
        for inst in instructions:
            if inst.is_jump() and inst.target_pc is not None:
                self.sources[inst.pc] = inst.target_pc
                self.destinations.add(inst.target_pc)

    def is_destination(self, pc): return pc in self.destinations
    def get_target(self, pc): return self.sources.get(pc)

def parse_compiled_asm(lines, target_info):
    """
    Parses raw compiled assembly (.s). Strips comments, identifies labels, 
    assigns pseudo-PCs, and resolves jump targets.
    """
    instructions = []
    labels_to_pc = {}
    pending_labels = []
    pc = 0
    function_name = "unknown_function"
    
    # Matches labels like .LBB0_1: or _func0: or LBB0_3:
    label_pattern = re.compile(r'^([.a-zA-Z_][a-zA-Z0-9_.]*):')

    # Pass 1: Assign PCs, trim comments, and collect labels
    for line in lines:
        # Strip comments dynamically based on the architecture
        code = line
        for c_char in target_info.comment_chars():
            code = code.split(c_char)[0]
        code = code.strip()
        
        if not code:
            continue

        # Check for label
        m_label = label_pattern.match(code)
        if m_label:
            lbl = m_label.group(1)
            pending_labels.append(lbl)
            # If it's the first global-looking label, assume it's the function name
            if function_name == "unknown_function" and not lbl.startswith('.'):
                function_name = lbl
            continue

        # Skip assembler directives (start with . but aren't labels)
        if code.startswith('.'):
            continue

        # Parse instruction
        parts = code.split(None, 1)
        opcode = parts[0].lower()
        ops_str = parts[1] if len(parts) > 1 else ""
        ops = [op.strip() for op in ops_str.split(',')] if ops_str else []

        # Bind any pending labels to the current PC
        for lbl in pending_labels:
            labels_to_pc[lbl] = pc
        pending_labels = []

        inst = Instruction(code, pc, opcode, ops, target_info)
        instructions.append(inst)
        pc += 4

    # Pass 2: Resolve string labels to target PCs
    for inst in instructions:
        if inst.is_jump() or inst.is_call():
            idx = target_info.target_op_index()
            if inst.ops and len(inst.ops) >= abs(idx):
                target_str = inst.ops[idx]
                if target_str in labels_to_pc:
                    inst.target_pc = labels_to_pc[target_str]

    return function_name, instructions

def build_basic_blocks(instructions, target_info):
    jump_table = JumpTable(instructions)
    basic_blocks = {}
    current_basic_block = None
    previous_jump_block = None
    
    for instruction in instructions:
        program_point = instruction.pc
        jump_point = jump_table.get_target(program_point)
        is_unconditional = instruction.is_unconditional_jump()

        if current_basic_block is None:
            current_basic_block = BasicBlock(program_point)
            basic_blocks[current_basic_block.key] = current_basic_block
            if previous_jump_block is not None:
                previous_jump_block.add_no_jump_edge(current_basic_block)
                previous_jump_block = None
                
        elif jump_table.is_destination(program_point):
            temp_block = current_basic_block
            current_basic_block = BasicBlock(program_point)
            basic_blocks[current_basic_block.key] = current_basic_block
            temp_block.add_no_jump_edge(current_basic_block)

        current_basic_block.add_instruction(instruction)

        if jump_point is not None:
            current_basic_block.add_jump_edge(jump_point)
            previous_jump_block = None if is_unconditional else current_basic_block
            current_basic_block = None
            
        elif instruction.is_sink():
            previous_jump_block = current_basic_block = None

    if previous_jump_block is not None:
        end_block = BasicBlock('end_of_function')
        dummy = Instruction('end of function', -1, '', [], target_info)
        end_block.add_instruction(dummy)
        previous_jump_block.add_no_jump_edge(end_block.key)
        basic_blocks[end_block.key] = end_block

    return basic_blocks

def draw_cfg(function_name, basic_blocks, view, fname):
    dot = Digraph(name=function_name, comment=function_name, engine='dot')
    dot.attr('graph', label=function_name)
    for key, basic_block in basic_blocks.items():
        dot.node(str(key), shape='record', label=basic_block.get_label())
        
    for basic_block in basic_blocks.values():
        if basic_block.jump_edge is not None:
            if basic_block.no_jump_edge is not None:
                dot.edge(f'{basic_block.key}:s0', str(basic_block.no_jump_edge))
            dot.edge(f'{basic_block.key}:s1', str(basic_block.jump_edge))
        elif basic_block.no_jump_edge is not None:
            dot.edge(str(basic_block.key), str(basic_block.no_jump_edge))
            
    if view:
        dot.format = 'gv'
        with tempfile.NamedTemporaryFile(mode='w+b', prefix=f"{fname}_{function_name}") as filename:
            dot.view(filename.name)
    else:
        dot.format = 'pdf'
        dot.render(filename=f"{fname}_{function_name}", cleanup=True)
        print(f'Saved CFG to {fname}_{function_name}.{dot.format}')

def save_cfg_text(function_name, basic_blocks, out_path):
    lines = [f'Function: {function_name}', f'Basic blocks: {len(basic_blocks)}\n']
    
    def sort_key(item): return (0, item[0]) if isinstance(item[0], int) else (1, str(item[0]))

    for key, bb in sorted(basic_blocks.items(), key=sort_key):
        lines.extend(['=' * 60, f'BLOCK {key}', '- Instructions:'])
        for inst in bb.instructions: lines.append(f'  {inst.text}')
        
        edges = []
        if bb.no_jump_edge is not None: edges.append(('NO_JUMP', bb.no_jump_edge))
        if bb.jump_edge is not None: edges.append(('JUMP', bb.jump_edge))
        
        lines.append('')
        if edges:
            lines.append('- Edges:')
            for kind, target in edges: lines.append(f'  {kind} -> {target}')
        else:
            lines.append('- Edges: (none)')
        lines.append('')

    with open(out_path, 'w', encoding='utf8') as f:
        f.write('\n'.join(lines))
    print(f'Saved CFG (text) to {out_path}')

## MAIN

if __name__ == "__main__":
    # Choose architecture: 'x86', 'arm', or 'riscv'
    arch = 'riscv'  
    target_info_map = {'x86': X86TargetInfo(), 'arm': ARMTargetInfo(), 'riscv': RISCVTargetInfo()}
    target_info = target_info_map[arch]

    root = Path(f"data/20260314_compiledown_HumanEval_O2/{arch}")
    
    # Optional: adjust directories to fit your workspace structure
    asm_dir = root / "asm"
    cfg_dir = root / "cfg"
    pdf_dir = root / "pdf"

    cfg_dir.mkdir(parents=True, exist_ok=True)
    pdf_dir.mkdir(parents=True, exist_ok=True)

    # Process all raw assembly files
    asm_files = sorted(asm_dir.glob("*.s"))

    for asm_path in asm_files:
        with open(asm_path, 'r', encoding='utf8') as f:
            lines = f.readlines()

        function_name, instructions = parse_compiled_asm(lines, target_info)
        basic_blocks = build_basic_blocks(instructions, target_info)

        stem = asm_path.stem 
        
        # Save Text and PDF Output
        save_cfg_text(function_name, basic_blocks, str(cfg_dir / f"{stem}_cfg.txt"))
        draw_cfg(function_name, basic_blocks, False, str(pdf_dir / stem))