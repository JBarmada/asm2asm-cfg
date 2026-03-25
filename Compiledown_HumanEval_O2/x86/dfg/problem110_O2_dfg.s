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
    .globl  func0                                 // |                     |                     |           |
    .p2align    4, 0x90                           // |                     |                     |           |
    .type   func0,@function                       // |                     |                     |           |
func0:                                            // |                     |                     |           |
    .cfi_startproc                                // |                     |                     |           |
    testl   %esi, %esi                            // |  1     v            |  0                  |  6 ^^^^^^ |
    je  .LBB0_1                                   // |  0                  |  0                  |  1  v     |
    pushq   %rbx                                  // |  2  v     x         |  0                  |  0        |
    .cfi_def_cfa_offset 16                        // |                     |                     |           |
    .cfi_offset %rbx, -16                         // |                     |                     |           |
    cmpl    $1, %esi                              // |  2     v  :         |  0                  |  6 ^^^^^^ |
    jle .LBB0_3                                   // |  1        :         |  0                  |  3  vvv   |
    movl    %esi, %r10d                           // |  3     v  :  ^      |  0                  |  0        |
    movl    (%rdi), %r8d                          // |  4      v :^ :      |  0                  |  0        |
    leaq    -1(%r10), %r9                         // |  4        ::^v      |  0                  |  0        |
    cmpq    $8, %r9                               // |  4        ::v:      |  0                  |  6 ^^^^^^ |
    jae .LBB0_8                                   // |  4        ::::      |  0                  |  1 v      |
    xorl    %ebx, %ebx                            // |  5  ^     ::::      |  0                  |  5 ^^^^^  |
    movl    $1, %r11d                             // |  5        ::::^     |  0                  |  0        |
    movl    %r8d, %edx                            // |  5    ^   :v::      |  0                  |  0        |
    jmp .LBB0_12                                  // |  3        : ::      |  0                  |  0        |
.LBB0_1:                                          // |                     |                     |           |
    .cfi_def_cfa_offset 8                         // |                     |                     |           |
    .cfi_restore %rbx                             // |                     |                     |           |
    movb    $1, %al                               // |  4 ^      : ::      |  0                  |  0        |
    retq                                          // |  3        x ::      |  0                  |  0        |
.LBB0_3:                                          // |                     |                     |           |
    .cfi_def_cfa_offset 16                        // |                     |                     |           |
    .cfi_offset %rbx, -16                         // |                     |                     |           |
    movl    (%rdi), %r8d                          // |  5      v :^::      |  0                  |  0        |
    xorl    %ebx, %ebx                            // |  5  ^     ::::      |  0                  |  5 ^^^^^  |
    jmp .LBB0_4                                   // |  4        ::::      |  0                  |  0        |
