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
    movl    $-1, %eax                             // |  2 ^      :         |  0                  |  0        |
    cmpl    $2, %esi                              // |  2     v  :         |  0                  |  6 ^^^^^^ |
    jl  .LBB0_5                                   // |  1        :         |  0                  |  2   vv   |
    movl    %esi, %eax                            // |  3 ^   v  :         |  0                  |  0        |
    movl    (%rdi), %esi                          // |  4 :   ^v :         |  0                  |  0        |
    leaq    -1(%rax), %r8                         // |  4 v   :  :^        |  0                  |  0        |
    addq    $-2, %rax                             // |  4 x   :  ::        |  0                  |  6 ^^^^^^ |
    movl    %r8d, %r9d                            // |  5 :   :  :v^       |  0                  |  0        |
    andl    $3, %r9d                              // |  5 :   :  ::x       |  0                  |  5 ^^^^^  |
    cmpq    $3, %rax                              // |  5 v   :  :::       |  0                  |  6 ^^^^^^ |
    jae .LBB0_6                                   // |  4     :  :::       |  0                  |  1 v      |
    movl    $-1, %eax                             // |  5 ^   :  :::       |  0                  |  0        |
    movl    $1, %edx                              // |  5    ^:  :::       |  0                  |  0        |
    jmp .LBB0_3                                   // |  4     :  :::       |  0                  |  0        |
.LBB0_6:                                          // |                     |                     |           |
    andq    $-4, %r8                              // |  4     :  :x:       |  0                  |  5 ^^^^^  |
    movl    $-1, %eax                             // |  5 ^   :  :::       |  0                  |  0        |
    movl    $1, %edx                              // |  5    ^:  :::       |  0                  |  0        |
    xorl    %ebx, %ebx                            // |  6  ^ ::  :::       |  0                  |  5 ^^^^^  |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_7:                                          // |                     |                     |           |
    movl    (%rdi,%rdx,4), %r10d                  // |  8  : v:v :::^      |  0                  |  0        |
    movl    4(%rdi,%rdx,4), %r11d                 // |  9  : v:v ::::^     |  0                  |  0        |
    cmpl    %esi, %r10d                           // |  8  : :v  :::v:     |  0                  |  6 ^^^^^^ |
    cmovll  %edx, %eax                            // |  8 ^: v   :::::     |  0                  |  0        |
    leal    1(%rdx), %esi                         // |  9 :: v^  :::::     |  0                  |  0        |
    cmpl    %r10d, %r11d                          // |  8 :: :   :::vv     |  0                  |  6 ^^^^^^ |
    cmovgel %eax, %esi                            // |  8 v: :^  ::: :     |  0                  |  0        |
    leal    2(%rdx), %ecx                         // |  8  :^v:  ::: :     |  0                  |  0        |
    movl    8(%rdi,%rdx,4), %r10d                 // |  9  : v:v :::^:     |  0                  |  0        |
    cmpl    %r11d, %r10d                          // |  8  : ::  :::vv     |  0                  |  6 ^^^^^^ |
    cmovgel %esi, %ecx                            // |  8  :^:v  ::::      |  0                  |  0        |
    leal    3(%rdx), %eax                         // |  8 ^::v   ::::      |  0                  |  0        |
    movl    12(%rdi,%rdx,4), %esi                 // |  9  ::v^v ::::      |  0                  |  0        |
    cmpl    %r10d, %esi                           // |  8  :::v  :::v      |  0                  |  6 ^^^^^^ |
    cmovgel %ecx, %eax                            // |  8 ^:v::  :::       |  0                  |  0        |
    addq    $4, %rdx                              // |  6  : x:  :::       |  0                  |  6 ^^^^^^ |
    addq    $4, %rbx                              // |  6  x ::  :::       |  0                  |  6 ^^^^^^ |
    cmpq    %r8, %rbx                             // |  6  v ::  :v:       |  0                  |  6 ^^^^^^ |
    jne .LBB0_7                                   // |  4    ::  : :       |  0                  |  1  v     |
.LBB0_3:                                          // |                     |                     |           |
    testq   %r9, %r9                              // |  4    ::  : v       |  0                  |  6 ^^^^^^ |
    je  .LBB0_5                                   // |  4    ::  : :       |  0                  |  1  v     |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_4:                                          // |                     |                     |           |
    movl    (%rdi,%rdx,4), %ecx                   // |  6   ^v:v : :       |  0                  |  0        |
    cmpl    %esi, %ecx                            // |  5   v:v  : :       |  0                  |  6 ^^^^^^ |
    cmovll  %edx, %eax                            // |  5 ^ :v   : :       |  0                  |  0        |
    incq    %rdx                                  // |  4   :x   : :       |  0                  |  5  ^^^^^ |
    movl    %ecx, %esi                            // |  4   v ^  : :       |  0                  |  0        |
    decq    %r9                                   // |  2        : x       |  0                  |  5  ^^^^^ |
    jne .LBB0_4                                   // |  1        :         |  0                  |  1  v     |
.LBB0_5:                                          // |                     |                     |           |
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
