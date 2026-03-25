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
    testl   %esi, %esi                            // |  2     v  :         |  0                  |  6 ^^^^^^ |
    jle .LBB0_1                                   // |  1        :         |  0                  |  3  vvv   |
    movl    %esi, %r8d                            // |  3     v  :^        |  0                  |  0        |
    xorl    %r10d, %r10d                          // |  3        :: ^      |  0                  |  5 ^^^^^  |
    movl    $3435973837, %r9d                     // |  4        ::^:      |  0                  |  0        |
    xorl    %eax, %eax                            // |  5 ^      ::::      |  0                  |  5 ^^^^^  |
    jmp .LBB0_4                                   // |  5 :      ::::      |  0                  |  0        |
.LBB0_6:                                          // |                     |                     |           |
    movl    %esi, %edx                            // |  7 :  ^v  ::::      |  0                  |  0        |
.LBB0_9:                                          // |                     |                     |           |
    xorl    %esi, %esi                            // |  7 :  :^  ::::      |  0                  |  5 ^^^^^  |
    cmpl    %edx, %r11d                           // |  8 :  v:  ::::v     |  0                  |  6 ^^^^^^ |
    setg    %sil                                  // |  6 :   x  ::::      |  0                  |  3  vvv   |
.LBB0_10:                                         // |                     |                     |           |
    addl    %esi, %eax                            // |  6 x   v  ::::      |  0                  |  6 ^^^^^^ |
    incq    %r10                                  // |  5 :      :::x      |  0                  |  5  ^^^^^ |
    cmpq    %r8, %r10                             // |  5 :      :v:v      |  0                  |  6 ^^^^^^ |
    je  .LBB0_2                                   // |  4 :      : ::      |  0                  |  1  v     |
.LBB0_4:                                          // |                     |                     |           |
    movl    (%rdi,%r10,4), %edx                   // |  6 :  ^ v : :v      |  0                  |  0        |
    movl    $1, %esi                              // |  5 :  :^  : :       |  0                  |  0        |
    testl   %edx, %edx                            // |  4 :  v   : :       |  0                  |  6 ^^^^^^ |
    jg  .LBB0_10                                  // |  4 :  :   : :       |  0                  |  3  vvv   |
    movl    %edx, %esi                            // |  5 :  v^  : :       |  0                  |  0        |
    negl    %esi                                  // |  5 :  :x  : :       |  0                  |  0        |
    xorl    %r11d, %r11d                          // |  6 :  ::  : : ^     |  0                  |  5 ^^^^^  |
    cmpl    $-10, %edx                            // |  5 :  v:  : :       |  0                  |  6 ^^^^^^ |
    jg  .LBB0_6                                   // |  4 :   :  : :       |  0                  |  3  vvv   |
    xorl    %r11d, %r11d                          // |  5 :   :  : : ^     |  0                  |  5 ^^^^^  |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_8:                                          // |                     |                     |           |
    movl    %esi, %edx                            // |  6 :  ^v  : : :     |  0                  |  0        |
    imulq   %r9, %rdx                             // |  6 x  ^:  : v :     |  0                  |  2 ^  ^   |
    shrq    $35, %rdx                             // |  4    x:  :   :     |  0                  |  5 ^^^^^  |
    leal    (%rdx,%rdx), %ecx                     // |  5   ^v:  :   :     |  0                  |  0        |
    leal    (%rcx,%rcx,4), %ecx                   // |  5   ^::  :   :     |  0                  |  0        |
    movl    %esi, %ebx                            // |  6  ^::v  :   :     |  0                  |  0        |
    subl    %ecx, %ebx                            // |  6  xv::  :   :     |  0                  |  6 ^^^^^^ |
    addl    %ebx, %r11d                           // |  5  v ::  :   x     |  0                  |  6 ^^^^^^ |
    cmpl    $99, %esi                             // |  3    :v  :         |  0                  |  6 ^^^^^^ |
    movl    %edx, %esi                            // |  3    v^  :         |  0                  |  2 ::     |
    ja  .LBB0_8                                   // |  1        :         |  0                  |  2 vv     |
    jmp .LBB0_9                                   // |  1        :         |  0                  |  0        |
.LBB0_1:                                          // |                     |                     |           |
    xorl    %eax, %eax                            // |  2 ^      :         |  0                  |  5 ^^^^^  |
.LBB0_2:                                          // |                     |                     |           |
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
