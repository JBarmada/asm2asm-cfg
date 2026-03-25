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
    testl   %edi, %edi                            // |  1      v           |  0                  |  6 ^^^^^^ |
    jle .LBB0_1                                   // |  0                  |  0                  |  3  vvv   |
    movl    %edi, %r8d                            // |  2      v  ^        |  0                  |  0        |
    leaq    -1(%r8), %rax                         // |  2 ^       v        |  0                  |  0        |
    movl    %r8d, %r9d                            // |  3 :       v^       |  0                  |  0        |
    andl    $7, %r9d                              // |  3 :       :x       |  0                  |  5 ^^^^^  |
    cmpq    $7, %rax                              // |  3 v       ::       |  0                  |  6 ^^^^^^ |
    jae .LBB0_8                                   // |  2         ::       |  0                  |  1 v      |
    movl    $1, %edx                              // |  3    ^    ::       |  0                  |  0        |
    movl    $1, %eax                              // |  3 ^       ::       |  0                  |  0        |
    movl    $1, %edi                              // |  3      ^  ::       |  0                  |  0        |
    testq   %r9, %r9                              // |  2         :v       |  0                  |  6 ^^^^^^ |
    jne .LBB0_6                                   // |  2         ::       |  0                  |  1  v     |
    jmp .LBB0_7                                   // |  2         ::       |  0                  |  0        |
.LBB0_1:                                          // |                     |                     |           |
    movl    $1, %eax                              // |  3 ^       ::       |  0                  |  0        |
    retq                                          // |  3        x::       |  0                  |  0        |
.LBB0_8:                                          // |                     |                     |           |
    andl    $-8, %r8d                             // |  3        :x:       |  0                  |  5 ^^^^^  |
    negq    %r8                                   // |  3        :x:       |  0                  |  0        |
    movl    $1, %eax                              // |  4 ^      :::       |  0                  |  0        |
    movl    $8, %edx                              // |  5 :  ^   :::       |  0                  |  0        |
    movl    $1, %edi                              // |  6 :  : ^ :::       |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_9:                                          // |                     |                     |           |
    leaq    -7(%rdx), %rsi                        // |  7 :  v^: :::       |  0                  |  0        |
    imulq   %rdi, %rsi                            // |  7 x  x^v :::       |  0                  |  2 ^  ^   |
    imulq   %rsi, %rax                            // |  6 ^  xv  :::       |  0                  |  2 ^  ^   |
    leaq    -6(%rdx), %rdi                        // |  7 :  v:^ :::       |  0                  |  0        |
    imulq   %rsi, %rdi                            // |  7 x  xv^ :::       |  0                  |  2 ^  ^   |
    imulq   %rdi, %rax                            // |  6 ^  x v :::       |  0                  |  2 ^  ^   |
    leaq    -5(%rdx), %rsi                        // |  7 :  v^: :::       |  0                  |  0        |
    imulq   %rdi, %rsi                            // |  7 x  x^v :::       |  0                  |  2 ^  ^   |
    imulq   %rsi, %rax                            // |  6 ^  xv  :::       |  0                  |  2 ^  ^   |
    leaq    -4(%rdx), %rdi                        // |  7 :  v:^ :::       |  0                  |  0        |
    imulq   %rsi, %rdi                            // |  7 x  xv^ :::       |  0                  |  2 ^  ^   |
    imulq   %rdi, %rax                            // |  6 ^  x v :::       |  0                  |  2 ^  ^   |
    leaq    -3(%rdx), %rsi                        // |  7 :  v^: :::       |  0                  |  0        |
    imulq   %rdi, %rsi                            // |  7 x  x^v :::       |  0                  |  2 ^  ^   |
    imulq   %rsi, %rax                            // |  6 ^  xv  :::       |  0                  |  2 ^  ^   |
    leaq    -2(%rdx), %rcx                        // |  7 : ^v:  :::       |  0                  |  0        |
    imulq   %rsi, %rcx                            // |  7 x ^xv  :::       |  0                  |  2 ^  ^   |
    imulq   %rcx, %rax                            // |  6 ^ vx   :::       |  0                  |  2 ^  ^   |
    leaq    -1(%rdx), %rdi                        // |  7 : :v ^ :::       |  0                  |  0        |
    imulq   %rcx, %rdi                            // |  7 x vx ^ :::       |  0                  |  2 ^  ^   |
    imulq   %rdi, %rax                            // |  6 ^  x v :::       |  0                  |  2 ^  ^   |
    imulq   %rdx, %rdi                            // |  6 x  x ^ :::       |  0                  |  2 ^  ^   |
    imulq   %rdi, %rax                            // |  6 ^  x v :::       |  0                  |  2 ^  ^   |
    leaq    (%r8,%rdx), %rcx                      // |  6 : ^v   :v:       |  0                  |  0        |
    addq    $8, %rcx                              // |  5 : x:   : :       |  0                  |  6 ^^^^^^ |
    addq    $8, %rdx                              // |  5 : :x   : :       |  0                  |  6 ^^^^^^ |
    cmpq    $8, %rcx                              // |  5 : v:   : :       |  0                  |  6 ^^^^^^ |
    jne .LBB0_9                                   // |  4 :  :   : :       |  0                  |  1  v     |
    addq    $-7, %rdx                             // |  4 :  x   : :       |  0                  |  6 ^^^^^^ |
    testq   %r9, %r9                              // |  4 :  :   : v       |  0                  |  6 ^^^^^^ |
    je  .LBB0_7                                   // |  4 :  :   : :       |  0                  |  1  v     |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_6:                                          // |                     |                     |           |
    imulq   %rdx, %rdi                            // |  5 x  x ^ : :       |  0                  |  2 ^  ^   |
    imulq   %rdi, %rax                            // |  5 ^  x v : :       |  0                  |  2 ^  ^   |
    incq    %rdx                                  // |  3    x   : :       |  0                  |  5  ^^^^^ |
    decq    %r9                                   // |  2        : x       |  0                  |  5  ^^^^^ |
    jne .LBB0_6                                   // |  1        :         |  0                  |  1  v     |
.LBB0_7:                                          // |                     |                     |           |
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