.LBB0_8:                                          // |                     |                     |           |
    movq    %r9, %rcx                             // |  5   ^    ::v:      |  0                  |  0        |
    andq    $-8, %rcx                             // |  5   x    ::::      |  0                  |  5 ^^^^^  |
    leaq    1(%rcx), %r11                         // |  6   v    ::::^     |  0                  |  0        |
    movd    %r8d, %xmm0                           // |  6   :    :v:::     |  1 ^                |  0        |
    pshufd  $0, %xmm0, %xmm2                      // |  6   :    :::::     |  0                  |  0        |
    pxor    %xmm0, %xmm0                          // |  6   :    :::::     |  1 ^                |  0        |
    xorl    %eax, %eax                            // |  7 ^ :    :::::     |  0                  |  5 ^^^^^  |
    pxor    %xmm1, %xmm1                          // |  7 : :    :::::     |  1  ^               |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_9:                                          // |                     |                     |           |
    movups  4(%rdi,%rax,4), %xmm3                 // |  8 v :  v :::::     |  1    ^             |  0        |
    shufps  $3, %xmm3, %xmm2                      // |  7 : :    :::::     |  1    :             |  0        |
    shufps  $152, %xmm3, %xmm2                    // |  7 : :    :::::     |  1    :             |  0        |
    pcmpgtd %xmm3, %xmm2                          // |  7 : :    :::::     |  2   ^v             |  0        |
    psubd   %xmm2, %xmm0                          // |  7 : :    :::::     |  2 ^ v              |  0        |
    movups  20(%rdi,%rax,4), %xmm2                // |  8 v :  v :::::     |  2 : ^              |  0        |
    shufps  $3, %xmm2, %xmm3                      // |  7 : :    :::::     |  2 : :              |  0        |
    shufps  $152, %xmm2, %xmm3                    // |  7 : :    :::::     |  2 : :              |  0        |
    pcmpgtd %xmm2, %xmm3                          // |  7 : :    :::::     |  3 : v^             |  0        |
    psubd   %xmm3, %xmm1                          // |  7 : :    :::::     |  3 :^ v             |  0        |
    addq    $8, %rax                              // |  7 x :    :::::     |  1 :                |  6 ^^^^^^ |
    cmpq    %rax, %rcx                            // |  7 v v    :::::     |  1 :                |  6 ^^^^^^ |
    jne .LBB0_9                                   // |  6   :    :::::     |  1 :                |  1  v     |
    paddd   %xmm0, %xmm1                          // |  6   :    :::::     |  2 v^               |  0        |
    pshufd  $238, %xmm1, %xmm0                    // |  6   :    :::::     |  1  :               |  0        |
    paddd   %xmm1, %xmm0                          // |  6   :    :::::     |  2 ^v               |  0        |
    pshufd  $85, %xmm0, %xmm1                     // |  6   :    :::::     |  1 :                |  0        |
    paddd   %xmm0, %xmm1                          // |  6   :    :::::     |  2 v^               |  0        |
    movd    %xmm1, %ebx                           // |  7  ^:    :::::     |  2 :v               |  0        |
    cmpq    %rcx, %r9                             // |  7  :v    ::v::     |  1 :                |  6 ^^^^^^ |
    je  .LBB0_4                                   // |  5  :     :: ::     |  1 :                |  1  v     |
    pshufd  $255, %xmm2, %xmm0                    // |  5  :     :: ::     |  1 :                |  0        |
    movd    %xmm0, %edx                           // |  6  : ^   :: ::     |  1 v                |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_12:                                         // |                     |                     |           |
    movl    (%rdi,%r11,4), %ecx                   // |  8  :^: v :: :v     |  0                  |  0        |
    xorl    %eax, %eax                            // |  8 ^:::   :: ::     |  0                  |  5 ^^^^^  |
    cmpl    %edx, %ecx                            // |  8 ::vv   :: ::     |  0                  |  6 ^^^^^^ |
    setl    %al                                   // |  7 x::    :: ::     |  0                  |  2   vv   |
    addl    %eax, %ebx                            // |  7 vx:    :: ::     |  0                  |  6 ^^^^^^ |
    incq    %r11                                  // |  7 :::    :: :x     |  0                  |  5  ^^^^^ |
    movl    %ecx, %edx                            // |  8 ::v^   :: ::     |  0                  |  0        |
    cmpq    %r11, %r10                            // |  6 ::     :: vv     |  0                  |  6 ^^^^^^ |
    jne .LBB0_12                                  // |  4 ::     ::        |  0                  |  1  v     |
.LBB0_4:                                          // |                     |                     |           |
    movslq  %esi, %rcx                            // |  6 ::^ v  ::        |  0                  |  0        |
    xorl    %edx, %edx                            // |  6 :::^   ::        |  0                  |  5 ^^^^^  |
    cmpl    %r8d, -4(%rdi,%rcx,4)                 // |  7 ::v: v :v        |  0                  |  6 ^^^^^^ |
    setg    %dl                                   // |  4 :: x   :         |  0                  |  3  vvv   |
    addl    %ebx, %edx                            // |  4 :v x   :         |  0                  |  6 ^^^^^^ |
    cmpl    $2, %edx                              // |  3 :  v   :         |  0                  |  6 ^^^^^^ |
    setb    %al                                   // |  2 x      :         |  0                  |  1 v      |
    popq    %rbx                                  // |  2  ^     x         |  0                  |  0        |
    .cfi_def_cfa_offset 8                         // |                     |                     |           |
    .cfi_restore %rbx                             // |                     |                     |           |
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
