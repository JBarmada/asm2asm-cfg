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
    .section    .rodata.cst4,"aM",@progbits,4     // |                     |                     |           |
    .p2align    2                                 // |                     |                     |           |
.LCPI0_0:                                         // |                     |                     |           |
    .long   0x3f000000                            // |                     |                     |           |
    .text                                         // |                     |                     |           |
    .globl  func0                                 // |                     |                     |           |
    .p2align    4, 0x90                           // |                     |                     |           |
    .type   func0,@function                       // |                     |                     |           |
func0:                                            // |                     |                     |           |
    .cfi_startproc                                // |                     |                     |           |
    testl   %esi, %esi                            // |  1     v            |  0                  |  6 ^^^^^^ |
    jle .LBB0_4                                   // |  0                  |  0                  |  3  vvv   |
    movl    %esi, %r8d                            // |  2     v   ^        |  0                  |  0        |
    xorl    %r9d, %r9d                            // |  2         :^       |  0                  |  5 ^^^^^  |
    movq    %r8, %r10                             // |  3         v:^      |  0                  |  0        |
    movq    %rdi, %rdx                            // |  5    ^ v  :::      |  0                  |  0        |
    jmp .LBB0_2                                   // |  4    :    :::      |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_3:                                          // |                     |                     |           |
    addq    $4, %rdx                              // |  4    x    :::      |  0                  |  6 ^^^^^^ |
    decq    %r10                                  // |  4    :    ::x      |  0                  |  5  ^^^^^ |
    cmpq    %r8, %r9                              // |  4    :    vv:      |  0                  |  6 ^^^^^^ |
    je  .LBB0_4                                   // |  4    :    :::      |  0                  |  1  v     |
.LBB0_2:                                          // |                     |                     |           |
    movq    %r9, %rax                             // |  5 ^  :    :v:      |  0                  |  0        |
    incq    %r9                                   // |  5 :  :    :x:      |  0                  |  5  ^^^^^ |
    cmpq    %r8, %r9                              // |  5 :  :    vv:      |  0                  |  6 ^^^^^^ |
    jae .LBB0_3                                   // |  3 :  :      :      |  0                  |  1 v      |
    movl    $1, %ecx                              // |  4 : ^:      :      |  0                  |  0        |
    jmp .LBB0_7                                   // |  4 : ::      :      |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_9:                                          // |                     |                     |           |
    incq    %rcx                                  // |  4 : x:      :      |  0                  |  5  ^^^^^ |
    cmpq    %rcx, %r10                            // |  4 : v:      v      |  0                  |  6 ^^^^^^ |
    je  .LBB0_3                                   // |  3 : ::             |  0                  |  2 :v     |
.LBB0_7:                                          // |                     |                     |           |
    movss   (%rdi,%rax,4), %xmm0                  // |  4 v :: v           |  1 ^                |  2 ::     |
    movss   (%rdx,%rcx,4), %xmm1                  // |  3 : vv             |  1  ^               |  2 ::     |
    ucomiss %xmm1, %xmm0                          // |  3 : ::             |  2 ^v               |  2 ::     |
    jbe .LBB0_9                                   // |  3 : ::             |  2 ::               |  2 vv     |
    movss   %xmm1, (%rdi,%rax,4)                  // |  4 v :: v           |  2 :v               |  0        |
    movss   %xmm0, (%rdx,%rcx,4)                  // |  2   vv             |  1 v                |  0        |
    jmp .LBB0_9                                   // |  1    :             |  0                  |  0        |
.LBB0_4:                                          // |                     |                     |           |
    movl    %esi, %eax                            // |  3 ^  :v            |  0                  |  0        |
    andl    $-2147483647, %eax                    // |  2 x  :             |  0                  |  5 ^^^^^  |
    cmpl    $1, %eax                              // |  2 v  :             |  0                  |  6 ^^^^^^ |
    jne .LBB0_10                                  // |  1    :             |  0                  |  1  v     |
    shrl    %esi                                  // |  2    :x            |  0                  |  5 ^^^^^  |
    movss   (%rdi,%rsi,4), %xmm0                  // |  3    :vv           |  1 ^                |  0        |
    retq                                          // |  3    ::  x         |  0                  |  0        |
.LBB0_10:                                         // |                     |                     |           |
    movl    %esi, %eax                            // |  4 ^  :v  :         |  0                  |  0        |
    shrl    $31, %eax                             // |  4 x  ::  :         |  0                  |  5 ^^^^^  |
    addl    %esi, %eax                            // |  4 x  :v  :         |  0                  |  6 ^^^^^^ |
    sarl    %eax                                  // |  3 x  :   :         |  0                  |  5 ^^^^^  |
    cltq                                          // |  3 :  :   :         |  0                  |  0        |
    movss   (%rdi,%rax,4), %xmm0                  // |  4 v  : v :         |  1 ^                |  0        |
    addss   -4(%rdi,%rax,4), %xmm0                // |  4 v  : v :         |  1 x                |  6 ^^^^^^ |
    mulss   .LCPI0_0(%rip), %xmm0                 // |  3 x  x   :         |  1 ^                |  2 ^  ^   |
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
