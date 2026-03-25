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
    pushq   %rbx                                  // |  2  v     x         |  0                  |  0        |
    .cfi_def_cfa_offset 16                        // |                     |                     |           |
    .cfi_offset %rbx, -16                         // |                     |                     |           |
    movl    %esi, %r8d                            // |  3     v  :^        |  0                  |  0        |
    shrl    $31, %r8d                             // |  2        :x        |  0                  |  5 ^^^^^  |
    addl    %esi, %r8d                            // |  3     v  :x        |  0                  |  6 ^^^^^^ |
    sarl    %r8d                                  // |  2        :x        |  0                  |  5 ^^^^^  |
    xorl    %r10d, %r10d                          // |  3        :: ^      |  0                  |  5 ^^^^^  |
    cmpl    $2, %esi                              // |  3     v  ::        |  0                  |  6 ^^^^^^ |
    jl  .LBB0_4                                   // |  2        ::        |  0                  |  2   vv   |
    movl    %r8d, %r9d                            // |  3        :v^       |  0                  |  0        |
    leal    -1(%rsi), %r11d                       // |  5     v  ::: ^     |  0                  |  0        |
    xorl    %ecx, %ecx                            // |  5   ^    ::: :     |  0                  |  5 ^^^^^  |
    xorl    %r10d, %r10d                          // |  6   :    :::^:     |  0                  |  5 ^^^^^  |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_2:                                          // |                     |                     |           |
    movl    (%rdi,%rcx,4), %eax                   // |  7 ^ v  v ::: :     |  0                  |  0        |
    movslq  %r11d, %rbx                           // |  7 :^:    ::: v     |  0                  |  0        |
    cmpl    (%rdi,%rbx,4), %eax                   // |  8 vv:  v ::: :     |  0                  |  6 ^^^^^^ |
    jne .LBB0_7                                   // |  6 : :    ::: :     |  0                  |  1  v     |
    leal    (%r10,%rax,2), %r10d                  // |  7 v :    :::^:     |  0                  |  0        |
    incq    %rcx                                  // |  6   x    :::::     |  0                  |  5  ^^^^^ |
    decl    %r11d                                 // |  6   :    ::::x     |  0                  |  5  ^^^^^ |
    cmpq    %rcx, %r9                             // |  5   v    ::v:      |  0                  |  6 ^^^^^^ |
    jne .LBB0_2                                   // |  3        :: :      |  0                  |  1  v     |
.LBB0_4:                                          // |                     |                     |           |
    andl    $-2147483647, %esi                    // |  4     x  :: :      |  0                  |  5 ^^^^^  |
    cmpl    $1, %esi                              // |  4     v  :: :      |  0                  |  6 ^^^^^^ |
    jne .LBB0_6                                   // |  3        :: :      |  0                  |  1  v     |
    movslq  %r8d, %rax                            // |  4 ^      :v :      |  0                  |  0        |
    addl    (%rdi,%rax,4), %r10d                  // |  4 v    v :  x      |  0                  |  6 ^^^^^^ |
.LBB0_6:                                          // |                     |                     |           |
    cmpl    %edx, %r10d                           // |  4 :  v   :  v      |  0                  |  6 ^^^^^^ |
    setle   %al                                   // |  2 x      :         |  0                  |  3  vvv   |
    popq    %rbx                                  // |  2  ^     x         |  0                  |  0        |
    .cfi_def_cfa_offset 8                         // |                     |                     |           |
    retq                                          // |  1        x         |  0                  |  0        |
.LBB0_7:                                          // |                     |                     |           |
    .cfi_def_cfa_offset 16                        // |                     |                     |           |
    xorl    %eax, %eax                            // |  2 ^      :         |  0                  |  5 ^^^^^  |
    popq    %rbx                                  // |  2  ^     x         |  0                  |  0        |
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
