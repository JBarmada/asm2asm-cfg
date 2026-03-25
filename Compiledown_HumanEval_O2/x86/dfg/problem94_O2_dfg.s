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
    movzbl  (%rdi), %ebx                          // |  4  ^   v :      :  |  0                  |  0        |
    testb   %bl, %bl                              // |  3  v     :      :  |  0                  |  6 ^^^^^^ |
    je  .LBB0_1                                   // |  3  :     :      :  |  0                  |  1  v     |
    movq    %rdi, %r15                            // |  5  :   v :      :^ |  0                  |  0        |
    xorl    %ebp, %ebp                            // |  5  :    ^:      :: |  0                  |  5 ^^^^^  |
    callq   __ctype_b_loc@PLT                     // |  5  :    :x      :: |  0                  |  0        |
    movq    %rax, %r12                            // |  7 v:    ::    ^ :: |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_3:                                          // |                     |                     |           |
    movq    (%r12), %rax                          // |  7 ^:    ::    v :: |  0                  |  0        |
    movsbq  %bl, %r13                             // |  6  v    ::     ^:: |  0                  |  0        |
    movzwl  (%rax,%r13,2), %eax                   // |  6 ^     ::     v:: |  0                  |  0        |
    testl   $512, %eax                            // |  6 v     ::     ::: |  0                  |  6 ^^^^^^ |
    jne .LBB0_4                                   // |  6 :     ::     ::: |  0                  |  1  v     |
    testl   $256, %eax                            // |  6 v     ::     ::: |  0                  |  6 ^^^^^^ |
    je  .LBB0_8                                   // |  5       ::     ::: |  0                  |  1  v     |
    callq   __ctype_tolower_loc@PLT               // |  5       :x     ::: |  0                  |  0        |
    jmp .LBB0_7                                   // |  5       ::     ::: |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_4:                                          // |                     |                     |           |
    callq   __ctype_toupper_loc@PLT               // |  5       :x     ::: |  0                  |  0        |
.LBB0_7:                                          // |                     |                     |           |
    movq    (%rax), %rax                          // |  6 ^     ::     ::: |  0                  |  0        |
    movzbl  (%rax,%r13,4), %ebx                   // |  7 v^    ::     v:: |  0                  |  0        |
.LBB0_8:                                          // |                     |                     |           |
    movzbl  %bl, %eax                             // |  6 ^v    ::      :: |  0                  |  0        |
    addl    $-65, %eax                            // |  6 x:    ::      :: |  0                  |  6 ^^^^^^ |
    cmpl    $52, %eax                             // |  6 v:    ::      :: |  0                  |  6 ^^^^^^ |
    ja  .LBB0_11                                  // |  6 ::    ::      :: |  0                  |  2 vv     |
    movabsq $4575140898685201, %rcx               // |  7 ::^   ::      :: |  0                  |  1 :      |
    btq %rax, %rcx                                // |  7 v:^   ::      :: |  0                  |  1 :      |
    jae .LBB0_11                                  // |  5  :    ::      :: |  0                  |  1 v      |
    addb    $2, %bl                               // |  5  x    ::      :: |  0                  |  6 ^^^^^^ |
.LBB0_11:                                         // |                     |                     |           |
    movb    %bl, (%r14,%rbp)                      // |  5  v    v:      v: |  0                  |  0        |
    movzbl  1(%r15,%rbp), %ebx                    // |  5  ^    v:      :v |  0                  |  0        |
    incq    %rbp                                  // |  4  :    x:      :  |  0                  |  5  ^^^^^ |
    testb   %bl, %bl                              // |  4  v    ::      :  |  0                  |  6 ^^^^^^ |
    jne .LBB0_3                                   // |  3       ::      :  |  0                  |  1  v     |
    movl    %ebp, %eax                            // |  4 ^     v:      :  |  0                  |  0        |
    jmp .LBB0_13                                  // |  2        :      :  |  0                  |  0        |
.LBB0_1:                                          // |                     |                     |           |
    xorl    %eax, %eax                            // |  3 ^      :      :  |  0                  |  5 ^^^^^  |
.LBB0_13:                                         // |                     |                     |           |
    movb    $0, (%r14,%rax)                       // |  3 v      :      v  |  0                  |  0        |
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
