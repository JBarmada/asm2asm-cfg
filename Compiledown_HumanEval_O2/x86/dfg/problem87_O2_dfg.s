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
    subq    $72, %rsp                             // |  1        x         |  0                  |  6 ^^^^^^ |
    .cfi_def_cfa_offset 128                       // |                     |                     |           |
    .cfi_offset %rbx, -56                         // |                     |                     |           |
    .cfi_offset %r12, -48                         // |                     |                     |           |
    .cfi_offset %r13, -40                         // |                     |                     |           |
    .cfi_offset %r14, -32                         // |                     |                     |           |
    .cfi_offset %r15, -24                         // |                     |                     |           |
    .cfi_offset %rbp, -16                         // |                     |                     |           |
    movq    %rdi, %rbx                            // |  3  ^   v :         |  0                  |  0        |
    callq   strlen@PLT                            // |  2  :     x         |  0                  |  0        |
    movq    %rax, %rbp                            // |  4 v:    ^:         |  0                  |  0        |
    addl    $2, %eax                              // |  4 x:    ::         |  0                  |  6 ^^^^^^ |
    movslq  %eax, %rdi                            // |  5 v:   ^::         |  0                  |  0        |
    callq   malloc@PLT                            // |  4 ::    :x         |  0                  |  0        |
    movq    %rbp, %r11                            // |  5 ::    v:   ^     |  0                  |  0        |
    movq    %rax, 8(%rsp)                         // |  4 v:     v   :     |  0                  |  0        |
    xorl    %r14d, %r14d                          // |  5 ::     :   :  ^  |  0                  |  5 ^^^^^  |
    testl   $-2147483648, %r11d                   // |  4 ::     :   v     |  0                  |  6 ^^^^^^ |
    jne .LBB0_17                                  // |  4 ::     :   :     |  0                  |  1  v     |
    movq    %rbx, %r10                            // |  5 :v     :  ^:     |  0                  |  0        |
    incl    %r11d                                 // |  4 :      :  :x     |  0                  |  5  ^^^^^ |
    xorl    %r13d, %r13d                          // |  5 :      :  :: ^   |  0                  |  5 ^^^^^  |
    xorl    %r14d, %r14d                          // |  6 :      :  :: :^  |  0                  |  5 ^^^^^  |
    xorl    %r12d, %r12d                          // |  7 :      :  ::^::  |  0                  |  5 ^^^^^  |
    jmp .LBB0_2                                   // |  7 :      :  :::::  |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_15:                                         // |                     |                     |           |
    movslq  %r12d, %rcx                           // |  8 : ^    :  ::v::  |  0                  |  0        |
    incl    %r12d                                 // |  8 : :    :  ::x::  |  0                  |  5  ^^^^^ |
    movb    %al, 16(%rsp,%rcx)                    // |  8 v v    v  :::::  |  0                  |  0        |
    movl    %r12d, %r15d                          // |  7        :  ::v::^ |  0                  |  0        |
.LBB0_16:                                         // |                     |                     |           |
    incq    %r13                                  // |  6        :  :: x:: |  0                  |  5  ^^^^^ |
    movl    %r15d, %r12d                          // |  7        :  ::^::v |  0                  |  0        |
    cmpq    %r11, %r13                            // |  6        :  :v:v:  |  0                  |  6 ^^^^^^ |
    je  .LBB0_17                                  // |  6        :  :::::  |  0                  |  1  v     |
.LBB0_2:                                          // |                     |                     |           |
    movzbl  (%r10,%r13), %eax                     // |  7 ^      :  v::v:  |  0                  |  0        |
    testb   $-33, %al                             // |  6 v      :  ::: :  |  0                  |  6 ^^^^^^ |
    jne .LBB0_15                                  // |  5        :  ::: :  |  0                  |  1  v     |
    cmpl    $2, %r12d                             // |  5        :  ::v :  |  0                  |  6 ^^^^^^ |
    jl  .LBB0_7                                   // |  5        :  ::: :  |  0                  |  2   vv   |
    leal    -1(%r12), %r8d                        // |  6        :^ ::v :  |  0                  |  0        |
    movl    %r12d, %r9d                           // |  7        ::^::v :  |  0                  |  0        |
    leaq    -1(%r9), %rdx                         // |  8    ^   ::v::: :  |  0                  |  0        |
    leaq    17(%rsp), %rsi                        // |  9    :^  v::::: :  |  0                  |  0        |
    xorl    %ebx, %ebx                            // | 10  ^ ::  :::::: :  |  0                  |  5 ^^^^^  |
    jmp .LBB0_5                                   // | 10  : ::  :::::: :  |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_6:                                          // |                     |                     |           |
    incq    %rsi                                  // | 10  : :x  :::::: :  |  0                  |  5  ^^^^^ |
    decq    %rdx                                  // | 10  : x:  :::::: :  |  0                  |  5  ^^^^^ |
    cmpq    %r8, %rbx                             // | 10  v ::  :v:::: :  |  0                  |  6 ^^^^^^ |
    je  .LBB0_7                                   // |  9  : ::  : :::: :  |  0                  |  1  v     |
