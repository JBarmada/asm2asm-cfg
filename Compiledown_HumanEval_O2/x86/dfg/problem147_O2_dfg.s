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
    xorl    %r10d, %r10d                          // |  2         : ^      |  0                  |  5 ^^^^^  |
    movl    $3435973837, %esi                     // |  3     ^   : :      |  0                  |  0        |
    xorl    %eax, %eax                            // |  4 ^   :   : :      |  0                  |  5 ^^^^^  |
    jmp .LBB0_4                                   // |  4 :   :   : :      |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_8:                                          // |                     |                     |           |
    incq    %r10                                  // |  4 :   :   : x      |  0                  |  5  ^^^^^ |
    cmpq    %r8, %r10                             // |  4 :   :   v v      |  0                  |  6 ^^^^^^ |
    je  .LBB0_2                                   // |  3 :   :     :      |  0                  |  1  v     |
.LBB0_4:                                          // |                     |                     |           |
    movl    (%rdi,%r10,4), %r9d                   // |  5 :   :v   ^v      |  0                  |  0        |
    cmpl    $11, %r9d                             // |  3 :   :    v       |  0                  |  6 ^^^^^^ |
    jl  .LBB0_8                                   // |  3 :   :    :       |  0                  |  2   vv   |
    movl    %r9d, %ecx                            // |  4 : ^ :    v       |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_6:                                          // |                     |                     |           |
    movl    %ecx, %edx                            // |  5 : v^:    :       |  0                  |  0        |
    movl    %ecx, %ecx                            // |  5 : ^::    :       |  0                  |  0        |
    imulq   %rsi, %rcx                            // |  5 x ^xv    :       |  0                  |  2 ^  ^   |
    shrq    $35, %rcx                             // |  4 : x:     :       |  0                  |  5 ^^^^^  |
    cmpl    $99, %edx                             // |  4 : :v     :       |  0                  |  6 ^^^^^^ |
    ja  .LBB0_6                                   // |  3 : :      :       |  0                  |  2 vv     |
    andl    %r9d, %ecx                            // |  3 : x      v       |  0                  |  5 ^^^^^  |
    andl    $1, %ecx                              // |  2 : x              |  0                  |  5 ^^^^^  |
    addl    %ecx, %eax                            // |  2 x v              |  0                  |  6 ^^^^^^ |
    jmp .LBB0_8                                   // |  0                  |  0                  |  0        |
.LBB0_1:                                          // |                     |                     |           |
    xorl    %eax, %eax                            // |  1 ^                |  0                  |  5 ^^^^^  |
.LBB0_2:                                          // |                     |                     |           |
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
