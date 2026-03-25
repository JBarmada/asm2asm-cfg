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
    movb    $0, (%rsi)                              // |  2     v  :         |  0                  |  0        |
    testl   %edi, %edi                              // |  2      v :         |  0                  |  6 ^^^^^^ |
    jle .LBB0_6                                     // |  1        :         |  0                  |  3  vvv   |
    movq    %rsi, %r14                              // |  3     v  :      ^  |  0                  |  0        |
    movl    %edi, %ebp                              // |  4      v^:      :  |  0                  |  0        |
    xorl    %eax, %eax                              // |  4 ^     ::      :  |  0                  |  5 ^^^^^  |
    leaq    .Lreltable.func0(%rip), %r12            // |  4       ::    ^ :  |  0                  |  0        |
    jmp .LBB0_2                                     // |  4       ::    : :  |  0                  |  0        |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_5:                                            // |                     |                     |           |
    xorl    %eax, %eax                              // |  5 ^     ::    : :  |  0                  |  5 ^^^^^  |
    testl   %ebp, %ebp                              // |  5 :     v:    : :  |  0                  |  6 ^^^^^^ |
    setg    %al                                     // |  5 x     ::    : :  |  0                  |  3  vvv   |
    addl    %r13d, %eax                             // |  6 x     ::    :v:  |  0                  |  6 ^^^^^^ |
    testl   %ebp, %ebp                              // |  5 :     v:    : :  |  0                  |  6 ^^^^^^ |
    jle .LBB0_6                                     // |  5 :     ::    : :  |  0                  |  3  vvv   |
.LBB0_2:                                            // |                     |                     |           |
    movl    %eax, %r13d                             // |  6 v     ::    :^:  |  0                  |  0        |
    leaq    .L__const.func0.num(%rip), %rax         // |  6 ^     ::    :::  |  0                  |  0        |
    movl    (%rax,%r13,4), %r15d                    // |  7 v     ::    :v:^ |  0                  |  0        |
    cmpl    %r15d, %ebp                             // |  6       v:    :::v |  0                  |  6 ^^^^^^ |
    jl  .LBB0_5                                     // |  6       ::    :::: |  0                  |  2   vv   |
    movslq  (%r12,%r13,4), %rbx                     // |  7  ^    ::    vv:: |  0                  |  0        |
    addq    %r12, %rbx                              // |  6  x    ::    v :: |  0                  |  6 ^^^^^^ |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_4:                                            // |                     |                     |           |
    movq    %r14, %rdi                              // |  6  :   ^::      v: |  0                  |  0        |
    movq    %rbx, %rsi                              // |  5  v  ^ ::       : |  0                  |  0        |
    callq   strcat@PLT                              // |  3       :x       : |  0                  |  0        |
    subl    %r15d, %ebp                             // |  3       x:       v |  0                  |  6 ^^^^^^ |
    cmpl    %r15d, %ebp                             // |  3       v:       v |  0                  |  6 ^^^^^^ |
    jge .LBB0_4                                     // |  1        :         |  0                  |  2   vv   |
    jmp .LBB0_5                                     // |  1        :         |  0                  |  0        |
.LBB0_6:                                            // |                     |                     |           |
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
    .asciz  "m"                                     // |                     |                     |           |
    .size   .L.str, 2                               // |                     |                     |           |
    .type   .L.str.1,@object                        // |                     |                     |           |
.L.str.1:                                           // |                     |                     |           |
    .asciz  "cm"                                    // |                     |                     |           |
    .size   .L.str.1, 3                             // |                     |                     |           |
    .type   .L.str.2,@object                        // |                     |                     |           |
.L.str.2:                                           // |                     |                     |           |
    .asciz  "d"                                     // |                     |                     |           |
    .size   .L.str.2, 2                             // |                     |                     |           |
    .type   .L.str.3,@object                        // |                     |                     |           |
.L.str.3:                                           // |                     |                     |           |
    .asciz  "cd"                                    // |                     |                     |           |
    .size   .L.str.3, 3                             // |                     |                     |           |
    .type   .L.str.4,@object                        // |                     |                     |           |
.L.str.4:                                           // |                     |                     |           |
    .asciz  "c"                                     // |                     |                     |           |
    .size   .L.str.4, 2                             // |                     |                     |           |
    .type   .L.str.5,@object                        // |                     |                     |           |
