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
    .section    .rodata.cst16,"aM",@progbits,16     // |                     |                     |           |
    .p2align    4                                   // |                     |                     |           |
.LCPI0_0:                                           // |                     |                     |           |
    .byte   208                                     // |                     |                     |           |
    .byte   208                                     // |                     |                     |           |
    .byte   208                                     // |                     |                     |           |
    .byte   208                                     // |                     |                     |           |
    .zero   1                                       // |                     |                     |           |
    .zero   1                                       // |                     |                     |           |
    .zero   1                                       // |                     |                     |           |
    .zero   1                                       // |                     |                     |           |
    .zero   1                                       // |                     |                     |           |
    .zero   1                                       // |                     |                     |           |
    .zero   1                                       // |                     |                     |           |
    .zero   1                                       // |                     |                     |           |
    .zero   1                                       // |                     |                     |           |
    .zero   1                                       // |                     |                     |           |
    .zero   1                                       // |                     |                     |           |
    .zero   1                                       // |                     |                     |           |
.LCPI0_1:                                           // |                     |                     |           |
    .byte   10                                      // |                     |                     |           |
    .byte   10                                      // |                     |                     |           |
    .byte   10                                      // |                     |                     |           |
    .byte   10                                      // |                     |                     |           |
    .zero   1                                       // |                     |                     |           |
    .zero   1                                       // |                     |                     |           |
    .zero   1                                       // |                     |                     |           |
    .zero   1                                       // |                     |                     |           |
    .zero   1                                       // |                     |                     |           |
    .zero   1                                       // |                     |                     |           |
    .zero   1                                       // |                     |                     |           |
    .zero   1                                       // |                     |                     |           |
    .zero   1                                       // |                     |                     |           |
    .zero   1                                       // |                     |                     |           |
    .zero   1                                       // |                     |                     |           |
    .zero   1                                       // |                     |                     |           |
.LCPI0_2:                                           // |                     |                     |           |
    .long   1                                       // |                     |                     |           |
    .long   1                                       // |                     |                     |           |
    .long   1                                       // |                     |                     |           |
    .long   1                                       // |                     |                     |           |
.LCPI0_3:                                           // |                     |                     |           |
    .byte   46                                      // |                     |                     |           |
    .byte   46                                      // |                     |                     |           |
    .byte   46                                      // |                     |                     |           |
    .byte   46                                      // |                     |                     |           |
    .zero   1                                       // |                     |                     |           |
    .zero   1                                       // |                     |                     |           |
    .zero   1                                       // |                     |                     |           |
    .zero   1                                       // |                     |                     |           |
    .zero   1                                       // |                     |                     |           |
    .zero   1                                       // |                     |                     |           |
    .zero   1                                       // |                     |                     |           |
    .zero   1                                       // |                     |                     |           |
    .zero   1                                       // |                     |                     |           |
    .zero   1                                       // |                     |                     |           |
    .zero   1                                       // |                     |                     |           |
    .zero   1                                       // |                     |                     |           |
    .text                                           // |                     |                     |           |
    .globl  func0                                   // |                     |                     |           |
    .p2align    4, 0x90                             // |                     |                     |           |
    .type   func0,@function                         // |                     |                     |           |
