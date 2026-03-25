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
    movl    %esi, %ebp                            // |  4     v ^:      :  |  0                  |  0        |
    movq    %rdi, %r15                            // |  5      v::      :^ |  0                  |  0        |
    movslq  %esi, %rbx                            // |  6  ^  v ::      :: |  0                  |  0        |
    leaq    (,%rbx,4), %rdi                       // |  6  v   ^::      :: |  0                  |  0        |
    callq   malloc@PLT                            // |  6  :   ::x      :: |  0                  |  0        |
    testl   %ebx, %ebx                            // |  6  v   :::      :: |  0                  |  6 ^^^^^^ |
    jle .LBB0_1                                   // |  5      :::      :: |  0                  |  3  vvv   |
    movl    %ebp, %edx                            // |  6    ^ :v:      :: |  0                  |  0        |
    xorl    %esi, %esi                            // |  6    :^: :      :: |  0                  |  5 ^^^^^  |
    xorl    %r10d, %r10d                          // |  7    ::: :  ^   :: |  0                  |  5 ^^^^^  |
    jmp .LBB0_4                                   // |  7    ::: :  :   :: |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_10:                                         // |                     |                     |           |
    movslq  %r10d, %rcx                           // |  8   ^::: :  v   :: |  0                  |  0        |
    incl    %r10d                                 // |  8   :::: :  x   :: |  0                  |  5  ^^^^^ |
    movl    %edi, (%rax,%rcx,4)                   // |  9 v v::v :  :   :: |  0                  |  0        |
.LBB0_11:                                         // |                     |                     |           |
    incq    %rsi                                  // |  6    :x  :  :   :: |  0                  |  5  ^^^^^ |
    cmpq    %rdx, %rsi                            // |  6    vv  :  :   :: |  0                  |  6 ^^^^^^ |
    je  .LBB0_6                                   // |  5     :  :  :   :: |  0                  |  1  v     |
.LBB0_4:                                          // |                     |                     |           |
    movl    (%r15,%rsi,4), %edi                   // |  6     v^ :  :   :v |  0                  |  0        |
    testl   %r10d, %r10d                          // |  4      : :  v   :  |  0                  |  6 ^^^^^^ |
    jle .LBB0_10                                  // |  4      : :  :   :  |  0                  |  3  vvv   |
    movl    %r10d, %ebp                           // |  5      :^:  v   :  |  0                  |  0        |
    xorl    %ebx, %ebx                            // |  6  ^   :::  :   :  |  0                  |  5 ^^^^^  |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_9:                                          // |                     |                     |           |
    cmpl    (%rax,%rbx,4), %edi                   // |  7 vv   v::  :   :  |  0                  |  6 ^^^^^^ |
    je  .LBB0_11                                  // |  5  :    ::  :   :  |  0                  |  1  v     |
    incq    %rbx                                  // |  5  x    ::  :   :  |  0                  |  5  ^^^^^ |
    cmpq    %rbx, %rbp                            // |  5  v    v:  :   :  |  0                  |  6 ^^^^^^ |
    jne .LBB0_9                                   // |  3        :  :   :  |  0                  |  1  v     |
    jmp .LBB0_10                                  // |  3        :  :   :  |  0                  |  0        |
.LBB0_6:                                          // |                     |                     |           |
    cmpl    $2, %r10d                             // |  3        :  v   :  |  0                  |  6 ^^^^^^ |
    jl  .LBB0_2                                   // |  3        :  :   :  |  0                  |  2   vv   |
    leal    -1(%r10), %r8d                        // |  4        :^ v   :  |  0                  |  0        |
    movl    %r10d, %r9d                           // |  5        ::^v   :  |  0                  |  0        |
    xorl    %r11d, %r11d                          // |  5        ::: ^  :  |  0                  |  5 ^^^^^  |
    movq    %r9, %rdi                             // |  6      ^ ::v :  :  |  0                  |  0        |
    movq    %rax, %rbp                            // |  8 v    :^::: :  :  |  0                  |  0        |
    jmp .LBB0_13                                  // |  7      ::::: :  :  |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_12:                                         // |                     |                     |           |
    addq    $4, %rbp                              // |  7      :x::: :  :  |  0                  |  6 ^^^^^^ |
    decq    %rdi                                  // |  7      x:::: :  :  |  0                  |  5  ^^^^^ |
    cmpq    %r8, %r11                             // |  7      :::v: v  :  |  0                  |  6 ^^^^^^ |
    je  .LBB0_2                                   // |  6      ::: : :  :  |  0                  |  1  v     |
.LBB0_13:                                         // |                     |                     |           |
    movq    %r11, %rbx                            // |  7  ^   ::: : v  :  |  0                  |  0        |
    incq    %r11                                  // |  7  :   ::: : x  :  |  0                  |  5  ^^^^^ |
    cmpq    %r9, %r11                             // |  7  :   ::: v v  :  |  0                  |  6 ^^^^^^ |
    jae .LBB0_12                                  // |  5  :   :::      :  |  0                  |  1 v      |
    movl    $1, %esi                              // |  6  :  ^:::      :  |  0                  |  0        |
    jmp .LBB0_15                                  // |  6  :  ::::      :  |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_17:                                         // |                     |                     |           |
    incq    %rsi                                  // |  6  :  x:::      :  |  0                  |  5  ^^^^^ |
    cmpq    %rsi, %rdi                            // |  6  :  vv::      :  |  0                  |  6 ^^^^^^ |
    je  .LBB0_12                                  // |  5  :  : ::      :  |  0                  |  1  v     |
.LBB0_15:                                         // |                     |                     |           |
    movl    (%rax,%rbx,4), %ecx                   // |  7 vv^ : ::      :  |  0                  |  0        |
    movl    (%rbp,%rsi,4), %edx                   // |  7  ::^v v:      :  |  0                  |  0        |
    cmpl    %edx, %ecx                            // |  7  :vv: ::      :  |  0                  |  6 ^^^^^^ |
    jle .LBB0_17                                  // |  7  :::: ::      :  |  0                  |  3  vvv   |
    movl    %edx, (%rax,%rbx,4)                   // |  8 vv:v: ::      :  |  0                  |  0        |
    movl    %ecx, (%rbp,%rsi,4)                   // |  5   v v v:      :  |  0                  |  0        |
    jmp .LBB0_17                                  // |  2        :      :  |  0                  |  0        |
.LBB0_1:                                          // |                     |                     |           |
    xorl    %r10d, %r10d                          // |  3        :  ^   :  |  0                  |  5 ^^^^^  |
.LBB0_2:                                          // |                     |                     |           |
    movl    %r10d, (%r14)                         // |  3        :  v   v  |  0                  |  0        |
    addq    $8, %rsp                              // |  1        x         |  0                  |  6 ^^^^^^ |
    .cfi_def_cfa_offset 40                        // |                     |                     |           |
    popq    %rbx                                  // |  2  ^     x         |  0                  |  0        |
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
