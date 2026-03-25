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
    movl    $0, (%rdx)                            // |  2    v   :         |  0                  |  0        |
    testl   %esi, %esi                            // |  2     v  :         |  0                  |  6 ^^^^^^ |
    movq    %rdi, 8(%rsp)                         // |  2      v v         |  0                  |  3  :::   |
    jle .LBB0_1                                   // |  1        :         |  0                  |  3  vvv   |
    movq    %rdx, %r15                            // |  3    v   :       ^ |  0                  |  0        |
    movq    %rdi, %rbx                            // |  4  ^   v :       : |  0                  |  0        |
    movl    %esi, %r12d                           // |  5  :  v  :    ^  : |  0                  |  0        |
    xorl    %r13d, %r13d                          // |  5  :     :    :^ : |  0                  |  5 ^^^^^  |
    xorl    %ebp, %ebp                            // |  5  :    ^:    :  : |  0                  |  5 ^^^^^  |
    jmp .LBB0_10                                  // |  5  :    ::    :  : |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_12:                                         // |                     |                     |           |
    incq    %rbp                                  // |  5  :    x:    :  : |  0                  |  5  ^^^^^ |
    cmpq    %rbp, %r12                            // |  5  :    v:    v  : |  0                  |  6 ^^^^^^ |
    je  .LBB0_2                                   // |  4  :    ::       : |  0                  |  1  v     |
.LBB0_10:                                         // |                     |                     |           |
    movq    (%rbx,%rbp,8), %r14                   // |  5  v    v:      ^: |  0                  |  0        |
    movq    %r14, %rdi                            // |  6  :   ^::      v: |  0                  |  0        |
    callq   strlen@PLT                            // |  5  :    :x      :: |  0                  |  0        |
    testb   $1, %al                               // |  6 v:    ::      :: |  0                  |  6 ^^^^^^ |
    jne .LBB0_12                                  // |  5  :    ::      :: |  0                  |  1  v     |
    movslq  %r13d, %r13                           // |  6  :    ::     ^:: |  0                  |  0        |
    movq    %r14, (%rbx,%r13,8)                   // |  6  v    ::     vv: |  0                  |  0        |
    incl    %r13d                                 // |  5  :    ::     x : |  0                  |  5  ^^^^^ |
    movl    %r13d, (%r15)                         // |  5  :    ::     v v |  0                  |  0        |
    jmp .LBB0_12                                  // |  4  :    ::     :   |  0                  |  0        |
.LBB0_2:                                          // |                     |                     |           |
    cmpl    $2, %r13d                             // |  4  :    ::     v   |  0                  |  6 ^^^^^^ |
    jl  .LBB0_18                                  // |  4  :    ::     :   |  0                  |  2   vv   |
    movq    %r13, 24(%rsp)                        // |  4  :    :v     v   |  0                  |  0        |
    leal    -1(%r13), %eax                        // |  5 ^:    ::     v   |  0                  |  0        |
    xorl    %ecx, %ecx                            // |  5 ::^   ::         |  0                  |  5 ^^^^^  |
    movl    %eax, 20(%rsp)                        // |  4 v:    :v         |  0                  |  0        |
    movl    %eax, %r13d                           // |  5 v:    ::     ^   |  0                  |  0        |
    jmp .LBB0_4                                   // |  4  :    ::     :   |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_16:                                         // |                     |                     |           |
    movq    32(%rsp), %rcx                        // |  5  :^   :v     :   |  0                  |  0        |
    incl    %ecx                                  // |  5  :x   ::     :   |  0                  |  5  ^^^^^ |
    decl    %r13d                                 // |  5  ::   ::     x   |  0                  |  5  ^^^^^ |
    cmpl    20(%rsp), %ecx                        // |  4  :v   :v         |  0                  |  6 ^^^^^^ |
    je  .LBB0_17                                  // |  4  ::   ::         |  0                  |  1  v     |
.LBB0_4:                                          // |                     |                     |           |
    movl    %r13d, %r13d                          // |  5  ::   ::     ^   |  0                  |  0        |
    movq    %rcx, 32(%rsp)                        // |  5  :v   :v     :   |  0                  |  0        |
    movl    %ecx, %eax                            // |  6 ^:v   ::     :   |  0                  |  0        |
    notl    %eax                                  // |  5 x:    ::     :   |  0                  |  0        |
    addl    24(%rsp), %eax                        // |  5 x:    :v     :   |  0                  |  6 ^^^^^^ |
    testl   %eax, %eax                            // |  5 v:    ::     :   |  0                  |  6 ^^^^^^ |
    jle .LBB0_16                                  // |  4  :    ::     :   |  0                  |  3  vvv   |
    movq    (%rbx), %r15                          // |  5  v    ::     : ^ |  0                  |  0        |
    xorl    %r14d, %r14d                          // |  6  :    ::     :^: |  0                  |  5 ^^^^^  |
    jmp .LBB0_6                                   // |  6  :    ::     ::: |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_14:                                         // |                     |                     |           |
    movq    8(%rsp), %rax                         // |  7 ^:    :v     ::: |  0                  |  0        |
    movq    %rbx, (%rax,%rbp,8)                   // |  7 vv    v:     ::: |  0                  |  0        |
    movq    %rax, %rbx                            // |  7 v^    ::     ::: |  0                  |  0        |
    movq    %r15, 8(%rax,%rbp,8)                  // |  6 v     v:     ::v |  0                  |  0        |
    cmpq    %r14, %r13                            // |  5 :      :     vv: |  0                  |  6 ^^^^^^ |
    je  .LBB0_16                                  // |  5 :      :     ::: |  0                  |  1  v     |