func0:                                              // |                     |                     |           |
    .cfi_startproc                                  // |                     |                     |           |
    pushq   %r15                                    // |  2        x       v |  0                  |  0        |
    .cfi_def_cfa_offset 16                          // |                     |                     |           |
    pushq   %r14                                    // |  2        x      v  |  0                  |  0        |
    .cfi_def_cfa_offset 24                          // |                     |                     |           |
    pushq   %r12                                    // |  2        x    v    |  0                  |  0        |
    .cfi_def_cfa_offset 32                          // |                     |                     |           |
    pushq   %rbx                                    // |  2  v     x         |  0                  |  0        |
    .cfi_def_cfa_offset 40                          // |                     |                     |           |
    pushq   %rax                                    // |  2 v      x         |  0                  |  0        |
    .cfi_def_cfa_offset 48                          // |                     |                     |           |
    .cfi_offset %rbx, -40                           // |                     |                     |           |
    .cfi_offset %r12, -32                           // |                     |                     |           |
    .cfi_offset %r14, -24                           // |                     |                     |           |
    .cfi_offset %r15, -16                           // |                     |                     |           |
    movq    %rdi, %r15                              // |  3      v :       ^ |  0                  |  0        |
    callq   strlen@PLT                              // |  2        x       : |  0                  |  0        |
    movq    %rax, %r14                              // |  4 v      :      ^: |  0                  |  0        |
    leaq    .L.str(%rip), %rbx                      // |  4  ^     :      :: |  0                  |  0        |
    cmpl    $5, %r14d                               // |  4  :     :      v: |  0                  |  6 ^^^^^^ |
    jl  .LBB0_14                                    // |  3  :     :       : |  0                  |  2   vv   |
    movzbl  (%r15), %eax                            // |  4 ^:     :       v |  0                  |  0        |
    cmpb    $65, %al                                // |  3 v:     :         |  0                  |  6 ^^^^^^ |
    jl  .LBB0_14                                    // |  3 ::     :         |  0                  |  2   vv   |
    addl    $-91, %eax                              // |  3 x:     :         |  0                  |  6 ^^^^^^ |
    cmpl    $36, %eax                               // |  3 v:     :         |  0                  |  6 ^^^^^^ |
    ja  .LBB0_4                                     // |  3 ::     :         |  0                  |  2 vv     |
    movabsq $133143986239, %rcx                     // |  4 ::^    :         |  0                  |  1 :      |
    btq %rax, %rcx                                  // |  4 v:^    :         |  0                  |  1 :      |
    jae .LBB0_4                                     // |  2  :     :         |  0                  |  1 v      |
.LBB0_14:                                           // |                     |                     |           |
    movq    %rbx, %rax                              // |  3 ^v     :         |  0                  |  0        |
    addq    $8, %rsp                                // |  1        x         |  0                  |  6 ^^^^^^ |
    .cfi_def_cfa_offset 40                          // |                     |                     |           |
    popq    %rbx                                    // |  2  ^     x         |  0                  |  0        |
    .cfi_def_cfa_offset 32                          // |                     |                     |           |
    popq    %r12                                    // |  2        x    ^    |  0                  |  0        |
    .cfi_def_cfa_offset 24                          // |                     |                     |           |
    popq    %r14                                    // |  2        x      ^  |  0                  |  0        |
    .cfi_def_cfa_offset 16                          // |                     |                     |           |
    popq    %r15                                    // |  3        x      :^ |  0                  |  0        |
    .cfi_def_cfa_offset 8                           // |                     |                     |           |
    retq                                            // |  3        x      :: |  0                  |  0        |
.LBB0_4:                                            // |                     |                     |           |
    .cfi_def_cfa_offset 48                          // |                     |                     |           |
    movl    %r14d, %eax                             // |  4 ^      :      v: |  0                  |  0        |
    leaq    (%r15,%rax), %r12                       // |  5 v      :    ^ :v |  0                  |  0        |
    addq    $-4, %r12                               // |  5 :      :    x :: |  0                  |  6 ^^^^^^ |
    leaq    .L.str.1(%rip), %rsi                    // |  6 :   ^  :    : :: |  0                  |  0        |
    movq    %r12, %rdi                              // |  6 :    ^ :    v :: |  0                  |  0        |
    callq   strcmp@PLT                              // |  5 :      x    : :: |  0                  |  0        |
    testl   %eax, %eax                              // |  5 v      :    : :: |  0                  |  6 ^^^^^^ |
    je  .LBB0_7                                     // |  5 :      :    : :: |  0                  |  1  v     |
    leaq    .L.str.2(%rip), %rsi                    // |  6 :   ^  :    : :: |  0                  |  0        |
    movq    %r12, %rdi                              // |  6 :    ^ :    v :: |  0                  |  0        |
    callq   strcmp@PLT                              // |  5 :      x    : :: |  0                  |  0        |
    testl   %eax, %eax                              // |  5 v      :    : :: |  0                  |  6 ^^^^^^ |
    je  .LBB0_7                                     // |  5 :      :    : :: |  0                  |  1  v     |
    leaq    .L.str.3(%rip), %rsi                    // |  6 :   ^  :    : :: |  0                  |  0        |
    movq    %r12, %rdi                              // |  6 :    ^ :    v :: |  0                  |  0        |
    callq   strcmp@PLT                              // |  4 :      x      :: |  0                  |  0        |
    testl   %eax, %eax                              // |  3 v             :: |  0                  |  6 ^^^^^^ |
    jne .LBB0_14                                    // |  2               :: |  0                  |  1  v     |
