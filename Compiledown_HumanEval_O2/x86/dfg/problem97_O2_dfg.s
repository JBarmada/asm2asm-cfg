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
    pushq   %r15                                  // |  2        x       v |  0                  |  0        |
    .cfi_def_cfa_offset 24                        // |                     |                     |           |
    pushq   %r14                                  // |  2        x      v  |  0                  |  0        |
    .cfi_def_cfa_offset 32                        // |                     |                     |           |
    pushq   %rbx                                  // |  2  v     x         |  0                  |  0        |
    .cfi_def_cfa_offset 40                        // |                     |                     |           |
    pushq   %rax                                  // |  2 v      x         |  0                  |  0        |
    .cfi_def_cfa_offset 48                        // |                     |                     |           |
    .cfi_offset %rbx, -40                         // |                     |                     |           |
    .cfi_offset %r14, -32                         // |                     |                     |           |
    .cfi_offset %r15, -24                         // |                     |                     |           |
    .cfi_offset %rbp, -16                         // |                     |                     |           |
    movq    %rsi, %r14                            // |  3     v  :      ^  |  0                  |  0        |
    movl    %edi, %r15d                           // |  4      v :      :^ |  0                  |  0        |
    movslq  %edi, %rbx                            // |  5  ^   v :      :: |  0                  |  0        |
    leaq    (,%rbx,4), %rdi                       // |  5  v   ^ :      :: |  0                  |  0        |
    callq   malloc@PLT                            // |  4  :     x      :: |  0                  |  0        |
    movq    %rax, %rcx                            // |  6 v:^    :      :: |  0                  |  0        |
    movl    $0, (%r14)                            // |  5  ::    :      v: |  0                  |  0        |
    cmpl    $3, %ebx                              // |  5  v:    :      :: |  0                  |  6 ^^^^^^ |
    jl  .LBB0_9                                   // |  4   :    :      :: |  0                  |  2   vv   |
    movl    $2, %esi                              // |  5   : ^  :      :: |  0                  |  0        |
    xorl    %r8d, %r8d                            // |  6   : :  :^     :: |  0                  |  5 ^^^^^  |
    jmp .LBB0_2                                   // |  6   : :  ::     :: |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_7:                                          // |                     |                     |           |
    movslq  %r8d, %rax                            // |  7 ^ : :  :v     :: |  0                  |  0        |
    movl    %esi, (%rcx,%rax,4)                   // |  7 v v v  ::     :: |  0                  |  0        |
    incl    %r8d                                  // |  6   : :  :x     :: |  0                  |  5  ^^^^^ |
    movl    %r8d, (%r14)                          // |  6   : :  :v     v: |  0                  |  0        |
.LBB0_8:                                          // |                     |                     |           |
    incl    %esi                                  // |  5   : x  ::      : |  0                  |  5  ^^^^^ |
    cmpl    %r15d, %esi                           // |  5   : v  ::      v |  0                  |  6 ^^^^^^ |
    je  .LBB0_9                                   // |  4   : :  ::        |  0                  |  1  v     |
.LBB0_2:                                          // |                     |                     |           |
    testl   %r8d, %r8d                            // |  4   : :  :v        |  0                  |  6 ^^^^^^ |
    jle .LBB0_7                                   // |  4   : :  ::        |  0                  |  3  vvv   |
    movl    %r8d, %ebx                            // |  5  ^: :  :v        |  0                  |  0        |
    xorl    %ebp, %ebp                            // |  5  :: : ^:         |  0                  |  5 ^^^^^  |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_5:                                          // |                     |                     |           |
    movl    (%rcx,%rbp,4), %edi                   // |  6  :v :^v:         |  0                  |  0        |
    movl    %edi, %eax                            // |  7 ^:: :v::         |  0                  |  0        |
    imull   %edi, %eax                            // |  8 ^::x:v::         |  0                  |  2 ^  ^   |
    cmpl    %esi, %eax                            // |  8 v:::v:::         |  0                  |  6 ^^^^^^ |
    ja  .LBB0_7                                   // |  7  :::::::         |  0                  |  2 vv     |
    movl    %esi, %eax                            // |  8 ^:::v:::         |  0                  |  0        |
    cltd                                          // |  7 :::: :::         |  0                  |  0        |
    idivl   %edi                                  // |  7 x::x x::         |  0                  |  0        |
    testl   %edx, %edx                            // |  5  ::v  ::         |  0                  |  6 ^^^^^^ |
    je  .LBB0_8                                   // |  4  ::   ::         |  0                  |  1  v     |
    incq    %rbp                                  // |  4  ::   x:         |  0                  |  5  ^^^^^ |
    cmpq    %rbp, %rbx                            // |  4  v:   v:         |  0                  |  6 ^^^^^^ |
    jne .LBB0_5                                   // |  2   :    :         |  0                  |  1  v     |
    jmp .LBB0_7                                   // |  2   :    :         |  0                  |  0        |
.LBB0_9:                                          // |                     |                     |           |
    movq    %rcx, %rax                            // |  3 ^ v    :         |  0                  |  0        |
    addq    $8, %rsp                              // |  1        x         |  0                  |  6 ^^^^^^ |
    .cfi_def_cfa_offset 40                        // |                     |                     |           |
    popq    %rbx                                  // |  2  ^     x         |  0                  |  0        |
    .cfi_def_cfa_offset 32                        // |                     |                     |           |
    popq    %r14                                  // |  2        x      ^  |  0                  |  0        |
    .cfi_def_cfa_offset 24                        // |                     |                     |           |
    popq    %r15                                  // |  2        x       ^ |  0                  |  0        |
    .cfi_def_cfa_offset 16                        // |                     |                     |           |
    popq    %rbp                                  // |  2       ^x         |  0                  |  0        |
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
