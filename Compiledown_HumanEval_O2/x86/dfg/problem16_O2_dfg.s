                                                    // +---------------------+---------------------+-----------+
                                                    // |         GPR         |        VECTOR       |   FLAGS   |
                                                    // |                     |                     |           |
                                                    // |    RRRRRRRRRRRRRRRR |    XXXXXXXXXXXXXXXX |    CZSOPA |
                                                    // |    ABCDSDBS89111111 |    MMMMMMMMMMMMMMMM |    FFFFFF |
                                                    // |    XXXXIIPP  012345 |    MMMMMMMMMMMMMMMM |           |
                                                    // |                     |    0123456789111111 |           |
                                                    // |  #                  |  #           012345 |  #        |
                                                    // +---------------------+---------------------+-----------+
    .text                                           // |                     |                     |           |
    .file   "code.c"                                // |                     |                     |           |
    .globl  func0                                   // |                     |                     |           |
    .p2align    4, 0x90                             // |                     |                     |           |
    .type   func0,@function                         // |                     |                     |           |
func0:                                              // |                     |                     |           |
    .cfi_startproc                                  // |                     |                     |           |
    pushq   %rbp                                    // |  2       vx         |  0                  |  0        |
    .cfi_def_cfa_offset 16                          // |                     |                     |           |
    pushq   %r15                                    // |  2        x       v |  0                  |  0        |
    .cfi_def_cfa_offset 24                          // |                     |                     |           |
    pushq   %r14                                    // |  2        x      v  |  0                  |  0        |
    .cfi_def_cfa_offset 32                          // |                     |                     |           |
    pushq   %r12                                    // |  2        x    v    |  0                  |  0        |
    .cfi_def_cfa_offset 40                          // |                     |                     |           |
    pushq   %rbx                                    // |  2  v     x         |  0                  |  0        |
    .cfi_def_cfa_offset 48                          // |                     |                     |           |
    .cfi_offset %rbx, -48                           // |                     |                     |           |
    .cfi_offset %r12, -40                           // |                     |                     |           |
    .cfi_offset %r14, -32                           // |                     |                     |           |
    .cfi_offset %r15, -24                           // |                     |                     |           |
    .cfi_offset %rbp, -16                           // |                     |                     |           |
    testl   %edi, %edi                              // |  2      v :         |  0                  |  6 ^^^^^^ |
    jle .LBB0_7                                     // |  1        :         |  0                  |  3  vvv   |
    movl    %edi, %r14d                             // |  3      v :      ^  |  0                  |  0        |
    movl    %edi, %r12d                             // |  4      v :    ^ :  |  0                  |  0        |
    negl    %r12d                                   // |  3        :    x :  |  0                  |  0        |
    movl    $2, %ebx                                // |  4  ^     :    : :  |  0                  |  0        |
    movl    $1, %ebp                                // |  5  :    ^:    : :  |  0                  |  0        |
    leaq    .L.str(%rip), %r15                      // |  6  :    ::    : :^ |  0                  |  0        |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_2:                                            // |                     |                     |           |
    xorl    %edi, %edi                              // |  7  :   ^::    : :: |  0                  |  5 ^^^^^  |
    xorl    %esi, %esi                              // |  7  :  ^ ::    : :: |  0                  |  5 ^^^^^  |
    movq    %r15, %rdx                              // |  7  : ^  ::    : :v |  0                  |  0        |
    movl    %ebp, %ecx                              // |  6  :^   v:    : :  |  0                  |  0        |
    xorl    %eax, %eax                              // |  6 ^:    ::    : :  |  0                  |  5 ^^^^^  |
    callq   snprintf@PLT                            // |  6 ::    :x    : :  |  0                  |  0        |
    addl    %eax, %ebx                              // |  6 vx    ::    : :  |  0                  |  6 ^^^^^^ |
    leal    (%r12,%rbp), %eax                       // |  6 ^:    v:    v :  |  0                  |  0        |
    incl    %eax                                    // |  6 x:    ::    : :  |  0                  |  5  ^^^^^ |
    movl    %ebp, %ecx                              // |  7 ::^   v:    : :  |  0                  |  0        |
    incl    %ecx                                    // |  6 ::x    :    : :  |  0                  |  5  ^^^^^ |
    movl    %ecx, %ebp                              // |  7 ::v   ^:    : :  |  0                  |  0        |
    cmpl    $1, %eax                                // |  5 v:     :    : :  |  0                  |  6 ^^^^^^ |
    jne .LBB0_2                                     // |  5 ::     :    : :  |  0                  |  1  v     |
    movslq  %ebx, %rdi                              // |  6 :v   ^ :    : :  |  0                  |  0        |
    callq   malloc@PLT                              // |  4 :      x    : :  |  0                  |  0        |
    testq   %rax, %rax                              // |  4 v      :    : :  |  0                  |  6 ^^^^^^ |
    je  .LBB0_10                                    // |  4 :      :    : :  |  0                  |  1  v     |
    movq    %rax, %r15                              // |  5 v      :    : :^ |  0                  |  0        |
    movw    $48, (%rax)                             // |  5 v      :    : :: |  0                  |  0        |
    testl   %r14d, %r14d                            // |  4        :    : v: |  0                  |  6 ^^^^^^ |
    jle .LBB0_11                                    // |  3        :    :  : |  0                  |  3  vvv   |
    movq    %r15, %rbx                              // |  4  ^     :    :  v |  0                  |  0        |
    incq    %rbx                                    // |  3  x     :    :    |  0                  |  5  ^^^^^ |
    movl    $1, %ebp                                // |  4  :    ^:    :    |  0                  |  0        |
    leaq    .L.str(%rip), %r14                      // |  5  :    ::    : ^  |  0                  |  0        |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_6:                                            // |                     |                     |           |
    movq    %rbx, %rdi                              // |  6  v   ^::    : :  |  0                  |  0        |
    movq    %r14, %rsi                              // |  6  :  ^ ::    : v  |  0                  |  0        |
    movl    %ebp, %edx                              // |  5  : ^  v:    :    |  0                  |  0        |
    xorl    %eax, %eax                              // |  5 ^:    ::    :    |  0                  |  5 ^^^^^  |
    callq   sprintf@PLT                             // |  5 ::    :x    :    |  0                  |  0        |
    cltq                                            // |  5 ::    ::    :    |  0                  |  0        |
    addq    %rax, %rbx                              // |  5 vx    ::    :    |  0                  |  6 ^^^^^^ |
    leal    (%r12,%rbp), %eax                       // |  4 ^     v:    v    |  0                  |  0        |
    incl    %eax                                    // |  3 x     ::         |  0                  |  5  ^^^^^ |
    movl    %ebp, %ecx                              // |  4 : ^   v:         |  0                  |  0        |
    incl    %ecx                                    // |  3 : x    :         |  0                  |  5  ^^^^^ |
    movl    %ecx, %ebp                              // |  4 : v   ^:         |  0                  |  0        |
    cmpl    $1, %eax                                // |  2 v      :         |  0                  |  6 ^^^^^^ |
    jne .LBB0_6                                     // |  2 :      :         |  0                  |  1  v     |
    jmp .LBB0_11                                    // |  2 :      :         |  0                  |  0        |