.LBB0_7:                                            // |                     |                     |           |
    movl    %r14d, %eax                             // |  3 ^             v: |  0                  |  0        |
    cmpq    $8, %rax                                // |  3 v             :: |  0                  |  6 ^^^^^^ |
    jae .LBB0_10                                    // |  3 :             :: |  0                  |  1 v      |
    xorl    %ecx, %ecx                              // |  4 : ^           :: |  0                  |  5 ^^^^^  |
    xorl    %esi, %esi                              // |  4 :   ^         :: |  0                  |  5 ^^^^^  |
    xorl    %edx, %edx                              // |  4 :  ^          :: |  0                  |  5 ^^^^^  |
    jmp .LBB0_9                                     // |  3 :             :: |  0                  |  0        |
.LBB0_10:                                           // |                     |                     |           |
    andl    $7, %r14d                               // |  3 :             x: |  0                  |  5 ^^^^^  |
    movq    %rax, %rcx                              // |  4 v ^           :: |  0                  |  0        |
    subq    %r14, %rcx                              // |  4 : x           v: |  0                  |  6 ^^^^^^ |
    pxor    %xmm13, %xmm13                          // |  4 : :           :: |  1              ^   |  0        |
    xorl    %edx, %edx                              // |  5 : :^          :: |  0                  |  5 ^^^^^  |
    movdqa  .LCPI0_0(%rip), %xmm8                   // |  5 : ::          :: |  1         ^        |  0        |
    movdqa  .LCPI0_1(%rip), %xmm9                   // |  5 : ::          :: |  2         :^       |  0        |
    pcmpeqd %xmm10, %xmm10                          // |  5 : ::          :: |  3         ::^      |  0        |
    movdqa  .LCPI0_2(%rip), %xmm12                  // |  5 : ::          :: |  4         ::: ^    |  0        |
    movdqa  .LCPI0_3(%rip), %xmm11                  // |  5 : ::          :: |  5         :::^:    |  0        |
    pxor    %xmm1, %xmm1                            // |  5 : ::          :: |  6  ^      :::::    |  0        |
    pxor    %xmm2, %xmm2                            // |  5 : ::          :: |  6   ^     :::::    |  0        |
    pxor    %xmm6, %xmm6                            // |  5 : ::          :: |  6       ^ :::::    |  0        |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_11:                                           // |                     |                     |           |
    movd    (%r15,%rdx), %xmm4                      // |  5 : :v          :v |  6     ^   :::::    |  0        |
    movd    4(%r15,%rdx), %xmm3                     // |  5 : :v          :v |  7    ^:   :::::    |  0        |
    movdqa  %xmm4, %xmm0                            // |  5 : ::          :: |  8 ^  :v   :::::    |  0        |
    paddb   %xmm8, %xmm0                            // |  5 : ::          :: |  7 ^  :    v::::    |  0        |
    movdqa  %xmm3, %xmm5                            // |  5 : ::          :: |  8 :  v ^  :::::    |  0        |
    paddb   %xmm8, %xmm5                            // |  5 : ::          :: |  7 :    ^  v::::    |  0        |
    movdqa  %xmm0, %xmm7                            // |  5 : ::          :: |  7 v    : ^ ::::    |  0        |
    pmaxub  %xmm9, %xmm7                            // |  5 : ::          :: |  7 :    : ^ v:::    |  0        |
    pcmpeqb %xmm0, %xmm7                            // |  5 : ::          :: |  7 v    : ^ ::::    |  0        |
    pxor    %xmm10, %xmm7                           // |  5 : ::          :: |  6      : ^ :v::    |  0        |
    punpcklbw   %xmm7, %xmm7                        // |  5 : ::          :: |  6      : ^ ::::    |  0        |
    punpcklwd   %xmm7, %xmm7                        // |  5 : ::          :: |  6      : ^ ::::    |  0        |
    pand    %xmm12, %xmm7                           // |  5 : ::          :: |  6      : ^ :::v    |  0        |
    paddd   %xmm7, %xmm13                           // |  5 : ::          :: |  7      : v ::::^   |  0        |
    movdqa  %xmm5, %xmm0                            // |  5 : ::          :: |  7 ^    v   :::::   |  0        |
    pmaxub  %xmm9, %xmm0                            // |  5 : ::          :: |  7 ^    :   v::::   |  0        |
    pcmpeqb %xmm5, %xmm0                            // |  5 : ::          :: |  6 ^    v    ::::   |  0        |
    pxor    %xmm10, %xmm0                           // |  5 : ::          :: |  5 ^         v:::   |  0        |
    punpcklbw   %xmm0, %xmm0                        // |  5 : ::          :: |  4 ^          :::   |  0        |
    punpcklwd   %xmm0, %xmm0                        // |  5 : ::          :: |  4 ^          :::   |  0        |
    pand    %xmm12, %xmm0                           // |  5 : ::          :: |  4 ^          :v:   |  0        |
    paddd   %xmm0, %xmm1                            // |  5 : ::          :: |  5 v^         :::   |  0        |
    pcmpeqb %xmm11, %xmm4                           // |  5 : ::          :: |  4     ^      v::   |  0        |
    punpcklbw   %xmm4, %xmm4                        // |  5 : ::          :: |  4     ^      :::   |  0        |
    punpcklwd   %xmm4, %xmm4                        // |  5 : ::          :: |  4     ^      :::   |  0        |
    pand    %xmm12, %xmm4                           // |  5 : ::          :: |  4     ^      :v:   |  0        |
    paddd   %xmm4, %xmm2                            // |  5 : ::          :: |  5   ^ v      :::   |  0        |
    pcmpeqb %xmm11, %xmm3                           // |  5 : ::          :: |  5   :^       v::   |  0        |
    punpcklbw   %xmm3, %xmm3                        // |  5 : ::          :: |  4   :^        ::   |  0        |
    punpcklwd   %xmm3, %xmm3                        // |  5 : ::          :: |  4   :^        ::   |  0        |
    pand    %xmm12, %xmm3                           // |  5 : ::          :: |  4   :^        v:   |  0        |
    paddd   %xmm3, %xmm6                            // |  5 : ::          :: |  4   :v  ^      :   |  0        |
    addq    $8, %rdx                                // |  5 : :x          :: |  2   :          :   |  6 ^^^^^^ |
    cmpq    %rdx, %rcx                              // |  5 : vv          :: |  2   :          :   |  6 ^^^^^^ |
    jne .LBB0_11                                    // |  4 : :           :: |  2   :          :   |  1  v     |
    paddd   %xmm2, %xmm6                            // |  4 : :           :: |  3   v   ^      :   |  0        |
    pshufd  $238, %xmm6, %xmm0                      // |  4 : :           :: |  2       :      :   |  0        |
    paddd   %xmm6, %xmm0                            // |  4 : :           :: |  3 ^     v      :   |  0        |
    pshufd  $85, %xmm0, %xmm2                       // |  4 : :           :: |  2 :            :   |  0        |
    paddd   %xmm0, %xmm2                            // |  4 : :           :: |  3 v ^          :   |  0        |
    movd    %xmm2, %edx                             // |  5 : :^          :: |  2   v          :   |  0        |
    paddd   %xmm13, %xmm1                           // |  5 : ::          :: |  2  ^           v   |  0        |
    pshufd  $238, %xmm1, %xmm0                      // |  5 : ::          :: |  1  :               |  0        |
    paddd   %xmm1, %xmm0                            // |  5 : ::          :: |  2 ^v               |  0        |
    pshufd  $85, %xmm0, %xmm1                       // |  5 : ::          :: |  1 :                |  0        |
    paddd   %xmm0, %xmm1                            // |  5 : ::          :: |  2 v^               |  0        |
    movd    %xmm1, %esi                             // |  6 : ::^         :: |  1  v               |  0        |
    testq   %r14, %r14                              // |  5 : ::          v: |  0                  |  6 ^^^^^^ |
    je  .LBB0_13                                    // |  4 : ::           : |  0                  |  1  v     |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_9:                                            // |                     |                     |           |
    movzbl  (%r15,%rcx), %edi                       // |  5 : v: ^         v |  0                  |  0        |
    leal    -48(%rdi), %ebx                         // |  5 :^:: v           |  0                  |  0        |
    cmpb    $10, %bl                                // |  5 :v:: :           |  0                  |  6 ^^^^^^ |
    adcl    $0, %esi                                // |  5 : ::^:           |  0                  |  6 ^^^^^^ |
    xorl    %ebx, %ebx                              // |  6 :^::::           |  0                  |  5 ^^^^^  |
    cmpb    $46, %dil                               // |  6 :::::v           |  0                  |  6 ^^^^^^ |
    sete    %bl                                     // |  5 :x:::            |  0                  |  1  v     |
    addl    %ebx, %edx                              // |  5 :v:x:            |  0                  |  6 ^^^^^^ |
    incq    %rcx                                    // |  4 : x::            |  0                  |  5  ^^^^^ |
    cmpq    %rcx, %rax                              // |  4 v v::            |  0                  |  6 ^^^^^^ |
    jne .LBB0_9                                     // |  2    ::            |  0                  |  1  v     |
