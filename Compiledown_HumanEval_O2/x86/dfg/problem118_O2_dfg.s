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
    pushq   %r13                                    // |  2        x     v   |  0                  |  0        |
    .cfi_def_cfa_offset 40                          // |                     |                     |           |
    pushq   %r12                                    // |  2        x    v    |  0                  |  0        |
    .cfi_def_cfa_offset 48                          // |                     |                     |           |
    pushq   %rbx                                    // |  2  v     x         |  0                  |  0        |
    .cfi_def_cfa_offset 56                          // |                     |                     |           |
    subq    $56, %rsp                               // |  1        x         |  0                  |  6 ^^^^^^ |
    .cfi_def_cfa_offset 112                         // |                     |                     |           |
    .cfi_offset %rbx, -56                           // |                     |                     |           |
    .cfi_offset %r12, -48                           // |                     |                     |           |
    .cfi_offset %r13, -40                           // |                     |                     |           |
    .cfi_offset %r14, -32                           // |                     |                     |           |
    .cfi_offset %r15, -24                           // |                     |                     |           |
    .cfi_offset %rbp, -16                           // |                     |                     |           |
    movq    %rdx, 24(%rsp)                          // |  2    v   v         |  0                  |  0        |
    movl    %esi, 20(%rsp)                          // |  2     v  v         |  0                  |  0        |
    movq    %rdi, 48(%rsp)                          // |  2      v v         |  0                  |  0        |
    callq   strlen@PLT                              // |  1        x         |  0                  |  0        |
    incq    %rax                                    // |  2 x      :         |  0                  |  5  ^^^^^ |
    movq    %rax, 40(%rsp)                          // |  2 v      v         |  0                  |  0        |
    movq    %rax, %rdi                              // |  3 v    ^ :         |  0                  |  0        |
    callq   malloc@PLT                              // |  2 :      x         |  0                  |  0        |
    movq    %rax, %rbx                              // |  3 v^     :         |  0                  |  0        |
    xorl    %r14d, %r14d                            // |  4 ::     :      ^  |  0                  |  5 ^^^^^  |
    callq   __ctype_b_loc@PLT                       // |  4 ::     x      :  |  0                  |  0        |
    movq    %rax, 32(%rsp)                          // |  4 v:     v      :  |  0                  |  0        |
    xorl    %eax, %eax                              // |  4 ^:     :      :  |  0                  |  5 ^^^^^  |
    movq    %rax, 8(%rsp)                           // |  4 v:     v      :  |  0                  |  0        |
    xorl    %r13d, %r13d                            // |  4  :     :     ^:  |  0                  |  5 ^^^^^  |
    xorl    %r12d, %r12d                            // |  4  :     :    ^ :  |  0                  |  5 ^^^^^  |
    movl    $0, 4(%rsp)                             // |  3  :     v      :  |  0                  |  0        |
    jmp .LBB0_1                                     // |  3  :     :      :  |  0                  |  0        |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_5:                                            // |                     |                     |           |
    leal    1(%r14), %r12d                          // |  4  :     :    ^ v  |  0                  |  0        |
    xorl    %r13d, %r13d                            // |  5  :     :    :^:  |  0                  |  5 ^^^^^  |
.LBB0_8:                                            // |                     |                     |           |
    incq    %r14                                    // |  4  :     :    : x  |  0                  |  5  ^^^^^ |
    cmpq    %r14, 40(%rsp)                          // |  4  :     v    : v  |  0                  |  6 ^^^^^^ |
    je  .LBB0_9                                     // |  4  :     :    : :  |  0                  |  1  v     |
