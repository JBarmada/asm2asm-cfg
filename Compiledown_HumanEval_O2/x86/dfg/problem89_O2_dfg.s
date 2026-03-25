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
    pushq   %r13                                  // |  2        x     v   |  0                  |  0        |
    .cfi_def_cfa_offset 40                        // |                     |                     |           |
    pushq   %r12                                  // |  2        x    v    |  0                  |  0        |
    .cfi_def_cfa_offset 48                        // |                     |                     |           |
    pushq   %rbx                                  // |  2  v     x         |  0                  |  0        |
    .cfi_def_cfa_offset 56                        // |                     |                     |           |
    pushq   %rax                                  // |  2 v      x         |  0                  |  0        |
    .cfi_def_cfa_offset 64                        // |                     |                     |           |
    .cfi_offset %rbx, -56                         // |                     |                     |           |
    .cfi_offset %r12, -48                         // |                     |                     |           |
    .cfi_offset %r13, -40                         // |                     |                     |           |
    .cfi_offset %r14, -32                         // |                     |                     |           |
    .cfi_offset %r15, -24                         // |                     |                     |           |
    .cfi_offset %rbp, -16                         // |                     |                     |           |
    movq    %rdx, %r15                            // |  3    v   :       ^ |  0                  |  0        |
    movl    %esi, (%rcx)                          // |  4   v v  :       : |  0                  |  0        |
    testl   %esi, %esi                            // |  3     v  :       : |  0                  |  6 ^^^^^^ |
    je  .LBB0_1                                   // |  2        :       : |  0                  |  1  v     |
    movl    %esi, %r12d                           // |  4     v  :    ^  : |  0                  |  0        |
    movq    %rdi, %r14                            // |  5      v :    : ^: |  0                  |  0        |
    movslq  %esi, %r13                            // |  6     v  :    :^:: |  0                  |  0        |
    leaq    (,%r13,4), %rdi                       // |  6      ^ :    :v:: |  0                  |  0        |
    callq   malloc@PLT                            // |  5        x    :::: |  0                  |  0        |
    movq    %rax, (%r15)                          // |  6 v      :    :::v |  0                  |  0        |
    testq   %rax, %rax                            // |  6 v      :    :::: |  0                  |  6 ^^^^^^ |
    je  .LBB0_16                                  // |  5        :    :::: |  0                  |  1  v     |
    movq    %rax, %rbx                            // |  7 v^     :    :::: |  0                  |  0        |
    movl    %r12d, %ebp                           // |  7  :    ^:    v::: |  0                  |  0        |
    testl   %r12d, %r12d                          // |  7  :    ::    v::: |  0                  |  6 ^^^^^^ |
    jle .LBB0_6                                   // |  7  :    ::    :::: |  0                  |  3  vvv   |
    leaq    (,%rbp,4), %rdx                       // |  8  : ^  v:    :::: |  0                  |  0        |
    movq    %rbx, %rdi                            // |  8  v   ^::    :::: |  0                  |  0        |
    movq    %r14, %rsi                            // |  8  :  ^ ::    ::v: |  0                  |  0        |
    callq   memcpy@PLT                            // |  8  :  : :x    :::: |  0                  |  0        |
.LBB0_6:                                          // |                     |                     |           |
    cmpl    $2, %r12d                             // |  8  :  : ::    v::: |  0                  |  6 ^^^^^^ |
    jl  .LBB0_2                                   // |  8  :  : ::    :::: |  0                  |  2   vv   |
    decl    %r12d                                 // |  8  :  : ::    x::: |  0                  |  5  ^^^^^ |
    movl    -4(%r14,%r13,4), %r10d                // |  9  :  : ::  ^ :vv: |  0                  |  0        |
    addl    (%r14), %r10d                         // |  9  :  : ::  x ::v: |  0                  |  6 ^^^^^^ |
    andl    $-2147483647, %r10d                   // |  8  :  : ::  x :: : |  0                  |  5 ^^^^^  |
    movl    %r12d, %r8d                           // |  9  :  : ::^ : v: : |  0                  |  0        |
    xorl    %r9d, %r9d                            // |  9  :  : :::^:  : : |  0                  |  5 ^^^^^  |
    movq    %rbx, %rdx                            // | 10  v ^: :::::  : : |  0                  |  0        |
    jmp .LBB0_9                                   // | 10  : :: :::::  : : |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_8:                                          // |                     |                     |           |
    addq    $4, %rdx                              // | 10  : x: :::::  : : |  0                  |  6 ^^^^^^ |
    decq    %rbp                                  // | 10  : :: x::::  : : |  0                  |  5  ^^^^^ |
    cmpq    %r8, %r9                              // | 10  : :: ::vv:  : : |  0                  |  6 ^^^^^^ |
    je  .LBB0_2                                   // |  9  : :: :: ::  : : |  0                  |  1  v     |
