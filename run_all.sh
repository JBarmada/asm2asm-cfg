#!/usr/bin/env bash
# Run the ARM and/or x86 CFG validator on all 164 problems.
# Usage:
#   ./run_all.sh              # both architectures, errors only
#   ./run_all.sh arm          # ARM only
#   ./run_all.sh x86          # x86 only
#   ./run_all.sh arm --debug  # ARM with full output + debug

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR" || exit 1

ARCH="${1:-both}"
shift 2>/dev/null          # remaining args forwarded to the validator
EXTRA_ARGS="${*:--w}"      # default to -w (errors only) if nothing else given

run_validator() {
    local validator="$1"
    local label="$2"

    echo ""
    echo "########################################"
    echo "# $label — all 164 problems"
    echo "########################################"

    local total_pass=0
    local total_fail=0

    for p in $(seq 1 164); do
        output=$(python "$validator" "$p" $EXTRA_ARGS 2>&1)

        if echo "$output" | grep -q '\[X\]'; then
            echo "===== problem${p} ===== FAIL"
            echo "$output"
            ((total_fail++))
        else
            ((total_pass++))
        fi
    done

    echo ""
    echo "--- $label totals: $total_pass passed, $total_fail failed out of 164 ---"
}

case "$ARCH" in
    arm)
        run_validator "arm_cfg_validator.py" "ARM"
        ;;
    x86)
        run_validator "x86_cfg_validator.py" "x86"
        ;;
    both)
        run_validator "arm_cfg_validator.py" "ARM"
        run_validator "x86_cfg_validator.py" "x86"
        ;;
    *)
        echo "Usage: $0 [arm|x86|both] [extra validator flags]"
        exit 1
        ;;
esac
