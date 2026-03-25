                                                       // +---------------------+---------------------+-----------+
                                                       // |         GPR         |        VECTOR       |   FLAGS   |
                                                       // |                     |                     |           |
                                                       // |    RRRRRRRRRRRRRRRR |    XXXXXXXXXXXXXXXX |    CZSOPA |
                                                       // |    ABCDSDBS89111111 |    MMMMMMMMMMMMMMMM |    FFFFFF |
                                                       // |    XXXXIIPP  012345 |    MMMMMMMMMMMMMMMM |           |
                                                       // |                     |    0123456789111111 |           |
                                                       // |  #                  |  #           012345 |  #        |
                                                       // +---------------------+---------------------+-----------+
    .text                                              // |                     |                     |           |
    .file   "code.c"                                   // |                     |                     |           |
    .globl  func0                                      // |                     |                     |           |
    .p2align    4, 0x90                                // |                     |                     |           |
    .type   func0,@function                            // |                     |                     |           |
func0:                                                 // |                     |                     |           |
    .cfi_startproc                                     // |                     |                     |           |
    pushq   %rbp                                       // |  2       vx         |  0                  |  0        |
    .cfi_def_cfa_offset 16                             // |                     |                     |           |
    pushq   %r15                                       // |  2        x       v |  0                  |  0        |
    .cfi_def_cfa_offset 24                             // |                     |                     |           |
    pushq   %r14                                       // |  2        x      v  |  0                  |  0        |
    .cfi_def_cfa_offset 32                             // |                     |                     |           |
    pushq   %r13                                       // |  2        x     v   |  0                  |  0        |
    .cfi_def_cfa_offset 40                             // |                     |                     |           |
    pushq   %r12                                       // |  2        x    v    |  0                  |  0        |
    .cfi_def_cfa_offset 48                             // |                     |                     |           |
    pushq   %rbx                                       // |  2  v     x         |  0                  |  0        |
    .cfi_def_cfa_offset 56                             // |                     |                     |           |
    pushq   %rax                                       // |  2 v      x         |  0                  |  0        |
    .cfi_def_cfa_offset 64                             // |                     |                     |           |
    .cfi_offset %rbx, -56                              // |                     |                     |           |
    .cfi_offset %r12, -48                              // |                     |                     |           |
    .cfi_offset %r13, -40                              // |                     |                     |           |
    .cfi_offset %r14, -32                              // |                     |                     |           |
    .cfi_offset %r15, -24                              // |                     |                     |           |
    .cfi_offset %rbp, -16                              // |                     |                     |           |
    movl    %esi, %ebp                                 // |  3     v ^:         |  0                  |  0        |
    movq    %rdi, %r14                                 // |  4      v::      ^  |  0                  |  0        |
    movslq  %esi, %rbx                                 // |  5  ^  v ::      :  |  0                  |  0        |
    leaq    (,%rbx,8), %rdi                            // |  5  v   ^::      :  |  0                  |  0        |
    callq   malloc@PLT                                 // |  4  :    :x      :  |  0                  |  0        |
    movq    %rax, %r12                                 // |  6 v:    ::    ^ :  |  0                  |  0        |
    testl   %ebx, %ebx                                 // |  5  v    ::    : :  |  0                  |  6 ^^^^^^ |
    jle .LBB0_8                                        // |  4       ::    : :  |  0                  |  3  vvv   |
    movl    %ebp, %r13d                                // |  5       v:    :^:  |  0                  |  0        |
    leaq    .L.str(%rip), %r15                         // |  6       ::    :::^ |  0                  |  0        |
    xorl    %ebx, %ebx                                 // |  7  ^    ::    :::: |  0                  |  5 ^^^^^  |
    jmp .LBB0_2                                        // |  7  :    ::    :::: |  0                  |  0        |
    .p2align    4, 0x90                                // |                     |                     |           |
.LBB0_7:                                               // |                     |                     |           |
    movl    $100, %edi                                 // |  8  :   ^::    :::: |  0                  |  0        |
    callq   malloc@PLT                                 // |  7  :    :x    :::: |  0                  |  0        |
    movq    %rax, (%r12,%rbx,8)                        // |  8 vv    ::    v::: |  0                  |  0        |
    movq    %rax, %rdi                                 // |  9 v:   ^::    :::: |  0                  |  0        |
    movq    %r15, %rsi                                 // |  8  :  ^ ::    :::v |  0                  |  0        |
    movl    %ebp, %edx                                 // |  7  : ^  v:    :::  |  0                  |  0        |
    movl    %ebp, %ecx                                 // |  7  :^   v:    :::  |  0                  |  0        |
    movl    %ebp, %r8d                                 // |  7  :    v:^   :::  |  0                  |  0        |
    xorl    %eax, %eax                                 // |  6 ^:     :    :::  |  0                  |  5 ^^^^^  |
    callq   sprintf@PLT                                // |  5  :     x    :::  |  0                  |  0        |
    incq    %rbx                                       // |  5  x     :    :::  |  0                  |  5  ^^^^^ |
    cmpq    %r13, %rbx                                 // |  5  v     :    :v:  |  0                  |  6 ^^^^^^ |
    je  .LBB0_8                                        // |  4  :     :    : :  |  0                  |  1  v     |
