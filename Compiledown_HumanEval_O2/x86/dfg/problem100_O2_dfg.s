                                                  // +---------------------+---------------------+-----------+
                                                  // |         GPR         |        VECTOR       |   FLAGS   |
                                                  // |                     |                     |           |
                                                  // |    RRRRRRRRRRRRRRRR |    XXXXXXXXXXXXXXXX |    CZSOPA |
                                                  // |    ABCDSDBS89111111 |    MMMMMMMMMMMMMMMM |    FFFFFF |
                                                  // |    XXXXIIPP  012345 |    MMMMMMMMMMMMMMMM |           |
                                                  // |                     |    0123456789111111 |           |
                                                  // |  #                  |  #           012345 |  #        |
                                                  // +---------------------+---------------------+-----------+
    .text                                         // |                     |                     |           |
    .file   "code.c"                              // |                     |                     |           |
    .section    .rodata.cst8,"aM",@progbits,8     // |                     |                     |           |
    .p2align    3                                 // |                     |                     |           |
.LCPI0_0:                                         // |                     |                     |           |
    .quad   0x3fe0000000000000                    // |                     |                     |           |
.LCPI0_1:                                         // |                     |                     |           |
    .quad   0xbfe0000000000000                    // |                     |                     |           |
    .text                                         // |                     |                     |           |
    .globl  func0                                 // |                     |                     |           |
    .p2align    4, 0x90                           // |                     |                     |           |
    .type   func0,@function                       // |                     |                     |           |
func0:                                            // |                     |                     |           |
    .cfi_startproc                                // |                     |                     |           |
    pushq   %rax                                  // |  2 v      x         |  0                  |  0        |
    .cfi_def_cfa_offset 16                        // |                     |                     |           |
    xorl    %esi, %esi                            // |  2     ^  :         |  0                  |  5 ^^^^^  |
    callq   strtod@PLT                            // |  1        x         |  0                  |  0        |
    xorpd   %xmm1, %xmm1                          // |  1        :         |  1  ^               |  5 ^^^^^  |
    ucomisd %xmm0, %xmm1                          // |  1        :         |  2 v^               |  2 ::     |
    jbe .LBB0_2                                   // |  1        :         |  0                  |  2 vv     |
    addsd   .LCPI0_1(%rip), %xmm0                 // |  1        :         |  1 x                |  6 ^^^^^^ |
    callq   ceil@PLT                              // |  1        x         |  1 :                |  0        |
    jmp .LBB0_3                                   // |  1        :         |  1 :                |  0        |
.LBB0_2:                                          // |                     |                     |           |
    addsd   .LCPI0_0(%rip), %xmm0                 // |  1        :         |  1 x                |  6 ^^^^^^ |
    callq   floor@PLT                             // |  1        x         |  1 :                |  0        |
.LBB0_3:                                          // |                     |                     |           |
    cvttsd2si   %xmm0, %eax                       // |  2 ^      :         |  1 v                |  0        |
    popq    %rcx                                  // |  2   ^    x         |  0                  |  0        |
    .cfi_def_cfa_offset 8                         // |                     |                     |           |
    retq                                          // |  1        x         |  0                  |  0        |
.Lfunc_end0:                                      // |                     |                     |           |
    .size   func0, .Lfunc_end0-func0              // |                     |                     |           |
    .cfi_endproc                                  // |                     |                     |           |
    .ident  "clang version 15.0.4"                // |                     |                     |           |
    .section    ".note.GNU-stack","",@progbits    // |                     |                     |           |
    .addrsig                                      // |                     |                     |           |
                                                  // +.....................+.....................+...........+
                                                  // Legend:
                                                  //     ^       : Register assignment (write)
                                                  //     v       : Register usage (read)
                                                  //     x       : Register usage and reassignment (R/W)
                                                  //     :       : Register in use (live)
                                                  //     <space> : Register not in use
                                                  //     #       : Number of occupied registers
