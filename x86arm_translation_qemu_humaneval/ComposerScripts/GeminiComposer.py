"""
Gemini as a composer. Has 8 configurations
The goal is to give gemini the initial translator assemblies that errored 
and have them fix it

We want to test 8 different configs/prompts

Prompts:
    Prompt w/ nothing extra
    Prompt w/ Error message 
    ... CFG alone
    ... DFG alone
    Error Message + CFG
    Error + DFG
    DFG + CFG
    Error + DFG + CFG
    
import and config module for main output and input directorys and parallelization variables
jsons live in ASMwork/x86arm_translation_qemu_humaneval/results/exp<##>/jsons/YYYYMMDD_HHMMSS_error_problems.json
parse arguments:
- model name - obtain from google api doc
2 options
- "gemini-3-flash-preview" 
- "gemini-3.1-pro-preview"
read the error json from json
copy all error translated problems into your result directory - do not modify them
create the prompts w/ error message + CFG + DFG or wahtever config needed
prompt gemini model async only on the error'd problems. 
place the error'd problems asm in your result directory under a new subdir. 
later tries will overwrite problems in the new subdir 
call run error json py pass in the results
log raw model output along the way

retry a problem at least 3 times if it fails. If it succeeds it stops trying on that problem
finally output a brief and verbose txt of the results

output directory name should be <benchmark>_<model>_<promptconfig>_<timestamp>
"""
