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
    xorl    %r10d, %r10d                          // |  1           ^      |  0                  |  5 ^^^^^  |
    movl    $3435973837, %r9d                     // |  2          ^:      |  0                  |  0        |
    xorl    %eax, %eax                            // |  3 ^        ::      |  0                  |  5 ^^^^^  |
    jmp .LBB0_4                                   // |  3 :        ::      |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_8:                                          // |                     |                     |           |
    incl    %r10d                                 // |  3 :        :x      |  0                  |  5  ^^^^^ |
    cmpl    %edi, %r10d                           // |  4 :    v   :v      |  0                  |  6 ^^^^^^ |
    je  .LBB0_2                                   // |  3 :        ::      |  0                  |  1  v     |
.LBB0_4:                                          // |                     |                     |           |
    imull   $-1171354717, %r10d, %esi             // |  4 x  x     ::      |  0                  |  2 ^  ^   |
    cmpl    $390451573, %esi                      // |  5 :  :v    ::      |  0                  |  6 ^^^^^^ |
    setae   %r8b                                  // |  5 :  :    x::      |  0                  |  1 v      |
    imull   $-991146299, %r10d, %esi              // |  5 x  x    :::      |  0                  |  2 ^  ^   |
    cmpl    $330382100, %esi                      // |  6 :  :v   :::      |  0                  |  6 ^^^^^^ |
    setae   %dl                                   // |  5 :  x    :::      |  0                  |  1 v      |
    testb   %dl, %r8b                             // |  5 :  v    v::      |  0                  |  6 ^^^^^^ |
    jne .LBB0_8                                   // |  3 :        ::      |  0                  |  1  v     |
    testl   %r10d, %r10d                          // |  3 :        :v      |  0                  |  6 ^^^^^^ |
    je  .LBB0_8                                   // |  3 :        ::      |  0                  |  1  v     |
    movl    %r10d, %r8d                           // |  4 :       ^:v      |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_7:                                          // |                     |                     |           |
    movl    %r8d, %edx                            // |  4 :  ^    v:       |  0                  |  0        |
    imulq   %r9, %rdx                             // |  4 x  ^    :v       |  0                  |  2 ^  ^   |
    shrq    $35, %rdx                             // |  3 :  x    :        |  0                  |  5 ^^^^^  |
    leal    (%rdx,%rdx), %ecx                     // |  4 : ^v    :        |  0                  |  0        |
    leal    (%rcx,%rcx,4), %ecx                   // |  4 : ^:    :        |  0                  |  0        |
    movl    %r8d, %esi                            // |  5 : ::^   v        |  0                  |  0        |
    subl    %ecx, %esi                            // |  5 : v:x   :        |  0                  |  6 ^^^^^^ |
    xorl    %ecx, %ecx                            // |  5 : ^::   :        |  0                  |  5 ^^^^^  |
    cmpl    $7, %esi                              // |  5 : ::v   :        |  0                  |  6 ^^^^^^ |
    sete    %cl                                   // |  4 : x:    :        |  0                  |  1  v     |
    addl    %ecx, %eax                            // |  4 x v:    :        |  0                  |  6 ^^^^^^ |
    cmpl    $9, %r8d                              // |  2    :    v        |  0                  |  6 ^^^^^^ |
    movl    %edx, %r8d                            // |  2    v    ^        |  0                  |  2 ::     |
    ja  .LBB0_7                                   // |  0                  |  0                  |  2 vv     |
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
