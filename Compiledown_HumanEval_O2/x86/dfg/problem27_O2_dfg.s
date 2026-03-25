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
    movq    %rdx, (%rsp)                          // |  2    v   v         |  0                  |  0        |
    movl    %esi, %ebp                            // |  3     v ^:         |  0                  |  0        |
    movq    %rdi, %r12                            // |  4      v::    ^    |  0                  |  0        |
    movslq  %esi, %r14                            // |  5     v ::    : ^  |  0                  |  0        |
    leaq    (,%r14,4), %rdi                       // |  5      ^::    : v  |  0                  |  0        |
    callq   malloc@PLT                            // |  4       :x    : :  |  0                  |  0        |
    movq    %rax, %r15                            // |  6 v     ::    : :^ |  0                  |  0        |
    movl    $4, %esi                              // |  6     ^ ::    : :: |  0                  |  0        |
    movq    %r14, %rdi                            // |  6      ^::    : v: |  0                  |  0        |
    callq   calloc@PLT                            // |  5       :x    : :: |  0                  |  0        |
    movq    %rax, %r13                            // |  7 v     ::    :^:: |  0                  |  0        |
    movl    $4, %esi                              // |  7     ^ ::    :::: |  0                  |  0        |
    movq    %r14, %rdi                            // |  7      ^::    ::v: |  0                  |  0        |
    callq   calloc@PLT                            // |  7      ::x    :::: |  0                  |  0        |
    movq    %rax, %rbx                            // |  9 v^   :::    :::: |  0                  |  0        |
    testl   %r14d, %r14d                          // |  8  :   :::    ::v: |  0                  |  6 ^^^^^^ |
    jle .LBB0_1                                   // |  7  :   :::    :: : |  0                  |  3  vvv   |
    movl    %ebp, %r8d                            // |  8  :   :v:^   :: : |  0                  |  0        |
    xorl    %edx, %edx                            // |  9  : ^ ::::   :: : |  0                  |  5 ^^^^^  |
    xorl    %esi, %esi                            // | 10  : :^::::   :: : |  0                  |  5 ^^^^^  |
    xorl    %ecx, %ecx                            // | 11  :^::::::   :: : |  0                  |  5 ^^^^^  |
    movq    (%rsp), %r9                           // | 12  ::::::v:^  :: : |  0                  |  0        |
    movl    %ebp, %r10d                           // | 12  :::::v:: ^ :: : |  0                  |  0        |
    jmp .LBB0_5                                   // | 11  ::::: :: : :: : |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_14:                                         // |                     |                     |           |
    movl    %esi, %eax                            // | 12 ^:::v: :: : :: : |  0                  |  0        |
    incl    %esi                                  // | 12 ::::x: :: : :: : |  0                  |  5  ^^^^^ |
    movq    %r13, %rbp                            // | 13 ::::::^:: : :v : |  0                  |  0        |
.LBB0_15:                                         // |                     |                     |           |
    cltq                                          // | 13 ::::::::: : :: : |  0                  |  0        |
    movl    %edi, (%rbp,%rax,4)                   // | 13 v::::vv:: : :: : |  0                  |  0        |
.LBB0_16:                                         // |                     |                     |           |
    incq    %rdx                                  // | 10  ::x:  :: : :: : |  0                  |  5  ^^^^^ |
    cmpq    %r8, %rdx                             // | 10  ::v:  :v : :: : |  0                  |  6 ^^^^^^ |
    je  .LBB0_2                                   // | 10  ::::  :: : :: : |  0                  |  1  v     |
.LBB0_5:                                          // |                     |                     |           |
    movl    (%r12,%rdx,4), %edi                   // | 11  ::v:^ :: : v: : |  0                  |  0        |
    testl   %ecx, %ecx                            // | 10  :v :: :: : :: : |  0                  |  6 ^^^^^^ |
    jle .LBB0_9                                   // | 10  :: :: :: : :: : |  0                  |  3  vvv   |
    movl    %ecx, %ebp                            // | 11  :v ::^:: : :: : |  0                  |  0        |
    xorl    %eax, %eax                            // | 12 ^:: ::::: : :: : |  0                  |  5 ^^^^^  |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_7:                                          // |                     |                     |           |
    cmpl    %edi, (%rbx,%rax,4)                   // | 12 vv: :v::: : :: : |  0                  |  6 ^^^^^^ |
    je  .LBB0_16                                  // | 12 ::: ::::: : :: : |  0                  |  1  v     |
    incq    %rax                                  // | 12 x:: ::::: : :: : |  0                  |  5  ^^^^^ |
    cmpq    %rax, %rbp                            // | 12 v:: ::v:: : :: : |  0                  |  6 ^^^^^^ |
    jne .LBB0_7                                   // | 10  :: :: :: : :: : |  0                  |  1  v     |
