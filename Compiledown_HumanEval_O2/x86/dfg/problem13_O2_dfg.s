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
    testl   %esi, %esi                              // |  2     v  :         |  0                  |  6 ^^^^^^ |
    jle .LBB0_1                                     // |  1        :         |  0                  |  3  vvv   |
    movq    %rdi, %r14                              // |  3      v :      ^  |  0                  |  0        |
    movl    %esi, %r12d                             // |  4     v  :    ^ :  |  0                  |  0        |
    xorl    %ebx, %ebx                              // |  4  ^     :    : :  |  0                  |  5 ^^^^^  |
    leaq    .L.str(%rip), %r13                      // |  5  :     :    :^:  |  0                  |  0        |
    xorl    %ebp, %ebp                              // |  5  :    ^:    : :  |  0                  |  5 ^^^^^  |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_4:                                            // |                     |                     |           |
    movq    (%r14,%rbx,8), %r15                     // |  6  v    ::    : v^ |  0                  |  0        |
    movq    %r15, %rdi                              // |  6  :   ^::    :  v |  0                  |  0        |
    callq   strlen@PLT                              // |  5  :    :x    :  : |  0                  |  0        |
    cmpl    %eax, %ebp                              // |  6 v:    v:    :  : |  0                  |  6 ^^^^^^ |
    cmovgl  %ebp, %eax                              // |  6 ^:    v:    :  : |  0                  |  0        |
    cmovlq  %r15, %r13                              // |  6 ::     :    :^ v |  0                  |  0        |
    incq    %rbx                                    // |  4 :x     :    :    |  0                  |  5  ^^^^^ |
    movl    %eax, %ebp                              // |  5 v:    ^:    :    |  0                  |  0        |
    cmpq    %rbx, %r12                              // |  3  v     :    v    |  0                  |  6 ^^^^^^ |
    jne .LBB0_4                                     // |  1        :         |  0                  |  1  v     |
    jmp .LBB0_2                                     // |  1        :         |  0                  |  0        |
.LBB0_1:                                            // |                     |                     |           |
    leaq    .L.str(%rip), %r13                      // |  2        :     ^   |  0                  |  0        |
.LBB0_2:                                            // |                     |                     |           |
    movq    %r13, %rax                              // |  3 ^      :     v   |  0                  |  0        |
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
    .zero   1                                       // |                     |                     |           |
    .size   .L.str, 1                               // |                     |                     |           |
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
