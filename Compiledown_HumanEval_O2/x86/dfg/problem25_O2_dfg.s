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
    movl    $1, %ecx                              // |  1   ^              |  0                  |  0        |
    cmpl    $4, %edi                              // |  2   :  v           |  0                  |  6 ^^^^^^ |
    jl  .LBB0_4                                   // |  1   :              |  0                  |  2   vv   |
    movl    $2, %esi                              // |  2   : ^            |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_2:                                          // |                     |                     |           |
    movl    %edi, %eax                            // |  4 ^ : :v           |  0                  |  0        |
    cltd                                          // |  3 : : :            |  0                  |  0        |
    idivl   %esi                                  // |  4 x :xx            |  0                  |  0        |
    testl   %edx, %edx                            // |  3   :v:            |  0                  |  6 ^^^^^^ |
    je  .LBB0_5                                   // |  3   :::            |  0                  |  1  v     |
    incl    %esi                                  // |  3   ::x            |  0                  |  5  ^^^^^ |
    movl    %esi, %eax                            // |  4 ^ ::v            |  0                  |  0        |
    imull   %esi, %eax                            // |  4 ^ :xv            |  0                  |  2 ^  ^   |
    cmpl    %edi, %eax                            // |  3 v :  v           |  0                  |  6 ^^^^^^ |
    jle .LBB0_2                                   // |  1   :              |  0                  |  3  vvv   |
.LBB0_4:                                          // |                     |                     |           |
    movl    %ecx, %eax                            // |  2 ^ v              |  0                  |  0        |
.LBB0_5:                                          // |                     |                     |           |
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
