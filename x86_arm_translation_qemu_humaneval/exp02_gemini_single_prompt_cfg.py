from google import genai
import os
import time
from pathlib import Path

"""
experiment 02: single prompt, CFG, gemini on clang15 o2 optimized x86 humaneval asm code
"""

# The client gets the API key from the environment variable `GEMINI_API_KEY`.
client = genai.Client()

# --- Configuration ---
BASE_DIR = Path(__file__).resolve().parent
input_s_dir = BASE_DIR.parent / "Compiledown_HumanEval_O2" / "x86" / "asm"
input_test_dir = BASE_DIR.parent / "HumanEval_source"
cfg_dir = BASE_DIR.parent / "Compiledown_HumanEval_O2" / "x86" / "cfg"

output_dir = BASE_DIR / "results" / "exp02"

prompt_dir = output_dir / "prompts"
raw_output_dir = output_dir / "raw_model_output"
arm_output_dir = output_dir / "arm_asm"
log_file = output_dir / "failures.log"

prompt_template = """Translate the following O2 optimized x86 assembly code to ARMv8 AArch64 assembly code.

The input assembly code represents a compiled function that solves a programming problem.
The provided CFG describes the function control flow and should be used to improve translation correctness.

Requirements:
- Preserve the function behavior exactly
- Output only ARMv8 assembly
- Do not include explanations or comments outside the assembly
- Keep the function structure equivalent

x86 Assembly:
{asm}

CFG:
{cfg}
"""

MODEL_NAME="gemini-3-flash-preview"

# -----------------------------
# Directory setup
# -----------------------------

prompt_dir.mkdir(parents=True, exist_ok=True)
raw_output_dir.mkdir(parents=True, exist_ok=True)
arm_output_dir.mkdir(parents=True, exist_ok=True)

# -----------------------------
# Helpers
# -----------------------------

def clean_model_output(text):
    """
    Remove markdown blocks if the model adds them.
    """
    if text is None:
        return ""

    text = text.replace("```asm", "")
    text = text.replace("```assembly", "")
    text = text.replace("```", "")

    return text.strip()


def log_failure(problem, error):
    with open(log_file, "a", encoding="utf-8") as f:
        f.write(f"{problem}: {error}\n")


def call_gemini(prompt):

    response = client.models.generate_content(
        model=MODEL_NAME,
        contents=prompt
    )

    return response.text


# -----------------------------
# Main experiment loop
# -----------------------------

def process_problems():

    s_files = sorted([f for f in os.listdir(input_s_dir) if f.endswith(".s")])
    total_files = len(s_files)
    start_time = time.time()

    if total_files == 0:
        print(f"No .s files found in {input_s_dir}")
        return

    for index, filename in enumerate(s_files, start=1):
        elapsed = time.time() - start_time
        print(f"[{index}/{total_files}] {filename} | elapsed: {elapsed:.1f}s")

        problem_name = filename.replace(".s", "")
        cfg_problem_name = problem_name
        
        arm_output_path = arm_output_dir / filename

        # Skip if already processed (resume capability)
        if arm_output_path.exists():
            print(f"Skipping {filename} (already done) | elapsed: {elapsed:.1f}s")
            continue

        print(f"Processing {filename}")

        try:

            input_path = input_s_dir / filename
            cfg_path = cfg_dir / f"{cfg_problem_name}_cfg.txt"

            with open(input_path, "r", encoding="utf-8") as f:
                x86_asm = f.read()

            with open(cfg_path, "r", encoding="utf-8") as f:
                cfg_text = f.read()

            prompt = prompt_template.format(asm=x86_asm, cfg=cfg_text)

            # Save prompt for reproducibility
            prompt_path = prompt_dir / f"{problem_name}.txt"
            with open(prompt_path, "w", encoding="utf-8") as f:
                f.write(prompt)

            # Call Gemini
            raw_output = call_gemini(prompt)

            # Save raw model output
            raw_path = raw_output_dir / f"{problem_name}.txt"
            with open(raw_path, "w", encoding="utf-8") as f:
                f.write(raw_output if raw_output else "")

            arm_code = clean_model_output(raw_output)

            # Save cleaned ARM assembly
            with open(arm_output_path, "w", encoding="utf-8") as f:
                f.write(arm_code)

            print(f"Saved ARM asm -> {arm_output_path}")

            # small delay to avoid rate limits
            time.sleep(1)

        except Exception as e:

            print(f"FAILED {filename}: {e}")
            log_failure(problem_name, str(e))


# -----------------------------
# Run experiment
# -----------------------------

if __name__ == "__main__":
    process_problems()
    client.close()