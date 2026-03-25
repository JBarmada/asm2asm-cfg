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
    xorl    %r9d, %r9d                            // |  3         :^:      |  0                  |  5 ^^^^^  |
    jmp .LBB0_7                                   // |  3         :::      |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_12:                                         // |                     |                     |           |
    cmpl    %r9d, %ecx                            // |  4   v     :v:      |  0                  |  6 ^^^^^^ |
    cmovgl  %ecx, %r9d                            // |  4   v     :^:      |  0                  |  0        |
.LBB0_13:                                         // |                     |                     |           |
    incq    %r10                                  // |  3         ::x      |  0                  |  5  ^^^^^ |
    cmpq    %r8, %r10                             // |  3         v:v      |  0                  |  6 ^^^^^^ |
    je  .LBB0_2                                   // |  2          ::      |  0                  |  1  v     |
.LBB0_7:                                          // |                     |                     |           |
    movl    (%rdi,%r10,4), %ecx                   // |  4   ^  v   :v      |  0                  |  0        |
    cmpl    $2, %ecx                              // |  2   v      :       |  0                  |  6 ^^^^^^ |
    jl  .LBB0_13                                  // |  2   :      :       |  0                  |  2   vv   |
    cmpl    $4, %ecx                              // |  2   v      :       |  0                  |  6 ^^^^^^ |
    jb  .LBB0_12                                  // |  2   :      :       |  0                  |  1 v      |
    movl    $2, %esi                              // |  3   : ^    :       |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_10:                                         // |                     |                     |           |
    movl    %ecx, %eax                            // |  4 ^ v :    :       |  0                  |  0        |
    cltd                                          // |  4 : : :    :       |  0                  |  0        |
    idivl   %esi                                  // |  5 x :xx    :       |  0                  |  0        |
    testl   %edx, %edx                            // |  4   :v:    :       |  0                  |  6 ^^^^^^ |
    je  .LBB0_13                                  // |  4   :::    :       |  0                  |  1  v     |
    incl    %esi                                  // |  4   ::x    :       |  0                  |  5  ^^^^^ |
    movl    %esi, %eax                            // |  5 ^ ::v    :       |  0                  |  0        |
    imull   %esi, %eax                            // |  5 ^ :xv    :       |  0                  |  2 ^  ^   |
    cmpl    %ecx, %eax                            // |  3 v v      :       |  0                  |  6 ^^^^^^ |
    jle .LBB0_10                                  // |  1          :       |  0                  |  3  vvv   |
    jmp .LBB0_12                                  // |  1          :       |  0                  |  0        |
.LBB0_2:                                          // |                     |                     |           |
    xorl    %eax, %eax                            // |  2 ^        :       |  0                  |  5 ^^^^^  |
    testl   %r9d, %r9d                            // |  2 :        v       |  0                  |  6 ^^^^^^ |
    jle .LBB0_5                                   // |  2 :        :       |  0                  |  3  vvv   |
    movl    $3435973837, %ecx                     // |  3 : ^      :       |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_4:                                          // |                     |                     |           |
    movl    %r9d, %edx                            // |  4 : :^     v       |  0                  |  0        |
    imulq   %rcx, %rdx                            // |  4 x v^     :       |  0                  |  2 ^  ^   |
    shrq    $35, %rdx                             // |  3 :  x     :       |  0                  |  5 ^^^^^  |
    leal    (%rdx,%rdx), %esi                     // |  4 :  v^    :       |  0                  |  0        |
    leal    (%rsi,%rsi,4), %esi                   // |  4 :  :^    :       |  0                  |  0        |
    movl    %r9d, %edi                            // |  5 :  ::^   v       |  0                  |  0        |
    subl    %esi, %edi                            // |  5 :  :vx   :       |  0                  |  6 ^^^^^^ |
    addl    %edi, %eax                            // |  4 x  : v   :       |  0                  |  6 ^^^^^^ |
    cmpl    $9, %r9d                              // |  2    :     v       |  0                  |  6 ^^^^^^ |
    movl    %edx, %r9d                            // |  2    v     ^       |  0                  |  2 ::     |
    ja  .LBB0_4                                   // |  0                  |  0                  |  2 vv     |
.LBB0_5:                                          // |                     |                     |           |
    retq                                          // |  1        x         |  0                  |  0        |
.LBB0_1:                                          // |                     |                     |           |
    xorl    %eax, %eax                            // |  2 ^      :         |  0                  |  5 ^^^^^  |
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
