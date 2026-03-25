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
    pushq   %rax                                  // |  2 v      x         |  0                  |  0        |
    .cfi_def_cfa_offset 16                        // |                     |                     |           |
    callq   strlen@PLT                            // |  1        x         |  0                  |  0        |
    movq    %rax, %rcx                            // |  3 v ^    :         |  0                  |  0        |
    cmpl    $2, %ecx                              // |  2   v    :         |  0                  |  6 ^^^^^^ |
    jge .LBB0_2                                   // |  1        :         |  0                  |  2   vv   |
    xorl    %eax, %eax                            // |  2 ^      :         |  0                  |  5 ^^^^^  |
.LBB0_7:                                          // |                     |                     |           |
    popq    %rcx                                  // |  2   ^    x         |  0                  |  0        |
    .cfi_def_cfa_offset 8                         // |                     |                     |           |
    retq                                          // |  2   :    x         |  0                  |  0        |
.LBB0_2:                                          // |                     |                     |           |
    .cfi_def_cfa_offset 16                        // |                     |                     |           |
    movb    $1, %al                               // |  3 ^ :    :         |  0                  |  0        |
    cmpl    $4, %ecx                              // |  2   v    :         |  0                  |  6 ^^^^^^ |
    jb  .LBB0_7                                   // |  2   :    :         |  0                  |  1 v      |
    movl    $2, %esi                              // |  3   : ^  :         |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_4:                                          // |                     |                     |           |
    movl    %ecx, %eax                            // |  4 ^ v :  :         |  0                  |  0        |
    cltd                                          // |  4 : : :  :         |  0                  |  0        |
    idivl   %esi                                  // |  5 x :xx  :         |  0                  |  0        |
    testl   %edx, %edx                            // |  4   :v:  :         |  0                  |  6 ^^^^^^ |
    je  .LBB0_6                                   // |  4   :::  :         |  0                  |  1  v     |
    incl    %esi                                  // |  4   ::x  :         |  0                  |  5  ^^^^^ |
    movl    %esi, %eax                            // |  5 ^ ::v  :         |  0                  |  0        |
    imull   %esi, %eax                            // |  5 ^ :xv  :         |  0                  |  2 ^  ^   |
    cmpl    %ecx, %eax                            // |  4 v v:   :         |  0                  |  6 ^^^^^^ |
    jle .LBB0_4                                   // |  3 :  :   :         |  0                  |  3  vvv   |
.LBB0_6:                                          // |                     |                     |           |
    testl   %edx, %edx                            // |  3 :  v   :         |  0                  |  6 ^^^^^^ |
    setne   %al                                   // |  2 x      :         |  0                  |  1  v     |
    popq    %rcx                                  // |  2   ^    x         |  0                  |  0        |
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
