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
    subq    $40, %rsp                               // |  1        x         |  0                  |  6 ^^^^^^ |
    .cfi_def_cfa_offset 96                          // |                     |                     |           |
    .cfi_offset %rbx, -56                           // |                     |                     |           |
    .cfi_offset %r12, -48                           // |                     |                     |           |
    .cfi_offset %r13, -40                           // |                     |                     |           |
    .cfi_offset %r14, -32                           // |                     |                     |           |
    .cfi_offset %r15, -24                           // |                     |                     |           |
    .cfi_offset %rbp, -16                           // |                     |                     |           |
    movq    %rsi, 32(%rsp)                          // |  2     v  v         |  0                  |  0        |
    movq    %rdi, %rbx                              // |  3  ^   v :         |  0                  |  0        |
    movb    $0, 14(%rsp)                            // |  2  :     v         |  0                  |  0        |
    movw    $0, 12(%rsp)                            // |  2  :     v         |  0                  |  0        |
    callq   strlen@PLT                              // |  2  :     x         |  0                  |  0        |
    movq    %rax, %rbp                              // |  4 v:    ^:         |  0                  |  0        |
    addl    $2, %eax                                // |  4 x:    ::         |  0                  |  6 ^^^^^^ |
    movslq  %eax, %rdi                              // |  5 v:   ^::         |  0                  |  0        |
    callq   malloc@PLT                              // |  4 ::    :x         |  0                  |  0        |
    movq    %rax, %rdi                              // |  5 v:   ^::         |  0                  |  0        |
    movq    %rbx, %rsi                              // |  5 :v  ^ ::         |  0                  |  0        |
    movq    %rax, %rbx                              // |  4 v^    ::         |  0                  |  0        |
    callq   strcpy@PLT                              // |  4 ::    :x         |  0                  |  0        |
    movq    %rbx, %rdi                              // |  5 :v   ^::         |  0                  |  0        |
    callq   strlen@PLT                              // |  4 ::    :x         |  0                  |  0        |
    movq    %rbp, %rdx                              // |  5 :: ^  v:         |  0                  |  0        |
    movw    $32, (%rbx,%rax)                        // |  4 vv :   :         |  0                  |  0        |
    cmpl    $2147483646, %edx                       // |  3  : v   :         |  0                  |  6 ^^^^^^ |
    ja  .LBB0_1                                     // |  3  : :   :         |  0                  |  2 vv     |
    incl    %edx                                    // |  3  : x   :         |  0                  |  5  ^^^^^ |
    xorl    %r14d, %r14d                            // |  4  : :   :      ^  |  0                  |  5 ^^^^^  |
    xorl    %r13d, %r13d                            // |  5  : :   :     ^:  |  0                  |  5 ^^^^^  |
    xorl    %ebp, %ebp                              // |  6  : :  ^:     ::  |  0                  |  5 ^^^^^  |
    xorl    %r12d, %r12d                            // |  7  : :  ::    ^::  |  0                  |  5 ^^^^^  |
    movq    %rbx, 24(%rsp)                          // |  7  v :  :v    :::  |  0                  |  0        |
    movq    %rdx, 16(%rsp)                          // |  7  : v  :v    :::  |  0                  |  0        |
    jmp .LBB0_4                                     // |  7  : :  ::    :::  |  0                  |  0        |
.LBB0_16:                                           // |                     |                     |           |
    movslq  %ebp, %rax                              // |  8 ^: :  v:    :::  |  0                  |  0        |
    incl    %ebp                                    // |  8 :: :  x:    :::  |  0                  |  5  ^^^^^ |
    movl    $1, (%r13,%rax,4)                       // |  8 v: :  ::    :v:  |  0                  |  0        |
.LBB0_17:                                           // |                     |                     |           |
    movb    $0, 12(%rsp)                            // |  7  : :  :v    :::  |  0                  |  0        |
.LBB0_21:                                           // |                     |                     |           |
    incq    %r14                                    // |  7  : :  ::    ::x  |  0                  |  5  ^^^^^ |
    cmpq    %r14, %rdx                              // |  7  : v  ::    ::v  |  0                  |  6 ^^^^^^ |
    je  .LBB0_2                                     // |  6  :    ::    :::  |  0                  |  1  v     |
