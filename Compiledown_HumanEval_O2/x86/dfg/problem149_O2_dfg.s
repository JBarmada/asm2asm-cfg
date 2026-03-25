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
    movq    %rdx, (%rsp)                            // |  2    v   v         |  0                  |  0        |
    movq    %rsi, %r15                              // |  3     v  :       ^ |  0                  |  0        |
    movq    %rdi, %r13                              // |  4      v :     ^ : |  0                  |  0        |
    leaq    .L.str(%rip), %rbx                      // |  4  ^     :     : : |  0                  |  0        |
    movq    %rbx, %rdi                              // |  5  v   ^ :     : : |  0                  |  0        |
    movq    %r13, %rsi                              // |  5  :  ^  :     v : |  0                  |  0        |
    callq   strcmp@PLT                              // |  4  :     x     : : |  0                  |  0        |
    xorl    %r12d, %r12d                            // |  5  :     :    ^: : |  0                  |  5 ^^^^^  |
    negl    %eax                                    // |  5 x:     :     : : |  0                  |  0        |
    movl    $0, %r14d                               // |  6 ::     :     :^: |  0                  |  0        |
    sbbl    %r14d, %r14d                            // |  6 ::     :     :^: |  0                  |  6 ^^^^^^ |
    movq    %rbx, %rdi                              // |  6 :v   ^ :     : : |  0                  |  0        |
    movq    %r15, %rsi                              // |  5 :   ^  :     : v |  0                  |  0        |
    callq   strcmp@PLT                              // |  4 :      x     : : |  0                  |  0        |
    negl    %eax                                    // |  4 x      :     : : |  0                  |  0        |
    sbbl    %r12d, %r12d                            // |  5 :      :    ^: : |  0                  |  6 ^^^^^^ |
    leaq    .L.str.1(%rip), %rbx                    // |  5 :^     :     : : |  0                  |  0        |
    movq    %rbx, %rdi                              // |  6 :v   ^ :     : : |  0                  |  0        |
    movq    %r13, %rsi                              // |  6 ::  ^  :     v : |  0                  |  0        |
    callq   strcmp@PLT                              // |  5 ::     x     : : |  0                  |  0        |
    testl   %eax, %eax                              // |  5 v:     :     : : |  0                  |  6 ^^^^^^ |
    movl    $1, %ebp                                // |  6 ::    ^:     : : |  0                  |  0        |
    cmovel  %ebp, %r14d                             // |  7 ::    v:     :^: |  0                  |  0        |
    movq    %rbx, %rdi                              // |  7 :v   ^::     : : |  0                  |  0        |
    movq    %r15, %rsi                              // |  6 :   ^ ::     : v |  0                  |  0        |
    callq   strcmp@PLT                              // |  5 :     :x     : : |  0                  |  0        |
    testl   %eax, %eax                              // |  5 v     ::     : : |  0                  |  6 ^^^^^^ |
    cmovel  %ebp, %r12d                             // |  6 :     v:    ^: : |  0                  |  0        |
    leaq    .L.str.2(%rip), %rbx                    // |  5 :^     :     : : |  0                  |  0        |
    movq    %rbx, %rdi                              // |  6 :v   ^ :     : : |  0                  |  0        |
    movq    %r13, %rsi                              // |  6 ::  ^  :     v : |  0                  |  0        |
    callq   strcmp@PLT                              // |  5 ::     x     : : |  0                  |  0        |
    testl   %eax, %eax                              // |  5 v:     :     : : |  0                  |  6 ^^^^^^ |
    movl    $2, %ebp                                // |  6 ::    ^:     : : |  0                  |  0        |
    cmovel  %ebp, %r14d                             // |  7 ::    v:     :^: |  0                  |  0        |
    movq    %rbx, %rdi                              // |  7 :v   ^::     : : |  0                  |  0        |
    movq    %r15, %rsi                              // |  6 :   ^ ::     : v |  0                  |  0        |
    callq   strcmp@PLT                              // |  5 :     :x     : : |  0                  |  0        |
    testl   %eax, %eax                              // |  5 v     ::     : : |  0                  |  6 ^^^^^^ |
    cmovel  %ebp, %r12d                             // |  6 :     v:    ^: : |  0                  |  0        |
    leaq    .L.str.3(%rip), %rbx                    // |  5 :^     :     : : |  0                  |  0        |
    movq    %rbx, %rdi                              // |  6 :v   ^ :     : : |  0                  |  0        |
    movq    %r13, %rsi                              // |  6 ::  ^  :     v : |  0                  |  0        |
    callq   strcmp@PLT                              // |  5 ::     x     : : |  0                  |  0        |
    testl   %eax, %eax                              // |  5 v:     :     : : |  0                  |  6 ^^^^^^ |
    movl    $3, %ebp                                // |  6 ::    ^:     : : |  0                  |  0        |
    cmovel  %ebp, %r14d                             // |  7 ::    v:     :^: |  0                  |  0        |
    movq    %rbx, %rdi                              // |  7 :v   ^::     : : |  0                  |  0        |
    movq    %r15, %rsi                              // |  6 :   ^ ::     : v |  0                  |  0        |
    callq   strcmp@PLT                              // |  5 :     :x     : : |  0                  |  0        |
    testl   %eax, %eax                              // |  5 v     ::     : : |  0                  |  6 ^^^^^^ |
    cmovel  %ebp, %r12d                             // |  6 :     v:    ^: : |  0                  |  0        |
    leaq    .L.str.4(%rip), %rbx                    // |  5 :^     :     : : |  0                  |  0        |
    movq    %rbx, %rdi                              // |  6 :v   ^ :     : : |  0                  |  0        |
    movq    %r13, %rsi                              // |  6 ::  ^  :     v : |  0                  |  0        |
    callq   strcmp@PLT                              // |  5 ::     x     : : |  0                  |  0        |
    testl   %eax, %eax                              // |  5 v:     :     : : |  0                  |  6 ^^^^^^ |
    movl    $4, %ebp                                // |  6 ::    ^:     : : |  0                  |  0        |
    cmovel  %ebp, %r14d                             // |  7 ::    v:     :^: |  0                  |  0        |
    movq    %rbx, %rdi                              // |  7 :v   ^::     : : |  0                  |  0        |
    movq    %r15, %rsi                              // |  6 :   ^ ::     : v |  0                  |  0        |
    callq   strcmp@PLT                              // |  5 :     :x     : : |  0                  |  0        |
    testl   %eax, %eax                              // |  5 v     ::     : : |  0                  |  6 ^^^^^^ |
    cmovel  %ebp, %r12d                             // |  6 :     v:    ^: : |  0                  |  0        |
    leaq    .L.str.5(%rip), %rbx                    // |  5 :^     :     : : |  0                  |  0        |
    movq    %rbx, %rdi                              // |  6 :v   ^ :     : : |  0                  |  0        |
    movq    %r13, %rsi                              // |  6 ::  ^  :     v : |  0                  |  0        |
    callq   strcmp@PLT                              // |  5 ::     x     : : |  0                  |  0        |
    testl   %eax, %eax                              // |  5 v:     :     : : |  0                  |  6 ^^^^^^ |
    movl    $5, %ebp                                // |  6 ::    ^:     : : |  0                  |  0        |
    cmovel  %ebp, %r14d                             // |  7 ::    v:     :^: |  0                  |  0        |
    movq    %rbx, %rdi                              // |  7 :v   ^::     : : |  0                  |  0        |
    movq    %r15, %rsi                              // |  6 :   ^ ::     : v |  0                  |  0        |
    callq   strcmp@PLT                              // |  5 :     :x     : : |  0                  |  0        |
    testl   %eax, %eax                              // |  5 v     ::     : : |  0                  |  6 ^^^^^^ |
    cmovel  %ebp, %r12d                             // |  6 :     v:    ^: : |  0                  |  0        |
    leaq    .L.str.6(%rip), %rbx                    // |  5 :^     :     : : |  0                  |  0        |
    movq    %rbx, %rdi                              // |  6 :v   ^ :     : : |  0                  |  0        |
    movq    %r13, %rsi                              // |  6 ::  ^  :     v : |  0                  |  0        |
    callq   strcmp@PLT                              // |  5 ::     x     : : |  0                  |  0        |
    testl   %eax, %eax                              // |  5 v:     :     : : |  0                  |  6 ^^^^^^ |
    movl    $6, %ebp                                // |  6 ::    ^:     : : |  0                  |  0        |
    cmovel  %ebp, %r14d                             // |  7 ::    v:     :^: |  0                  |  0        |
    movq    %rbx, %rdi                              // |  7 :v   ^::     : : |  0                  |  0        |
    movq    %r15, %rsi                              // |  6 :   ^ ::     : v |  0                  |  0        |
    callq   strcmp@PLT                              // |  5 :     :x     : : |  0                  |  0        |
    testl   %eax, %eax                              // |  5 v     ::     : : |  0                  |  6 ^^^^^^ |
    cmovel  %ebp, %r12d                             // |  6 :     v:    ^: : |  0                  |  0        |
    leaq    .L.str.7(%rip), %rbx                    // |  5 :^     :     : : |  0                  |  0        |
    movq    %rbx, %rdi                              // |  6 :v   ^ :     : : |  0                  |  0        |
    movq    %r13, %rsi                              // |  6 ::  ^  :     v : |  0                  |  0        |
    callq   strcmp@PLT                              // |  4 ::     x       : |  0                  |  0        |
    testl   %eax, %eax                              // |  4 v:     :       : |  0                  |  6 ^^^^^^ |
    movl    $7, %ebp                                // |  5 ::    ^:       : |  0                  |  0        |
    cmovel  %ebp, %r14d                             // |  6 ::    v:      ^: |  0                  |  0        |
    movq    %rbx, %rdi                              // |  7 :v   ^::      :: |  0                  |  0        |
    movq    %r15, %rsi                              // |  6 :   ^ ::      :v |  0                  |  0        |
    callq   strcmp@PLT                              // |  4 :     :x      :  |  0                  |  0        |
    movq    (%rsp), %rcx                            // |  5 : ^   :v      :  |  0                  |  0        |
    testl   %eax, %eax                              // |  5 v :   ::      :  |  0                  |  6 ^^^^^^ |
    cmovel  %ebp, %r12d                             // |  5   :   v:    ^ :  |  0                  |  0        |
    cmpl    $-1, %r14d                              // |  4   :    :    : v  |  0                  |  6 ^^^^^^ |
    je  .LBB0_7                                     // |  4   :    :    : :  |  0                  |  1  v     |
    cmpl    $-1, %r12d                              // |  4   :    :    v :  |  0                  |  6 ^^^^^^ |
    je  .LBB0_7                                     // |  4   :    :    : :  |  0                  |  1  v     |
    cmpl    %r12d, %r14d                            // |  4   :    :    v v  |  0                  |  6 ^^^^^^ |
    je  .LBB0_7                                     // |  4   :    :    : :  |  0                  |  1  v     |
    movl    %r12d, %r15d                            // |  5   :    :    v :^ |  0                  |  0        |
    cmovgl  %r14d, %r15d                            // |  4   :    :      v^ |  0                  |  0        |
    cmovll  %r14d, %r12d                            // |  5   :    :    ^ v: |  0                  |  0        |
    movl    %r12d, %eax                             // |  5 ^ :    :    v  : |  0                  |  0        |
    notl    %eax                                    // |  5 x :    :    :  : |  0                  |  0        |
    addl    %r15d, %eax                             // |  5 x :    :    :  v |  0                  |  6 ^^^^^^ |
    movl    %eax, (%rcx)                            // |  5 v v    :    :  : |  0                  |  3  :::   |
    jle .LBB0_7                                     // |  4 :      :    :  : |  0                  |  3  vvv   |
    movl    %eax, %edi                              // |  5 v    ^ :    :  : |  0                  |  0        |
    shlq    $3, %rdi                                // |  5 :    x :    :  : |  0                  |  5 ^^^^^  |
    callq   malloc@PLT                              // |  4 :      x    :  : |  0                  |  0        |
    leal    1(%r12), %ecx                           // |  5 : ^    :    v  : |  0                  |  0        |
    cmpl    %r15d, %ecx                             // |  5 : v    :    :  v |  0                  |  6 ^^^^^^ |
    jae .LBB0_8                                     // |  5 : :    :    :  : |  0                  |  1 v      |
    movl    %ecx, %ebx                              // |  6 :^v    :    :  : |  0                  |  0        |
    movl    %r15d, %ecx                             // |  6 ::^    :    :  v |  0                  |  0        |
    subl    %r12d, %ecx                             // |  5 ::x    :    v    |  0                  |  6 ^^^^^^ |
    leal    -2(%rcx), %r10d                         // |  6 ::v    :  ^ :    |  0                  |  0        |
    cmpl    $5, %r10d                               // |  6 :::    :  v :    |  0                  |  6 ^^^^^^ |
    jb  .LBB0_17                                    // |  6 :::    :  : :    |  0                  |  1 v      |
    addl    $-2, %ecx                               // |  6 ::x    :  : :    |  0                  |  6 ^^^^^^ |
    js  .LBB0_17                                    // |  5 ::     :  : :    |  0                  |  1   v    |
    incq    %r10                                    // |  5 ::     :  x :    |  0                  |  5  ^^^^^ |
    movq    %r10, %r8                               // |  6 ::     :^ v :    |  0                  |  0        |
    andq    $-4, %r8                                // |  6 ::     :x : :    |  0                  |  5 ^^^^^  |
    leaq    -4(%r8), %rcx                           // |  7 ::^    :v : :    |  0                  |  0        |
    movq    %rcx, %r9                               // |  8 ::v    ::^: :    |  0                  |  0        |
    shrq    $2, %r9                                 // |  8 :::    ::x: :    |  0                  |  5 ^^^^^  |
    incq    %r9                                     // |  8 :::    ::x: :    |  0                  |  5  ^^^^^ |
    testq   %rcx, %rcx                              // |  8 ::v    :::: :    |  0                  |  6 ^^^^^^ |
    je  .LBB0_23                                    // |  7 ::     :::: :    |  0                  |  1  v     |
    movq    %r9, %rdi                               // |  8 ::   ^ ::v: :    |  0                  |  0        |
    andq    $-2, %rdi                               // |  8 ::   x :::: :    |  0                  |  5 ^^^^^  |
    leaq    .L__const.func0.planets(%rip), %rcx     // |  9 ::^  : :::: :    |  0                  |  0        |
    leaq    (%rcx,%rbx,8), %rdx                     // | 10 :vv^ : :::: :    |  0                  |  0        |
    addq    $48, %rdx                               // |  9 :: x : :::: :    |  0                  |  6 ^^^^^^ |
    xorl    %ebp, %ebp                              // | 10 :: : :^:::: :    |  0                  |  5 ^^^^^  |
    movabsq $17179869184, %r11                      // | 11 :: : ::::::^:    |  0                  |  0        |
    movabsq $34359738368, %r14                      // | 12 :: : :::::::: ^  |  0                  |  0        |
    xorl    %esi, %esi                              // | 13 :: :^:::::::: :  |  0                  |  5 ^^^^^  |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_12:                                           // |                     |                     |           |
    movq    %rbp, %rcx                              // | 14 ::^:::v:::::: :  |  0                  |  0        |
    sarq    $29, %rcx                               // | 14 ::^:::::::::: :  |  0                  |  5 ^^^^^  |
    movups  -48(%rdx,%rsi,8), %xmm0                 // | 14 :::vv:::::::: :  |  1 ^                |  0        |
    movups  -32(%rdx,%rsi,8), %xmm1                 // | 14 :::vv:::::::: :  |  2 :^               |  0        |
    movups  -16(%rdx,%rsi,8), %xmm2                 // | 14 :::vv:::::::: :  |  3 ::^              |  0        |
    movups  (%rdx,%rsi,8), %xmm3                    // | 14 :::vv:::::::: :  |  4 :::^             |  0        |
    movups  %xmm0, (%rax,%rcx)                      // | 13 v:v ::::::::: :  |  4 v:::             |  0        |
    movups  %xmm1, 16(%rax,%rcx)                    // | 13 v:v ::::::::: :  |  3  v::             |  0        |
    leaq    (%r11,%rbp), %rcx                       // | 13 ::^ ::v::::v: :  |  2   ::             |  0        |
    sarq    $29, %rcx                               // | 12 ::^ ::::::: : :  |  2   ::             |  5 ^^^^^  |
    movups  %xmm2, (%rax,%rcx)                      // | 12 v:v ::::::: : :  |  2   v:             |  0        |
    movups  %xmm3, 16(%rax,%rcx)                    // | 12 v:v ::::::: : :  |  1    v             |  0        |
    addq    $8, %rsi                                // | 11 ::  x:::::: : :  |  0                  |  6 ^^^^^^ |
    addq    %r14, %rbp                              // | 11 ::  ::x:::: : v  |  0                  |  6 ^^^^^^ |
    addq    $-2, %rdi                               // |  9 ::  :x :::: :    |  0                  |  6 ^^^^^^ |
    jne .LBB0_12                                    // |  8 ::  :  :::: :    |  0                  |  1  v     |
    testb   $1, %r9b                                // |  8 ::  :  ::v: :    |  0                  |  6 ^^^^^^ |
    je  .LBB0_15                                    // |  8 ::  :  :::: :    |  0                  |  1  v     |
