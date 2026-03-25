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
    pushq   %r12                                  // |  2        x    v    |  0                  |  0        |
    .cfi_def_cfa_offset 40                        // |                     |                     |           |
    pushq   %rbx                                  // |  2  v     x         |  0                  |  0        |
    .cfi_def_cfa_offset 48                        // |                     |                     |           |
    .cfi_offset %rbx, -48                         // |                     |                     |           |
    .cfi_offset %r12, -40                         // |                     |                     |           |
    .cfi_offset %r14, -32                         // |                     |                     |           |
    .cfi_offset %r15, -24                         // |                     |                     |           |
    .cfi_offset %rbp, -16                         // |                     |                     |           |
    movq    %rsi, %r14                            // |  3     v  :      ^  |  0                  |  0        |
    movq    %rdi, %rbx                            // |  4  ^   v :      :  |  0                  |  0        |
    xorl    %ecx, %ecx                            // |  4  :^    :      :  |  0                  |  5 ^^^^^  |
    xorl    %ebp, %ebp                            // |  5  ::   ^:      :  |  0                  |  5 ^^^^^  |
    xorl    %r15d, %r15d                          // |  6  ::   ::      :^ |  0                  |  5 ^^^^^  |
    xorl    %eax, %eax                            // |  7 ^::   ::      :: |  0                  |  5 ^^^^^  |
    jmp .LBB0_1                                   // |  7 :::   ::      :: |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_3:                                          // |                     |                     |           |
    testl   %edx, %edx                            // |  8 :::v  ::      :: |  0                  |  6 ^^^^^^ |
    je  .LBB0_4                                   // |  7 :::   ::      :: |  0                  |  1  v     |
.LBB0_8:                                          // |                     |                     |           |
    incq    %rbx                                  // |  7 :x:   ::      :: |  0                  |  5  ^^^^^ |
.LBB0_1:                                          // |                     |                     |           |
    movzbl  (%rbx), %edx                          // |  8 :v:^  ::      :: |  0                  |  0        |
    cmpl    $40, %edx                             // |  8 :::v  ::      :: |  0                  |  6 ^^^^^^ |
    je  .LBB0_5                                   // |  8 ::::  ::      :: |  0                  |  1  v     |
    cmpl    $41, %edx                             // |  8 :::v  ::      :: |  0                  |  6 ^^^^^^ |
    jne .LBB0_3                                   // |  7 :::   ::      :: |  0                  |  1  v     |
    decl    %ecx                                  // |  7 ::x   ::      :: |  0                  |  5  ^^^^^ |
    jne .LBB0_8                                   // |  6 ::    ::      :: |  0                  |  1  v     |
    movslq  %r15d, %r12                           // |  7 ::    ::    ^ :v |  0                  |  0        |
    incl    %r15d                                 // |  7 ::    ::    : :x |  0                  |  5  ^^^^^ |
    leaq    4(,%r12,4), %rsi                      // |  8 ::  ^ ::    v :: |  0                  |  0        |
    movq    %rax, %rdi                            // |  8 v:   ^::    : :: |  0                  |  0        |
    callq   realloc@PLT                           // |  7 ::    :x    : :: |  0                  |  0        |
    movl    %ebp, (%rax,%r12,4)                   // |  7 v:    v:    v :: |  0                  |  0        |
    xorl    %ecx, %ecx                            // |  5  :^    :      :: |  0                  |  5 ^^^^^  |
    xorl    %ebp, %ebp                            // |  6  ::   ^:      :: |  0                  |  5 ^^^^^  |
    jmp .LBB0_8                                   // |  6  ::   ::      :: |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_5:                                          // |                     |                     |           |
    cmpl    %ebp, %ecx                            // |  6  :v   v:      :: |  0                  |  6 ^^^^^^ |
    leal    1(%rcx), %ecx                         // |  5  :^    :      :: |  0                  |  0        |
    cmovgel %ecx, %ebp                            // |  6  :v   ^:      :: |  0                  |  0        |
    incq    %rbx                                  // |  4  x     :      :: |  0                  |  5  ^^^^^ |
    jmp .LBB0_1                                   // |  3        :      :: |  0                  |  0        |
.LBB0_4:                                          // |                     |                     |           |
    movl    %r15d, (%r14)                         // |  3        :      vv |  0                  |  0        |
    popq    %rbx                                  // |  2  ^     x         |  0                  |  0        |
    .cfi_def_cfa_offset 40                        // |                     |                     |           |
    popq    %r12                                  // |  2        x    ^    |  0                  |  0        |
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
