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
    movq    %rdi, %r14                              // |  3      v :      ^  |  0                  |  0        |
    callq   strlen@PLT                              // |  2        x      :  |  0                  |  0        |
    testq   %rax, %rax                              // |  3 v      :      :  |  0                  |  6 ^^^^^^ |
    je  .LBB0_1                                     // |  2        :      :  |  0                  |  1  v     |
    movq    %rax, %r12                              // |  4 v      :    ^ :  |  0                  |  0        |
    xorl    %ebx, %ebx                              // |  4  ^     :    : :  |  0                  |  5 ^^^^^  |
    leaq    .L.str(%rip), %r15                      // |  5  :     :    : :^ |  0                  |  0        |
    xorl    %ebp, %ebp                              // |  6  :    ^:    : :: |  0                  |  5 ^^^^^  |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_4:                                            // |                     |                     |           |
    movsbl  (%r14,%rbx), %esi                       // |  6  v  ^  :    : v: |  0                  |  0        |
    movl    $7, %edx                                // |  5  : ^   :    :  : |  0                  |  0        |
    movq    %r15, %rdi                              // |  5  :   ^ :    :  v |  0                  |  0        |
    callq   memchr@PLT                              // |  3  :     x    :    |  0                  |  0        |
    cmpq    $1, %rax                                // |  4 v:     :    :    |  0                  |  6 ^^^^^^ |
    sbbl    $-1, %ebp                               // |  4  :    ^:    :    |  0                  |  6 ^^^^^^ |
    incq    %rbx                                    // |  3  x     :    :    |  0                  |  5  ^^^^^ |
    cmpq    %rbx, %r12                              // |  3  v     :    v    |  0                  |  6 ^^^^^^ |
    jne .LBB0_4                                     // |  1        :         |  0                  |  1  v     |
    jmp .LBB0_2                                     // |  1        :         |  0                  |  0        |
.LBB0_1:                                            // |                     |                     |           |
    xorl    %ebp, %ebp                              // |  2       ^:         |  0                  |  5 ^^^^^  |
.LBB0_2:                                            // |                     |                     |           |
    movl    %ebp, %eax                              // |  3 ^     v:         |  0                  |  0        |
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
    .asciz  "2357BD"                                // |                     |                     |           |
    .size   .L.str, 7                               // |                     |                     |           |
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