.LBB0_14:                                           // |                     |                     |           |
    leaq    (%rsi,%rbx), %rcx                       // |  9 :v^ v  :::: :    |  0                  |  0        |
    leaq    .L__const.func0.planets(%rip), %rdx     // | 10 :::^:  :::: :    |  0                  |  0        |
    movups  (%rdx,%rcx,8), %xmm0                    // | 10 ::vv:  :::: :    |  1 ^                |  0        |
    movups  16(%rdx,%rcx,8), %xmm1                  // | 10 ::vv:  :::: :    |  2 :^               |  0        |
    movslq  %esi, %rcx                              // |  9 ::^ v  :::: :    |  2 ::               |  0        |
    movups  %xmm0, (%rax,%rcx,8)                    // |  8 v:v    :::: :    |  2 v:               |  0        |
    movups  %xmm1, 16(%rax,%rcx,8)                  // |  8 v:v    :::: :    |  1  v               |  0        |
.LBB0_15:                                           // |                     |                     |           |
    cmpq    %r8, %r10                               // |  7  ::    :v:v :    |  0                  |  6 ^^^^^^ |
    je  .LBB0_8                                     // |  6  ::    :::  :    |  0                  |  1  v     |
    addq    %r8, %rbx                               // |  6  x:    :v:  :    |  0                  |  6 ^^^^^^ |
    leal    (%r12,%r8), %edx                        // |  6   :^   :v:  v    |  0                  |  0        |
    jmp .LBB0_18                                    // |  3   :    : :       |  0                  |  0        |
