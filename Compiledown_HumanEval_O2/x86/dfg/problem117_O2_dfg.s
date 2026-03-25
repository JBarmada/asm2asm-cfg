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
    .cfi_offset %rbx, -40                         // |                     |                     |           |
    .cfi_offset %r14, -32                         // |                     |                     |           |
    .cfi_offset %r15, -24                         // |                     |                     |           |
    .cfi_offset %rbp, -16                         // |                     |                     |           |
    testl   %esi, %esi                            // |  2     v  :         |  0                  |  6 ^^^^^^ |
    jle .LBB0_16                                  // |  1        :         |  0                  |  3  vvv   |
    movl    %esi, %r10d                           // |  3     v  :  ^      |  0                  |  0        |
    movl    $1, %r9d                              // |  3        : ^:      |  0                  |  0        |
    xorl    %r8d, %r8d                            // |  4        :^::      |  0                  |  5 ^^^^^  |
    jmp .LBB0_3                                   // |  4        ::::      |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_2:                                          // |                     |                     |           |
    incq    %r9                                   // |  4        ::x:      |  0                  |  5  ^^^^^ |
    cmpq    %r10, %r8                             // |  4        :v:v      |  0                  |  6 ^^^^^^ |
    je  .LBB0_16                                  // |  4        ::::      |  0                  |  1  v     |
.LBB0_3:                                          // |                     |                     |           |
    movq    %r8, %r11                             // |  5        :v::^     |  0                  |  0        |
    incq    %r8                                   // |  5        :x:::     |  0                  |  5  ^^^^^ |
    cmpq    %r10, %r8                             // |  5        :v:v:     |  0                  |  6 ^^^^^^ |
    jae .LBB0_2                                   // |  4        : :::     |  0                  |  1 v      |
    movq    %r9, %rcx                             // |  5   ^    : v::     |  0                  |  0        |
    jmp .LBB0_5                                   // |  4   :    :  ::     |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_14:                                         // |                     |                     |           |
    movl    %r15d, (%rdi,%r11,4)                  // |  6   :  v :  :v   v |  0                  |  0        |
    movl    %r14d, (%rdi,%rcx,4)                  // |  6   v  v :  ::  v  |  0                  |  0        |
.LBB0_15:                                         // |                     |                     |           |
    incq    %rcx                                  // |  4   x    :  ::     |  0                  |  5  ^^^^^ |
    cmpq    %r10, %rcx                            // |  4   v    :  v:     |  0                  |  6 ^^^^^^ |
    je  .LBB0_2                                   // |  3   :    :   :     |  0                  |  1  v     |
.LBB0_5:                                          // |                     |                     |           |
    movl    (%rdi,%r11,4), %r14d                  // |  5   :  v :   v  ^  |  0                  |  0        |
    xorl    %eax, %eax                            // |  4 ^ :    :      :  |  0                  |  5 ^^^^^  |
    movl    $0, %esi                              // |  4   : ^  :      :  |  0                  |  0        |
    testl   %r14d, %r14d                          // |  3   :    :      v  |  0                  |  6 ^^^^^^ |
    jle .LBB0_8                                   // |  3   :    :      :  |  0                  |  3  vvv   |
    xorl    %esi, %esi                            // |  4   : ^  :      :  |  0                  |  5 ^^^^^  |
    movl    %r14d, %edx                           // |  5   :^:  :      v  |  0                  |  0        |
    movl    %r14d, %ebx                           // |  6  ^:::  :      v  |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_7:                                          // |                     |                     |           |
    movl    %edx, %ebp                            // |  7  ::v: ^:      :  |  0                  |  0        |
    andl    $1, %ebp                              // |  7  :::: x:      :  |  0                  |  5 ^^^^^  |
    addl    %ebp, %esi                            // |  7  :::x v:      :  |  0                  |  6 ^^^^^^ |
    shrl    %ebx                                  // |  6  x:::  :      :  |  0                  |  5 ^^^^^  |
    cmpl    $2, %edx                              // |  6  ::v:  :      :  |  0                  |  6 ^^^^^^ |
    movl    %ebx, %edx                            // |  6  v:^:  :      :  |  0                  |  1 :      |
    jae .LBB0_7                                   // |  4   : :  :      :  |  0                  |  1 v      |
.LBB0_8:                                          // |                     |                     |           |
    movl    (%rdi,%rcx,4), %r15d                  // |  6   v :v :      :^ |  0                  |  0        |
    testl   %r15d, %r15d                          // |  4     :  :      :v |  0                  |  6 ^^^^^^ |
    jle .LBB0_11                                  // |  4     :  :      :: |  0                  |  3  vvv   |
    xorl    %eax, %eax                            // |  5 ^   :  :      :: |  0                  |  5 ^^^^^  |
    movl    %r15d, %edx                           // |  6 :  ^:  :      :v |  0                  |  0        |
    movl    %r15d, %ebp                           // |  7 :  :: ^:      :v |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_10:                                         // |                     |                     |           |
    movl    %edx, %ebx                            // |  8 :^ v: ::      :: |  0                  |  0        |
    andl    $1, %ebx                              // |  8 :x :: ::      :: |  0                  |  5 ^^^^^  |
    addl    %ebx, %eax                            // |  8 xv :: ::      :: |  0                  |  6 ^^^^^^ |
    shrl    %ebp                                  // |  7 :  :: x:      :: |  0                  |  5 ^^^^^  |
    cmpl    $1, %edx                              // |  7 :  v: ::      :: |  0                  |  6 ^^^^^^ |
    movl    %ebp, %edx                            // |  7 :  ^: v:      :: |  0                  |  2 ::     |
    ja  .LBB0_10                                  // |  5 :   :  :      :: |  0                  |  2 vv     |
.LBB0_11:                                         // |                     |                     |           |
    cmpl    %esi, %eax                            // |  5 v   v  :      :: |  0                  |  6 ^^^^^^ |
    jb  .LBB0_14                                  // |  3        :      :: |  0                  |  2 v:     |
    jne .LBB0_15                                  // |  3        :      :: |  0                  |  1  v     |
    cmpl    %r14d, %r15d                          // |  3        :      vv |  0                  |  6 ^^^^^^ |
    jl  .LBB0_14                                  // |  1        :         |  0                  |  2   vv   |
    jmp .LBB0_15                                  // |  1        :         |  0                  |  0        |
.LBB0_16:                                         // |                     |                     |           |
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
