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
    subq    $40, %rsp                             // |  1        x         |  0                  |  6 ^^^^^^ |
    .cfi_def_cfa_offset 96                        // |                     |                     |           |
    .cfi_offset %rbx, -56                         // |                     |                     |           |
    .cfi_offset %r12, -48                         // |                     |                     |           |
    .cfi_offset %r13, -40                         // |                     |                     |           |
    .cfi_offset %r14, -32                         // |                     |                     |           |
    .cfi_offset %r15, -24                         // |                     |                     |           |
    .cfi_offset %rbp, -16                         // |                     |                     |           |
    movq    %r8, 8(%rsp)                          // |  2        vv        |  0                  |  0        |
    movl    %ecx, %ebp                            // |  3   v   ^:         |  0                  |  0        |
    movq    %rdx, 32(%rsp)                        // |  3    v  :v         |  0                  |  0        |
    movl    %esi, %r13d                           // |  4     v ::     ^   |  0                  |  0        |
    movq    %rdi, 16(%rsp)                        // |  4      v:v     :   |  0                  |  0        |
    movl    $800, %edi                            // |  4      ^::     :   |  0                  |  0        |
    callq   malloc@PLT                            // |  3       :x     :   |  0                  |  0        |
    movq    %rax, (%rsp)                          // |  4 v     :v     :   |  0                  |  0        |
    testl   %r13d, %r13d                          // |  3       ::     v   |  0                  |  6 ^^^^^^ |
    jle .LBB0_1                                   // |  3       ::     :   |  0                  |  3  vvv   |
    movl    %r13d, %eax                           // |  4 ^     ::     v   |  0                  |  0        |
    movq    %rax, 24(%rsp)                        // |  3 v     :v         |  0                  |  0        |
    xorl    %r12d, %r12d                          // |  3       ::    ^    |  0                  |  5 ^^^^^  |
    xorl    %r14d, %r14d                          // |  4       ::    : ^  |  0                  |  5 ^^^^^  |
    jmp .LBB0_4                                   // |  3       ::    :    |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_9:                                          // |                     |                     |           |
    incq    %r12                                  // |  3       ::    x    |  0                  |  5  ^^^^^ |
    cmpq    24(%rsp), %r12                        // |  3       :v    v    |  0                  |  6 ^^^^^^ |
    je  .LBB0_2                                   // |  3       ::    :    |  0                  |  1  v     |
.LBB0_4:                                          // |                     |                     |           |
    movq    32(%rsp), %rax                        // |  4 ^     :v    :    |  0                  |  0        |
    movl    (%rax,%r12,4), %r13d                  // |  5 v     ::    v^   |  0                  |  0        |
    testl   %r13d, %r13d                          // |  4       ::    :v   |  0                  |  6 ^^^^^^ |
    jle .LBB0_9                                   // |  3       ::    :    |  0                  |  3  vvv   |
    movq    16(%rsp), %rax                        // |  4 ^     :v    :    |  0                  |  0        |
    movq    (%rax,%r12,8), %r15                   // |  5 v     ::    v  ^ |  0                  |  0        |
    jmp .LBB0_6                                   // |  4       ::    :  : |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_8:                                          // |                     |                     |           |
    leaq    1(%rbx), %rax                         // |  6 ^v    ::    :  : |  0                  |  0        |
    movq    %rbx, %r13                            // |  7 :v    ::    :^ : |  0                  |  0        |
    cmpq    $1, %rax                              // |  6 v     ::    :: : |  0                  |  6 ^^^^^^ |
    jbe .LBB0_9                                   // |  5       ::    :: : |  0                  |  2 vv     |
.LBB0_6:                                          // |                     |                     |           |
    leaq    -1(%r13), %rbx                        // |  6  ^    ::    :v : |  0                  |  0        |
    movl    %ebx, %eax                            // |  7 ^v    ::    :: : |  0                  |  0        |
    cmpl    %ebp, (%r15,%rax,4)                   // |  6 v     v:    :: v |  0                  |  6 ^^^^^^ |
    jne .LBB0_8                                   // |  4 :      :    ::   |  0                  |  1  v     |
    decl    %r13d                                 // |  4 :      :    :x   |  0                  |  5  ^^^^^ |
    movl    $8, %edi                              // |  5 :    ^ :    ::   |  0                  |  0        |
    callq   malloc@PLT                            // |  4 :      x    ::   |  0                  |  0        |
    movslq  %r14d, %r14                           // |  5 :      :    ::^  |  0                  |  0        |
    movq    (%rsp), %rcx                          // |  6 : ^    v    :::  |  0                  |  0        |
    movq    %rax, (%rcx,%r14,8)                   // |  6 v v    :    ::v  |  0                  |  0        |
    movl    %r12d, (%rax)                         // |  5 v      :    v::  |  0                  |  0        |
    movl    %r13d, 4(%rax)                        // |  4 v      :     v:  |  0                  |  0        |
    incl    %r14d                                 // |  2        :      x  |  0                  |  5  ^^^^^ |
    jmp .LBB0_8                                   // |  1        :         |  0                  |  0        |
.LBB0_1:                                          // |                     |                     |           |
    xorl    %r14d, %r14d                          // |  2        :      ^  |  0                  |  5 ^^^^^  |
.LBB0_2:                                          // |                     |                     |           |
    movq    8(%rsp), %rax                         // |  3 ^      v      :  |  0                  |  0        |
    movl    %r14d, (%rax)                         // |  3 v      :      v  |  0                  |  0        |
    movq    (%rsp), %rax                          // |  2 ^      v         |  0                  |  0        |
    addq    $40, %rsp                             // |  1        x         |  0                  |  6 ^^^^^^ |
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