.LBB0_7:                                            // |                     |                     |           |
    movl    $0, (%rcx)                              // |  3   v    : :       |  0                  |  0        |
    xorl    %eax, %eax                              // |  3 ^      : :       |  0                  |  5 ^^^^^  |
.LBB0_8:                                            // |                     |                     |           |
    addq    $8, %rsp                                // |  3 :      x :       |  0                  |  6 ^^^^^^ |
    .cfi_def_cfa_offset 56                          // |                     |                     |           |
    popq    %rbx                                    // |  4 :^     x :       |  0                  |  0        |
    .cfi_def_cfa_offset 48                          // |                     |                     |           |
    popq    %r12                                    // |  5 ::     x :  ^    |  0                  |  0        |
    .cfi_def_cfa_offset 40                          // |                     |                     |           |
    popq    %r13                                    // |  6 ::     x :  :^   |  0                  |  0        |
    .cfi_def_cfa_offset 32                          // |                     |                     |           |
    popq    %r14                                    // |  6 ::     x :  : ^  |  0                  |  0        |
    .cfi_def_cfa_offset 24                          // |                     |                     |           |
    popq    %r15                                    // |  6 ::     x :  :  ^ |  0                  |  0        |
    .cfi_def_cfa_offset 16                          // |                     |                     |           |
    popq    %rbp                                    // |  7 ::    ^x :  :  : |  0                  |  0        |
    .cfi_def_cfa_offset 8                           // |                     |                     |           |
    retq                                            // |  6 ::     x :  :  : |  0                  |  0        |
