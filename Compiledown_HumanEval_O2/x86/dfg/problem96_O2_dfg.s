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
    pushq   %rbp                                  // |  2       vx         |  0                  |  0        |
    .cfi_def_cfa_offset 16                        // |                     |                     |           |
    pushq   %r15                                  // |  2        x       v |  0                  |  0        |
    .cfi_def_cfa_offset 24                        // |                     |                     |           |
    pushq   %r14                                  // |  2        x      v  |  0                  |  0        |
    .cfi_def_cfa_offset 32                        // |                     |                     |           |
    pushq   %r13                                  // |  2        x     v   |  0                  |  0        |
    .cfi_def_cfa_offset 40                        // |                     |                     |           |
    pushq   %r12                                  // |  2        x    v    |  0                  |  0        |
    .cfi_def_cfa_offset 48                        // |                     |                     |           |
    pushq   %rbx                                  // |  2  v     x         |  0                  |  0        |
    .cfi_def_cfa_offset 56                        // |                     |                     |           |
    pushq   %rax                                  // |  2 v      x         |  0                  |  0        |
    .cfi_def_cfa_offset 64                        // |                     |                     |           |
    .cfi_offset %rbx, -56                         // |                     |                     |           |
    .cfi_offset %r12, -48                         // |                     |                     |           |
    .cfi_offset %r13, -40                         // |                     |                     |           |
    .cfi_offset %r14, -32                         // |                     |                     |           |
    .cfi_offset %r15, -24                         // |                     |                     |           |
    .cfi_offset %rbp, -16                         // |                     |                     |           |
    testl   %esi, %esi                            // |  2     v  :         |  0                  |  6 ^^^^^^ |
    je  .LBB0_1                                   // |  1        :         |  0                  |  3  v::   |
    jle .LBB0_14                                  // |  1        :         |  0                  |  3  vvv   |
    movq    %rdi, %r15                            // |  3      v :       ^ |  0                  |  0        |
    movl    %esi, %eax                            // |  4 ^   v  :       : |  0                  |  0        |
    movq    %rax, (%rsp)                          // |  3 v      v       : |  0                  |  0        |
    xorl    %r12d, %r12d                          // |  3        :    ^  : |  0                  |  5 ^^^^^  |
    xorl    %r13d, %r13d                          // |  4        :    :^ : |  0                  |  5 ^^^^^  |
    xorl    %ebx, %ebx                            // |  4  ^     :    :  : |  0                  |  5 ^^^^^  |
    jmp .LBB0_4                                   // |  3        :    :  : |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_13:                                         // |                     |                     |           |
    incq    %r12                                  // |  3        :    x  : |  0                  |  5  ^^^^^ |
    cmpq    (%rsp), %r12                          // |  3        v    v  : |  0                  |  6 ^^^^^^ |
    je  .LBB0_14                                  // |  3        :    :  : |  0                  |  1  v     |
.LBB0_4:                                          // |                     |                     |           |
    movq    %r12, %rax                            // |  4 ^      :    v  : |  0                  |  0        |
    shlq    $4, %rax                              // |  3 x      :       : |  0                  |  5 ^^^^^  |
    movq    (%r15,%rax), %rbp                     // |  4 v     ^:       v |  0                  |  0        |
    movzbl  (%rbp), %r14d                         // |  4 :     v:      ^  |  0                  |  0        |
    testb   %r14b, %r14b                          // |  4 :     ::      v  |  0                  |  6 ^^^^^^ |
    je  .LBB0_13                                  // |  4 :     ::      :  |  0                  |  1  v     |
    callq   __ctype_b_loc@PLT                     // |  4 :     :x      :  |  0                  |  0        |
    movq    (%rax), %rcx                          // |  5 v ^   ::      :  |  0                  |  0        |
    incq    %rbp                                  // |  4   :   x:      :  |  0                  |  5  ^^^^^ |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_7:                                          // |                     |                     |           |
    movzbl  %r14b, %eax                           // |  5 ^ :   ::      v  |  0                  |  0        |
    movzwl  (%rcx,%rax,2), %edx                   // |  5 v v^  ::         |  0                  |  0        |
    xorl    %eax, %eax                            // |  4 ^  :  ::         |  0                  |  5 ^^^^^  |
    testl   $1024, %edx                           // |  3    v  ::         |  0                  |  6 ^^^^^^ |
    je  .LBB0_15                                  // |  3    :  ::         |  0                  |  1  v     |
    testl   $256, %edx                            // |  3    v  ::         |  0                  |  6 ^^^^^^ |
    je  .LBB0_10                                  // |  3    :  ::         |  0                  |  1  v     |
    movl    $1, %r13d                             // |  4    :  ::     ^   |  0                  |  0        |
.LBB0_10:                                         // |                     |                     |           |
    testl   $512, %edx                            // |  4    v  ::     :   |  0                  |  6 ^^^^^^ |
    je  .LBB0_12                                  // |  3       ::     :   |  0                  |  1  v     |
    movl    $1, %ebx                              // |  4  ^    ::     :   |  0                  |  0        |
.LBB0_12:                                         // |                     |                     |           |
    leal    (%rbx,%r13), %edx                     // |  5  v ^  ::     v   |  0                  |  0        |
    cmpl    $2, %edx                              // |  3    v  ::         |  0                  |  6 ^^^^^^ |
    je  .LBB0_15                                  // |  2       ::         |  0                  |  1  v     |
    movzbl  (%rbp), %r14d                         // |  3       v:      ^  |  0                  |  0        |
    incq    %rbp                                  // |  3       x:      :  |  0                  |  5  ^^^^^ |
    testb   %r14b, %r14b                          // |  2        :      v  |  0                  |  6 ^^^^^^ |
    jne .LBB0_7                                   // |  1        :         |  0                  |  1  v     |
    jmp .LBB0_13                                  // |  1        :         |  0                  |  0        |
.LBB0_1:                                          // |                     |                     |           |
    xorl    %eax, %eax                            // |  2 ^      :         |  0                  |  5 ^^^^^  |
    jmp .LBB0_15                                  // |  1        :         |  0                  |  0        |
.LBB0_14:                                         // |                     |                     |           |
    movl    $1, %eax                              // |  2 ^      :         |  0                  |  0        |
.LBB0_15:                                         // |                     |                     |           |
    addq    $8, %rsp                              // |  1        x         |  0                  |  6 ^^^^^^ |
    .cfi_def_cfa_offset 56                        // |                     |                     |           |
    popq    %rbx                                  // |  2  ^     x         |  0                  |  0        |
    .cfi_def_cfa_offset 48                        // |                     |                     |           |
    popq    %r12                                  // |  2        x    ^    |  0                  |  0        |
    .cfi_def_cfa_offset 40                        // |                     |                     |           |
    popq    %r13                                  // |  2        x     ^   |  0                  |  0        |
    .cfi_def_cfa_offset 32                        // |                     |                     |           |
    popq    %r14                                  // |  2        x      ^  |  0                  |  0        |
    .cfi_def_cfa_offset 24                        // |                     |                     |           |
    popq    %r15                                  // |  2        x       ^ |  0                  |  0        |
    .cfi_def_cfa_offset 16                        // |                     |                     |           |
    popq    %rbp                                  // |  2       ^x         |  0                  |  0        |
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