.LBB0_7:                                            // |                     |                     |           |
    movl    $2, %edi                                // |  3 :    ^ :         |  0                  |  0        |
    callq   malloc@PLT                              // |  2 :      x         |  0                  |  0        |
    testq   %rax, %rax                              // |  2 v      :         |  0                  |  6 ^^^^^^ |
    je  .LBB0_10                                    // |  2 :      :         |  0                  |  1  v     |
    movq    %rax, %r15                              // |  3 v      :       ^ |  0                  |  0        |
    movw    $48, (%rax)                             // |  2 v      :         |  0                  |  0        |
    jmp .LBB0_11                                    // |  1        :         |  0                  |  0        |
.LBB0_10:                                           // |                     |                     |           |
    xorl    %r15d, %r15d                            // |  2        :       ^ |  0                  |  5 ^^^^^  |
.LBB0_11:                                           // |                     |                     |           |
    movq    %r15, %rax                              // |  3 ^      :       v |  0                  |  0        |
    popq    %rbx                                    // |  2  ^     x         |  0                  |  0        |
    .cfi_def_cfa_offset 40                          // |                     |                     |           |
    popq    %r12                                    // |  2        x    ^    |  0                  |  0        |
    .cfi_def_cfa_offset 32                          // |                     |                     |           |
    popq    %r14                                    // |  2        x      ^  |  0                  |  0        |
    .cfi_def_cfa_offset 24                          // |                     |                     |           |
    popq    %r15                                    // |  2        x       ^ |  0                  |  0        |
    .cfi_def_cfa_offset 16                          // |                     |                     |           |
    popq    %rbp                                    // |  2       ^x         |  0                  |  0        |
    .cfi_def_cfa_offset 8                           // |                     |                     |           |
    retq                                            // |  1        x         |  0                  |  0        |
.Lfunc_end0:                                        // |                     |                     |           |
    .size   func0, .Lfunc_end0-func0                // |                     |                     |           |
    .cfi_endproc                                    // |                     |                     |           |
    .type   .L.str,@object                          // |                     |                     |           |
    .section    .rodata.str1.1,"aMS",@progbits,1    // |                     |                     |           |
.L.str:                                             // |                     |                     |           |
    .asciz  " %d"                                   // |                     |                     |           |
    .size   .L.str, 4                               // |                     |                     |           |
    .ident  "clang version 15.0.4"                  // |                     |                     |           |
    .section    ".note.GNU-stack","",@progbits      // |                     |                     |           |
    .addrsig                                        // |                     |                     |           |
                                                    // +.....................+.....................+...........+
                                                    // Legend:
                                                    //     ^       : Register assignment (write)
                                                    //     v       : Register usage (read)
                                                    //     x       : Register usage and reassignment (R/W)
                                                    //     :       : Register in use (live)
                                                    //     <space> : Register not in use
                                                    //     #       : Number of occupied registers
