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
    pushq   %rbp                                  // |  2       vx         |  0                  |  0        |
    .cfi_def_cfa_offset 16                        // |                     |                     |           |
    pushq   %r14                                  // |  2        x      v  |  0                  |  0        |
    .cfi_def_cfa_offset 24                        // |                     |                     |           |
    pushq   %rbx                                  // |  2  v     x         |  0                  |  0        |
    .cfi_def_cfa_offset 32                        // |                     |                     |           |
    .cfi_offset %rbx, -32                         // |                     |                     |           |
    .cfi_offset %r14, -24                         // |                     |                     |           |
    .cfi_offset %rbp, -16                         // |                     |                     |           |
    movq    %rsi, %r14                            // |  3     v  :      ^  |  0                  |  0        |
    movl    %edi, %ebp                            // |  4      v^:      :  |  0                  |  0        |
    movl    $256, %edi                            // |  4      ^::      :  |  0                  |  0        |
    callq   malloc@PLT                            // |  3       :x      :  |  0                  |  0        |
    movq    %rax, %rcx                            // |  5 v ^   ::      :  |  0                  |  0        |
    movl    $0, (%r14)                            // |  4   :   ::      v  |  0                  |  0        |
    xorl    %esi, %esi                            // |  5   : ^ ::      :  |  0                  |  5 ^^^^^  |
    cmpl    $4, %ebp                              // |  5   : : v:      :  |  0                  |  6 ^^^^^^ |
    jge .LBB0_1                                   // |  5   : : ::      :  |  0                  |  2   vv   |
.LBB0_7:                                          // |                     |                     |           |
    cmpl    $1, %ebp                              // |  5   : : v:      :  |  0                  |  6 ^^^^^^ |
    jle .LBB0_9                                   // |  5   : : ::      :  |  0                  |  3  vvv   |
    leal    1(%rsi), %eax                         // |  6 ^ : v ::      :  |  0                  |  0        |
    movl    %eax, (%r14)                          // |  6 v : : ::      v  |  0                  |  0        |
    movslq  %esi, %rax                            // |  5 ^ : v ::         |  0                  |  0        |
    movl    %ebp, (%rcx,%rax,4)                   // |  4 v v   v:         |  0                  |  0        |
.LBB0_9:                                          // |                     |                     |           |
    movq    %rcx, %rax                            // |  3 ^ v    :         |  0                  |  0        |
    popq    %rbx                                  // |  3  ^:    x         |  0                  |  0        |
    .cfi_def_cfa_offset 24                        // |                     |                     |           |
    popq    %r14                                  // |  3   :    x      ^  |  0                  |  0        |
    .cfi_def_cfa_offset 16                        // |                     |                     |           |
    popq    %rbp                                  // |  4   :   ^x      :  |  0                  |  0        |
    .cfi_def_cfa_offset 8                         // |                     |                     |           |
    retq                                          // |  4   :   :x      :  |  0                  |  0        |
.LBB0_1:                                          // |                     |                     |           |
    .cfi_def_cfa_offset 32                        // |                     |                     |           |
    movl    $2, %edi                              // |  4   :  ^:       :  |  0                  |  0        |
    xorl    %esi, %esi                            // |  5   : ^::       :  |  0                  |  5 ^^^^^  |
    jmp .LBB0_2                                   // |  5   : :::       :  |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_6:                                          // |                     |                     |           |
    incl    %edi                                  // |  5   : :x:       :  |  0                  |  5  ^^^^^ |
    movl    %edi, %eax                            // |  6 ^ : :v:       :  |  0                  |  0        |
    imull   %edi, %eax                            // |  7 ^ :x:v:       :  |  0                  |  2 ^  ^   |
    cmpl    %ebp, %eax                            // |  7 v ::::v       :  |  0                  |  6 ^^^^^^ |
    jg  .LBB0_7                                   // |  6   :::::       :  |  0                  |  3  vvv   |
.LBB0_2:                                          // |                     |                     |           |
    movl    %ebp, %eax                            // |  7 ^ ::::v       :  |  0                  |  0        |
    cltd                                          // |  7 : :::::       :  |  0                  |  0        |
    idivl   %edi                                  // |  7 x :x:x:       :  |  0                  |  0        |
    testl   %edx, %edx                            // |  6   :v:::       :  |  0                  |  6 ^^^^^^ |
    jne .LBB0_6                                   // |  6   :::::       :  |  0                  |  1  v     |
    movslq  %esi, %rax                            // |  7 ^ ::v::       :  |  0                  |  0        |
    leaq    (%rcx,%rax,4), %rbx                   // |  8 v^v::::       :  |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_4:                                          // |                     |                     |           |
    movl    %ebp, %eax                            // |  7 ^: :::v       :  |  0                  |  0        |
    cltd                                          // |  6 :: :::        :  |  0                  |  0        |
    idivl   %edi                                  // |  6 x: x:x        :  |  0                  |  0        |
    movl    %edi, (%rbx)                          // |  6 :v ::v        :  |  0                  |  0        |
    movl    %eax, %ebp                            // |  7 v: :::^       :  |  0                  |  0        |
    cltd                                          // |  6 :: :::        :  |  0                  |  0        |
    idivl   %edi                                  // |  6 x: x:x        :  |  0                  |  0        |
    addq    $4, %rbx                              // |  4  x ::         :  |  0                  |  6 ^^^^^^ |
    incl    %esi                                  // |  3    :x         :  |  0                  |  5  ^^^^^ |
    testl   %edx, %edx                            // |  3    v:         :  |  0                  |  6 ^^^^^^ |
    je  .LBB0_4                                   // |  2     :         :  |  0                  |  1  v     |
    movl    %esi, (%r14)                          // |  2     v         v  |  0                  |  0        |
    jmp .LBB0_6                                   // |  0                  |  0                  |  0        |
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
