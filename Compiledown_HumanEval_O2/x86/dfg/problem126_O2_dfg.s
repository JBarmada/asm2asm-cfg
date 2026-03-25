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
    testl   %esi, %esi                            // |  1     v            |  0                  |  6 ^^^^^^ |
    je  .LBB0_9                                   // |  0                  |  0                  |  1  v     |
    pushq   %rbx                                  // |  2  v     x         |  0                  |  0        |
    .cfi_def_cfa_offset 16                        // |                     |                     |           |
    .cfi_offset %rbx, -16                         // |                     |                     |           |
    cmpl    $2, %esi                              // |  2     v  :         |  0                  |  6 ^^^^^^ |
    jl  .LBB0_11                                  // |  1        :         |  0                  |  2   vv   |
    movl    (%rdi), %r9d                          // |  3      v : ^       |  0                  |  0        |
    movl    4(%rdi), %r10d                        // |  4      v : :^      |  0                  |  0        |
    movb    $1, %al                               // |  4 ^      : ::      |  0                  |  0        |
    cmpl    %r9d, %r10d                           // |  3        : vv      |  0                  |  6 ^^^^^^ |
    jl  .LBB0_12                                  // |  3        : ::      |  0                  |  2   vv   |
    movl    %esi, %r8d                            // |  5     v  :^::      |  0                  |  0        |
    movl    $1, %edx                              // |  5    ^   ::::      |  0                  |  0        |
    movb    $1, %al                               // |  6 ^  :   ::::      |  0                  |  0        |
    movl    $2, %esi                              // |  7 :  :^  ::::      |  0                  |  0        |
    movl    $4294967295, %ebx                     // |  8 :^ ::  ::::      |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_4:                                          // |                     |                     |           |
    movl    %r10d, %r11d                          // |  9 :: ::  :::v^     |  0                  |  0        |
    cmpq    $2, %rdx                              // |  8 :: v:  ::: :     |  0                  |  6 ^^^^^^ |
    jb  .LBB0_7                                   // |  8 :: ::  ::: :     |  0                  |  1 v      |
    cmpl    %r9d, %r11d                           // |  8 :: ::  ::v v     |  0                  |  6 ^^^^^^ |
    jne .LBB0_7                                   // |  8 :: ::  ::: :     |  0                  |  1  v     |
    movl    %ebx, %ecx                            // |  9 :v^::  ::: :     |  0                  |  0        |
    cmpl    (%rdi,%rcx,4), %r9d                   // | 10 ::v::v ::v :     |  0                  |  6 ^^^^^^ |
    je  .LBB0_12                                  // |  7 :: ::  ::  :     |  0                  |  1  v     |
.LBB0_7:                                          // |                     |                     |           |
    cmpq    %r8, %rsi                             // |  7 :: :v  :v  :     |  0                  |  6 ^^^^^^ |
    setb    %al                                   // |  6 x: ::  :   :     |  0                  |  2 v:     |
    je  .LBB0_12                                  // |  5  : ::  :   :     |  0                  |  1  v     |
    movl    (%rdi,%rsi,4), %r10d                  // |  7  : :vv :  ^:     |  0                  |  0        |
    incq    %rsi                                  // |  6  : :x  :  ::     |  0                  |  5  ^^^^^ |
    incq    %rbx                                  // |  5  x :   :  ::     |  0                  |  5  ^^^^^ |
    incq    %rdx                                  // |  4    x   :  ::     |  0                  |  5  ^^^^^ |
    movl    %r11d, %r9d                           // |  4        : ^:v     |  0                  |  0        |
    cmpl    %r11d, %r10d                          // |  3        :  vv     |  0                  |  6 ^^^^^^ |
    jge .LBB0_4                                   // |  1        :         |  0                  |  2   vv   |
    jmp .LBB0_12                                  // |  1        :         |  0                  |  0        |
.LBB0_9:                                          // |                     |                     |           |
    .cfi_def_cfa_offset 8                         // |                     |                     |           |
    .cfi_restore %rbx                             // |                     |                     |           |
    movb    $1, %al                               // |  2 ^      :         |  0                  |  0        |
    andb    $1, %al                               // |  2 x      :         |  0                  |  5 ^^^^^  |
    retq                                          // |  1        x         |  0                  |  0        |
.LBB0_11:                                         // |                     |                     |           |
    .cfi_def_cfa_offset 16                        // |                     |                     |           |
    .cfi_offset %rbx, -16                         // |                     |                     |           |
    xorl    %eax, %eax                            // |  2 ^      :         |  0                  |  5 ^^^^^  |
.LBB0_12:                                         // |                     |                     |           |
    xorb    $1, %al                               // |  2 ^      :         |  0                  |  5 ^^^^^  |
    popq    %rbx                                  // |  3 :^     x         |  0                  |  0        |
    .cfi_def_cfa_offset 8                         // |                     |                     |           |
    .cfi_restore %rbx                             // |                     |                     |           |
    andb    $1, %al                               // |  2 x      :         |  0                  |  5 ^^^^^  |
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