.L.str.5:                                           // |                     |                     |           |
    .asciz  "xc"                                    // |                     |                     |           |
    .size   .L.str.5, 3                             // |                     |                     |           |
    .type   .L.str.6,@object                        // |                     |                     |           |
.L.str.6:                                           // |                     |                     |           |
    .asciz  "l"                                     // |                     |                     |           |
    .size   .L.str.6, 2                             // |                     |                     |           |
    .type   .L.str.7,@object                        // |                     |                     |           |
.L.str.7:                                           // |                     |                     |           |
    .asciz  "xl"                                    // |                     |                     |           |
    .size   .L.str.7, 3                             // |                     |                     |           |
    .type   .L.str.8,@object                        // |                     |                     |           |
.L.str.8:                                           // |                     |                     |           |
    .asciz  "x"                                     // |                     |                     |           |
    .size   .L.str.8, 2                             // |                     |                     |           |
    .type   .L.str.9,@object                        // |                     |                     |           |
.L.str.9:                                           // |                     |                     |           |
    .asciz  "ix"                                    // |                     |                     |           |
    .size   .L.str.9, 3                             // |                     |                     |           |
    .type   .L.str.10,@object                       // |                     |                     |           |
.L.str.10:                                          // |                     |                     |           |
    .asciz  "v"                                     // |                     |                     |           |
    .size   .L.str.10, 2                            // |                     |                     |           |
    .type   .L.str.11,@object                       // |                     |                     |           |
.L.str.11:                                          // |                     |                     |           |
    .asciz  "iv"                                    // |                     |                     |           |
    .size   .L.str.11, 3                            // |                     |                     |           |
    .type   .L.str.12,@object                       // |                     |                     |           |
.L.str.12:                                          // |                     |                     |           |
    .asciz  "i"                                     // |                     |                     |           |
    .size   .L.str.12, 2                            // |                     |                     |           |
    .type   .Lreltable.func0,@object                // |                     |                     |           |
    .section    .rodata,"a",@progbits               // |                     |                     |           |
    .p2align    2                                   // |                     |                     |           |
.Lreltable.func0:                                   // |                     |                     |           |
    .long   .L.str-.Lreltable.func0                 // |                     |                     |           |
    .long   .L.str.1-.Lreltable.func0               // |                     |                     |           |
    .long   .L.str.2-.Lreltable.func0               // |                     |                     |           |
    .long   .L.str.3-.Lreltable.func0               // |                     |                     |           |
    .long   .L.str.4-.Lreltable.func0               // |                     |                     |           |
    .long   .L.str.5-.Lreltable.func0               // |                     |                     |           |
    .long   .L.str.6-.Lreltable.func0               // |                     |                     |           |
    .long   .L.str.7-.Lreltable.func0               // |                     |                     |           |
    .long   .L.str.8-.Lreltable.func0               // |                     |                     |           |
    .long   .L.str.9-.Lreltable.func0               // |                     |                     |           |
    .long   .L.str.10-.Lreltable.func0              // |                     |                     |           |
    .long   .L.str.11-.Lreltable.func0              // |                     |                     |           |
    .long   .L.str.12-.Lreltable.func0              // |                     |                     |           |
    .size   .Lreltable.func0, 52                    // |                     |                     |           |
    .type   .L__const.func0.num,@object             // |                     |                     |           |
    .p2align    4                                   // |                     |                     |           |
.L__const.func0.num:                                // |                     |                     |           |
    .long   1000                                    // |                     |                     |           |
    .long   900                                     // |                     |                     |           |
    .long   500                                     // |                     |                     |           |
    .long   400                                     // |                     |                     |           |
    .long   100                                     // |                     |                     |           |
    .long   90                                      // |                     |                     |           |
    .long   50                                      // |                     |                     |           |
    .long   40                                      // |                     |                     |           |
    .long   10                                      // |                     |                     |           |
    .long   9                                       // |                     |                     |           |
    .long   5                                       // |                     |                     |           |
    .long   4                                       // |                     |                     |           |
    .long   1                                       // |                     |                     |           |
    .size   .L__const.func0.num, 52                 // |                     |                     |           |
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