.LBB0_9:                                          // |                     |                     |           |
    movq    %r9, %rdi                             // | 10  : ::^:: v:  : : |  0                  |  0        |
    incq    %r9                                   // | 10  : ::::: x:  : : |  0                  |  5  ^^^^^ |
    cmpq    %r13, %r9                             // | 10  : ::::: v:  v : |  0                  |  6 ^^^^^^ |
    jge .LBB0_8                                   // |  8  : :::::  :    : |  0                  |  2   vv   |
    movl    $1, %ecx                              // |  9  :^:::::  :    : |  0                  |  0        |
    jmp .LBB0_11                                  // |  9  :::::::  :    : |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_14:                                         // |                     |                     |           |
    movl    %eax, (%rbx,%rdi,4)                   // | 10 vv:::v::  :    : |  0                  |  0        |
    movl    %esi, (%rdx,%rcx,4)                   // |  9  :vvv:::  :    : |  0                  |  0        |
.LBB0_15:                                         // |                     |                     |           |
    incq    %rcx                                  // |  8  :x: :::  :    : |  0                  |  5  ^^^^^ |
    cmpq    %rcx, %rbp                            // |  8  :v: :v:  :    : |  0                  |  6 ^^^^^^ |
    je  .LBB0_8                                   // |  7  ::: : :  :    : |  0                  |  1  v     |
.LBB0_11:                                         // |                     |                     |           |
    movl    (%rbx,%rdi,4), %esi                   // |  8  v::^v :  :    : |  0                  |  0        |
    movl    (%rdx,%rcx,4), %eax                   // |  7 ^ vv:  :  :    : |  0                  |  0        |
    cmpl    $1, %r10d                             // |  5 :   :  :  v    : |  0                  |  6 ^^^^^^ |
    jne .LBB0_13                                  // |  4 :   :  :       : |  0                  |  1  v     |
    cmpl    %eax, %esi                            // |  4 v   v  :       : |  0                  |  6 ^^^^^^ |
    jg  .LBB0_14                                  // |  4 :   :  :       : |  0                  |  3  vvv   |
    jmp .LBB0_15                                  // |  4 :   :  :       : |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_13:                                         // |                     |                     |           |
    cmpl    %eax, %esi                            // |  4 v   v  :       : |  0                  |  6 ^^^^^^ |
    jl  .LBB0_14                                  // |  2        :       : |  0                  |  2   vv   |
    jmp .LBB0_15                                  // |  2        :       : |  0                  |  0        |
.LBB0_1:                                          // |                     |                     |           |
    movq    $0, (%r15)                            // |  2        :       v |  0                  |  0        |
.LBB0_2:                                          // |                     |                     |           |
    addq    $8, %rsp                              // |  1        x         |  0                  |  6 ^^^^^^ |
    .cfi_def_cfa_offset 56                        // |                     |                     |           |
    popq    %rbx                                  // |  2  ^     x         |  0                  |  0        |
    .cfi_def_cfa_offset 48                        // |                     |                     |           |
    popq    %r12                                  // |  2        x    ^    |  0                  |  0        |
    .cfi_def_cfa_offset 40                        // |                     |                     |           |
    popq    %r13                                  // |  2        x     ^   |  0                  |  0        |
    .cfi_def_cfa_offset 32                        // |                     |                     |           |
    popq    %r14                                  // |  2        x      ^  |  0                  |  0        |
    .cfi_def_cfa_offset 24                        // |                     |                     |           |
    popq    %r15                                  // |  2        x       ^ |  0                  |  0        |
    .cfi_def_cfa_offset 16                        // |                     |                     |           |
    popq    %rbp                                  // |  2       ^x         |  0                  |  0        |
    .cfi_def_cfa_offset 8                         // |                     |                     |           |
    retq                                          // |  1        x         |  0                  |  0        |
.LBB0_16:                                         // |                     |                     |           |
    .cfi_def_cfa_offset 64                        // |                     |                     |           |
    movl    $1, %edi                              // |  2      ^ :         |  0                  |  0        |
    callq   exit@PLT                              // |  1        x         |  0                  |  0        |
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