.LBB0_17:                                           // |                     |                     |           |
    .cfi_def_cfa_offset 64                          // |                     |                     |           |
    movl    %r12d, %edx                             // |  6 :: ^     :  v  : |  0                  |  0        |
.LBB0_18:                                           // |                     |                     |           |
    movl    %r15d, %esi                             // |  7 :: :^    :  :  v |  0                  |  0        |
    subl    %ebx, %esi                              // |  7 :v :x    :  :  : |  0                  |  6 ^^^^^^ |
    leal    1(%rbx), %ecx                           // |  8 :v^::    :  :  : |  0                  |  0        |
    testb   $1, %sil                                // |  8 ::::v    :  :  : |  0                  |  6 ^^^^^^ |
    je  .LBB0_20                                    // |  7 ::::     :  :  : |  0                  |  1  v     |
    leaq    .L__const.func0.planets(%rip), %rsi     // |  8 ::::^    :  :  : |  0                  |  0        |
    movq    (%rsi,%rbx,8), %rsi                     // |  8 :v::^    :  :  : |  0                  |  0        |
    subl    %r12d, %edx                             // |  8 :::x:    :  v  : |  0                  |  6 ^^^^^^ |
    movslq  %edx, %rdx                              // |  8 :::^:    :  :  : |  0                  |  0        |
    movq    %rsi, (%rax,%rdx,8)                     // |  8 v::vv    :  :  : |  0                  |  0        |
    movl    %ebx, %edx                              // |  7 :v:^     :  :  : |  0                  |  0        |
    incq    %rbx                                    // |  7 :x::     :  :  : |  0                  |  5  ^^^^^ |