.LBB0_9:                                          // |                     |                     |           |
    testl   %esi, %esi                            // | 10  :: v: :: : :: : |  0                  |  6 ^^^^^^ |
    jle .LBB0_14                                  // | 10  :: :: :: : :: : |  0                  |  3  vvv   |
    movl    %esi, %ebp                            // | 11  :: v:^:: : :: : |  0                  |  0        |
    xorl    %eax, %eax                            // | 11 ^::  :::: : :: : |  0                  |  5 ^^^^^  |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_12:                                         // |                     |                     |           |
    cmpl    %edi, (%r13,%rax,4)                   // | 11 v::  v::: : :v : |  0                  |  6 ^^^^^^ |
    je  .LBB0_13                                  // | 10 :::   ::: : :: : |  0                  |  1  v     |
    incq    %rax                                  // | 10 x::   ::: : :: : |  0                  |  5  ^^^^^ |
    cmpq    %rax, %rbp                            // | 10 v::   v:: : :: : |  0                  |  6 ^^^^^^ |
    jne .LBB0_12                                  // |  8  ::    :: : :: : |  0                  |  1  v     |
    jmp .LBB0_14                                  // |  8  ::    :: : :: : |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_13:                                         // |                     |                     |           |
    movl    %ecx, %eax                            // |  9 ^:v    :: : :: : |  0                  |  0        |
    incl    %ecx                                  // |  8  :x    :: : :: : |  0                  |  5  ^^^^^ |
    movq    %rbx, %rbp                            // |  9  v:   ^:: : :: : |  0                  |  0        |
    jmp .LBB0_15                                  // |  9  ::   ::: : :: : |  0                  |  0        |
.LBB0_2:                                          // |                     |                     |           |
    testl   %r10d, %r10d                          // |  9  ::   ::: v :: : |  0                  |  6 ^^^^^^ |
    jle .LBB0_3                                   // |  8  ::   :::   :: : |  0                  |  3  vvv   |
    movl    %ecx, %esi                            // |  9  :v ^ :::   :: : |  0                  |  0        |
    xorl    %edi, %edi                            // | 10  :: :^:::   :: : |  0                  |  5 ^^^^^  |
    xorl    %edx, %edx                            // | 11  ::^:::::   :: : |  0                  |  5 ^^^^^  |
    jmp .LBB0_18                                  // | 11  ::::::::   :: : |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_22:                                         // |                     |                     |           |
    movslq  %edx, %rax                            // | 12 ^::v:::::   :: : |  0                  |  0        |
    incl    %edx                                  // | 12 :::x:::::   :: : |  0                  |  5  ^^^^^ |
    movl    %ebp, (%r15,%rax,4)                   // | 11 v:: ::v::   :: v |  0                  |  0        |
.LBB0_23:                                         // |                     |                     |           |
    incq    %rdi                                  // |  9  :: :x ::   :: : |  0                  |  5  ^^^^^ |
    cmpq    %r8, %rdi                             // |  9  :: :v :v   :: : |  0                  |  6 ^^^^^^ |
    je  .LBB0_24                                  // |  8  :: :: :    :: : |  0                  |  1  v     |
.LBB0_18:                                         // |                     |                     |           |
    movl    (%r12,%rdi,4), %ebp                   // |  9  :: :v^:    v: : |  0                  |  0        |
    testl   %ecx, %ecx                            // |  7  :v : ::     : : |  0                  |  6 ^^^^^^ |
    jle .LBB0_22                                  // |  6  :  : ::     : : |  0                  |  3  vvv   |
    xorl    %eax, %eax                            // |  7 ^:  : ::     : : |  0                  |  5 ^^^^^  |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_21:                                         // |                     |                     |           |
    cmpl    %ebp, (%rbx,%rax,4)                   // |  7 vv  : v:     : : |  0                  |  6 ^^^^^^ |
    je  .LBB0_23                                  // |  6 ::  :  :     : : |  0                  |  1  v     |
    incq    %rax                                  // |  6 x:  :  :     : : |  0                  |  5  ^^^^^ |
    cmpq    %rax, %rsi                            // |  6 v:  v  :     : : |  0                  |  6 ^^^^^^ |
    jne .LBB0_21                                  // |  4  :     :     : : |  0                  |  1  v     |
    jmp .LBB0_22                                  // |  4  :     :     : : |  0                  |  0        |
.LBB0_1:                                          // |                     |                     |           |
    xorl    %edx, %edx                            // |  5  : ^   :     : : |  0                  |  5 ^^^^^  |
    movq    (%rsp), %r9                           // |  5  :     v ^   : : |  0                  |  0        |
    jmp .LBB0_24                                  // |  5  :     : :   : : |  0                  |  0        |
.LBB0_3:                                          // |                     |                     |           |
    xorl    %edx, %edx                            // |  6  : ^   : :   : : |  0                  |  5 ^^^^^  |
.LBB0_24:                                         // |                     |                     |           |
    movl    %edx, (%r9)                           // |  6  : v   : v   : : |  0                  |  0        |
    movq    %r13, %rdi                            // |  5  :   ^ :     v : |  0                  |  0        |
    callq   free@PLT                              // |  3  :     x       : |  0                  |  0        |
    movq    %rbx, %rdi                            // |  4  v   ^ :       : |  0                  |  0        |
    callq   free@PLT                              // |  2        x       : |  0                  |  0        |
    movq    %r15, %rax                            // |  3 ^      :       v |  0                  |  0        |
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
