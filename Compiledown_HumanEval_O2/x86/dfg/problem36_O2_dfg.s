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
    .section    .rodata.cst4,"aM",@progbits,4     // |                     |                     |           |
    .p2align    2                                 // |                     |                     |           |
.LCPI0_0:                                         // |                     |                     |           |
    .long   0xc61c4000                            // |                     |                     |           |
    .text                                         // |                     |                     |           |
    .globl  func0                                 // |                     |                     |           |
    .p2align    4, 0x90                           // |                     |                     |           |
    .type   func0,@function                       // |                     |                     |           |
func0:                                            // |                     |                     |           |
    .cfi_startproc                                // |                     |                     |           |
    testl   %esi, %esi                            // |  1     v            |  0                  |  6 ^^^^^^ |
    jle .LBB0_1                                   // |  0                  |  0                  |  3  vvv   |
    movl    %esi, %ecx                            // |  2   ^ v            |  0                  |  0        |
    leaq    -1(%rcx), %rdx                        // |  2   v^             |  0                  |  0        |
    movl    %ecx, %eax                            // |  3 ^ v:             |  0                  |  0        |
    andl    $3, %eax                              // |  3 x ::             |  0                  |  5 ^^^^^  |
    cmpq    $3, %rdx                              // |  3 : :v             |  0                  |  6 ^^^^^^ |
    jae .LBB0_8                                   // |  2 : :              |  0                  |  1 v      |
    movss   .LCPI0_0(%rip), %xmm1                 // |  2 : :              |  1  ^               |  0        |
    xorl    %edx, %edx                            // |  3 : :^             |  0                  |  5 ^^^^^  |
    jmp .LBB0_4                                   // |  2 : :              |  0                  |  0        |
.LBB0_1:                                          // |                     |                     |           |
    movss   .LCPI0_0(%rip), %xmm0                 // |  2 : :              |  1 ^                |  0        |
    retq                                          // |  3 : :    x         |  0                  |  0        |
.LBB0_8:                                          // |                     |                     |           |
    andl    $-4, %ecx                             // |  3 : x    :         |  0                  |  5 ^^^^^  |
    movss   .LCPI0_0(%rip), %xmm1                 // |  3 : :    :         |  1  ^               |  0        |
    xorl    %edx, %edx                            // |  4 : :^   :         |  1  :               |  5 ^^^^^  |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_9:                                          // |                     |                     |           |
    movss   (%rdi,%rdx,4), %xmm0                  // |  5 : :v v :         |  2 ^:               |  0        |
    maxss   %xmm1, %xmm0                          // |  4 : ::   :         |  2 ^v               |  0        |
    movss   4(%rdi,%rdx,4), %xmm1                 // |  5 : :v v :         |  2 :^               |  0        |
    maxss   %xmm0, %xmm1                          // |  4 : ::   :         |  2 v^               |  0        |
    movss   8(%rdi,%rdx,4), %xmm0                 // |  5 : :v v :         |  2 ^:               |  0        |
    maxss   %xmm1, %xmm0                          // |  4 : ::   :         |  2 ^v               |  0        |
    movss   12(%rdi,%rdx,4), %xmm1                // |  5 : :v v :         |  2 :^               |  0        |
    maxss   %xmm0, %xmm1                          // |  4 : ::   :         |  2 v^               |  0        |
    addq    $4, %rdx                              // |  4 : :x   :         |  1  :               |  6 ^^^^^^ |
    cmpq    %rdx, %rcx                            // |  4 : vv   :         |  1  :               |  6 ^^^^^^ |
    jne .LBB0_9                                   // |  3 :  :   :         |  1  :               |  1  v     |
.LBB0_4:                                          // |                     |                     |           |
    movaps  %xmm1, %xmm0                          // |  3 :  :   :         |  2 ^v               |  0        |
    testq   %rax, %rax                            // |  3 v  :   :         |  1  :               |  6 ^^^^^^ |
    je  .LBB0_7                                   // |  3 :  :   :         |  1  :               |  1  v     |
    leaq    (%rdi,%rdx,4), %rcx                   // |  5 : ^v v :         |  1  :               |  0        |
    xorl    %edx, %edx                            // |  4 : :^   :         |  1  :               |  5 ^^^^^  |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_6:                                          // |                     |                     |           |
    movss   (%rcx,%rdx,4), %xmm0                  // |  4 : vv   :         |  2 ^:               |  0        |
    maxss   %xmm1, %xmm0                          // |  3 :  :   :         |  2 ^v               |  0        |
    incq    %rdx                                  // |  3 :  x   :         |  1 :                |  5  ^^^^^ |
    movaps  %xmm0, %xmm1                          // |  3 :  :   :         |  2 v^               |  0        |
    cmpq    %rdx, %rax                            // |  3 v  v   :         |  0                  |  6 ^^^^^^ |
    jne .LBB0_6                                   // |  1        :         |  0                  |  1  v     |
.LBB0_7:                                          // |                     |                     |           |
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
