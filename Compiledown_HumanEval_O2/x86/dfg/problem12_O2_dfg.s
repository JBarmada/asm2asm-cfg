                                                   // +---------------------+---------------------+-----------+
                                                   // |         GPR         |        VECTOR       |   FLAGS   |
                                                   // |                     |                     |           |
                                                   // |    RRRRRRRRRRRRRRRR |    XXXXXXXXXXXXXXXX |    CZSOPA |
                                                   // |    ABCDSDBS89111111 |    MMMMMMMMMMMMMMMM |    FFFFFF |
                                                   // |    XXXXIIPP  012345 |    MMMMMMMMMMMMMMMM |           |
                                                   // |                     |    0123456789111111 |           |
                                                   // |  #                  |  #           012345 |  #        |
                                                   // +---------------------+---------------------+-----------+
    .text                                          // |                     |                     |           |
    .file   "code.c"                               // |                     |                     |           |
    .section    .rodata.cst16,"aM",@progbits,16    // |                     |                     |           |
    .p2align    4                                  // |                     |                     |           |
.LCPI0_0:                                          // |                     |                     |           |
    .zero   16,49                                  // |                     |                     |           |
.LCPI0_1:                                          // |                     |                     |           |
    .byte   49                                     // |                     |                     |           |
    .byte   49                                     // |                     |                     |           |
    .byte   49                                     // |                     |                     |           |
    .byte   49                                     // |                     |                     |           |
    .byte   49                                     // |                     |                     |           |
    .byte   49                                     // |                     |                     |           |
    .byte   49                                     // |                     |                     |           |
    .byte   49                                     // |                     |                     |           |
    .zero   1                                      // |                     |                     |           |
    .zero   1                                      // |                     |                     |           |
    .zero   1                                      // |                     |                     |           |
    .zero   1                                      // |                     |                     |           |
    .zero   1                                      // |                     |                     |           |
    .zero   1                                      // |                     |                     |           |
    .zero   1                                      // |                     |                     |           |
    .zero   1                                      // |                     |                     |           |
    .text                                          // |                     |                     |           |
    .globl  func0                                  // |                     |                     |           |
    .p2align    4, 0x90                            // |                     |                     |           |
    .type   func0,@function                        // |                     |                     |           |
func0:                                             // |                     |                     |           |
    .cfi_startproc                                 // |                     |                     |           |
    pushq   %r15                                   // |  2        x       v |  0                  |  0        |
    .cfi_def_cfa_offset 16                         // |                     |                     |           |
    pushq   %r14                                   // |  2        x      v  |  0                  |  0        |
    .cfi_def_cfa_offset 24                         // |                     |                     |           |
    pushq   %r12                                   // |  2        x    v    |  0                  |  0        |
    .cfi_def_cfa_offset 32                         // |                     |                     |           |
    pushq   %rbx                                   // |  2  v     x         |  0                  |  0        |
    .cfi_def_cfa_offset 40                         // |                     |                     |           |
    pushq   %rax                                   // |  2 v      x         |  0                  |  0        |
    .cfi_def_cfa_offset 48                         // |                     |                     |           |
    .cfi_offset %rbx, -40                          // |                     |                     |           |
    .cfi_offset %r12, -32                          // |                     |                     |           |
    .cfi_offset %r14, -24                          // |                     |                     |           |
    .cfi_offset %r15, -16                          // |                     |                     |           |
    movq    %rsi, %r14                             // |  3     v  :      ^  |  0                  |  0        |
    movq    %rdi, %rbx                             // |  4  ^   v :      :  |  0                  |  0        |
    callq   strlen@PLT                             // |  3  :     x      :  |  0                  |  0        |
    movq    %rax, %r12                             // |  5 v:     :    ^ :  |  0                  |  0        |
    movq    %r14, %rdi                             // |  5  :   ^ :    : v  |  0                  |  0        |
    callq   strlen@PLT                             // |  4  :     x    : :  |  0                  |  0        |
    movq    %rax, %r15                             // |  6 v:     :    : :^ |  0                  |  0        |
    cmpl    %r15d, %r12d                           // |  5  :     :    v :v |  0                  |  6 ^^^^^^ |
    cmovll  %r12d, %r15d                           // |  5  :     :    v :^ |  0                  |  0        |
    leal    1(%r15), %eax                          // |  5 ^:     :      :v |  0                  |  0        |
    movslq  %eax, %rdi                             // |  6 v:   ^ :      :: |  0                  |  0        |
    callq   malloc@PLT                             // |  5 ::     x      :: |  0                  |  0        |
    testq   %rax, %rax                             // |  5 v:     :      :: |  0                  |  6 ^^^^^^ |
    je  .LBB0_19                                   // |  5 ::     :      :: |  0                  |  1  v     |
    testl   %r15d, %r15d                           // |  5 ::     :      :v |  0                  |  6 ^^^^^^ |
    jle .LBB0_18                                   // |  5 ::     :      :: |  0                  |  3  vvv   |
    movl    %r15d, %r9d                            // |  6 ::     : ^    :v |  0                  |  0        |
    cmpl    $8, %r15d                              // |  6 ::     : :    :v |  0                  |  6 ^^^^^^ |
    jae .LBB0_5                                    // |  6 ::     : :    :: |  0                  |  1 v      |
    xorl    %edx, %edx                             // |  7 :: ^   : :    :: |  0                  |  5 ^^^^^  |
    jmp .LBB0_4                                    // |  6 ::     : :    :: |  0                  |  0        |
