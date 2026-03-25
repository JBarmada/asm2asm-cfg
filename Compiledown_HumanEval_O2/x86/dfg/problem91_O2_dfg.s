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
    movl    $-1, %eax                             // |  1 ^                |  0                  |  0        |
    cmpl    $2, %esi                              // |  1     v            |  0                  |  6 ^^^^^^ |
    jl  .LBB0_6                                   // |  0                  |  0                  |  2   vv   |
    movl    %esi, %r8d                            // |  2     v   ^        |  0                  |  0        |
    leaq    (,%r8,4), %r9                         // |  2         v^       |  0                  |  0        |
    andq    $-8, %r9                              // |  2         :x       |  0                  |  5 ^^^^^  |
    movl    $2147483647, %ecx                     // |  3   ^     ::       |  0                  |  0        |
    xorl    %r10d, %r10d                          // |  4   :     ::^      |  0                  |  5 ^^^^^  |
    movl    $2147483647, %eax                     // |  5 ^ :     :::      |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_2:                                          // |                     |                     |           |
    movl    (%rdi,%r10), %edx                     // |  7 : :^ v  ::v      |  0                  |  0        |
    cmpl    %eax, %edx                            // |  6 v :v    :::      |  0                  |  6 ^^^^^^ |
    movl    %edx, %esi                            // |  7 : :v^   :::      |  0                  |  0        |
    cmovel  %ecx, %esi                            // |  7 : v:^   :::      |  0                  |  0        |
    cmpl    %ecx, %edx                            // |  6 : vv    :::      |  0                  |  6 ^^^^^^ |
    cmovgel %ecx, %esi                            // |  7 : v:^   :::      |  0                  |  0        |
    cmpl    %eax, %edx                            // |  5 v  v    :::      |  0                  |  6 ^^^^^^ |
    cmovgel %eax, %edx                            // |  5 v  ^    :::      |  0                  |  0        |
    cmovll  %eax, %esi                            // |  6 v  :^   :::      |  0                  |  0        |
    movl    4(%rdi,%r10), %eax                    // |  7 ^  ::v  ::v      |  0                  |  0        |
    cmpl    %edx, %eax                            // |  6 v  v:   :::      |  0                  |  6 ^^^^^^ |
    movl    %eax, %ecx                            // |  7 v ^::   :::      |  0                  |  0        |
    cmovel  %esi, %ecx                            // |  7 : ^:v   :::      |  0                  |  0        |
    cmpl    %esi, %eax                            // |  6 v  :v   :::      |  0                  |  6 ^^^^^^ |
    cmovgel %esi, %ecx                            // |  7 : ^:v   :::      |  0                  |  0        |
    cmpl    %edx, %eax                            // |  5 v  v    :::      |  0                  |  6 ^^^^^^ |
    cmovgel %edx, %eax                            // |  5 ^  v    :::      |  0                  |  0        |
    cmovll  %edx, %ecx                            // |  6 : ^v    :::      |  0                  |  0        |
    addq    $8, %r10                              // |  5 : :     ::x      |  0                  |  6 ^^^^^^ |
    cmpq    %r10, %r9                             // |  5 : :     :vv      |  0                  |  6 ^^^^^^ |
    jne .LBB0_2                                   // |  4 : :     : :      |  0                  |  1  v     |
    testb   $1, %r8b                              // |  4 : :     v :      |  0                  |  6 ^^^^^^ |
    je  .LBB0_5                                   // |  3 : :       :      |  0                  |  1  v     |
    movl    (%rdi,%r10), %edx                     // |  5 : :^ v    v      |  0                  |  0        |
    cmpl    %eax, %edx                            // |  3 v :v             |  0                  |  6 ^^^^^^ |
    movl    %edx, %esi                            // |  4 : :v^            |  0                  |  0        |
    cmovel  %ecx, %esi                            // |  4 : v:^            |  0                  |  0        |
    cmpl    %ecx, %edx                            // |  3 : vv             |  0                  |  6 ^^^^^^ |
    cmovgel %ecx, %esi                            // |  4 : v:^            |  0                  |  0        |
    cmpl    %eax, %edx                            // |  2 v  v             |  0                  |  6 ^^^^^^ |
    cmovll  %eax, %esi                            // |  2 v   ^            |  0                  |  0        |
    movl    %esi, %ecx                            // |  2   ^ v            |  0                  |  0        |
.LBB0_5:                                          // |                     |                     |           |
    cmpl    $2147483647, %ecx                     // |  1   v              |  0                  |  6 ^^^^^^ |
    movl    $-1, %eax                             // |  2 ^ :              |  0                  |  0        |
    cmovnel %ecx, %eax                            // |  2 ^ v              |  0                  |  0        |
.LBB0_6:                                          // |                     |                     |           |
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