.LBB0_20:                                           // |                     |                     |           |
    cmpl    %ecx, %r15d                             // |  7 ::v:     :  :  v |  0                  |  6 ^^^^^^ |
    je  .LBB0_8                                     // |  6 :: :     :  :  : |  0                  |  1  v     |
    movl    %r12d, %esi                             // |  7 :: :^    :  v  : |  0                  |  0        |
    negl    %esi                                    // |  7 :: :x    :  :  : |  0                  |  0        |
    leaq    .L__const.func0.planets(%rip), %r8      // |  8 :: ::   ^:  :  : |  0                  |  0        |
    movq    %rbx, %rcx                              // |  9 :v^::   ::  :  : |  0                  |  0        |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_22:                                           // |                     |                     |           |
    subl    %r12d, %edx                             // |  9 :::x:   ::  v  : |  0                  |  6 ^^^^^^ |
    movslq  %edx, %rdx                              // |  8 :::^:   ::     : |  0                  |  0        |
    movq    (%r8,%rbx,8), %rbp                      // |  9 :v::: ^ v:     : |  0                  |  0        |
    movq    8(%r8,%rbx,8), %rdi                     // | 10 :v:::^: v:     : |  0                  |  0        |
    movq    %rbp, (%rax,%rdx,8)                     // |  9 v::v::v  :     : |  0                  |  0        |
    leal    (%rsi,%rbx), %edx                       // |  8 :v:^v:   :     : |  0                  |  0        |
    movslq  %edx, %rdx                              // |  7 :::^ :   :     : |  0                  |  0        |
    movq    %rdi, (%rax,%rdx,8)                     // |  7 v::v v   :     : |  0                  |  0        |
    addq    $2, %rcx                                // |  4  :x      :     : |  0                  |  6 ^^^^^^ |
    leal    1(%rbx), %edx                           // |  5  v:^     :     : |  0                  |  0        |
    movq    %rcx, %rbx                              // |  4  ^v      :     : |  0                  |  0        |
    cmpl    %ecx, %r15d                             // |  3   v      :     v |  0                  |  6 ^^^^^^ |
    jne .LBB0_22                                    // |  1          :       |  0                  |  1  v     |
    jmp .LBB0_8                                     // |  1          :       |  0                  |  0        |
