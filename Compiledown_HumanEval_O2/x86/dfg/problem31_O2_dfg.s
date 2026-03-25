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
    pushq   %rbp                                  // |  2       vx         |  0                  |  0        |
    .cfi_def_cfa_offset 16                        // |                     |                     |           |
    pushq   %r15                                  // |  2        x       v |  0                  |  0        |
    .cfi_def_cfa_offset 24                        // |                     |                     |           |
    pushq   %r14                                  // |  2        x      v  |  0                  |  0        |
    .cfi_def_cfa_offset 32                        // |                     |                     |           |
    pushq   %rbx                                  // |  2  v     x         |  0                  |  0        |
    .cfi_def_cfa_offset 40                        // |                     |                     |           |
    pushq   %rax                                  // |  2 v      x         |  0                  |  0        |
    .cfi_def_cfa_offset 48                        // |                     |                     |           |
    .cfi_offset %rbx, -40                         // |                     |                     |           |
    .cfi_offset %r14, -32                         // |                     |                     |           |
    .cfi_offset %r15, -24                         // |                     |                     |           |
    .cfi_offset %rbp, -16                         // |                     |                     |           |
    movq    %rdx, %r14                            // |  3    v   :      ^  |  0                  |  0        |
    movl    %esi, %r15d                           // |  4     v  :      :^ |  0                  |  0        |
    movq    %rdi, %rbx                            // |  5  ^   v :      :: |  0                  |  0        |
    movslq  %esi, %rbp                            // |  6  :  v ^:      :: |  0                  |  0        |
    leaq    (,%rbp,4), %rdi                       // |  6  :   ^v:      :: |  0                  |  0        |
    callq   malloc@PLT                            // |  5  :    :x      :: |  0                  |  0        |
    movl    $0, (%r14)                            // |  5  :    ::      v: |  0                  |  0        |
    testl   %ebp, %ebp                            // |  5  :    v:      :: |  0                  |  6 ^^^^^^ |
    jle .LBB0_6                                   // |  4  :     :      :: |  0                  |  3  vvv   |
    movl    %r15d, %ecx                           // |  5  :^    :      :v |  0                  |  0        |
    cmpl    $1, %r15d                             // |  5  ::    :      :v |  0                  |  6 ^^^^^^ |
    jne .LBB0_7                                   // |  4  ::    :      :  |  0                  |  1  v     |
    xorl    %edx, %edx                            // |  5  ::^   :      :  |  0                  |  5 ^^^^^  |
    xorl    %esi, %esi                            // |  6  :::^  :      :  |  0                  |  5 ^^^^^  |
.LBB0_3:                                          // |                     |                     |           |
    testb   $1, %cl                               // |  6  :v::  :      :  |  0                  |  6 ^^^^^^ |
    je  .LBB0_6                                   // |  5  : ::  :      :  |  0                  |  1  v     |
    movss   (%rbx,%rsi,4), %xmm0                  // |  5  v :v  :      :  |  1 ^                |  0        |
    xorps   %xmm1, %xmm1                          // |  3    :   :      :  |  1  ^               |  5 ^^^^^  |
    ucomiss %xmm1, %xmm0                          // |  3    :   :      :  |  2 ^v               |  2 ::     |
    jbe .LBB0_6                                   // |  3    :   :      :  |  1 :                |  2 vv     |
    leal    1(%rdx), %ecx                         // |  4   ^v   :      :  |  1 :                |  0        |
    movl    %ecx, (%r14)                          // |  4   v:   :      v  |  1 :                |  0        |
    movslq  %edx, %rcx                            // |  3   ^v   :         |  1 :                |  0        |
    movss   %xmm0, (%rax,%rcx,4)                  // |  3 v v    :         |  1 v                |  0        |
.LBB0_6:                                          // |                     |                     |           |
    addq    $8, %rsp                              // |  2   :    x         |  0                  |  6 ^^^^^^ |
    .cfi_def_cfa_offset 40                        // |                     |                     |           |
    popq    %rbx                                  // |  3  ^:    x         |  0                  |  0        |
    .cfi_def_cfa_offset 32                        // |                     |                     |           |
    popq    %r14                                  // |  4  ::    x      ^  |  0                  |  0        |
    .cfi_def_cfa_offset 24                        // |                     |                     |           |
    popq    %r15                                  // |  5  ::    x      :^ |  0                  |  0        |
    .cfi_def_cfa_offset 16                        // |                     |                     |           |
    popq    %rbp                                  // |  5  ::   ^x      :  |  0                  |  0        |
    .cfi_def_cfa_offset 8                         // |                     |                     |           |
    retq                                          // |  4  ::    x      :  |  0                  |  0        |
.LBB0_7:                                          // |                     |                     |           |
    .cfi_def_cfa_offset 48                        // |                     |                     |           |
    movl    %ecx, %edi                            // |  4  :v  ^        :  |  0                  |  0        |
    andl    $-2, %edi                             // |  3  :   x        :  |  0                  |  5 ^^^^^  |
    xorl    %edx, %edx                            // |  4  : ^ :        :  |  0                  |  5 ^^^^^  |
    xorps   %xmm0, %xmm0                          // |  4  : : :        :  |  1 ^                |  5 ^^^^^  |
    xorl    %esi, %esi                            // |  5  : :^:        :  |  1 :                |  5 ^^^^^  |
    jmp .LBB0_8                                   // |  5  : :::        :  |  1 :                |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_12:                                         // |                     |                     |           |
    addq    $2, %rsi                              // |  5  : :x:        :  |  1 :                |  6 ^^^^^^ |
    cmpq    %rsi, %rdi                            // |  5  : :vv        :  |  1 :                |  6 ^^^^^^ |
    je  .LBB0_3                                   // |  4  : ::         :  |  1 :                |  2 :v     |
.LBB0_8:                                          // |                     |                     |           |
    movss   (%rbx,%rsi,4), %xmm1                  // |  4  v :v         :  |  2 :^               |  2 ::     |
    ucomiss %xmm0, %xmm1                          // |  4  : ::         :  |  2 v^               |  2 ::     |
    jbe .LBB0_10                                  // |  4  : ::         :  |  2 ::               |  2 vv     |
    movslq  %edx, %rbp                            // |  5  : v: ^       :  |  2 ::               |  1 :      |
    incl    %edx                                  // |  5  : x: :       :  |  2 ::               |  6 :^^^^^ |
    movl    %edx, (%r14)                          // |  5  : v: :       v  |  2 ::               |  2 ::     |
    movss   %xmm1, (%rax,%rbp,4)                  // |  6 v: :: v       :  |  2 :v               |  2 ::     |
.LBB0_10:                                         // |                     |                     |           |
    movss   4(%rbx,%rsi,4), %xmm1                 // |  4  v :v         :  |  2 :^               |  2 ::     |
    ucomiss %xmm0, %xmm1                          // |  2    :          :  |  2 v^               |  2 ::     |
    jbe .LBB0_12                                  // |  2    :          :  |  1  :               |  2 vv     |
    movslq  %edx, %rbp                            // |  3    v  ^       :  |  1  :               |  0        |
    incl    %edx                                  // |  3    x  :       :  |  1  :               |  5  ^^^^^ |
    movl    %edx, (%r14)                          // |  3    v  :       v  |  1  :               |  0        |
    movss   %xmm1, (%rax,%rbp,4)                  // |  2 v     v          |  1  v               |  0        |
    jmp .LBB0_12                                  // |  0                  |  0                  |  0        |
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