.LBB0_13:                                           // |                     |                     |           |
    cmpl    $1, %edx                                // |  2    v:            |  0                  |  6 ^^^^^^ |
    leaq    .L.str(%rip), %rax                      // |  2 ^   :            |  0                  |  0        |
    leaq    .L.str.4(%rip), %rbx                    // |  3 :^  :            |  0                  |  0        |
    cmovneq %rax, %rbx                              // |  3 v^  :            |  0                  |  0        |
    cmpl    $4, %esi                                // |  2 :   v            |  0                  |  6 ^^^^^^ |
    cmovaeq %rax, %rbx                              // |  2 v^               |  0                  |  0        |
    jmp .LBB0_14                                    // |  0                  |  0                  |  0        |
.Lfunc_end0:                                        // |                     |                     |           |
    .size   func0, .Lfunc_end0-func0                // |                     |                     |           |
    .cfi_endproc                                    // |                     |                     |           |
    .type   .L.str,@object                          // |                     |                     |           |
    .section    .rodata.str1.1,"aMS",@progbits,1    // |                     |                     |           |
.L.str:                                             // |                     |                     |           |
    .asciz  "No"                                    // |                     |                     |           |
    .size   .L.str, 3                               // |                     |                     |           |
    .type   .L.str.1,@object                        // |                     |                     |           |
.L.str.1:                                           // |                     |                     |           |
    .asciz  ".txt"                                  // |                     |                     |           |
    .size   .L.str.1, 5                             // |                     |                     |           |
    .type   .L.str.2,@object                        // |                     |                     |           |
.L.str.2:                                           // |                     |                     |           |
    .asciz  ".exe"                                  // |                     |                     |           |
    .size   .L.str.2, 5                             // |                     |                     |           |
    .type   .L.str.3,@object                        // |                     |                     |           |
.L.str.3:                                           // |                     |                     |           |
    .asciz  ".dll"                                  // |                     |                     |           |
    .size   .L.str.3, 5                             // |                     |                     |           |
    .type   .L.str.4,@object                        // |                     |                     |           |
.L.str.4:                                           // |                     |                     |           |
    .asciz  "Yes"                                   // |                     |                     |           |
    .size   .L.str.4, 4                             // |                     |                     |           |
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
