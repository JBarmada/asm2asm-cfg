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
    pushq   %r12                                  // |  2        x    v    |  0                  |  0        |
    .cfi_def_cfa_offset 40                        // |                     |                     |           |
    pushq   %rbx                                  // |  2  v     x         |  0                  |  0        |
    .cfi_def_cfa_offset 48                        // |                     |                     |           |
    .cfi_offset %rbx, -48                         // |                     |                     |           |
    .cfi_offset %r12, -40                         // |                     |                     |           |
    .cfi_offset %r14, -32                         // |                     |                     |           |
    .cfi_offset %r15, -24                         // |                     |                     |           |
    .cfi_offset %rbp, -16                         // |                     |                     |           |
    movq    %rsi, %r14                            // |  3     v  :      ^  |  0                  |  0        |
    movq    %rdi, %rbx                            // |  4  ^   v :      :  |  0                  |  0        |
    callq   strlen@PLT                            // |  3  :     x      :  |  0                  |  0        |
    movq    %rax, %r15                            // |  5 v:     :      :^ |  0                  |  0        |
    movq    %r14, %rdi                            // |  5  :   ^ :      v: |  0                  |  0        |
    callq   strlen@PLT                            // |  4  :     x      :: |  0                  |  0        |
    xorl    %ebp, %ebp                            // |  5  :    ^:      :: |  0                  |  5 ^^^^^  |
    testl   %r15d, %r15d                          // |  4  :     :      :v |  0                  |  6 ^^^^^^ |
    je  .LBB0_4                                   // |  4  :     :      :: |  0                  |  1  v     |
    cmpl    %eax, %r15d                           // |  5 v:     :      :v |  0                  |  6 ^^^^^^ |
    jl  .LBB0_4                                   // |  4  :     :      :: |  0                  |  2   vv   |
    movslq  %eax, %r12                            // |  6 v:     :    ^ :: |  0                  |  0        |
    subl    %r12d, %r15d                          // |  5  :     :    v :x |  0                  |  6 ^^^^^^ |
    incl    %r15d                                 // |  5  :     :    : :x |  0                  |  5  ^^^^^ |
    xorl    %ebp, %ebp                            // |  6  :    ^:    : :: |  0                  |  5 ^^^^^  |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_3:                                          // |                     |                     |           |
    movq    %rbx, %rdi                            // |  6  v   ^ :    : :: |  0                  |  0        |
    movq    %r14, %rsi                            // |  6  :  ^  :    : v: |  0                  |  0        |
    movq    %r12, %rdx                            // |  5  : ^   :    v  : |  0                  |  0        |
    callq   strncmp@PLT                           // |  3  :     x       : |  0                  |  0        |
    cmpl    $1, %eax                              // |  4 v:     :       : |  0                  |  6 ^^^^^^ |
    adcl    $0, %ebp                              // |  4  :    ^:       : |  0                  |  6 ^^^^^^ |
    incq    %rbx                                  // |  4  x    ::       : |  0                  |  5  ^^^^^ |
    decq    %r15                                  // |  3       ::       x |  0                  |  5  ^^^^^ |
    jne .LBB0_3                                   // |  2       ::         |  0                  |  1  v     |
.LBB0_4:                                          // |                     |                     |           |
    movl    %ebp, %eax                            // |  3 ^     v:         |  0                  |  0        |
    popq    %rbx                                  // |  2  ^     x         |  0                  |  0        |
    .cfi_def_cfa_offset 40                        // |                     |                     |           |
    popq    %r12                                  // |  2        x    ^    |  0                  |  0        |
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