.LBB0_4:                                            // |                     |                     |           |
    movzbl  (%rbx,%r14), %r15d                      // |  7  v    ::    ::v^ |  0                  |  0        |
    cmpb    $32, %r15b                              // |  5       ::    :: v |  0                  |  6 ^^^^^^ |
    jne .LBB0_18                                    // |  5       ::    :: : |  0                  |  1  v     |
    cmpw    $111, 12(%rsp)                          // |  5       :v    :: : |  0                  |  6 ^^^^^^ |
    jne .LBB0_9                                     // |  5       ::    :: : |  0                  |  1  v     |
    cmpl    %r12d, %ebp                             // |  5       v:    v: : |  0                  |  6 ^^^^^^ |
    jne .LBB0_8                                     // |  4       ::     : : |  0                  |  1  v     |
    leal    (%rbp,%rbp), %r12d                      // |  5       v:    ^: : |  0                  |  0        |
    testl   %ebp, %ebp                              // |  4       v:     : : |  0                  |  6 ^^^^^^ |
    movl    $4, %eax                                // |  5 ^     ::     : : |  0                  |  0        |
    cmovlel %eax, %r12d                             // |  6 v     ::    ^: : |  0                  |  0        |
    movslq  %r12d, %rsi                             // |  7 :   ^ ::    v: : |  0                  |  0        |
    shlq    $2, %rsi                                // |  7 :   x ::    :: : |  0                  |  5 ^^^^^  |
    movq    %r13, %rdi                              // |  7 :    ^::    :v : |  0                  |  0        |
    callq   realloc@PLT                             // |  5 :     :x    :  : |  0                  |  0        |
    movq    16(%rsp), %rdx                          // |  6 :  ^  :v    :  : |  0                  |  0        |
    movq    %rax, %r13                              // |  6 v     ::    :^ : |  0                  |  0        |
.LBB0_8:                                            // |                     |                     |           |
    movslq  %ebp, %rax                              // |  6 ^     v:    :: : |  0                  |  0        |
    incl    %ebp                                    // |  6 :     x:    :: : |  0                  |  5  ^^^^^ |
    movl    $4, (%r13,%rax,4)                       // |  6 v     ::    :v : |  0                  |  0        |
.LBB0_9:                                            // |                     |                     |           |
    movzwl  12(%rsp), %eax                          // |  6 ^     :v    :: : |  0                  |  0        |
    xorl    $31855, %eax                            // |  6 ^     ::    :: : |  0                  |  5 ^^^^^  |
    movzbl  14(%rsp), %ecx                          // |  7 : ^   :v    :: : |  0                  |  0        |
    orw %ax, %cx                                    // |  7 v x   ::    :: : |  0                  |  5 ^^^^^  |
    jne .LBB0_13                                    // |  5       ::    :: : |  0                  |  1  v     |
    cmpl    %r12d, %ebp                             // |  5       v:    v: : |  0                  |  6 ^^^^^^ |
    jne .LBB0_12                                    // |  5       ::    :: : |  0                  |  1  v     |
    leal    (%r12,%r12), %ebx                       // |  6  ^    ::    v: : |  0                  |  0        |
    testl   %r12d, %r12d                            // |  5       ::    v: : |  0                  |  6 ^^^^^^ |
    movl    $4, %eax                                // |  5 ^     ::     : : |  0                  |  0        |
    cmovlel %eax, %ebx                              // |  6 v^    ::     : : |  0                  |  0        |
    movslq  %ebx, %rsi                              // |  7 :v  ^ ::     : : |  0                  |  0        |
    shlq    $2, %rsi                                // |  7 ::  x ::     : : |  0                  |  5 ^^^^^  |
    movq    %r13, %rdi                              // |  7 ::   ^::     v : |  0                  |  0        |
    callq   realloc@PLT                             // |  5 ::    :x       : |  0                  |  0        |
    movq    16(%rsp), %rdx                          // |  6 :: ^  :v       : |  0                  |  0        |
    movq    %rax, %r13                              // |  6 v:    ::     ^ : |  0                  |  0        |
    movl    %ebx, %r12d                             // |  6  v    ::    ^: : |  0                  |  0        |
    movq    24(%rsp), %rbx                          // |  6  ^    :v    :: : |  0                  |  0        |
.LBB0_12:                                           // |                     |                     |           |
    movslq  %ebp, %rax                              // |  6 ^     v:    :: : |  0                  |  0        |
    incl    %ebp                                    // |  6 :     x:    :: : |  0                  |  5  ^^^^^ |
    movl    $2, (%r13,%rax,4)                       // |  6 v     ::    :v : |  0                  |  0        |