.LBB0_5:                                          // |                     |                     |           |
    movq    %rbx, %rdi                            // | 10  v ::^ : :::: :  |  0                  |  0        |
    incq    %rbx                                  // | 10  x ::: : :::: :  |  0                  |  5  ^^^^^ |
    cmpq    %r9, %rbx                             // | 10  v ::: : v::: :  |  0                  |  6 ^^^^^^ |
    jae .LBB0_6                                   // |  8    ::: :  ::: :  |  0                  |  1 v      |
    xorl    %ebp, %ebp                            // |  9    :::^:  ::: :  |  0                  |  5 ^^^^^  |
    jmp .LBB0_12                                  // |  9    :::::  ::: :  |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_14:                                         // |                     |                     |           |
    incq    %rbp                                  // |  9    :::x:  ::: :  |  0                  |  5  ^^^^^ |
    cmpq    %rbp, %rdx                            // |  9    v::v:  ::: :  |  0                  |  6 ^^^^^^ |
    je  .LBB0_6                                   // |  8     ::::  ::: :  |  0                  |  1  v     |
.LBB0_12:                                         // |                     |                     |           |
    movzbl  16(%rsp,%rdi), %eax                   // |  9 ^   :v:v  ::: :  |  0                  |  0        |
    movzbl  (%rsi,%rbp), %ecx                     // | 10 : ^ v:v:  ::: :  |  0                  |  0        |
    cmpb    %cl, %al                              // | 10 v v ::::  ::: :  |  0                  |  6 ^^^^^^ |
    jle .LBB0_14                                  // | 10 : : ::::  ::: :  |  0                  |  3  vvv   |
    movb    %cl, 16(%rsp,%rdi)                    // | 10 : v :v:v  ::: :  |  0                  |  0        |
    movb    %al, (%rsi,%rbp)                      // |  8 v   v v:  ::: :  |  0                  |  0        |
    jmp .LBB0_14                                  // |  5        :  ::: :  |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_7:                                          // |                     |                     |           |
    testl   %r14d, %r14d                          // |  5        :  ::: v  |  0                  |  6 ^^^^^^ |
    jle .LBB0_9                                   // |  5        :  ::: :  |  0                  |  3  vvv   |
    movl    %r14d, %eax                           // |  6 ^      :  ::: v  |  0                  |  0        |
    incl    %r14d                                 // |  6 :      :  ::: x  |  0                  |  5  ^^^^^ |
    movq    8(%rsp), %rcx                         // |  6 : ^    v  :::    |  0                  |  0        |
    movb    $32, (%rcx,%rax)                      // |  6 v v    :  :::    |  0                  |  0        |
.LBB0_9:                                          // |                     |                     |           |
    xorl    %r15d, %r15d                          // |  5        :  :::  ^ |  0                  |  5 ^^^^^  |
    testl   %r12d, %r12d                          // |  4        :  ::v    |  0                  |  6 ^^^^^^ |
    jle .LBB0_16                                  // |  4        :  :::    |  0                  |  3  vvv   |
    movslq  %r14d, %r14                           // |  5        :  ::: ^  |  0                  |  0        |
    movq    8(%rsp), %rax                         // |  6 ^      v  ::: :  |  0                  |  0        |
    leaq    (%rax,%r14), %rdi                     // |  7 v    ^ :  ::: v  |  0                  |  0        |
    movl    %r12d, %edx                           // |  6    ^   :  ::v :  |  0                  |  0        |
    leaq    16(%rsp), %rsi                        // |  6     ^  v  ::: :  |  0                  |  0        |
    movq    %r10, %rbx                            // |  6  ^     :  v:: :  |  0                  |  0        |
    movq    %r11, %rbp                            // |  6  :    ^:   v: :  |  0                  |  0        |
    callq   memcpy@PLT                            // |  5  :    :x    : :  |  0                  |  0        |
    movq    %rbp, %r11                            // |  6  :    v:   ^: :  |  0                  |  0        |
    movq    %rbx, %r10                            // |  5  v     :  ^ : :  |  0                  |  0        |
    addl    %r12d, %r14d                          // |  3        :    v x  |  0                  |  6 ^^^^^^ |
    jmp .LBB0_16                                  // |  2        :      :  |  0                  |  0        |
.LBB0_17:                                         // |                     |                     |           |
    movslq  %r14d, %rcx                           // |  3   ^    :      v  |  0                  |  0        |
    movq    8(%rsp), %rax                         // |  3 ^ :    v         |  0                  |  0        |
    movb    $0, (%rax,%rcx)                       // |  3 v v    :         |  0                  |  0        |
    addq    $72, %rsp                             // |  1        x         |  0                  |  6 ^^^^^^ |
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
