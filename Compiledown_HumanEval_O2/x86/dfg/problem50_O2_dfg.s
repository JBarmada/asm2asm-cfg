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
    leal    -1(%rdi), %eax                        // |  2 ^    v           |  0                  |  0        |
    movl    %edi, %ecx                            // |  3 : ^  v           |  0                  |  0        |
    andl    $3, %ecx                              // |  2 : x              |  0                  |  5 ^^^^^  |
    cmpl    $3, %eax                              // |  2 v :              |  0                  |  6 ^^^^^^ |
    jae .LBB0_7                                   // |  1   :              |  0                  |  1 v      |
    movl    $1, %edx                              // |  2   :^             |  0                  |  0        |
    jmp .LBB0_4                                   // |  1   :              |  0                  |  0        |
.LBB0_1:                                          // |                     |                     |           |
    movl    $1, %eax                              // |  2 ^ :              |  0                  |  0        |
    retq                                          // |  2   :    x         |  0                  |  0        |
.LBB0_7:                                          // |                     |                     |           |
    andl    $-4, %edi                             // |  3   :  x :         |  0                  |  5 ^^^^^  |
    movl    $1, %edx                              // |  4   :^ : :         |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_8:                                          // |                     |                     |           |
    addl    %edx, %edx                            // |  4   :x : :         |  0                  |  6 ^^^^^^ |
    movl    %edx, %eax                            // |  5 ^ :v : :         |  0                  |  0        |
    cltd                                          // |  5 : :: : :         |  0                  |  0        |
    idivl   %esi                                  // |  6 x :xx: :         |  0                  |  0        |
    leal    (%rdx,%rdx), %eax                     // |  6 ^ :v:: :         |  0                  |  0        |
    cltd                                          // |  6 : :::: :         |  0                  |  0        |
    idivl   %esi                                  // |  6 x :xx: :         |  0                  |  0        |
    leal    (%rdx,%rdx), %eax                     // |  6 ^ :v:: :         |  0                  |  0        |
    cltd                                          // |  6 : :::: :         |  0                  |  0        |
    idivl   %esi                                  // |  6 x :xx: :         |  0                  |  0        |
    leal    (%rdx,%rdx), %eax                     // |  6 ^ :v:: :         |  0                  |  0        |
    cltd                                          // |  6 : :::: :         |  0                  |  0        |
    idivl   %esi                                  // |  6 x :xx: :         |  0                  |  0        |
    addl    $-4, %edi                             // |  5   :::x :         |  0                  |  6 ^^^^^^ |
    jne .LBB0_8                                   // |  4   :::  :         |  0                  |  1  v     |
.LBB0_4:                                          // |                     |                     |           |
    testl   %ecx, %ecx                            // |  4   v::  :         |  0                  |  6 ^^^^^^ |
    je  .LBB0_6                                   // |  4   :::  :         |  0                  |  1  v     |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_5:                                          // |                     |                     |           |
    addl    %edx, %edx                            // |  4   :x:  :         |  0                  |  6 ^^^^^^ |
    movl    %edx, %eax                            // |  5 ^ :v:  :         |  0                  |  0        |
    cltd                                          // |  5 : :::  :         |  0                  |  0        |
    idivl   %esi                                  // |  5 x :xx  :         |  0                  |  0        |
    decl    %ecx                                  // |  3   x:   :         |  0                  |  5  ^^^^^ |
    jne .LBB0_5                                   // |  2    :   :         |  0                  |  1  v     |
.LBB0_6:                                          // |                     |                     |           |
    movl    %edx, %eax                            // |  3 ^  v   :         |  0                  |  0        |
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
