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
    pushq   %rax                                    // |  2 v      x         |  0                  |  0        |
    .cfi_def_cfa_offset 64                          // |                     |                     |           |
    .cfi_offset %rbx, -56                           // |                     |                     |           |
    .cfi_offset %r12, -48                           // |                     |                     |           |
    .cfi_offset %r13, -40                           // |                     |                     |           |
    .cfi_offset %r14, -32                           // |                     |                     |           |
    .cfi_offset %r15, -24                           // |                     |                     |           |
    .cfi_offset %rbp, -16                           // |                     |                     |           |
    movq    %rdi, %r14                              // |  3      v :      ^  |  0                  |  0        |
    callq   strlen@PLT                              // |  2        x      :  |  0                  |  0        |
    movq    %rax, %r15                              // |  4 v      :      :^ |  0                  |  0        |
    testl   %r15d, %r15d                            // |  3        :      :v |  0                  |  6 ^^^^^^ |
    jle .LBB0_1                                     // |  3        :      :: |  0                  |  3  vvv   |
    movl    %r15d, %r13d                            // |  4        :     ^:v |  0                  |  0        |
    xorl    %ebp, %ebp                              // |  5       ^:     ::: |  0                  |  5 ^^^^^  |
    leaq    .L.str(%rip), %r12                      // |  6       ::    ^::: |  0                  |  0        |
    xorl    %ebx, %ebx                              // |  7  ^    ::    :::: |  0                  |  5 ^^^^^  |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_7:                                            // |                     |                     |           |
    movsbl  (%r14,%rbp), %esi                       // |  7     ^ v:    ::v: |  0                  |  0        |
    movl    $11, %edx                               // |  7    ^  ::    :::: |  0                  |  0        |
    movq    %r12, %rdi                              // |  7      ^::    v::: |  0                  |  0        |
    callq   memchr@PLT                              // |  5       :x     ::: |  0                  |  0        |
    cmpq    $1, %rax                                // |  6 v     ::     ::: |  0                  |  6 ^^^^^^ |
    sbbl    $-1, %ebx                               // |  6  ^    ::     ::: |  0                  |  6 ^^^^^^ |
    incq    %rbp                                    // |  6  :    x:     ::: |  0                  |  5  ^^^^^ |
    cmpq    %rbp, %r13                              // |  6  :    v:     v:: |  0                  |  6 ^^^^^^ |
    jne .LBB0_7                                     // |  4  :     :      :: |  0                  |  1  v     |
    testl   %r15d, %r15d                            // |  4  :     :      :v |  0                  |  6 ^^^^^^ |
    jle .LBB0_5                                     // |  4  :     :      :: |  0                  |  3  vvv   |
    decl    %r15d                                   // |  4  :     :      :x |  0                  |  5  ^^^^^ |
    movzbl  (%r14,%r15), %eax                       // |  5 ^:     :      vv |  0                  |  0        |
    orl $32, %eax                                   // |  3 x:     :         |  0                  |  5 ^^^^^  |
    cmpl    $121, %eax                              // |  3 v:     :         |  0                  |  6 ^^^^^^ |
    jne .LBB0_5                                     // |  2  :     :         |  0                  |  1  v     |
    incl    %ebx                                    // |  2  x     :         |  0                  |  5  ^^^^^ |
    jmp .LBB0_5                                     // |  1        :         |  0                  |  0        |
.LBB0_1:                                            // |                     |                     |           |
    xorl    %ebx, %ebx                              // |  2  ^     :         |  0                  |  5 ^^^^^  |
.LBB0_5:                                            // |                     |                     |           |
    movl    %ebx, %eax                              // |  3 ^v     :         |  0                  |  0        |
    addq    $8, %rsp                                // |  1        x         |  0                  |  6 ^^^^^^ |
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