.LBB0_2:                                               // |                     |                     |           |
    movq    (%r14,%rbx,8), %rax                        // |  5 ^v     :    : v  |  0                  |  0        |
    movzbl  (%rax), %ecx                               // |  4 v ^    :    :    |  0                  |  0        |
    movl    $0, %ebp                                   // |  5 : :   ^:    :    |  0                  |  0        |
    testb   %cl, %cl                                   // |  4 : v    :    :    |  0                  |  6 ^^^^^^ |
    je  .LBB0_7                                        // |  3 :      :    :    |  0                  |  1  v     |
    incq    %rax                                       // |  3 x      :    :    |  0                  |  5  ^^^^^ |
    xorl    %ebp, %ebp                                 // |  4 :     ^:    :    |  0                  |  5 ^^^^^  |
    jmp .LBB0_4                                        // |  4 :     ::    :    |  0                  |  0        |
    .p2align    4, 0x90                                // |                     |                     |           |
.LBB0_6:                                               // |                     |                     |           |
    movzbl  (%rax), %ecx                               // |  5 v ^   ::    :    |  0                  |  0        |
    incq    %rax                                       // |  5 x :   ::    :    |  0                  |  5  ^^^^^ |
    testb   %cl, %cl                                   // |  4   v   ::    :    |  0                  |  6 ^^^^^^ |
    je  .LBB0_7                                        // |  4   :   ::    :    |  0                  |  1  v     |
.LBB0_4:                                               // |                     |                     |           |
    leal    -48(%rcx), %edx                            // |  5   v^  ::    :    |  0                  |  0        |
    cmpb    $9, %dl                                    // |  4    v  ::    :    |  0                  |  6 ^^^^^^ |
    ja  .LBB0_6                                        // |  3       ::    :    |  0                  |  2 vv     |
    movzbl  %cl, %ecx                                  // |  4   ^   ::    :    |  0                  |  0        |
    addl    $-48, %ecx                                 // |  4   x   ::    :    |  0                  |  6 ^^^^^^ |
    andl    $-2147483647, %ecx                         // |  4   x   ::    :    |  0                  |  5 ^^^^^  |
    xorl    %edx, %edx                                 // |  5   :^  ::    :    |  0                  |  5 ^^^^^  |
    cmpl    $1, %ecx                                   // |  5   v:  ::    :    |  0                  |  6 ^^^^^^ |
    sete    %dl                                        // |  4    x  ::    :    |  0                  |  1  v     |
    addl    %edx, %ebp                                 // |  4    v  x:    :    |  0                  |  6 ^^^^^^ |
    jmp .LBB0_6                                        // |  2        :    :    |  0                  |  0        |
.LBB0_8:                                               // |                     |                     |           |
    movq    %r12, %rax                                 // |  3 ^      :    v    |  0                  |  0        |
    addq    $8, %rsp                                   // |  1        x         |  0                  |  6 ^^^^^^ |
    .cfi_def_cfa_offset 56                             // |                     |                     |           |
    popq    %rbx                                       // |  2  ^     x         |  0                  |  0        |
    .cfi_def_cfa_offset 48                             // |                     |                     |           |
    popq    %r12                                       // |  2        x    ^    |  0                  |  0        |
    .cfi_def_cfa_offset 40                             // |                     |                     |           |
    popq    %r13                                       // |  2        x     ^   |  0                  |  0        |
    .cfi_def_cfa_offset 32                             // |                     |                     |           |
    popq    %r14                                       // |  2        x      ^  |  0                  |  0        |
    .cfi_def_cfa_offset 24                             // |                     |                     |           |
    popq    %r15                                       // |  2        x       ^ |  0                  |  0        |
    .cfi_def_cfa_offset 16                             // |                     |                     |           |
    popq    %rbp                                       // |  2       ^x         |  0                  |  0        |
    .cfi_def_cfa_offset 8                              // |                     |                     |           |
    retq                                               // |  1        x         |  0                  |  0        |
.Lfunc_end0:                                           // |                     |                     |           |
    .size   func0, .Lfunc_end0-func0                   // |                     |                     |           |
    .cfi_endproc                                       // |                     |                     |           |
    .type   .L.str,@object                             // |                     |                     |           |
    .section    .rodata.str1.1,"aMS",@progbits,1       // |                     |                     |           |
.L.str:                                                // |                     |                     |           |
    .asciz  "the number of odd elements %d in th...    // |                     |                     |           |
    .size   .L.str, 64                                 // |                     |                     |           |
    .ident  "clang version 15.0.4"                     // |                     |                     |           |
    .section    ".note.GNU-stack","",@progbits         // |                     |                     |           |
    .addrsig                                           // |                     |                     |           |
                                                       // +.....................+.....................+...........+
                                                       // Legend:
                                                       //     ^       : Register assignment (write)
                                                       //     v       : Register usage (read)
                                                       //     x       : Register usage and reassignment (R/W)
                                                       //     :       : Register in use (live)
                                                       //     <space> : Register not in use
                                                       //     #       : Number of occupied registers
