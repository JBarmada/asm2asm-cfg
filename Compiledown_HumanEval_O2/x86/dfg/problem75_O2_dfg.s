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
    movl    %ecx, 4(%rsp)                         // |  2   v    v         |  0                  |  0        |
    movq    %rdx, %r12                            // |  3    v   :    ^    |  0                  |  0        |
    movq    %rdi, %rbp                            // |  4      v^:    :    |  0                  |  0        |
    xorl    %r14d, %r14d                          // |  4       ::    : ^  |  0                  |  5 ^^^^^  |
    movl    $0, %ebx                              // |  4  ^    ::    :    |  0                  |  0        |
    testl   %esi, %esi                            // |  4     v ::    :    |  0                  |  6 ^^^^^^ |
    jle .LBB0_3                                   // |  3       ::    :    |  0                  |  3  vvv   |
    movl    %esi, %r13d                           // |  5     v ::    :^   |  0                  |  0        |
    xorl    %r15d, %r15d                          // |  5       ::    :: ^ |  0                  |  5 ^^^^^  |
    xorl    %ebx, %ebx                            // |  6  ^    ::    :: : |  0                  |  5 ^^^^^  |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_2:                                          // |                     |                     |           |
    movq    (%rbp,%r15,8), %rdi                   // |  7  :   ^v:    :: v |  0                  |  0        |
    callq   strlen@PLT                            // |  6  :    :x    :: : |  0                  |  0        |
    addl    %eax, %ebx                            // |  7 vx    ::    :: : |  0                  |  6 ^^^^^^ |
    incq    %r15                                  // |  6  :    ::    :: x |  0                  |  5  ^^^^^ |
    cmpq    %r15, %r13                            // |  6  :    ::    :v v |  0                  |  6 ^^^^^^ |
    jne .LBB0_2                                   // |  4  :    ::    :    |  0                  |  1  v     |
.LBB0_3:                                          // |                     |                     |           |
    movq    %rbp, %r13                            // |  5  :    v:    :^   |  0                  |  0        |
    movl    4(%rsp), %eax                         // |  5 ^:     v    ::   |  0                  |  0        |
    testl   %eax, %eax                            // |  5 v:     :    ::   |  0                  |  6 ^^^^^^ |
    jle .LBB0_6                                   // |  5 ::     :    ::   |  0                  |  3  vvv   |
    movl    %eax, %r15d                           // |  6 v:     :    :: ^ |  0                  |  0        |
    xorl    %ebp, %ebp                            // |  7 ::    ^:    :: : |  0                  |  5 ^^^^^  |
    xorl    %r14d, %r14d                          // |  8 ::    ::    ::^: |  0                  |  5 ^^^^^  |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_5:                                          // |                     |                     |           |
    movq    (%r12,%rbp,8), %rdi                   // |  9 ::   ^v:    v::: |  0                  |  0        |
    callq   strlen@PLT                            // |  7 ::    :x     ::: |  0                  |  0        |
    addl    %eax, %r14d                           // |  7 v:    ::     :x: |  0                  |  6 ^^^^^^ |
    incq    %rbp                                  // |  6  :    x:     ::: |  0                  |  5  ^^^^^ |
    cmpq    %rbp, %r15                            // |  6  :    v:     ::v |  0                  |  6 ^^^^^^ |
    jne .LBB0_5                                   // |  4  :     :     ::  |  0                  |  1  v     |
.LBB0_6:                                          // |                     |                     |           |
    cmpl    %r14d, %ebx                           // |  4  v     :     :v  |  0                  |  6 ^^^^^^ |
    cmovleq %r13, %r12                            // |  3        :    ^v   |  0                  |  0        |
    cmovlq  %r13, %r12                            // |  3        :    ^v   |  0                  |  0        |
    movq    %r12, %rax                            // |  3 ^      :    v    |  0                  |  0        |
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
