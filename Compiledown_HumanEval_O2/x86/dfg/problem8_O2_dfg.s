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
    subq    $24, %rsp                             // |  1        x         |  0                  |  6 ^^^^^^ |
    .cfi_def_cfa_offset 80                        // |                     |                     |           |
    .cfi_offset %rbx, -56                         // |                     |                     |           |
    .cfi_offset %r12, -48                         // |                     |                     |           |
    .cfi_offset %r13, -40                         // |                     |                     |           |
    .cfi_offset %r14, -32                         // |                     |                     |           |
    .cfi_offset %r15, -24                         // |                     |                     |           |
    .cfi_offset %rbp, -16                         // |                     |                     |           |
    movq    %rcx, 8(%rsp)                         // |  2   v    v         |  0                  |  0        |
    movq    %rdx, 16(%rsp)                        // |  2    v   v         |  0                  |  0        |
    testl   %esi, %esi                            // |  2     v  :         |  0                  |  6 ^^^^^^ |
    jle .LBB0_1                                   // |  1        :         |  0                  |  3  vvv   |
    movq    %rdi, %r12                            // |  3      v :    ^    |  0                  |  0        |
    movl    %esi, %r13d                           // |  4     v  :    :^   |  0                  |  0        |
    xorl    %r14d, %r14d                          // |  4        :    ::^  |  0                  |  5 ^^^^^  |
    xorl    %ebp, %ebp                            // |  5       ^:    :::  |  0                  |  5 ^^^^^  |
    xorl    %ebx, %ebx                            // |  6  ^    ::    :::  |  0                  |  5 ^^^^^  |
    jmp .LBB0_4                                   // |  6  :    ::    :::  |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_6:                                          // |                     |                     |           |
    incq    %r14                                  // |  6  :    ::    ::x  |  0                  |  5  ^^^^^ |
    cmpq    %r14, %r13                            // |  6  :    ::    :vv  |  0                  |  6 ^^^^^^ |
    je  .LBB0_2                                   // |  5  :    ::    : :  |  0                  |  1  v     |
.LBB0_4:                                          // |                     |                     |           |
    movq    (%r12,%r14,8), %rdi                   // |  6  :   ^::    v v  |  0                  |  0        |
    movq    16(%rsp), %rsi                        // |  6  :  ^ :v    : :  |  0                  |  0        |
    callq   strstr@PLT                            // |  5  :    :x    : :  |  0                  |  0        |
    testq   %rax, %rax                            // |  6 v:    ::    : :  |  0                  |  6 ^^^^^^ |
    je  .LBB0_6                                   // |  5  :    ::    : :  |  0                  |  1  v     |
    movslq  %ebp, %r15                            // |  6  :    v:    : :^ |  0                  |  0        |
    incl    %ebp                                  // |  6  :    x:    : :: |  0                  |  5  ^^^^^ |
    leaq    8(,%r15,8), %rsi                      // |  6  :  ^  :    : :v |  0                  |  0        |
    movq    %rbx, %rdi                            // |  6  v   ^ :    : :: |  0                  |  0        |
    callq   realloc@PLT                           // |  4        x    : :: |  0                  |  0        |
    movq    %rax, %rbx                            // |  6 v^     :    : :: |  0                  |  0        |
    movq    (%r12,%r14,8), %rax                   // |  6 ^:     :    v v: |  0                  |  0        |
    movq    %rax, (%rbx,%r15,8)                   // |  4 vv     :       v |  0                  |  0        |
    jmp .LBB0_6                                   // |  1        :         |  0                  |  0        |
.LBB0_1:                                          // |                     |                     |           |
    xorl    %ebx, %ebx                            // |  2  ^     :         |  0                  |  5 ^^^^^  |
    xorl    %ebp, %ebp                            // |  3  :    ^:         |  0                  |  5 ^^^^^  |
.LBB0_2:                                          // |                     |                     |           |
    movq    8(%rsp), %rax                         // |  4 ^:    :v         |  0                  |  0        |
    movl    %ebp, (%rax)                          // |  4 v:    v:         |  0                  |  0        |
    movq    %rbx, %rax                            // |  3 ^v     :         |  0                  |  0        |
    addq    $24, %rsp                             // |  1        x         |  0                  |  6 ^^^^^^ |
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
