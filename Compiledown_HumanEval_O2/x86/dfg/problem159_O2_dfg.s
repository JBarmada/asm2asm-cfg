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
    subq    $296, %rsp                              // |  1        x         |  0                  |  6 ^^^^^^ |
    .cfi_def_cfa_offset 352                         // |                     |                     |           |
    .cfi_offset %rbx, -56                           // |                     |                     |           |
    .cfi_offset %r12, -48                           // |                     |                     |           |
    .cfi_offset %r13, -40                           // |                     |                     |           |
    .cfi_offset %r14, -32                           // |                     |                     |           |
    .cfi_offset %r15, -24                           // |                     |                     |           |
    .cfi_offset %rbp, -16                           // |                     |                     |           |
    movq    %rdi, 24(%rsp)                          // |  2      v v         |  0                  |  0        |
    testl   %esi, %esi                              // |  2     v  :         |  0                  |  6 ^^^^^^ |
    jle .LBB0_1                                     // |  1        :         |  0                  |  3  vvv   |
    movl    %esi, %eax                              // |  3 ^   v  :         |  0                  |  0        |
    movq    %rax, 16(%rsp)                          // |  2 v      v         |  0                  |  0        |
    xorl    %ebp, %ebp                              // |  2       ^:         |  0                  |  5 ^^^^^  |
    leaq    .L.str(%rip), %rax                      // |  3 ^     ::         |  0                  |  0        |
    movq    %rax, 8(%rsp)                           // |  3 v     :v         |  0                  |  0        |
    leaq    32(%rsp), %rbx                          // |  3  ^    :v         |  0                  |  0        |
    movl    $0, 4(%rsp)                             // |  3  :    :v         |  0                  |  0        |
    jmp .LBB0_4                                     // |  3  :    ::         |  0                  |  0        |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_12:                                           // |                     |                     |           |
    movl    %r14d, 4(%rsp)                          // |  4  :    :v      v  |  0                  |  0        |
    movq    %r12, 8(%rsp)                           // |  4  :    :v    v    |  0                  |  0        |
.LBB0_13:                                           // |                     |                     |           |
    incq    %rbp                                    // |  3  :    x:         |  0                  |  5  ^^^^^ |
    cmpq    16(%rsp), %rbp                          // |  3  :    vv         |  0                  |  6 ^^^^^^ |
    je  .LBB0_2                                     // |  3  :    ::         |  0                  |  1  v     |
.LBB0_4:                                            // |                     |                     |           |
    xorps   %xmm0, %xmm0                            // |  3  :    ::         |  1 ^                |  5 ^^^^^  |
    movaps  %xmm0, 272(%rsp)                        // |  3  :    :v         |  1 v                |  0        |
    movaps  %xmm0, 256(%rsp)                        // |  3  :    :v         |  1 v                |  0        |
    movaps  %xmm0, 240(%rsp)                        // |  3  :    :v         |  1 v                |  0        |
    movaps  %xmm0, 224(%rsp)                        // |  3  :    :v         |  1 v                |  0        |
    movaps  %xmm0, 208(%rsp)                        // |  3  :    :v         |  1 v                |  0        |
    movaps  %xmm0, 192(%rsp)                        // |  3  :    :v         |  1 v                |  0        |
    movaps  %xmm0, 176(%rsp)                        // |  3  :    :v         |  1 v                |  0        |
    movaps  %xmm0, 160(%rsp)                        // |  3  :    :v         |  1 v                |  0        |
    movaps  %xmm0, 144(%rsp)                        // |  3  :    :v         |  1 v                |  0        |
    movaps  %xmm0, 128(%rsp)                        // |  3  :    :v         |  1 v                |  0        |
    movaps  %xmm0, 112(%rsp)                        // |  3  :    :v         |  1 v                |  0        |
    movaps  %xmm0, 96(%rsp)                         // |  3  :    :v         |  1 v                |  0        |
    movaps  %xmm0, 80(%rsp)                         // |  3  :    :v         |  1 v                |  0        |
    movaps  %xmm0, 64(%rsp)                         // |  3  :    :v         |  1 v                |  0        |
    movaps  %xmm0, 48(%rsp)                         // |  3  :    :v         |  1 v                |  0        |
    movaps  %xmm0, 32(%rsp)                         // |  3  :    :v         |  1 v                |  0        |
    movq    24(%rsp), %rax                          // |  4 ^:    :v         |  0                  |  0        |
    movq    (%rax,%rbp,8), %r12                     // |  5 v:    v:    ^    |  0                  |  0        |
    movzbl  (%r12), %r13d                           // |  5 ::     :    v^   |  0                  |  0        |
    movl    $0, %r14d                               // |  6 ::     :    ::^  |  0                  |  0        |
    testb   %r13b, %r13b                            // |  5 ::     :    :v   |  0                  |  6 ^^^^^^ |
    je  .LBB0_9                                     // |  4 ::     :    :    |  0                  |  1  v     |
    leaq    1(%r12), %r15                           // |  5 ::     :    v  ^ |  0                  |  0        |
    xorl    %r14d, %r14d                            // |  6 ::     :    : ^: |  0                  |  5 ^^^^^  |
    jmp .LBB0_6                                     // |  6 ::     :    : :: |  0                  |  0        |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_8:                                            // |                     |                     |           |
    movzbl  (%r15), %r13d                           // |  7 ::     :    :^:v |  0                  |  0        |
    incq    %r15                                    // |  7 ::     :    :::x |  0                  |  5  ^^^^^ |
    testb   %r13b, %r13b                            // |  6 ::     :    :v:  |  0                  |  6 ^^^^^^ |
    je  .LBB0_9                                     // |  6 ::     :    :::  |  0                  |  1  v     |
