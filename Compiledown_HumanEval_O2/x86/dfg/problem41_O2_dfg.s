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
    testl   %esi, %esi                            // |  2     v  :         |  0                  |  6 ^^^^^^ |
    jle .LBB0_1                                   // |  1        :         |  0                  |  3  vvv   |
    movl    %esi, %r8d                            // |  3     v  :^        |  0                  |  0        |
    movb    $1, %al                               // |  3 ^      ::        |  0                  |  0        |
    movl    $2, %r14d                             // |  4 :      ::     ^  |  0                  |  0        |
    movl    $1, %r15d                             // |  5 :      ::     :^ |  0                  |  0        |
    xorl    %r9d, %r9d                            // |  6 :      ::^    :: |  0                  |  5 ^^^^^  |
.LBB0_4:                                          // |                     |                     |           |
    movl    %eax, %r10d                           // |  7 v      :::^   :: |  0                  |  0        |
    movq    %r9, %r11                             // |  8 :      ::v:^  :: |  0                  |  0        |
    incq    %r9                                   // |  8 :      ::x::  :: |  0                  |  5  ^^^^^ |
    movq    %r15, %r12                            // |  9 :      :::::^ :v |  0                  |  0        |
    movq    %r14, %rcx                            // | 10 : ^    :::::: v: |  0                  |  0        |
    cmpq    %r8, %r9                              // | 10 : :    :vv::: :: |  0                  |  6 ^^^^^^ |
    setb    %al                                   // | 10 x :    :::::: :: |  0                  |  1 v      |
    jb  .LBB0_6                                   // |  9   :    :::::: :: |  0                  |  1 v      |
.LBB0_3:                                          // |                     |                     |           |
    incq    %r14                                  // |  9   :    :::::: x: |  0                  |  5  ^^^^^ |
    incq    %r15                                  // |  8   :    ::::::  x |  0                  |  5  ^^^^^ |
    cmpq    %r8, %r9                              // |  7   :    :vv:::    |  0                  |  6 ^^^^^^ |
    jne .LBB0_4                                   // |  6   :    :: :::    |  0                  |  1  v     |
    jmp .LBB0_11                                  // |  6   :    :: :::    |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_5:                                          // |                     |                     |           |
    incq    %rcx                                  // |  6   x    :: :::    |  0                  |  5  ^^^^^ |
    cmpq    %r8, %r12                             // |  6   :    :v ::v    |  0                  |  6 ^^^^^^ |
    je  .LBB0_3                                   // |  5   :    :  :::    |  0                  |  1  v     |
.LBB0_6:                                          // |                     |                     |           |
    movq    %r12, %rdx                            // |  6   :^   :  ::v    |  0                  |  0        |
    incq    %r12                                  // |  6   ::   :  ::x    |  0                  |  5  ^^^^^ |
    cmpl    %esi, %r12d                           // |  7   ::v  :  ::v    |  0                  |  6 ^^^^^^ |
    jge .LBB0_5                                   // |  5   ::   :  ::     |  0                  |  2   vv   |
    movl    (%rdi,%rdx,4), %ebp                   // |  7   :v v^:  ::     |  0                  |  0        |
    addl    (%rdi,%r11,4), %ebp                   // |  6   :  vx:  :v     |  0                  |  6 ^^^^^^ |
    movq    %rcx, %rdx                            // |  5   v^  ::  :      |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_9:                                          // |                     |                     |           |
    movl    (%rdi,%rdx,4), %ebx                   // |  6  ^ v v::  :      |  0                  |  0        |
    addl    %ebp, %ebx                            // |  5  x :  v:  :      |  0                  |  6 ^^^^^^ |
    je  .LBB0_10                                  // |  3    :   :  :      |  0                  |  1  v     |
    incq    %rdx                                  // |  3    x   :  :      |  0                  |  5  ^^^^^ |
    cmpl    %esi, %edx                            // |  4    vv  :  :      |  0                  |  6 ^^^^^^ |
    jl  .LBB0_9                                   // |  2        :  :      |  0                  |  2   vv   |
    jmp .LBB0_5                                   // |  2        :  :      |  0                  |  0        |
.LBB0_10:                                         // |                     |                     |           |
    movl    %r10d, %eax                           // |  3 ^      :  v      |  0                  |  0        |
    jmp .LBB0_11                                  // |  1        :         |  0                  |  0        |
.LBB0_1:                                          // |                     |                     |           |
    xorl    %eax, %eax                            // |  2 ^      :         |  0                  |  5 ^^^^^  |
.LBB0_11:                                         // |                     |                     |           |
    andb    $1, %al                               // |  2 x      :         |  0                  |  5 ^^^^^  |
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