.LBB0_1:                                            // |                     |                     |           |
    movq    32(%rsp), %rax                          // |  5 ^:     v    : :  |  0                  |  0        |
    movq    (%rax), %rbp                            // |  6 v:    ^:    : :  |  0                  |  0        |
    movq    48(%rsp), %rax                          // |  6 ^:    :v    : :  |  0                  |  0        |
    movsbq  (%rax,%r14), %r15                       // |  7 v:    ::    : v^ |  0                  |  0        |
    testb   $32, 1(%rbp,%r15,2)                     // |  6  :    v:    : :v |  0                  |  6 ^^^^^^ |
    jne .LBB0_3                                     // |  6  :    ::    : :: |  0                  |  1  v     |
    testb   %r15b, %r15b                            // |  6  :    ::    : :v |  0                  |  6 ^^^^^^ |
    je  .LBB0_3                                     // |  6  :    ::    : :: |  0                  |  1  v     |
    movl    %r14d, %eax                             // |  7 ^:    ::    : v: |  0                  |  0        |
    subl    %r12d, %eax                             // |  7 x:    ::    v :: |  0                  |  6 ^^^^^^ |
    cltq                                            // |  7 ::    ::    : :: |  0                  |  0        |
    movb    %r15b, (%rbx,%rax)                      // |  7 vv    ::    : :v |  0                  |  0        |
    movl    $11, %edx                               // |  8 :: ^  ::    : :: |  0                  |  0        |
    leaq    .L.str(%rip), %rdi                      // |  8 ::   ^::    : :: |  0                  |  0        |
    movl    %r15d, %esi                             // |  8 ::  ^ ::    : :v |  0                  |  0        |
    callq   memchr@PLT                              // |  7 ::    :x    : :: |  0                  |  0        |
    testq   %rax, %rax                              // |  7 v:    ::    : :: |  0                  |  6 ^^^^^^ |
    jne .LBB0_8                                     // |  6  :    ::    : :: |  0                  |  1  v     |
    movzbl  %r15b, %eax                             // |  7 ^:    ::    : :v |  0                  |  0        |
    movzwl  (%rbp,%rax,2), %eax                     // |  6 ^:    v:    : :  |  0                  |  0        |
    btl $10, %eax                                   // |  5 ^:     :    : :  |  0                  |  0        |
    adcl    $0, %r13d                               // |  5  :     :    :^:  |  0                  |  6 ^^^^^^ |
    jmp .LBB0_8                                     // |  5  :     :    :::  |  0                  |  0        |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_3:                                            // |                     |                     |           |
    cmpl    20(%rsp), %r13d                         // |  5  :     v    :v:  |  0                  |  6 ^^^^^^ |
    jne .LBB0_5                                     // |  4  :     :    : :  |  0                  |  1  v     |
    movl    %r14d, %eax                             // |  5 ^:     :    : v  |  0                  |  0        |
    subl    %r12d, %eax                             // |  4 x:     :    v    |  0                  |  6 ^^^^^^ |
    cltq                                            // |  3 ::     :         |  0                  |  0        |
    movb    $0, (%rbx,%rax)                         // |  3 vv     :         |  0                  |  0        |
    movl    4(%rsp), %eax                           // |  3 ^:     v         |  0                  |  0        |
    movslq  %eax, %r15                              // |  4 v:     :       ^ |  0                  |  0        |
    incl    %eax                                    // |  4 x:     :       : |  0                  |  5  ^^^^^ |
    movl    %eax, 4(%rsp)                           // |  4 v:     v       : |  0                  |  0        |
    leaq    8(,%r15,8), %rsi                        // |  5 ::  ^  :       v |  0                  |  0        |
    movq    8(%rsp), %rdi                           // |  5 ::   ^ v       : |  0                  |  0        |
    callq   realloc@PLT                             // |  4 ::     x       : |  0                  |  0        |
    movq    %rbx, %rbp                              // |  5 :v    ^:       : |  0                  |  0        |
    movq    %rax, %rbx                              // |  5 v^    ::       : |  0                  |  0        |
    movq    %rbp, %rdi                              // |  6 ::   ^v:       : |  0                  |  0        |
    callq   strlen@PLT                              // |  5 ::    :x       : |  0                  |  0        |
    leaq    1(%rax), %rdi                           // |  6 v:   ^::       : |  0                  |  0        |
    callq   malloc@PLT                              // |  5 ::    :x       : |  0                  |  0        |
    movq    %rbx, 8(%rsp)                           // |  5 :v    :v       : |  0                  |  0        |
    movq    %rax, (%rbx,%r15,8)                     // |  5 vv    ::       v |  0                  |  0        |
    movq    %rbp, %rbx                              // |  4 :^    v:         |  0                  |  0        |
    movq    %rax, %rdi                              // |  5 v:   ^::         |  0                  |  0        |
    movq    %rbp, %rsi                              // |  4  :  ^ v:         |  0                  |  0        |
    callq   strcpy@PLT                              // |  2  :     x         |  0                  |  0        |
    jmp .LBB0_5                                     // |  2  :     :         |  0                  |  0        |
.LBB0_9:                                            // |                     |                     |           |
    movq    %rbx, %rdi                              // |  3  v   ^ :         |  0                  |  0        |
    callq   free@PLT                                // |  1        x         |  0                  |  0        |
    movq    24(%rsp), %rax                          // |  2 ^      v         |  0                  |  0        |
    movl    4(%rsp), %ecx                           // |  3 : ^    v         |  0                  |  0        |
    movl    %ecx, (%rax)                            // |  3 v v    :         |  0                  |  0        |
    movq    8(%rsp), %rax                           // |  2 ^      v         |  0                  |  0        |
    addq    $56, %rsp                               // |  1        x         |  0                  |  6 ^^^^^^ |
    .cfi_def_cfa_offset 56                          // |                     |                     |           |
    popq    %rbx                                    // |  2  ^     x         |  0                  |  0        |
    .cfi_def_cfa_offset 48                          // |                     |                     |           |
    popq    %r12                                    // |  2        x    ^    |  0                  |  0        |
    .cfi_def_cfa_offset 40                          // |                     |                     |           |
    popq    %r13                                    // |  2        x     ^   |  0                  |  0        |
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
    .asciz  "aeiouAEIOU"                            // |                     |                     |           |
    .size   .L.str, 11                              // |                     |                     |           |
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
