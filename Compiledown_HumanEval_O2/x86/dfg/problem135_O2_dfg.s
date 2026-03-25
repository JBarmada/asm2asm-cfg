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
    movq    %rdi, %r14                            // |  3      v :      ^  |  0                  |  0        |
    callq   strlen@PLT                            // |  2        x      :  |  0                  |  0        |
    movq    %rax, %rbx                            // |  4 v^     :      :  |  0                  |  0        |
    xorl    %r15d, %r15d                          // |  4  :     :      :^ |  0                  |  5 ^^^^^  |
    testl   %ebx, %ebx                            // |  3  v     :      :  |  0                  |  6 ^^^^^^ |
    je  .LBB0_4                                   // |  3  :     :      :  |  0                  |  1  v     |
    movl    %ebx, %ebp                            // |  4  v    ^:      :  |  0                  |  0        |
    shlq    $32, %rbx                             // |  4  x    ::      :  |  0                  |  5 ^^^^^  |
    movabsq $-4294967296, %rax                    // |  5 ^:    ::      :  |  0                  |  0        |
    addq    %rbx, %rax                            // |  5 xv    ::      :  |  0                  |  6 ^^^^^^ |
    sarq    $32, %rax                             // |  5 ^:    ::      :  |  0                  |  5 ^^^^^  |
    movzbl  (%r14,%rax), %r12d                    // |  6 v:    ::    ^ v  |  0                  |  0        |
    callq   __ctype_b_loc@PLT                     // |  5  :    :x    : :  |  0                  |  0        |
    movq    (%rax), %rax                          // |  6 ^:    ::    : :  |  0                  |  0        |
    testb   $4, 1(%rax,%r12,2)                    // |  6 v:    ::    v :  |  0                  |  6 ^^^^^^ |
    je  .LBB0_4                                   // |  5 ::    ::      :  |  0                  |  1  v     |
    movl    $1, %r15d                             // |  6 ::    ::      :^ |  0                  |  0        |
    cmpl    $1, %ebp                              // |  5 ::    v:      :  |  0                  |  6 ^^^^^^ |
    je  .LBB0_4                                   // |  4 ::     :      :  |  0                  |  1  v     |
    movabsq $-8589934592, %rcx                    // |  5 ::^    :      :  |  0                  |  0        |
    addq    %rcx, %rbx                            // |  5 :xv    :      :  |  0                  |  6 ^^^^^^ |
    sarq    $32, %rbx                             // |  4 :^     :      :  |  0                  |  5 ^^^^^  |
    movzbl  (%r14,%rbx), %ecx                     // |  5 :v^    :      v  |  0                  |  0        |
    xorl    %r15d, %r15d                          // |  4 : :    :       ^ |  0                  |  5 ^^^^^  |
    testb   $4, 1(%rax,%rcx,2)                    // |  4 v v    :       : |  0                  |  6 ^^^^^^ |
    sete    %r15b                                 // |  2        :       x |  0                  |  1  v     |
.LBB0_4:                                          // |                     |                     |           |
    movl    %r15d, %eax                           // |  3 ^      :       v |  0                  |  0        |
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