.LBB0_5:                                           // |                     |                     |           |
    cmpl    $32, %r15d                             // |  6 ::     : :    :v |  0                  |  6 ^^^^^^ |
    jae .LBB0_7                                    // |  6 ::     : :    :: |  0                  |  1 v      |
    xorl    %edx, %edx                             // |  7 :: ^   : :    :: |  0                  |  5 ^^^^^  |
    jmp .LBB0_15                                   // |  6 ::     : :    :: |  0                  |  0        |
.LBB0_7:                                           // |                     |                     |           |
    movl    %r9d, %edx                             // |  7 :: ^   : v    :: |  0                  |  0        |
    andl    $-32, %edx                             // |  7 :: x   : :    :: |  0                  |  5 ^^^^^  |
    leaq    -32(%rdx), %rsi                        // |  8 :: v^  : :    :: |  0                  |  0        |
    movq    %rsi, %r8                              // |  9 :: :v  :^:    :: |  0                  |  0        |
    shrq    $5, %r8                                // |  9 :: ::  :x:    :: |  0                  |  5 ^^^^^  |
    incq    %r8                                    // |  9 :: ::  :x:    :: |  0                  |  5  ^^^^^ |
    testq   %rsi, %rsi                             // |  9 :: :v  :::    :: |  0                  |  6 ^^^^^^ |
    je  .LBB0_8                                    // |  8 :: :   :::    :: |  0                  |  1  v     |
    movq    %r8, %rdi                              // |  9 :: : ^ :v:    :: |  0                  |  0        |
    andq    $-2, %rdi                              // |  9 :: : x :::    :: |  0                  |  5 ^^^^^  |
    xorl    %esi, %esi                             // | 10 :: :^: :::    :: |  0                  |  5 ^^^^^  |
    movdqa  .LCPI0_0(%rip), %xmm0                  // | 10 :: ::: :::    :: |  1 ^                |  0        |
    .p2align    4, 0x90                            // |                     |                     |           |
