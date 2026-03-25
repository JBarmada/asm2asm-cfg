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
    movl    %esi, 4(%rsp)                         // |  2     v  v         |  0                  |  0        |
    movq    %rdi, %rbx                            // |  3  ^   v :         |  0                  |  0        |
    callq   strlen@PLT                            // |  2  :     x         |  0                  |  0        |
    movq    %rax, 8(%rsp)                         // |  3 v:     v         |  0                  |  0        |
    testl   %eax, %eax                            // |  3 v:     :         |  0                  |  6 ^^^^^^ |
    jle .LBB0_7                                   // |  2  :     :         |  0                  |  3  vvv   |
    movq    8(%rsp), %rax                         // |  3 ^:     v         |  0                  |  0        |
    addl    $2, %eax                              // |  3 x:     :         |  0                  |  6 ^^^^^^ |
    movl    $2863311531, %ecx                     // |  4 ::^    :         |  0                  |  0        |
    imulq   %rax, %rcx                            // |  5 x:^x   :         |  0                  |  2 ^  ^   |
    shrq    $33, %rcx                             // |  3  :x    :         |  0                  |  5 ^^^^^  |
    movl    $3, %r14d                             // |  3  :     :      ^  |  0                  |  0        |
    xorl    %r15d, %r15d                          // |  4  :     :      :^ |  0                  |  5 ^^^^^  |
    movq    %rsp, %r13                            // |  5  :     v     ^:: |  0                  |  0        |
    jmp .LBB0_2                                   // |  5  :     :     ::: |  0                  |  0        |
.LBB0_5:                                          // |                     |                     |           |
    movzbl  (%rsp), %eax                          // |  6 ^:     v     ::: |  0                  |  0        |
    movzwl  1(%rsp), %ecx                         // |  7 ::^    v     ::: |  0                  |  0        |
    movw    %cx, (%rsp)                           // |  7 ::v    v     ::: |  0                  |  0        |
    movb    %al, 2(%rsp)                          // |  6 v:     v     ::: |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_6:                                          // |                     |                     |           |
    movq    %rbx, %rdi                            // |  6  v   ^ :     ::: |  0                  |  0        |
    movq    %r13, %rsi                            // |  6  :  ^  :     v:: |  0                  |  0        |
    movq    %rbp, %rdx                            // |  7  : ^  v:     ::: |  0                  |  0        |
    callq   strncpy@PLT                           // |  5  :     x     ::: |  0                  |  0        |
    addl    $3, %r14d                             // |  5  :     :     :x: |  0                  |  6 ^^^^^^ |
    addq    $3, %rbx                              // |  5  x     :     ::: |  0                  |  6 ^^^^^^ |
    addl    $-3, %r15d                            // |  5  :     :     ::x |  0                  |  6 ^^^^^^ |
    movq    16(%rsp), %rcx                        // |  6  :^    v     ::: |  0                  |  0        |
    decq    %rcx                                  // |  6  :x    :     ::: |  0                  |  5  ^^^^^ |
    je  .LBB0_7                                   // |  6  ::    :     ::: |  0                  |  1  v     |
.LBB0_2:                                          // |                     |                     |           |
    movq    %rcx, 16(%rsp)                        // |  6  :v    v     ::: |  0                  |  0        |
    movq    8(%rsp), %r12                         // |  6  :     v    ^::: |  0                  |  0        |
    cmpl    %r12d, %r14d                          // |  6  :     :    v:v: |  0                  |  6 ^^^^^^ |
    cmovll  %r14d, %r12d                          // |  6  :     :    ^:v: |  0                  |  0        |
    leal    (%r12,%r15), %eax                     // |  7 ^:     :    v::v |  0                  |  0        |
    movslq  %eax, %rbp                            // |  7 v:    ^:    :::  |  0                  |  0        |
    movq    %r13, %rdi                            // |  7  :   ^::    :v:  |  0                  |  0        |
    movq    %rbx, %rsi                            // |  6  v  ^ ::    : :  |  0                  |  0        |
    movq    %rbp, %rdx                            // |  5    ^  v:    : :  |  0                  |  0        |
    callq   strncpy@PLT                           // |  4       :x    : :  |  0                  |  0        |
    movb    $0, (%rsp,%rbp)                       // |  4       vv    : :  |  0                  |  0        |
    cmpl    %r14d, %r12d                          // |  3        :    v v  |  0                  |  6 ^^^^^^ |
    jne .LBB0_6                                   // |  1        :         |  0                  |  1  v     |
    cmpl    $0, 4(%rsp)                           // |  1        v         |  0                  |  6 ^^^^^^ |
    je  .LBB0_5                                   // |  1        :         |  0                  |  1  v     |
    movzbl  2(%rsp), %eax                         // |  2 ^      v         |  0                  |  0        |
    movzbl  (%rsp), %ecx                          // |  3 : ^    v         |  0                  |  0        |
    movzbl  1(%rsp), %edx                         // |  4 : :^   v         |  0                  |  0        |
    movb    %dl, 2(%rsp)                          // |  4 : :v   v         |  0                  |  0        |
    movb    %cl, 1(%rsp)                          // |  3 : v    v         |  0                  |  0        |
    movb    %al, (%rsp)                           // |  2 v      v         |  0                  |  0        |
    jmp .LBB0_6                                   // |  1        :         |  0                  |  0        |
.LBB0_7:                                          // |                     |                     |           |
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
