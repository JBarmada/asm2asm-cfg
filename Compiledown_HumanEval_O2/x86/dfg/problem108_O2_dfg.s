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
    pushq   %r14                                  // |  2        x      v  |  0                  |  0        |
    .cfi_def_cfa_offset 24                        // |                     |                     |           |
    pushq   %rbx                                  // |  2  v     x         |  0                  |  0        |
    .cfi_def_cfa_offset 32                        // |                     |                     |           |
    .cfi_offset %rbx, -32                         // |                     |                     |           |
    .cfi_offset %r14, -24                         // |                     |                     |           |
    .cfi_offset %rbp, -16                         // |                     |                     |           |
    movl    %edi, %r14d                           // |  3      v :      ^  |  0                  |  0        |
    movl    $8, %edi                              // |  3      ^ :      :  |  0                  |  0        |
    callq   malloc@PLT                            // |  2        x      :  |  0                  |  0        |
    movq    $0, (%rax)                            // |  3 v      :      :  |  0                  |  0        |
    testl   %r14d, %r14d                          // |  2        :      v  |  0                  |  6 ^^^^^^ |
    jle .LBB0_9                                   // |  2        :      :  |  0                  |  3  vvv   |
    movl    $1, %esi                              // |  3     ^  :      :  |  0                  |  0        |
    xorl    %r8d, %r8d                            // |  4     :  :^     :  |  0                  |  5 ^^^^^  |
    xorl    %r9d, %r9d                            // |  5     :  ::^    :  |  0                  |  5 ^^^^^  |
    jmp .LBB0_2                                   // |  5     :  :::    :  |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_7:                                          // |                     |                     |           |
    incl    %r9d                                  // |  5     :  ::x    :  |  0                  |  5  ^^^^^ |
    movl    %r9d, 4(%rax)                         // |  6 v   :  ::v    :  |  0                  |  0        |
.LBB0_8:                                          // |                     |                     |           |
    leal    1(%rsi), %ecx                         // |  5   ^ v  ::     :  |  0                  |  0        |
    cmpl    %r14d, %esi                           // |  5   : v  ::     v  |  0                  |  6 ^^^^^^ |
    movl    %ecx, %esi                            // |  4   v ^  ::        |  0                  |  1  :     |
    je  .LBB0_9                                   // |  3     :  ::        |  0                  |  1  v     |
.LBB0_2:                                          // |                     |                     |           |
    movl    %esi, %edi                            // |  4     v^ ::        |  0                  |  0        |
    xorl    %ecx, %ecx                            // |  5   ^ :: ::        |  0                  |  5 ^^^^^  |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_3:                                          // |                     |                     |           |
    leal    (%rcx,%rcx,4), %ecx                   // |  5   ^ :: ::        |  0                  |  0        |
    movslq  %edi, %rbp                            // |  5     :v^::        |  0                  |  0        |
    imulq   $1717986919, %rbp, %rdi               // |  7 x  x:::::        |  0                  |  2 ^  ^   |
    movq    %rdi, %rbx                            // |  7 :^  :v:::        |  0                  |  0        |
    shrq    $63, %rbx                             // |  6 :x  : :::        |  0                  |  5 ^^^^^  |
    sarq    $34, %rdi                             // |  7 ::  :^:::        |  0                  |  5 ^^^^^  |
    addl    %ebx, %edi                            // |  7 :v  :x:::        |  0                  |  6 ^^^^^^ |
    leal    (%rdi,%rdi), %ebx                     // |  7 :^  :v:::        |  0                  |  0        |
    leal    (%rbx,%rbx,4), %ebx                   // |  6 :^  : :::        |  0                  |  0        |
    movl    %ebp, %edx                            // |  7 :: ^: v::        |  0                  |  0        |
    subl    %ebx, %edx                            // |  7 :v x: :::        |  0                  |  6 ^^^^^^ |
    leal    (%rdx,%rcx,2), %ecx                   // |  7 : ^v: :::        |  0                  |  0        |
    addl    $9, %ebp                              // |  6 : : : x::        |  0                  |  6 ^^^^^^ |
    cmpl    $18, %ebp                             // |  6 : : : v::        |  0                  |  6 ^^^^^^ |
    ja  .LBB0_3                                   // |  5 : : :  ::        |  0                  |  2 vv     |
    cmpl    %ecx, %esi                            // |  5 : v v  ::        |  0                  |  6 ^^^^^^ |
    jne .LBB0_8                                   // |  4 :   :  ::        |  0                  |  1  v     |
    testb   $1, %sil                              // |  4 :   v  ::        |  0                  |  6 ^^^^^^ |
    jne .LBB0_7                                   // |  3 :      ::        |  0                  |  1  v     |
    incl    %r8d                                  // |  3 :      :x        |  0                  |  5  ^^^^^ |
    movl    %r8d, (%rax)                          // |  3 v      :v        |  0                  |  0        |
    jmp .LBB0_8                                   // |  1        :         |  0                  |  0        |
.LBB0_9:                                          // |                     |                     |           |
    popq    %rbx                                  // |  2  ^     x         |  0                  |  0        |
    .cfi_def_cfa_offset 24                        // |                     |                     |           |
    popq    %r14                                  // |  2        x      ^  |  0                  |  0        |
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
