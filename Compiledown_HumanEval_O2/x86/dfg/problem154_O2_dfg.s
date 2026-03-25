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
    pushq   %r14                                    // |  2        x      v  |  0                  |  0        |
    .cfi_def_cfa_offset 24                          // |                     |                     |           |
    pushq   %rbx                                    // |  2  v     x         |  0                  |  0        |
    .cfi_def_cfa_offset 32                          // |                     |                     |           |
    .cfi_offset %rbx, -32                           // |                     |                     |           |
    .cfi_offset %r14, -24                           // |                     |                     |           |
    .cfi_offset %rbp, -16                           // |                     |                     |           |
    movq    %rdi, %r8                               // |  3      v :^        |  0                  |  0        |
    testl   %edx, %edx                              // |  3    v   ::        |  0                  |  6 ^^^^^^ |
    jle .LBB0_1                                     // |  2        ::        |  0                  |  3  vvv   |
    movl    %edx, %r9d                              // |  4    v   ::^       |  0                  |  0        |
    movl    $-1000, %r14d                           // |  4        :::    ^  |  0                  |  0        |
    xorl    %edx, %edx                              // |  5    ^   :::    :  |  0                  |  5 ^^^^^  |
    xorl    %r11d, %r11d                            // |  6    :   ::: ^  :  |  0                  |  5 ^^^^^  |
    jmp .LBB0_4                                     // |  5    :   :::    :  |  0                  |  0        |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_7:                                            // |                     |                     |           |
    cmpl    %r14d, %eax                             // |  6 v  :   :::    v  |  0                  |  6 ^^^^^^ |
    cmovgq  %r10, %r11                              // |  6    :   :::v^     |  0                  |  0        |
    cmovgl  %eax, %r14d                             // |  6 v  :   :::    ^  |  0                  |  0        |
    incq    %rdx                                    // |  4    x   :::       |  0                  |  5  ^^^^^ |
    cmpq    %r9, %rdx                               // |  4    v   ::v       |  0                  |  6 ^^^^^^ |
    je  .LBB0_2                                     // |  3    :   ::        |  0                  |  1  v     |
.LBB0_4:                                            // |                     |                     |           |
    movq    (%rsi,%rdx,8), %r10                     // |  5    vv  :: ^      |  0                  |  0        |
    movzbl  (%r10), %ebx                            // |  4  ^     :: v      |  0                  |  0        |
    movl    $0, %eax                                // |  5 ^:     :: :      |  0                  |  0        |
    testb   %bl, %bl                                // |  4  v     :: :      |  0                  |  6 ^^^^^^ |
    je  .LBB0_7                                     // |  4  :     :: :      |  0                  |  1  v     |
    leaq    1(%r10), %rdi                           // |  5  :   ^ :: v      |  0                  |  0        |
    xorl    %eax, %eax                              // |  5 ^:   : ::        |  0                  |  5 ^^^^^  |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_6:                                            // |                     |                     |           |
    leal    -65(%rbx), %ebp                         // |  5  v   :^::        |  0                  |  0        |
    cmpb    $26, %bpl                               // |  5  :   :v::        |  0                  |  6 ^^^^^^ |
    adcl    $0, %eax                                // |  5 ^:   : ::        |  0                  |  6 ^^^^^^ |
    addb    $-97, %bl                               // |  4  x   : ::        |  0                  |  6 ^^^^^^ |
    cmpb    $26, %bl                                // |  4  v   : ::        |  0                  |  6 ^^^^^^ |
    sbbl    $0, %eax                                // |  4 ^    : ::        |  0                  |  6 ^^^^^^ |
    movzbl  (%rdi), %ebx                            // |  4  ^   v ::        |  0                  |  0        |
    incq    %rdi                                    // |  4  :   x ::        |  0                  |  5  ^^^^^ |
    testb   %bl, %bl                                // |  3  v     ::        |  0                  |  6 ^^^^^^ |
    jne .LBB0_6                                     // |  2        ::        |  0                  |  1  v     |
    jmp .LBB0_7                                     // |  2        ::        |  0                  |  0        |
.LBB0_1:                                            // |                     |                     |           |
    xorl    %r11d, %r11d                            // |  3        ::  ^     |  0                  |  5 ^^^^^  |
.LBB0_2:                                            // |                     |                     |           |
    leaq    .L.str(%rip), %rsi                      // |  4     ^  ::  :     |  0                  |  0        |
    movq    %rcx, %rdi                              // |  5   v  ^ ::  :     |  0                  |  0        |
    movq    %r8, %rdx                               // |  4    ^   :v  :     |  0                  |  0        |
    movq    %r11, %rcx                              // |  3   ^    :   v     |  0                  |  0        |
    xorl    %eax, %eax                              // |  2 ^      :         |  0                  |  5 ^^^^^  |
    popq    %rbx                                    // |  2  ^     x         |  0                  |  0        |
    .cfi_def_cfa_offset 24                          // |                     |                     |           |
    popq    %r14                                    // |  2        x      ^  |  0                  |  0        |
    .cfi_def_cfa_offset 16                          // |                     |                     |           |
    popq    %rbp                                    // |  2       ^x         |  0                  |  0        |
    .cfi_def_cfa_offset 8                           // |                     |                     |           |
    jmp sprintf@PLT                                 // |  0                  |  0                  |  0        |
.Lfunc_end0:                                        // |                     |                     |           |
    .size   func0, .Lfunc_end0-func0                // |                     |                     |           |
    .cfi_endproc                                    // |                     |                     |           |
    .type   .L.str,@object                          // |                     |                     |           |
    .section    .rodata.str1.1,"aMS",@progbits,1    // |                     |                     |           |
.L.str:                                             // |                     |                     |           |
    .asciz  "%s.%s"                                 // |                     |                     |           |
    .size   .L.str, 6                               // |                     |                     |           |
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
