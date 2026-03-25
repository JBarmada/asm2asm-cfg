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
    testl   %esi, %esi                            // |  2     v  :         |  0                  |  6 ^^^^^^ |
    jle .LBB0_8                                   // |  1        :         |  0                  |  3  vvv   |
    movq    %rdi, %rbx                            // |  3  ^   v :         |  0                  |  0        |
    movl    %esi, %r14d                           // |  4  :  v  :      ^  |  0                  |  0        |
    leaq    (,%r14,4), %rdi                       // |  4  :   ^ :      v  |  0                  |  0        |
    callq   malloc@PLT                            // |  3  :     x      :  |  0                  |  0        |
    testq   %rax, %rax                            // |  4 v:     :      :  |  0                  |  6 ^^^^^^ |
    je  .LBB0_8                                   // |  3  :     :      :  |  0                  |  1  v     |
    movl    (%rbx), %edx                          // |  4  v ^   :      :  |  0                  |  0        |
    leaq    -1(%r14), %rcx                        // |  5  :^:   :      v  |  0                  |  0        |
    movl    %r14d, %r8d                           // |  6  :::   :^     v  |  0                  |  0        |
    andl    $3, %r8d                              // |  5  :::   :x        |  0                  |  5 ^^^^^  |
    cmpq    $3, %rcx                              // |  5  :v:   ::        |  0                  |  6 ^^^^^^ |
    jae .LBB0_10                                  // |  4  : :   ::        |  0                  |  1 v      |
    xorl    %esi, %esi                            // |  5  : :^  ::        |  0                  |  5 ^^^^^  |
.LBB0_4:                                          // |                     |                     |           |
    testq   %r8, %r8                              // |  5  : ::  :v        |  0                  |  6 ^^^^^^ |
    je  .LBB0_9                                   // |  5  : ::  ::        |  0                  |  1  v     |
    leaq    (%rax,%rsi,4), %rdi                   // |  7 v: :v^ ::        |  0                  |  0        |
    leaq    (%rbx,%rsi,4), %rsi                   // |  6  v :^: ::        |  0                  |  0        |
    xorl    %ebx, %ebx                            // |  6  ^ ::: ::        |  0                  |  5 ^^^^^  |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_6:                                          // |                     |                     |           |
    movl    (%rsi,%rbx,4), %ecx                   // |  7  v^:v: ::        |  0                  |  0        |
    cmpl    %edx, %ecx                            // |  6  :vv : ::        |  0                  |  6 ^^^^^^ |
    cmovgl  %ecx, %edx                            // |  6  :v^ : ::        |  0                  |  0        |
    movl    %edx, (%rdi,%rbx,4)                   // |  5  v v v ::        |  0                  |  0        |
    incq    %rbx                                  // |  4  x :   ::        |  0                  |  5  ^^^^^ |
    cmpq    %rbx, %r8                             // |  4  v :   :v        |  0                  |  6 ^^^^^^ |
    jne .LBB0_6                                   // |  2    :   :         |  0                  |  1  v     |
    jmp .LBB0_9                                   // |  2    :   :         |  0                  |  0        |
.LBB0_8:                                          // |                     |                     |           |
    xorl    %eax, %eax                            // |  3 ^  :   :         |  0                  |  5 ^^^^^  |
.LBB0_9:                                          // |                     |                     |           |
    addq    $8, %rsp                              // |  3 :  :   x         |  0                  |  6 ^^^^^^ |
    .cfi_def_cfa_offset 24                        // |                     |                     |           |
    popq    %rbx                                  // |  4 :^ :   x         |  0                  |  0        |
    .cfi_def_cfa_offset 16                        // |                     |                     |           |
    popq    %r14                                  // |  5 :: :   x      ^  |  0                  |  0        |
    .cfi_def_cfa_offset 8                         // |                     |                     |           |
    retq                                          // |  5 :: :   x      :  |  0                  |  0        |
.LBB0_10:                                         // |                     |                     |           |
    .cfi_def_cfa_offset 32                        // |                     |                     |           |
    andl    $-4, %r14d                            // |  4 :: :          x  |  0                  |  5 ^^^^^  |
    xorl    %esi, %esi                            // |  5 :: :^         :  |  0                  |  5 ^^^^^  |
    jmp .LBB0_12                                  // |  5 :: ::         :  |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_11:                                         // |                     |                     |           |
    movl    %edx, 12(%rax,%rsi,4)                 // |  5 v: vv         :  |  0                  |  0        |
    addq    $4, %rsi                              // |  5 :: :x         :  |  0                  |  6 ^^^^^^ |
    cmpq    %rsi, %r14                            // |  5 :: :v         v  |  0                  |  6 ^^^^^^ |
    je  .LBB0_4                                   // |  4 :: ::            |  0                  |  1  v     |
.LBB0_12:                                         // |                     |                     |           |
    movl    (%rbx,%rsi,4), %ecx                   // |  5 :v^:v            |  0                  |  0        |
    cmpl    %edx, %ecx                            // |  5 ::vv:            |  0                  |  6 ^^^^^^ |
    cmovgl  %ecx, %edx                            // |  5 ::v^:            |  0                  |  0        |
    movl    %edx, (%rax,%rsi,4)                   // |  4 v: vv            |  0                  |  0        |
    movl    4(%rbx,%rsi,4), %edi                  // |  5 :v :v^           |  0                  |  0        |
    cmpl    %edx, %edi                            // |  5 :: v:v           |  0                  |  6 ^^^^^^ |
    jg  .LBB0_14                                  // |  4 :: ::            |  0                  |  3  vvv   |
    movl    %edx, %edi                            // |  5 :: v:^           |  0                  |  0        |
.LBB0_14:                                         // |                     |                     |           |
    movl    %edi, 4(%rax,%rsi,4)                  // |  4 v:  vv           |  0                  |  0        |
    movl    8(%rbx,%rsi,4), %ecx                  // |  5 :v^ v:           |  0                  |  0        |
    cmpl    %edi, %ecx                            // |  5 ::v :v           |  0                  |  6 ^^^^^^ |
    jg  .LBB0_16                                  // |  4 ::  ::           |  0                  |  3  vvv   |
    movl    %edi, %ecx                            // |  5 ::^ :v           |  0                  |  0        |
.LBB0_16:                                         // |                     |                     |           |
    movl    %ecx, 8(%rax,%rsi,4)                  // |  4 v:v v            |  0                  |  0        |
    movl    12(%rbx,%rsi,4), %edx                 // |  4  v:^v            |  0                  |  0        |
    cmpl    %ecx, %edx                            // |  2   vv             |  0                  |  6 ^^^^^^ |
    jg  .LBB0_11                                  // |  1   :              |  0                  |  3  vvv   |
    movl    %ecx, %edx                            // |  2   v^             |  0                  |  0        |
    jmp .LBB0_11                                  // |  0                  |  0                  |  0        |
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