.LBB0_23:                                           // |                     |                     |           |
    xorl    %esi, %esi                              // |  2     ^    :       |  0                  |  5 ^^^^^  |
    testb   $1, %r9b                                // |  1          v       |  0                  |  6 ^^^^^^ |
    jne .LBB0_14                                    // |  0                  |  0                  |  1  v     |
    jmp .LBB0_15                                    // |  0                  |  0                  |  0        |
.Lfunc_end0:                                        // |                     |                     |           |
    .size   func0, .Lfunc_end0-func0                // |                     |                     |           |
    .cfi_endproc                                    // |                     |                     |           |
    .type   .L.str,@object                          // |                     |                     |           |
    .section    .rodata.str1.1,"aMS",@progbits,1    // |                     |                     |           |
.L.str:                                             // |                     |                     |           |
    .asciz  "Mercury"                               // |                     |                     |           |
    .size   .L.str, 8                               // |                     |                     |           |
    .type   .L.str.1,@object                        // |                     |                     |           |
.L.str.1:                                           // |                     |                     |           |
    .asciz  "Venus"                                 // |                     |                     |           |
    .size   .L.str.1, 6                             // |                     |                     |           |
    .type   .L.str.2,@object                        // |                     |                     |           |
.L.str.2:                                           // |                     |                     |           |
    .asciz  "Earth"                                 // |                     |                     |           |
    .size   .L.str.2, 6                             // |                     |                     |           |
    .type   .L.str.3,@object                        // |                     |                     |           |