.LBB0_6:                                            // |                     |                     |           |
    movsbl  %r13b, %esi                             // |  7 ::  ^  :    :v:  |  0                  |  0        |
    movq    %rbx, %rdi                              // |  7 :v   ^ :    :::  |  0                  |  0        |
    callq   strchr@PLT                              // |  6 ::     x    :::  |  0                  |  0        |
    testq   %rax, %rax                              // |  6 v:     :    :::  |  0                  |  6 ^^^^^^ |
    jne .LBB0_8                                     // |  6 ::     :    :::  |  0                  |  1  v     |
    movq    %rbx, %rdi                              // |  7 :v   ^ :    :::  |  0                  |  0        |
    callq   strlen@PLT                              // |  5 :      x    :::  |  0                  |  0        |
    cltq                                            // |  5 :      :    :::  |  0                  |  0        |
    movb    %r13b, 32(%rsp,%rax)                    // |  5 v      v    :v:  |  0                  |  0        |
    incl    %eax                                    // |  4 x      :    : :  |  0                  |  5  ^^^^^ |
    cltq                                            // |  4 :      :    : :  |  0                  |  0        |
    movb    $0, 32(%rsp,%rax)                       // |  4 v      v    : :  |  0                  |  0        |
    incl    %r14d                                   // |  4 :      :    : x  |  0                  |  5  ^^^^^ |
    jmp .LBB0_8                                     // |  4 :      :    : :  |  0                  |  0        |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_9:                                            // |                     |                     |           |
    cmpl    4(%rsp), %r14d                          // |  4 :      v    : v  |  0                  |  6 ^^^^^^ |
    jg  .LBB0_12                                    // |  3 :      :    :    |  0                  |  3  vvv   |
    jne .LBB0_13                                    // |  3 :      :    :    |  0                  |  1  v     |
    movq    %r12, %rdi                              // |  4 :    ^ :    v    |  0                  |  0        |
    movq    8(%rsp), %rsi                           // |  3 :   ^  v         |  0                  |  0        |
    callq   strcmp@PLT                              // |  2 :      x         |  0                  |  0        |
    testl   %eax, %eax                              // |  2 v      :         |  0                  |  6 ^^^^^^ |
    js  .LBB0_12                                    // |  1        :         |  0                  |  1   v    |
    jmp .LBB0_13                                    // |  1        :         |  0                  |  0        |
.LBB0_1:                                            // |                     |                     |           |
    leaq    .L.str(%rip), %rax                      // |  2 ^      :         |  0                  |  0        |
    movq    %rax, 8(%rsp)                           // |  2 v      v         |  0                  |  0        |
.LBB0_2:                                            // |                     |                     |           |
    movq    8(%rsp), %rax                           // |  2 ^      v         |  0                  |  0        |
    addq    $296, %rsp                              // |  1        x         |  0                  |  6 ^^^^^^ |
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
