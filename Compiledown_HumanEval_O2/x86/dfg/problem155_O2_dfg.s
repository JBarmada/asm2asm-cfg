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
    movq    %rsi, %r15                            // |  3     v  :       ^ |  0                  |  0        |
    movq    %rdi, 16(%rsp)                        // |  3      v v       : |  0                  |  0        |
    movq    %rsi, %rdi                            // |  4     v^ :       : |  0                  |  0        |
    callq   strlen@PLT                            // |  2        x       : |  0                  |  0        |
    movq    %rax, %rbx                            // |  4 v^     :       : |  0                  |  0        |
    addl    %eax, %eax                            // |  4 x:     :       : |  0                  |  6 ^^^^^^ |
    incl    %eax                                  // |  4 x:     :       : |  0                  |  5  ^^^^^ |
    movslq  %eax, %rdi                            // |  5 v:   ^ :       : |  0                  |  0        |
    callq   malloc@PLT                            // |  4 ::     x       : |  0                  |  0        |
    movq    %rax, %r13                            // |  5 v:     :     ^ : |  0                  |  0        |
    testl   %ebx, %ebx                            // |  4  v     :     : : |  0                  |  6 ^^^^^^ |
    jle .LBB0_1                                   // |  4  :     :     : : |  0                  |  3  vvv   |
    movslq  %ebx, %r14                            // |  5  v     :     :^: |  0                  |  0        |
    movl    %r14d, %eax                           // |  5 ^      :     :v: |  0                  |  0        |
    movq    %rax, 8(%rsp)                         // |  5 v      v     ::: |  0                  |  0        |
    movb    $1, %r12b                             // |  6 :      :    ^::: |  0                  |  0        |
    xorl    %ebp, %ebp                            // |  7 :     ^:    :::: |  0                  |  5 ^^^^^  |
    movq    %r14, %rbx                            // |  8 :^    ::    ::v: |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_4:                                          // |                     |                     |           |
    leaq    (%r15,%rbp), %rsi                     // |  9 ::  ^ v:    :::v |  0                  |  0        |
    movq    %r13, %rdi                            // |  9 ::   ^::    :v:: |  0                  |  0        |
    movq    %rbx, %rdx                            // |  9 :v ^  ::    :::: |  0                  |  0        |
    callq   strncpy@PLT                           // |  8 ::    :x    :::: |  0                  |  0        |
    leaq    (%rbx,%r13), %rdi                     // |  9 :v   ^::    :v:: |  0                  |  0        |
    movq    %r15, %rsi                            // |  9 ::  ^ ::    :::v |  0                  |  0        |
    movq    %rbp, %rdx                            // |  8 :: ^  v:    :::  |  0                  |  0        |
    callq   strncpy@PLT                           // |  7 ::    :x    :::  |  0                  |  0        |
    movb    $0, (%r13,%r14)                       // |  7 ::    ::    :vv  |  0                  |  0        |
    movq    16(%rsp), %rdi                        // |  8 ::   ^:v    :::  |  0                  |  0        |
    movq    %r13, %rsi                            // |  8 ::  ^ ::    :v:  |  0                  |  0        |
    callq   strstr@PLT                            // |  7 ::    :x    :::  |  0                  |  0        |
    testq   %rax, %rax                            // |  7 v:    ::    :::  |  0                  |  6 ^^^^^^ |
    jne .LBB0_5                                   // |  6  :    ::    :::  |  0                  |  1  v     |
    incq    %rbp                                  // |  6  :    x:    :::  |  0                  |  5  ^^^^^ |
    cmpq    %r14, %rbp                            // |  6  :    v:    ::v  |  0                  |  6 ^^^^^^ |
    setl    %r12b                                 // |  5  :    ::    x:   |  0                  |  2   vv   |
    decq    %rbx                                  // |  4  x    ::     :   |  0                  |  5  ^^^^^ |
    cmpq    %rbp, 8(%rsp)                         // |  3       vv     :   |  0                  |  6 ^^^^^^ |
    jne .LBB0_4                                   // |  2        :     :   |  0                  |  1  v     |
    jmp .LBB0_5                                   // |  2        :     :   |  0                  |  0        |
.LBB0_1:                                          // |                     |                     |           |
    xorl    %r12d, %r12d                          // |  3        :    ^:   |  0                  |  5 ^^^^^  |
.LBB0_5:                                          // |                     |                     |           |
    movq    %r13, %rdi                            // |  4      ^ :    :v   |  0                  |  0        |
    callq   free@PLT                              // |  2        x    :    |  0                  |  0        |
    andb    $1, %r12b                             // |  2        :    x    |  0                  |  5 ^^^^^  |
    movl    %r12d, %eax                           // |  3 ^      :    v    |  0                  |  0        |
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