.LBB0_10:                                          // |                     |                     |           |
    movdqu  (%rbx,%rsi), %xmm1                     // | 10 :v :v: :::    :: |  2 :^               |  0        |
    movdqu  16(%rbx,%rsi), %xmm2                   // | 10 :v :v: :::    :: |  3 ::^              |  0        |
    movdqu  (%r14,%rsi), %xmm3                     // | 10 :: :v: :::    v: |  4 :::^             |  0        |
    pcmpeqb %xmm1, %xmm3                           // | 10 :: ::: :::    :: |  4 :v:^             |  0        |
    movdqu  16(%r14,%rsi), %xmm1                   // | 10 :: :v: :::    v: |  3 :^:              |  0        |
    pcmpeqb %xmm2, %xmm1                           // | 10 :: ::: :::    :: |  3 :^v              |  0        |
    paddb   %xmm0, %xmm3                           // | 10 :: ::: :::    :: |  2 v  ^             |  0        |
    paddb   %xmm0, %xmm1                           // | 10 :: ::: :::    :: |  3 v^ :             |  0        |
    movdqu  %xmm3, (%rax,%rsi)                     // | 10 v: :v: :::    :: |  3 :: v             |  0        |
    movdqu  %xmm1, 16(%rax,%rsi)                   // | 10 v: :v: :::    :: |  2 :v               |  0        |
    movdqu  32(%rbx,%rsi), %xmm1                   // | 10 :v :v: :::    :: |  2 :^               |  0        |
    movdqu  48(%rbx,%rsi), %xmm2                   // | 10 :v :v: :::    :: |  3 ::^              |  0        |
    movdqu  32(%r14,%rsi), %xmm3                   // | 10 :: :v: :::    v: |  4 :::^             |  0        |
    pcmpeqb %xmm1, %xmm3                           // | 10 :: ::: :::    :: |  4 :v:^             |  0        |
    movdqu  48(%r14,%rsi), %xmm1                   // | 10 :: :v: :::    v: |  3 :^:              |  0        |
    pcmpeqb %xmm2, %xmm1                           // | 10 :: ::: :::    :: |  3 :^v              |  0        |
    paddb   %xmm0, %xmm3                           // | 10 :: ::: :::    :: |  2 v  ^             |  0        |
    paddb   %xmm0, %xmm1                           // | 10 :: ::: :::    :: |  3 v^ :             |  0        |
    movdqu  %xmm3, 32(%rax,%rsi)                   // | 10 v: :v: :::    :: |  2  : v             |  0        |
    movdqu  %xmm1, 48(%rax,%rsi)                   // | 10 v: :v: :::    :: |  1  v               |  0        |
    addq    $64, %rsi                              // | 10 :: :x: :::    :: |  0                  |  6 ^^^^^^ |
    addq    $-2, %rdi                              // | 10 :: ::x :::    :: |  0                  |  6 ^^^^^^ |
    jne .LBB0_10                                   // |  9 :: ::  :::    :: |  0                  |  1  v     |
    testb   $1, %r8b                               // |  9 :: ::  :v:    :: |  0                  |  6 ^^^^^^ |
    je  .LBB0_13                                   // |  9 :: ::  :::    :: |  0                  |  1  v     |
.LBB0_12:                                          // |                     |                     |           |
    movdqu  (%rbx,%rsi), %xmm0                     // |  9 :v :v  :::    :: |  1 ^                |  0        |
    movdqu  16(%rbx,%rsi), %xmm1                   // |  9 :v :v  :::    :: |  2 :^               |  0        |
    movdqu  (%r14,%rsi), %xmm2                     // |  9 :: :v  :::    v: |  3 ::^              |  0        |
    pcmpeqb %xmm0, %xmm2                           // |  9 :: ::  :::    :: |  3 v:^              |  0        |
    movdqu  16(%r14,%rsi), %xmm0                   // |  9 :: :v  :::    v: |  2 ^:               |  0        |
    pcmpeqb %xmm1, %xmm0                           // |  9 :: ::  :::    :: |  2 ^v               |  0        |
    movdqa  .LCPI0_0(%rip), %xmm1                  // |  9 :: ::  :::    :: |  1  ^               |  0        |
    paddb   %xmm1, %xmm2                           // |  9 :: ::  :::    :: |  2  v^              |  0        |
    paddb   %xmm1, %xmm0                           // |  9 :: ::  :::    :: |  3 ^v:              |  0        |
    movdqu  %xmm2, (%rax,%rsi)                     // |  9 v: :v  :::    :: |  2 : v              |  0        |
    movdqu  %xmm0, 16(%rax,%rsi)                   // |  9 v: :v  :::    :: |  1 v                |  0        |
.LBB0_13:                                          // |                     |                     |           |
    cmpq    %r9, %rdx                              // |  8 :: v   ::v    :: |  0                  |  6 ^^^^^^ |
    je  .LBB0_18                                   // |  8 :: :   :::    :: |  0                  |  1  v     |
    testb   $24, %r9b                              // |  8 :: :   ::v    :: |  0                  |  6 ^^^^^^ |
    je  .LBB0_4                                    // |  8 :: :   :::    :: |  0                  |  1  v     |
.LBB0_15:                                          // |                     |                     |           |
    movq    %rdx, %rsi                             // |  9 :: v^  :::    :: |  0                  |  0        |
    movl    %r9d, %edx                             // |  9 :: ^:  ::v    :: |  0                  |  0        |
    andl    $-8, %edx                              // |  9 :: x:  :::    :: |  0                  |  5 ^^^^^  |
    movdqa  .LCPI0_1(%rip), %xmm0                  // |  9 :: ::  :::    :: |  1 ^                |  0        |
    .p2align    4, 0x90                            // |                     |                     |           |
