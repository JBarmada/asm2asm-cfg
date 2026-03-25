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
    movq    %rsi, %r14                            // |  3     v  :      ^  |  0                  |  0        |
    movzbl  (%rdi), %r15d                         // |  4      v :      :^ |  0                  |  0        |
    testb   %r15b, %r15b                          // |  3        :      :v |  0                  |  6 ^^^^^^ |
    je  .LBB0_1                                   // |  3        :      :: |  0                  |  1  v     |
    movq    %rdi, %r13                            // |  5      v :     ^:: |  0                  |  0        |
    xorl    %ebp, %ebp                            // |  5       ^:     ::: |  0                  |  5 ^^^^^  |
    callq   __ctype_b_loc@PLT                     // |  5       :x     ::: |  0                  |  0        |
    movq    %rax, %r12                            // |  7 v     ::    ^::: |  0                  |  0        |
.LBB0_3:                                          // |                     |                     |           |
    movq    (%r12), %rax                          // |  7 ^     ::    v::: |  0                  |  0        |
    movq    %r13, %rbx                            // |  7 :^    ::     v:: |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_4:                                          // |                     |                     |           |
    movsbq  %r15b, %rcx                           // |  7 ::^   ::      :v |  0                  |  0        |
    testb   $8, 1(%rax,%rcx,2)                    // |  7 v:v   ::      :: |  0                  |  6 ^^^^^^ |
    jne .LBB0_7                                   // |  6 ::    ::      :: |  0                  |  1  v     |
    cmpb    $45, %r15b                            // |  6 ::    ::      :v |  0                  |  6 ^^^^^^ |
    je  .LBB0_7                                   // |  5 ::    ::      :  |  0                  |  1  v     |
    movzbl  1(%rbx), %r15d                        // |  6 :v    ::      :^ |  0                  |  0        |
    incq    %rbx                                  // |  6 :x    ::      :: |  0                  |  5  ^^^^^ |
    testb   %r15b, %r15b                          // |  6 ::    ::      :v |  0                  |  6 ^^^^^^ |
    jne .LBB0_4                                   // |  5 ::    ::      :  |  0                  |  1  v     |
    jmp .LBB0_16                                  // |  5 ::    ::      :  |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_7:                                          // |                     |                     |           |
    movq    %rbx, %rdi                            // |  6 :v   ^::      :  |  0                  |  0        |
    movq    %rsp, %rsi                            // |  6 ::  ^ :v      :  |  0                  |  0        |
    movl    $10, %edx                             // |  6 :: ^  ::      :  |  0                  |  0        |
    callq   strtol@PLT                            // |  5 ::    :x      :  |  0                  |  0        |
    movq    (%rsp), %r13                          // |  6 ::    :v     ^:  |  0                  |  0        |
    cmpq    %r13, %rbx                            // |  6 :v    ::     v:  |  0                  |  6 ^^^^^^ |
    je  .LBB0_11                                  // |  5 :     ::     ::  |  0                  |  1  v     |
    movzbl  (%r13), %ecx                          // |  6 : ^   ::     v:  |  0                  |  0        |
    cmpl    $44, %ecx                             // |  6 : v   ::     ::  |  0                  |  6 ^^^^^^ |
    je  .LBB0_10                                  // |  6 : :   ::     ::  |  0                  |  1  v     |
    testl   %ecx, %ecx                            // |  6 : v   ::     ::  |  0                  |  6 ^^^^^^ |
    jne .LBB0_11                                  // |  5 :     ::     ::  |  0                  |  1  v     |
.LBB0_10:                                         // |                     |                     |           |
    movslq  %ebp, %rcx                            // |  6 : ^   v:     ::  |  0                  |  0        |
    incl    %ebp                                  // |  6 : :   x:     ::  |  0                  |  5  ^^^^^ |
    leaq    func0.out(%rip), %rdx                 // |  6 : :^   :     ::  |  0                  |  0        |
    movl    %eax, (%rdx,%rcx,4)                   // |  6 v vv   :     ::  |  0                  |  0        |
    movzbl  (%r13), %r15d                         // |  4        :     v:^ |  0                  |  0        |
    testb   %r15b, %r15b                          // |  4        :     ::v |  0                  |  6 ^^^^^^ |
    jne .LBB0_3                                   // |  3        :     ::  |  0                  |  1  v     |
    jmp .LBB0_16                                  // |  3        :     ::  |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_13:                                         // |                     |                     |           |
    incq    %r13                                  // |  3        :     x:  |  0                  |  5  ^^^^^ |
.LBB0_11:                                         // |                     |                     |           |
    movzbl  (%r13), %r15d                         // |  4        :     v:^ |  0                  |  0        |
    testl   %r15d, %r15d                          // |  4        :     ::v |  0                  |  6 ^^^^^^ |
    je  .LBB0_14                                  // |  4        :     ::: |  0                  |  1  v     |
    cmpl    $44, %r15d                            // |  4        :     ::v |  0                  |  6 ^^^^^^ |
    jne .LBB0_13                                  // |  4        :     ::: |  0                  |  1  v     |
.LBB0_14:                                         // |                     |                     |           |
    movq    %r13, (%rsp)                          // |  4        v     v:: |  0                  |  0        |
    testb   %r15b, %r15b                          // |  3        :      :v |  0                  |  6 ^^^^^^ |
    jne .LBB0_3                                   // |  2        :      :  |  0                  |  1  v     |
    jmp .LBB0_16                                  // |  2        :      :  |  0                  |  0        |
.LBB0_1:                                          // |                     |                     |           |
    xorl    %ebp, %ebp                            // |  3       ^:      :  |  0                  |  5 ^^^^^  |
.LBB0_16:                                         // |                     |                     |           |
    movl    %ebp, (%r14)                          // |  3       v:      v  |  0                  |  0        |
    leaq    func0.out(%rip), %rax                 // |  2 ^      :         |  0                  |  0        |
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
    .type   func0.out,@object                     // |                     |                     |           |
    .local  func0.out                             // |                     |                     |           |
    .comm   func0.out,1024,16                     // |                     |                     |           |
    .ident  "clang version 15.0.4"                // |                     |                     |           |
    .section    ".note.GNU-stack","",@progbits    // |                     |                     |           |
    .addrsig                                      // |                     |                     |           |
    .addrsig_sym func0.out                        // |                     |                     |           |
                                                  // +.....................+.....................+...........+
                                                  // Legend:
                                                  //     ^       : Register assignment (write)
                                                  //     v       : Register usage (read)
                                                  //     x       : Register usage and reassignment (R/W)
                                                  //     :       : Register in use (live)
                                                  //     <space> : Register not in use
                                                  //     #       : Number of occupied registers