.LBB0_13:                                           // |                     |                     |           |
    movzwl  12(%rsp), %eax                          // |  6 ^     :v    :: : |  0                  |  0        |
    xorl    $31790, %eax                            // |  6 ^     ::    :: : |  0                  |  5 ^^^^^  |
    movzbl  14(%rsp), %ecx                          // |  7 : ^   :v    :: : |  0                  |  0        |
    orw %ax, %cx                                    // |  7 v x   ::    :: : |  0                  |  5 ^^^^^  |
    jne .LBB0_17                                    // |  5       ::    :: : |  0                  |  1  v     |
    cmpl    %r12d, %ebp                             // |  5       v:    v: : |  0                  |  6 ^^^^^^ |
    jne .LBB0_16                                    // |  4        :    :: : |  0                  |  1  v     |
    leal    (%r12,%r12), %ebx                       // |  5  ^     :    v: : |  0                  |  0        |
    testl   %r12d, %r12d                            // |  4        :    v: : |  0                  |  6 ^^^^^^ |
    movl    $4, %eax                                // |  4 ^      :     : : |  0                  |  0        |
    cmovlel %eax, %ebx                              // |  5 v^     :     : : |  0                  |  0        |
    movslq  %ebx, %rsi                              // |  6 :v  ^  :     : : |  0                  |  0        |
    shlq    $2, %rsi                                // |  6 ::  x  :     : : |  0                  |  5 ^^^^^  |
    movq    %r13, %rdi                              // |  6 ::   ^ :     v : |  0                  |  0        |
    callq   realloc@PLT                             // |  4 ::     x       : |  0                  |  0        |
    movq    16(%rsp), %rdx                          // |  5 :: ^   v       : |  0                  |  0        |
    movq    %rax, %r13                              // |  5 v:     :     ^ : |  0                  |  0        |
    movl    %ebx, %r12d                             // |  5 :v     :    ^  : |  0                  |  0        |
    movq    24(%rsp), %rbx                          // |  4 :^     v       : |  0                  |  0        |
    jmp .LBB0_16                                    // |  4 ::     :       : |  0                  |  0        |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_18:                                           // |                     |                     |           |
    leaq    12(%rsp), %rdi                          // |  5 ::   ^ v       : |  0                  |  0        |
    callq   strlen@PLT                              // |  4 ::     x       : |  0                  |  0        |
    cmpq    $1, %rax                                // |  4 v:     :       : |  0                  |  6 ^^^^^^ |
    ja  .LBB0_20                                    // |  4 ::     :       : |  0                  |  2 vv     |
    movb    %r15b, 12(%rsp,%rax)                    // |  4 v:     v       v |  0                  |  0        |
    movb    $0, 13(%rsp,%rax)                       // |  3 v:     v         |  0                  |  0        |
.LBB0_20:                                           // |                     |                     |           |
    movq    16(%rsp), %rdx                          // |  3  : ^   v         |  0                  |  0        |
    jmp .LBB0_21                                    // |  2  :     :         |  0                  |  0        |
.LBB0_1:                                            // |                     |                     |           |
    xorl    %ebp, %ebp                              // |  3  :    ^:         |  0                  |  5 ^^^^^  |
    xorl    %r13d, %r13d                            // |  4  :    ::     ^   |  0                  |  5 ^^^^^  |
.LBB0_2:                                            // |                     |                     |           |
    movq    %rbx, %rdi                              // |  5  v   ^::     :   |  0                  |  0        |
    callq   free@PLT                                // |  3       :x     :   |  0                  |  0        |
    movq    32(%rsp), %rax                          // |  4 ^     :v     :   |  0                  |  0        |
    movl    %ebp, (%rax)                            // |  4 v     v:     :   |  0                  |  0        |
    movq    %r13, %rax                              // |  3 ^      :     v   |  0                  |  0        |
    addq    $40, %rsp                               // |  1        x         |  0                  |  6 ^^^^^^ |
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
    .type   .L.str.1,@object                        // |                     |                     |           |
    .section    .rodata.str1.1,"aMS",@progbits,1    // |                     |                     |           |
.L.str.1:                                           // |                     |                     |           |
    .asciz  "o"                                     // |                     |                     |           |
    .size   .L.str.1, 2                             // |                     |                     |           |
    .type   .L.str.2,@object                        // |                     |                     |           |
.L.str.2:                                           // |                     |                     |           |
    .asciz  "o|"                                    // |                     |                     |           |
    .size   .L.str.2, 3                             // |                     |                     |           |
    .type   .L.str.3,@object                        // |                     |                     |           |
.L.str.3:                                           // |                     |                     |           |
    .asciz  ".|"                                    // |                     |                     |           |
    .size   .L.str.3, 3                             // |                     |                     |           |
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