.LBB0_16:                                          // |                     |                     |           |
    movq    (%rbx,%rsi), %xmm1                     // |  9 :v :v  :::    :: |  2 :^               |  0        |
    movq    (%r14,%rsi), %xmm2                     // |  9 :: :v  :::    v: |  3 ::^              |  0        |
    pcmpeqb %xmm1, %xmm2                           // |  9 :: ::  :::    :: |  3 :v^              |  0        |
    paddb   %xmm0, %xmm2                           // |  9 :: ::  :::    :: |  2 v ^              |  0        |
    movq    %xmm2, (%rax,%rsi)                     // |  9 v: :v  :::    :: |  1   v              |  0        |
    addq    $8, %rsi                               // |  9 :: :x  :::    :: |  0                  |  6 ^^^^^^ |
    cmpq    %rsi, %rdx                             // |  9 :: vv  :::    :: |  0                  |  6 ^^^^^^ |
    jne .LBB0_16                                   // |  8 :: :   :::    :: |  0                  |  1  v     |
    cmpq    %r9, %rdx                              // |  8 :: v   ::v    :: |  0                  |  6 ^^^^^^ |
    je  .LBB0_18                                   // |  8 :: :   :::    :: |  0                  |  1  v     |
    .p2align    4, 0x90                            // |                     |                     |           |
.LBB0_4:                                           // |                     |                     |           |
    movzbl  (%rbx,%rdx), %ecx                      // |  9 :v^v   :::    :: |  0                  |  0        |
    cmpb    (%r14,%rdx), %cl                       // |  8 : vv   :::    v: |  0                  |  6 ^^^^^^ |
    sete    %cl                                    // |  7 : x:   :::     : |  0                  |  1  v     |
    xorb    $49, %cl                               // |  7 : ^:   :::     : |  0                  |  5 ^^^^^  |
    movb    %cl, (%rax,%rdx)                       // |  7 v vv   :::     : |  0                  |  0        |
    incq    %rdx                                   // |  6 :  x   :::     : |  0                  |  5  ^^^^^ |
    cmpq    %rdx, %r9                              // |  6 :  v   ::v     : |  0                  |  6 ^^^^^^ |
    jne .LBB0_4                                    // |  4 :      ::      : |  0                  |  1  v     |
.LBB0_18:                                          // |                     |                     |           |
    movslq  %r15d, %rcx                            // |  5 : ^    ::      v |  0                  |  0        |
    movb    $0, (%rax,%rcx)                        // |  4 v v    ::        |  0                  |  0        |
.LBB0_19:                                          // |                     |                     |           |
    addq    $8, %rsp                               // |  2        x:        |  0                  |  6 ^^^^^^ |
    .cfi_def_cfa_offset 40                         // |                     |                     |           |
    popq    %rbx                                   // |  3  ^     x:        |  0                  |  0        |
    .cfi_def_cfa_offset 32                         // |                     |                     |           |
    popq    %r12                                   // |  3        x:   ^    |  0                  |  0        |
    .cfi_def_cfa_offset 24                         // |                     |                     |           |
    popq    %r14                                   // |  3        x:     ^  |  0                  |  0        |
    .cfi_def_cfa_offset 16                         // |                     |                     |           |
    popq    %r15                                   // |  3        x:      ^ |  0                  |  0        |
    .cfi_def_cfa_offset 8                          // |                     |                     |           |
    retq                                           // |  2        x:        |  0                  |  0        |
.LBB0_8:                                           // |                     |                     |           |
    .cfi_def_cfa_offset 48                         // |                     |                     |           |
    xorl    %esi, %esi                             // |  2     ^   :        |  0                  |  5 ^^^^^  |
    testb   $1, %r8b                               // |  1         v        |  0                  |  6 ^^^^^^ |
    jne .LBB0_12                                   // |  0                  |  0                  |  1  v     |
    jmp .LBB0_13                                   // |  0                  |  0                  |  0        |
.Lfunc_end0:                                       // |                     |                     |           |
    .size   func0, .Lfunc_end0-func0               // |                     |                     |           |
    .cfi_endproc                                   // |                     |                     |           |
    .ident  "clang version 15.0.4"                 // |                     |                     |           |
    .section    ".note.GNU-stack","",@progbits     // |                     |                     |           |
    .addrsig                                       // |                     |                     |           |
                                                   // +.....................+.....................+...........+
                                                   // Legend:
                                                   //     ^       : Register assignment (write)
                                                   //     v       : Register usage (read)
                                                   //     x       : Register usage and reassignment (R/W)
                                                   //     :       : Register in use (live)
                                                   //     <space> : Register not in use
                                                   //     #       : Number of occupied registers
