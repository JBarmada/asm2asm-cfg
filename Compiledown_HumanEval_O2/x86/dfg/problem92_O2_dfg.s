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
    .globl  func0                                 // |                     |                     |           |
    .p2align    4, 0x90                           // |                     |                     |           |
    .type   func0,@function                       // |                     |                     |           |
func0:                                            // |                     |                     |           |
    .cfi_startproc                                // |                     |                     |           |
    pushq   %r14                                  // |  2        x      v  |  0                  |  0        |
    .cfi_def_cfa_offset 16                        // |                     |                     |           |
    pushq   %rbx                                  // |  2  v     x         |  0                  |  0        |
    .cfi_def_cfa_offset 24                        // |                     |                     |           |
    pushq   %rax                                  // |  2 v      x         |  0                  |  0        |
    .cfi_def_cfa_offset 32                        // |                     |                     |           |
    .cfi_offset %rbx, -24                         // |                     |                     |           |
    .cfi_offset %r14, -16                         // |                     |                     |           |
    movzbl  (%rdi), %ebx                          // |  3  ^   v :         |  0                  |  0        |
    testb   %bl, %bl                              // |  2  v     :         |  0                  |  6 ^^^^^^ |
    je  .LBB0_1                                   // |  1        :         |  0                  |  1  v     |
    movq    %rdi, %r14                            // |  3      v :      ^  |  0                  |  0        |
    callq   __ctype_b_loc@PLT                     // |  2        x      :  |  0                  |  0        |
    movq    (%rax), %r9                           // |  4 v      : ^    :  |  0                  |  0        |
    incq    %r14                                  // |  3        : :    x  |  0                  |  5  ^^^^^ |
    movl    $1, %edx                              // |  4    ^   : :    :  |  0                  |  0        |
    xorl    %eax, %eax                            // |  4 ^      : :    :  |  0                  |  5 ^^^^^  |
    movabsq $-9223301659520663552, %r8            // |  5 :      :^:    :  |  0                  |  0        |
    xorl    %r10d, %r10d                          // |  5 :      : :^   :  |  0                  |  5 ^^^^^  |
    jmp .LBB0_4                                   // |  4 :      : :    :  |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_6:                                          // |                     |                     |           |
    movl    $1, %r10d                             // |  5 :      : :^   :  |  0                  |  0        |
.LBB0_10:                                         // |                     |                     |           |
    movzbl  %r11b, %edx                           // |  7 :  ^   : ::v  :  |  0                  |  0        |
    addl    %edx, %eax                            // |  6 x  v   : ::   :  |  0                  |  6 ^^^^^^ |
    movzbl  (%r14), %ebx                          // |  5  ^     : ::   v  |  0                  |  0        |
    incq    %r14                                  // |  5  :     : ::   x  |  0                  |  5  ^^^^^ |
    movl    %ecx, %edx                            // |  6  :v^   : ::      |  0                  |  0        |
    testb   %bl, %bl                              // |  5  v :   : ::      |  0                  |  6 ^^^^^^ |
    je  .LBB0_2                                   // |  5  : :   : ::      |  0                  |  1  v     |
.LBB0_4:                                          // |                     |                     |           |
    movsbq  %bl, %rdi                             // |  6  v : ^ : ::      |  0                  |  0        |
    movzwl  (%r9,%rdi,2), %esi                    // |  7  : :^v : v:      |  0                  |  0        |
    movl    %esi, %ecx                            // |  7  :^:v: :  :      |  0                  |  0        |
    andl    $8192, %ecx                           // |  7  :x::: :  :      |  0                  |  5 ^^^^^  |
    shrl    $13, %esi                             // |  7  :::x: :  :      |  0                  |  5 ^^^^^  |
    testl   %r10d, %r10d                          // |  7  ::::: :  v      |  0                  |  6 ^^^^^^ |
    setne   %r11b                                 // |  7  ::::: :   x     |  0                  |  1  v     |
    andb    %sil, %r11b                           // |  7  :::v: :   x     |  0                  |  5 ^^^^^  |
    testl   %ecx, %ecx                            // |  5  :v: : :         |  0                  |  6 ^^^^^^ |
    cmovnel %edx, %ecx                            // |  5  :^v : :         |  0                  |  0        |
    cmpb    $73, %dil                             // |  4  : : v :         |  0                  |  6 ^^^^^^ |
    jne .LBB0_7                                   // |  3  : :   :         |  0                  |  1  v     |
    testl   %edx, %edx                            // |  3  : v   :         |  0                  |  6 ^^^^^^ |
    jne .LBB0_6                                   // |  2  :     :         |  0                  |  1  v     |
.LBB0_7:                                          // |                     |                     |           |
    xorl    %r10d, %r10d                          // |  3  :     :  ^      |  0                  |  5 ^^^^^  |
    cmpb    $63, %bl                              // |  2  v     :         |  0                  |  6 ^^^^^^ |
    ja  .LBB0_10                                  // |  2  :     :         |  0                  |  2 vv     |
    movzbl  %bl, %edx                             // |  3  v ^   :         |  0                  |  1 :      |
    btq %rdx, %r8                                 // |  3    v   :^        |  0                  |  1 :      |
    jae .LBB0_10                                  // |  1        :         |  0                  |  1 v      |
    movl    $1, %ecx                              // |  2   ^    :         |  0                  |  0        |
    jmp .LBB0_10                                  // |  1        :         |  0                  |  0        |
.LBB0_1:                                          // |                     |                     |           |
    xorl    %eax, %eax                            // |  2 ^      :         |  0                  |  5 ^^^^^  |
.LBB0_2:                                          // |                     |                     |           |
    addq    $8, %rsp                              // |  1        x         |  0                  |  6 ^^^^^^ |
    .cfi_def_cfa_offset 24                        // |                     |                     |           |
    popq    %rbx                                  // |  2  ^     x         |  0                  |  0        |
    .cfi_def_cfa_offset 16                        // |                     |                     |           |
    popq    %r14                                  // |  2        x      ^  |  0                  |  0        |
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
