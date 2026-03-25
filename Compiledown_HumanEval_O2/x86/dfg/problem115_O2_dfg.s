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
    movq    (%rdi), %rax                          // |  2 ^    v           |  0                  |  0        |
    cmpl    $2, %esi                              // |  2 :   v            |  0                  |  6 ^^^^^^ |
    jl  .LBB0_5                                   // |  1 :                |  0                  |  2   vv   |
    movl    %esi, %r8d                            // |  3 :   v   ^        |  0                  |  0        |
    decq    %r8                                   // |  2 :       x        |  0                  |  5  ^^^^^ |
    cmpl    $2, %esi                              // |  3 :   v   :        |  0                  |  6 ^^^^^^ |
    jne .LBB0_6                                   // |  2 :       :        |  0                  |  1  v     |
    movl    $1, %edx                              // |  3 :  ^    :        |  0                  |  0        |
    movq    %rax, %rsi                            // |  3 v   ^   :        |  0                  |  0        |
    jmp .LBB0_3                                   // |  2 :       :        |  0                  |  0        |
.LBB0_6:                                          // |                     |                     |           |
    movq    %r8, %r9                              // |  3 :       v^       |  0                  |  0        |
    andq    $-2, %r9                              // |  3 :       :x       |  0                  |  5 ^^^^^  |
    negq    %r9                                   // |  3 :       :x       |  0                  |  0        |
    movl    $1, %edx                              // |  4 :  ^    ::       |  0                  |  0        |
    movq    %rax, %rsi                            // |  5 v  :^   ::       |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_7:                                          // |                     |                     |           |
    movq    %rsi, %rcx                            // |  6 : ^:v   ::       |  0                  |  0        |
    sarq    $63, %rcx                             // |  6 : ^::   ::       |  0                  |  5 ^^^^^  |
    andq    %rsi, %rcx                            // |  6 : x:v   ::       |  0                  |  5 ^^^^^  |
    addq    (%rdi,%rdx,8), %rcx                   // |  6 : xv v  ::       |  0                  |  6 ^^^^^^ |
    cmpq    %rax, %rcx                            // |  5 v v:    ::       |  0                  |  6 ^^^^^^ |
    cmovlq  %rcx, %rax                            // |  5 ^ v:    ::       |  0                  |  0        |
    movq    %rcx, %rsi                            // |  6 : v:^   ::       |  0                  |  0        |
    sarq    $63, %rsi                             // |  6 : ::^   ::       |  0                  |  5 ^^^^^  |
    andq    %rcx, %rsi                            // |  6 : v:x   ::       |  0                  |  5 ^^^^^  |
    addq    8(%rdi,%rdx,8), %rsi                  // |  6 :  vxv  ::       |  0                  |  6 ^^^^^^ |
    cmpq    %rax, %rsi                            // |  5 v  :v   ::       |  0                  |  6 ^^^^^^ |
    cmovlq  %rsi, %rax                            // |  5 ^  :v   ::       |  0                  |  0        |
    leaq    (%r9,%rdx), %rcx                      // |  6 : ^v:   :v       |  0                  |  0        |
    addq    $2, %rcx                              // |  5 : x::   :        |  0                  |  6 ^^^^^^ |
    addq    $2, %rdx                              // |  5 : :x:   :        |  0                  |  6 ^^^^^^ |
    cmpq    $1, %rcx                              // |  5 : v::   :        |  0                  |  6 ^^^^^^ |
    jne .LBB0_7                                   // |  4 :  ::   :        |  0                  |  1  v     |
.LBB0_3:                                          // |                     |                     |           |
    testb   $1, %r8b                              // |  4 :  ::   v        |  0                  |  6 ^^^^^^ |
    je  .LBB0_5                                   // |  3 :  ::            |  0                  |  1  v     |
    movq    %rsi, %rcx                            // |  4 : ^:v            |  0                  |  0        |
    sarq    $63, %rcx                             // |  4 : ^::            |  0                  |  5 ^^^^^  |
    andq    %rsi, %rcx                            // |  4 : x:v            |  0                  |  5 ^^^^^  |
    addq    (%rdi,%rdx,8), %rcx                   // |  4 : xv v           |  0                  |  6 ^^^^^^ |
    cmpq    %rax, %rcx                            // |  2 v v              |  0                  |  6 ^^^^^^ |
    cmovgeq %rax, %rcx                            // |  2 v ^              |  0                  |  0        |
    movq    %rcx, %rax                            // |  2 ^ v              |  0                  |  0        |
.LBB0_5:                                          // |                     |                     |           |
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