.L.str.3:                                           // |                     |                     |           |
    .asciz  "Mars"                                  // |                     |                     |           |
    .size   .L.str.3, 5                             // |                     |                     |           |
    .type   .L.str.4,@object                        // |                     |                     |           |
.L.str.4:                                           // |                     |                     |           |
    .asciz  "Jupiter"                               // |                     |                     |           |
    .size   .L.str.4, 8                             // |                     |                     |           |
    .type   .L.str.5,@object                        // |                     |                     |           |
.L.str.5:                                           // |                     |                     |           |
    .asciz  "Saturn"                                // |                     |                     |           |
    .size   .L.str.5, 7                             // |                     |                     |           |
    .type   .L.str.6,@object                        // |                     |                     |           |
.L.str.6:                                           // |                     |                     |           |
    .asciz  "Uranus"                                // |                     |                     |           |
    .size   .L.str.6, 7                             // |                     |                     |           |
    .type   .L.str.7,@object                        // |                     |                     |           |
.L.str.7:                                           // |                     |                     |           |
    .asciz  "Neptune"                               // |                     |                     |           |
    .size   .L.str.7, 8                             // |                     |                     |           |
    .type   .L__const.func0.planets,@object         // |                     |                     |           |
    .section    .data.rel.ro,"aw",@progbits         // |                     |                     |           |
    .p2align    4                                   // |                     |                     |           |
.L__const.func0.planets:                            // |                     |                     |           |
    .quad   .L.str                                  // |                     |                     |           |
    .quad   .L.str.1                                // |                     |                     |           |
    .quad   .L.str.2                                // |                     |                     |           |
    .quad   .L.str.3                                // |                     |                     |           |
    .quad   .L.str.4                                // |                     |                     |           |
    .quad   .L.str.5                                // |                     |                     |           |
    .quad   .L.str.6                                // |                     |                     |           |
    .quad   .L.str.7                                // |                     |                     |           |
    .size   .L__const.func0.planets, 64             // |                     |                     |           |
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
