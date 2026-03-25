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
    jle .LBB0_1                                   // |  0                  |  0                  |  3  vvv   |
    movl    %esi, %r8d                            // |  2     v   ^        |  0                  |  0        |
    xorl    %esi, %esi                            // |  2     ^   :        |  0                  |  5 ^^^^^  |
    xorl    %r10d, %r10d                          // |  3     :   : ^      |  0                  |  5 ^^^^^  |
    xorl    %r9d, %r9d                            // |  4     :   :^:      |  0                  |  5 ^^^^^  |
    jmp .LBB0_4                                   // |  4     :   :::      |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_5:                                          // |                     |                     |           |
    cmpl    %r9d, %ecx                            // |  5   v :   :v:      |  0                  |  6 ^^^^^^ |
    movl    %r9d, %eax                            // |  5 ^   :   :v:      |  0                  |  0        |
    cmovgl  %ecx, %eax                            // |  6 ^ v :   :::      |  0                  |  0        |
    testl   %r9d, %r9d                            // |  4     :   :v:      |  0                  |  6 ^^^^^^ |
    cmovel  %ecx, %eax                            // |  5 ^ v :   : :      |  0                  |  0        |
    movl    %eax, %r9d                            // |  5 v   :   :^:      |  0                  |  0        |
.LBB0_8:                                          // |                     |                     |           |
    incq    %rsi                                  // |  3     x   : :      |  0                  |  5  ^^^^^ |
    cmpq    %rsi, %r8                             // |  3     v   v :      |  0                  |  6 ^^^^^^ |
    je  .LBB0_2                                   // |  2     :     :      |  0                  |  1  v     |
.LBB0_4:                                          // |                     |                     |           |
    movl    (%rdi,%rsi,4), %ecx                   // |  4   ^ vv    :      |  0                  |  0        |
    testl   %ecx, %ecx                            // |  2   v       :      |  0                  |  6 ^^^^^^ |
    js  .LBB0_5                                   // |  2   :       :      |  0                  |  2  :v    |
    je  .LBB0_8                                   // |  2   :       :      |  0                  |  1  v     |
    cmpl    %r10d, %ecx                           // |  2   v       v      |  0                  |  6 ^^^^^^ |
    movl    %r10d, %eax                           // |  3 ^ :       v      |  0                  |  0        |
    cmovll  %ecx, %eax                            // |  3 ^ v       :      |  0                  |  0        |
    testl   %r10d, %r10d                          // |  2   :       v      |  0                  |  6 ^^^^^^ |
    cmovel  %ecx, %eax                            // |  2 ^ v              |  0                  |  0        |
    movl    %eax, %r10d                           // |  2 v         ^      |  0                  |  0        |
    jmp .LBB0_8                                   // |  0                  |  0                  |  0        |
.LBB0_1:                                          // |                     |                     |           |
    xorl    %r9d, %r9d                            // |  1          ^       |  0                  |  5 ^^^^^  |
    xorl    %r10d, %r10d                          // |  2          :^      |  0                  |  5 ^^^^^  |
.LBB0_2:                                          // |                     |                     |           |
    movl    %r9d, (%rdx)                          // |  3    v     v:      |  0                  |  0        |
    movl    %r10d, 4(%rdx)                        // |  2    v      v      |  0                  |  0        |
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