.LBB0_6:                                          // |                     |                     |           |
    movq    %r14, %rbp                            // |  6 :     ^:     :v: |  0                  |  0        |
    movq    %r15, %rdi                            // |  7 :    ^::     ::v |  0                  |  0        |
    callq   strlen@PLT                            // |  6 :     :x     ::: |  0                  |  0        |
    movq    %rax, %r12                            // |  7 v     ::    ^::: |  0                  |  0        |
    incq    %r14                                  // |  7 :     ::    ::x: |  0                  |  5  ^^^^^ |
    movq    8(%rbx,%rbp,8), %rbx                  // |  8 :^    v:    :::: |  0                  |  0        |
    movq    %rbx, %rdi                            // |  8 :v   ^ :    :::: |  0                  |  0        |
    callq   strlen@PLT                            // |  7 ::     x    :::: |  0                  |  0        |
    cmpq    %rax, %r12                            // |  7 v:     :    v::: |  0                  |  6 ^^^^^^ |
    ja  .LBB0_14                                  // |  6 ::     :     ::: |  0                  |  2 vv     |
    jne .LBB0_8                                   // |  6 ::     :     ::: |  0                  |  1  v     |
    movq    %r15, %rdi                            // |  7 ::   ^ :     ::v |  0                  |  0        |
    movq    %rbx, %rsi                            // |  6 :v  ^  :     ::  |  0                  |  0        |
    callq   strcmp@PLT                            // |  5 ::     x     ::  |  0                  |  0        |
    testl   %eax, %eax                            // |  5 v:     :     ::  |  0                  |  6 ^^^^^^ |
    jg  .LBB0_14                                  // |  5 ::     :     ::  |  0                  |  3  vvv   |
.LBB0_8:                                          // |                     |                     |           |
    movq    %rbx, %r15                            // |  6 :v     :     ::^ |  0                  |  0        |
    movq    8(%rsp), %rbx                         // |  5 :^     v     ::  |  0                  |  0        |
    cmpq    %r14, %r13                            // |  4 :      :     vv  |  0                  |  6 ^^^^^^ |
    jne .LBB0_6                                   // |  2 :      :         |  0                  |  1  v     |
    jmp .LBB0_16                                  // |  2 :      :         |  0                  |  0        |
.LBB0_1:                                          // |                     |                     |           |
    xorl    %r13d, %r13d                          // |  3 :      :     ^   |  0                  |  5 ^^^^^  |
    jmp .LBB0_18                                  // |  2 :      :         |  0                  |  0        |
.LBB0_17:                                         // |                     |                     |           |
    movq    24(%rsp), %r13                        // |  3 :      v     ^   |  0                  |  0        |
.LBB0_18:                                         // |                     |                     |           |
    movslq  %r13d, %rbp                           // |  4 :     ^:     v   |  0                  |  0        |
    leaq    (,%rbp,8), %rdi                       // |  5 :    ^v:     :   |  0                  |  0        |
    callq   malloc@PLT                            // |  4 :     :x     :   |  0                  |  0        |
    movq    %rax, %rbx                            // |  5 v^    ::     :   |  0                  |  0        |
    testl   %ebp, %ebp                            // |  4  :    v:     :   |  0                  |  6 ^^^^^^ |
    jle .LBB0_20                                  // |  3  :     :     :   |  0                  |  3  vvv   |
    movl    %r13d, %edx                           // |  4  : ^   :     v   |  0                  |  0        |
    shlq    $3, %rdx                              // |  3  : x   :         |  0                  |  5 ^^^^^  |
    movq    %rbx, %rdi                            // |  3  v   ^ :         |  0                  |  0        |
    movq    8(%rsp), %rsi                         // |  3  :  ^  v         |  0                  |  0        |
    callq   memcpy@PLT                            // |  2  :     x         |  0                  |  0        |
.LBB0_20:                                         // |                     |                     |           |
    movq    %rbx, %rax                            // |  3 ^v     :         |  0                  |  0        |
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
