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
    .long   0                                      // |                     |                     |           |
    .long   0                                      // |                     |                     |           |
    .long   2                                      // |                     |                     |           |
    .long   0                                      // |                     |                     |           |
    .text                                          // |                     |                     |           |
    .globl  func0                                  // |                     |                     |           |
    .p2align    4, 0x90                            // |                     |                     |           |
    .type   func0,@function                        // |                     |                     |           |
func0:                                             // |                     |                     |           |
    .cfi_startproc                                 // |                     |                     |           |
    subq    $280, %rsp                             // |  1        x         |  0                  |  6 ^^^^^^ |
    .cfi_def_cfa_offset 288                        // |                     |                     |           |
    movaps  .LCPI0_0(%rip), %xmm0                  // |  1        :         |  1 ^                |  0        |
    movaps  %xmm0, -128(%rsp)                      // |  1        v         |  1 v                |  0        |
    cmpl    $4, %edi                               // |  2      v :         |  0                  |  6 ^^^^^^ |
    jl  .LBB0_5                                    // |  1        :         |  0                  |  2   vv   |
    leal    1(%rdi), %r8d                          // |  3      v :^        |  0                  |  0        |
    cmpl    $5, %r8d                               // |  2        :v        |  0                  |  6 ^^^^^^ |
    jne .LBB0_6                                    // |  2        ::        |  0                  |  1  v     |
    movl    $4, %ecx                               // |  3   ^    ::        |  0                  |  0        |
    xorl    %r10d, %r10d                           // |  3        :: ^      |  0                  |  5 ^^^^^  |
    xorl    %edx, %edx                             // |  3    ^   ::        |  0                  |  5 ^^^^^  |
    jmp .LBB0_3                                    // |  2        ::        |  0                  |  0        |
.LBB0_6:                                           // |                     |                     |           |
    leaq    -4(%r8), %r9                           // |  3        :v^       |  0                  |  0        |
    andq    $-2, %r9                               // |  3        ::x       |  0                  |  5 ^^^^^  |
    negq    %r9                                    // |  3        ::x       |  0                  |  0        |
    movl    $4, %ecx                               // |  4   ^    :::       |  0                  |  0        |
    xorl    %esi, %esi                             // |  5   : ^  :::       |  0                  |  5 ^^^^^  |
    xorl    %edx, %edx                             // |  6   :^:  :::       |  0                  |  5 ^^^^^  |
    .p2align    4, 0x90                            // |                     |                     |           |
.LBB0_7:                                           // |                     |                     |           |
    movl    -136(%rsp,%rcx,4), %eax                // |  7 ^ v::  v::       |  0                  |  0        |
    movl    -132(%rsp,%rcx,4), %r10d               // |  8 : v::  v::^      |  0                  |  0        |
    addl    %eax, %edx                             // |  8 v :x:  ::::      |  0                  |  6 ^^^^^^ |
    addl    %esi, %edx                             // |  8 : :xv  ::::      |  0                  |  6 ^^^^^^ |
    addl    -144(%rsp,%rcx,4), %edx                // |  7 : vx   v:::      |  0                  |  6 ^^^^^^ |
    movl    %edx, -128(%rsp,%rcx,4)                // |  7 : vv   v:::      |  0                  |  0        |
    addl    %r10d, %edx                            // |  7 : :x   :::v      |  0                  |  6 ^^^^^^ |
    addl    %eax, %edx                             // |  7 v :x   ::::      |  0                  |  6 ^^^^^^ |
    addl    -140(%rsp,%rcx,4), %edx                // |  6   vx   v:::      |  0                  |  6 ^^^^^^ |
    movl    %edx, -124(%rsp,%rcx,4)                // |  6   vv   v:::      |  0                  |  0        |
    leaq    (%r9,%rcx), %rax                       // |  7 ^ v:   ::v:      |  0                  |  0        |
    addq    $2, %rax                               // |  6 x ::   :: :      |  0                  |  6 ^^^^^^ |
    addq    $2, %rcx                               // |  6 : x:   :: :      |  0                  |  6 ^^^^^^ |
    movl    %r10d, %esi                            // |  7 : ::^  :: v      |  0                  |  0        |
    cmpq    $4, %rax                               // |  6 v ::   :: :      |  0                  |  6 ^^^^^^ |
    jne .LBB0_7                                    // |  5   ::   :: :      |  0                  |  1  v     |
.LBB0_3:                                           // |                     |                     |           |
    testb   $1, %r8b                               // |  5   ::   :v :      |  0                  |  6 ^^^^^^ |
    je  .LBB0_5                                    // |  4   ::   :  :      |  0                  |  1  v     |
    addl    -136(%rsp,%rcx,4), %edx                // |  4   vx   v  :      |  0                  |  6 ^^^^^^ |
    addl    %r10d, %edx                            // |  4   :x   :  v      |  0                  |  6 ^^^^^^ |
    addl    -144(%rsp,%rcx,4), %edx                // |  3   vx   v         |  0                  |  6 ^^^^^^ |
    movl    %edx, -128(%rsp,%rcx,4)                // |  3   vv   v         |  0                  |  0        |
.LBB0_5:                                           // |                     |                     |           |
    movslq  %edi, %rax                             // |  3 ^    v :         |  0                  |  0        |
    movl    -128(%rsp,%rax,4), %eax                // |  2 ^      v         |  0                  |  0        |
    addq    $280, %rsp                             // |  1        x         |  0                  |  6 ^^^^^^ |
    .cfi_def_cfa_offset 8                          // |                     |                     |           |
    retq                                           // |  1        x         |  0                  |  0        |
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
