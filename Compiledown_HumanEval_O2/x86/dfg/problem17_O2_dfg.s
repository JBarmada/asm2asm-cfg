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
    subq    $1024, %rsp                           // |  1        x         |  0                  |  6 ^^^^^^ |
    .cfi_def_cfa_offset 1072                      // |                     |                     |           |
    .cfi_offset %rbx, -48                         // |                     |                     |           |
    .cfi_offset %r12, -40                         // |                     |                     |           |
    .cfi_offset %r14, -32                         // |                     |                     |           |
    .cfi_offset %r15, -24                         // |                     |                     |           |
    .cfi_offset %rbp, -16                         // |                     |                     |           |
    movq    %rdi, %rbp                            // |  3      v^:         |  0                  |  0        |
    movq    %rsp, %rdi                            // |  3      ^:v         |  0                  |  0        |
    xorl    %r14d, %r14d                          // |  3       ::      ^  |  0                  |  5 ^^^^^  |
    movl    $1024, %edx                           // |  3    ^  ::         |  0                  |  0        |
    xorl    %esi, %esi                            // |  3     ^ ::         |  0                  |  5 ^^^^^  |
    callq   memset@PLT                            // |  2       :x         |  0                  |  0        |
    movzbl  (%rbp), %ebx                          // |  3  ^    v:         |  0                  |  0        |
    testb   %bl, %bl                              // |  3  v    ::         |  0                  |  6 ^^^^^^ |
    je  .LBB0_6                                   // |  2       ::         |  0                  |  1  v     |
    callq   __ctype_tolower_loc@PLT               // |  2       :x         |  0                  |  0        |
    movq    (%rax), %r15                          // |  4 v     ::       ^ |  0                  |  0        |
    incq    %rbp                                  // |  3       x:       : |  0                  |  5  ^^^^^ |
    xorl    %r14d, %r14d                          // |  4       ::      ^: |  0                  |  5 ^^^^^  |
    jmp .LBB0_2                                   // |  4       ::      :: |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_5:                                          // |                     |                     |           |
    movzbl  (%rbp), %ebx                          // |  5  ^    v:      :: |  0                  |  0        |
    incq    %rbp                                  // |  5  :    x:      :: |  0                  |  5  ^^^^^ |
    testb   %bl, %bl                              // |  4  v     :      :: |  0                  |  6 ^^^^^^ |
    je  .LBB0_6                                   // |  4  :     :      :: |  0                  |  1  v     |
.LBB0_2:                                          // |                     |                     |           |
    movzbl  %bl, %eax                             // |  5 ^v     :      :: |  0                  |  0        |
    movl    (%r15,%rax,4), %ebx                   // |  5 v^     :      :v |  0                  |  0        |
    movsbq  %bl, %r12                             // |  4  v     :    ^ :  |  0                  |  0        |
    cmpl    $0, (%rsp,%r12,4)                     // |  4  :     v    v :  |  0                  |  6 ^^^^^^ |
    jne .LBB0_5                                   // |  4  :     :    : :  |  0                  |  1  v     |
    callq   __ctype_b_loc@PLT                     // |  4  :     x    : :  |  0                  |  0        |
    movq    (%rax), %rax                          // |  5 ^:     :    : :  |  0                  |  0        |
    movzbl  %bl, %ecx                             // |  6 :v^    :    : :  |  0                  |  0        |
    testb   $4, 1(%rax,%rcx,2)                    // |  5 v v    :    : :  |  0                  |  6 ^^^^^^ |
    je  .LBB0_5                                   // |  3        :    : :  |  0                  |  1  v     |
    movl    $1, (%rsp,%r12,4)                     // |  3        v    v :  |  0                  |  0        |
    incl    %r14d                                 // |  2        :      x  |  0                  |  5  ^^^^^ |
    jmp .LBB0_5                                   // |  2        :      :  |  0                  |  0        |
.LBB0_6:                                          // |                     |                     |           |
    movl    %r14d, %eax                           // |  3 ^      :      v  |  0                  |  0        |
    addq    $1024, %rsp                           // |  1        x         |  0                  |  6 ^^^^^^ |
    .cfi_def_cfa_offset 48                        // |                     |                     |           |
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
