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
    pushq   %rbx                                    // |  2  v     x         |  0                  |  0        |
    .cfi_def_cfa_offset 40                          // |                     |                     |           |
    pushq   %rax                                    // |  2 v      x         |  0                  |  0        |
    .cfi_def_cfa_offset 48                          // |                     |                     |           |
    .cfi_offset %rbx, -40                           // |                     |                     |           |
    .cfi_offset %r14, -32                           // |                     |                     |           |
    .cfi_offset %r15, -24                           // |                     |                     |           |
    .cfi_offset %rbp, -16                           // |                     |                     |           |
    movq    %rdi, %r15                              // |  3      v :       ^ |  0                  |  0        |
    movzbl  (%rdi), %ebp                            // |  4      v^:       : |  0                  |  0        |
    testb   %bpl, %bpl                              // |  3       v:       : |  0                  |  6 ^^^^^^ |
    je  .LBB0_5                                     // |  2        :       : |  0                  |  1  v     |
    leaq    1(%r15), %rbx                           // |  3  ^     :       v |  0                  |  0        |
    leaq    .L.str(%rip), %r14                      // |  4  :     :      ^: |  0                  |  0        |
    jmp .LBB0_2                                     // |  4  :     :      :: |  0                  |  0        |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_4:                                            // |                     |                     |           |
    movzbl  (%rbx), %ebp                            // |  5  v    ^:      :: |  0                  |  0        |
    incq    %rbx                                    // |  5  x    ::      :: |  0                  |  5  ^^^^^ |
    testb   %bpl, %bpl                              // |  4       v:      :: |  0                  |  6 ^^^^^^ |
    je  .LBB0_5                                     // |  4       ::      :: |  0                  |  1  v     |
.LBB0_2:                                            // |                     |                     |           |
    movsbl  %bpl, %esi                              // |  5     ^ v:      :: |  0                  |  0        |
    movl    $11, %edx                               // |  5    ^  ::      :: |  0                  |  0        |
    movq    %r14, %rdi                              // |  5      ^::      v: |  0                  |  0        |
    callq   memchr@PLT                              // |  3       :x       : |  0                  |  0        |
    testq   %rax, %rax                              // |  4 v     ::       : |  0                  |  6 ^^^^^^ |
    jne .LBB0_4                                     // |  3       ::       : |  0                  |  1  v     |
    movb    %bpl, (%r15)                            // |  3       v:       v |  0                  |  0        |
    incq    %r15                                    // |  2        :       x |  0                  |  5  ^^^^^ |
    jmp .LBB0_4                                     // |  2        :       : |  0                  |  0        |
.LBB0_5:                                            // |                     |                     |           |
    movb    $0, (%r15)                              // |  2        :       v |  0                  |  0        |
    addq    $8, %rsp                                // |  1        x         |  0                  |  6 ^^^^^^ |
    .cfi_def_cfa_offset 40                          // |                     |                     |           |
    popq    %rbx                                    // |  2  ^     x         |  0                  |  0        |
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
    .asciz  "AEIOUaeiou"                            // |                     |                     |           |
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
