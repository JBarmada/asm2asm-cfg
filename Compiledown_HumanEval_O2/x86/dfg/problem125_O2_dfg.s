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
    movq    %rdi, %rbx                            // |  3  ^   v :         |  0                  |  0        |
    callq   strlen@PLT                            // |  2  :     x         |  0                  |  0        |
    xorl    %r14d, %r14d                          // |  3  :     :      ^  |  0                  |  5 ^^^^^  |
    cmpq    $10, %rax                             // |  3 v:     :         |  0                  |  6 ^^^^^^ |
    jne .LBB0_16                                  // |  2  :     :         |  0                  |  1  v     |
    movzbl  (%rbx), %eax                          // |  3 ^v     :         |  0                  |  0        |
    leal    -58(%rax), %ecx                       // |  4 v:^    :         |  0                  |  0        |
    cmpb    $-10, %cl                             // |  4 ::v    :         |  0                  |  6 ^^^^^^ |
    jb  .LBB0_16                                  // |  3 ::     :         |  0                  |  1 v      |
    movzbl  1(%rbx), %ecx                         // |  4 :v^    :         |  0                  |  0        |
    leal    -58(%rcx), %edx                       // |  5 ::v^   :         |  0                  |  0        |
    cmpb    $-10, %dl                             // |  5 :::v   :         |  0                  |  6 ^^^^^^ |
    jb  .LBB0_16                                  // |  4 :::    :         |  0                  |  1 v      |
    cmpb    $45, 2(%rbx)                          // |  4 :v:    :         |  0                  |  6 ^^^^^^ |
    jne .LBB0_16                                  // |  4 :::    :         |  0                  |  1  v     |
    movzbl  3(%rbx), %r8d                         // |  5 :v:    :^        |  0                  |  0        |
    leal    -58(%r8), %esi                        // |  6 ::: ^  :v        |  0                  |  0        |
    cmpb    $-10, %sil                            // |  6 ::: v  ::        |  0                  |  6 ^^^^^^ |
    jb  .LBB0_16                                  // |  5 :::    ::        |  0                  |  1 v      |
    movzbl  4(%rbx), %esi                         // |  6 :v: ^  ::        |  0                  |  0        |
    leal    -58(%rsi), %edi                       // |  7 ::: v^ ::        |  0                  |  0        |
    cmpb    $-10, %dil                            // |  7 ::: :v ::        |  0                  |  6 ^^^^^^ |
    jb  .LBB0_16                                  // |  6 ::: :  ::        |  0                  |  1 v      |
    cmpb    $45, 5(%rbx)                          // |  6 :v: :  ::        |  0                  |  6 ^^^^^^ |
    jne .LBB0_16                                  // |  6 ::: :  ::        |  0                  |  1  v     |
    movzbl  6(%rbx), %edx                         // |  7 :v:^:  ::        |  0                  |  0        |
    addb    $-58, %dl                             // |  7 :::x:  ::        |  0                  |  6 ^^^^^^ |
    cmpb    $-10, %dl                             // |  7 :::v:  ::        |  0                  |  6 ^^^^^^ |
    jb  .LBB0_16                                  // |  6 ::: :  ::        |  0                  |  1 v      |
    movzbl  7(%rbx), %edx                         // |  7 :v:^:  ::        |  0                  |  0        |
    addb    $-58, %dl                             // |  7 :::x:  ::        |  0                  |  6 ^^^^^^ |
    cmpb    $-10, %dl                             // |  7 :::v:  ::        |  0                  |  6 ^^^^^^ |
    jb  .LBB0_16                                  // |  6 ::: :  ::        |  0                  |  1 v      |
    movzbl  8(%rbx), %edx                         // |  7 :v:^:  ::        |  0                  |  0        |
    addb    $-58, %dl                             // |  7 :::x:  ::        |  0                  |  6 ^^^^^^ |
    cmpb    $-10, %dl                             // |  7 :::v:  ::        |  0                  |  6 ^^^^^^ |
    jb  .LBB0_16                                  // |  6 ::: :  ::        |  0                  |  1 v      |
    movzbl  9(%rbx), %edx                         // |  7 :v:^:  ::        |  0                  |  0        |
    addb    $-58, %dl                             // |  6 : :x:  ::        |  0                  |  6 ^^^^^^ |
    cmpb    $-10, %dl                             // |  6 : :v:  ::        |  0                  |  6 ^^^^^^ |
    jb  .LBB0_16                                  // |  5 : : :  ::        |  0                  |  1 v      |
    movb    %al, 5(%rsp)                          // |  5 v : :  v:        |  0                  |  0        |
    movb    %cl, 6(%rsp)                          // |  5 : v :  v:        |  0                  |  0        |
    movb    $0, 7(%rsp)                           // |  4 :   :  v:        |  0                  |  0        |
    movb    %r8b, 2(%rsp)                         // |  4 :   :  vv        |  0                  |  0        |
    movb    %sil, 3(%rsp)                         // |  3 :   v  v         |  0                  |  0        |
    movb    $0, 4(%rsp)                           // |  2 :      v         |  0                  |  0        |
    xorl    %r14d, %r14d                          // |  3 :      :      ^  |  0                  |  5 ^^^^^  |
    leaq    5(%rsp), %rdi                         // |  3 :    ^ v         |  0                  |  0        |
    xorl    %esi, %esi                            // |  3 :   ^  :         |  0                  |  5 ^^^^^  |
    movl    $10, %edx                             // |  3 :  ^   :         |  0                  |  0        |
    callq   strtol@PLT                            // |  2 :      x         |  0                  |  0        |
    movq    %rax, %rbx                            // |  3 v^     :         |  0                  |  0        |
    leaq    2(%rsp), %rdi                         // |  4 ::   ^ v         |  0                  |  0        |
    xorl    %esi, %esi                            // |  4 ::  ^  :         |  0                  |  5 ^^^^^  |
    movl    $10, %edx                             // |  4 :: ^   :         |  0                  |  0        |
    callq   strtol@PLT                            // |  4 :: :   x         |  0                  |  0        |
    leal    -13(%rbx), %ecx                       // |  5 :v^:   :         |  0                  |  0        |
    cmpl    $-12, %ecx                            // |  5 ::v:   :         |  0                  |  6 ^^^^^^ |
    jb  .LBB0_16                                  // |  4 :: :   :         |  0                  |  1 v      |
    leal    -32(%rax), %ecx                       // |  5 v:^:   :         |  0                  |  0        |
    cmpl    $-31, %ecx                            // |  5 ::v:   :         |  0                  |  6 ^^^^^^ |
    jb  .LBB0_16                                  // |  4 :: :   :         |  0                  |  1 v      |
    movl    %ebx, %ecx                            // |  5 :v^:   :         |  0                  |  0        |
    andl    $-3, %ecx                             // |  5 ::x:   :         |  0                  |  5 ^^^^^  |
    cmpl    $4, %ecx                              // |  5 ::v:   :         |  0                  |  6 ^^^^^^ |
    setne   %dl                                   // |  5 :::x   :         |  0                  |  1  v     |
    cmpl    $9, %ecx                              // |  5 ::v:   :         |  0                  |  6 ^^^^^^ |
    setne   %cl                                   // |  5 ::x:   :         |  0                  |  1  v     |
    testb   %cl, %dl                              // |  5 ::vv   :         |  0                  |  6 ^^^^^^ |
    jne .LBB0_15                                  // |  4 :::    :         |  0                  |  1  v     |
    cmpl    $31, %eax                             // |  4 v::    :         |  0                  |  6 ^^^^^^ |
    je  .LBB0_16                                  // |  4 :::    :         |  0                  |  1  v     |
.LBB0_15:                                         // |                     |                     |           |
    cmpl    $2, %ebx                              // |  4 :v:    :         |  0                  |  6 ^^^^^^ |
    setne   %cl                                   // |  3 : x    :         |  0                  |  1  v     |
    cmpl    $30, %eax                             // |  3 v :    :         |  0                  |  6 ^^^^^^ |
    setb    %al                                   // |  3 x :    :         |  0                  |  1 v      |
    orb %cl, %al                                  // |  3 x v    :         |  0                  |  5 ^^^^^  |
    movzbl  %al, %r14d                            // |  3 v      :      ^  |  0                  |  0        |
.LBB0_16:                                         // |                     |                     |           |
    movl    %r14d, %eax                           // |  3 ^      :      v  |  0                  |  0        |
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
