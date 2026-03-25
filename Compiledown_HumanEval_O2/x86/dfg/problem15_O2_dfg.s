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
    pushq   %r13                                  // |  2        x     v   |  0                  |  0        |
    .cfi_def_cfa_offset 40                        // |                     |                     |           |
    pushq   %r12                                  // |  2        x    v    |  0                  |  0        |
    .cfi_def_cfa_offset 48                        // |                     |                     |           |
    pushq   %rbx                                  // |  2  v     x         |  0                  |  0        |
    .cfi_def_cfa_offset 56                        // |                     |                     |           |
    subq    $24, %rsp                             // |  1        x         |  0                  |  6 ^^^^^^ |
    .cfi_def_cfa_offset 80                        // |                     |                     |           |
    .cfi_offset %rbx, -56                         // |                     |                     |           |
    .cfi_offset %r12, -48                         // |                     |                     |           |
    .cfi_offset %r13, -40                         // |                     |                     |           |
    .cfi_offset %r14, -32                         // |                     |                     |           |
    .cfi_offset %r15, -24                         // |                     |                     |           |
    .cfi_offset %rbp, -16                         // |                     |                     |           |
    movq    %rsi, 16(%rsp)                        // |  2     v  v         |  0                  |  0        |
    movq    %rdi, %r12                            // |  3      v :    ^    |  0                  |  0        |
    callq   strlen@PLT                            // |  2        x    :    |  0                  |  0        |
    movq    %rax, %rbp                            // |  4 v     ^:    :    |  0                  |  0        |
    movq    %rax, %rbx                            // |  5 v^    ::    :    |  0                  |  0        |
    shlq    $32, %rbx                             // |  4  x    ::    :    |  0                  |  5 ^^^^^  |
    movq    %rbx, %rdi                            // |  5  v   ^::    :    |  0                  |  0        |
    sarq    $29, %rdi                             // |  5  :   ^::    :    |  0                  |  5 ^^^^^  |
    callq   malloc@PLT                            // |  4  :    :x    :    |  0                  |  0        |
    movq    %rax, %r13                            // |  6 v:    ::    :^   |  0                  |  0        |
    movabsq $4294967296, %rdi                     // |  6  :   ^::    ::   |  0                  |  0        |
    addq    %rbx, %rdi                            // |  6  v   x::    ::   |  0                  |  6 ^^^^^^ |
    sarq    $32, %rdi                             // |  5      ^::    ::   |  0                  |  5 ^^^^^  |
    callq   malloc@PLT                            // |  4       :x    ::   |  0                  |  0        |
    movq    %rax, %rbx                            // |  6 v^    ::    ::   |  0                  |  0        |
    movb    $0, (%rax)                            // |  6 v:    ::    ::   |  0                  |  0        |
    testl   %ebp, %ebp                            // |  5  :    v:    ::   |  0                  |  6 ^^^^^^ |
    movq    %rbp, 8(%rsp)                         // |  5  :    vv    ::   |  0                  |  3  :::   |
    jle .LBB0_3                                   // |  5  :    ::    ::   |  0                  |  3  vvv   |
    movl    %ebp, %r14d                           // |  6  :    v:    ::^  |  0                  |  0        |
    xorl    %r15d, %r15d                          // |  6  :     :    :::^ |  0                  |  5 ^^^^^  |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_2:                                          // |                     |                     |           |
    movq    %rbx, %rdi                            // |  7  v   ^ :    :::: |  0                  |  0        |
    callq   strlen@PLT                            // |  6  :     x    :::: |  0                  |  0        |
    movq    %rax, %rbp                            // |  8 v:    ^:    :::: |  0                  |  0        |
    leaq    2(%rax), %rsi                         // |  9 v:  ^ ::    :::: |  0                  |  0        |
    movq    %rbx, %rdi                            // |  8  v   ^::    :::: |  0                  |  0        |
    callq   realloc@PLT                           // |  6       :x    :::: |  0                  |  0        |
    movq    %rax, %rbx                            // |  8 v^    ::    :::: |  0                  |  0        |
    movzbl  (%r12,%r15), %eax                     // |  8 ^:    ::    v::v |  0                  |  0        |
    movb    %al, (%rbx,%rbp)                      // |  7 vv    v:     ::: |  0                  |  0        |
    movb    $0, 1(%rbx,%rbp)                      // |  7 :v    v:     ::: |  0                  |  0        |
    movq    %rbx, %rdi                            // |  7 :v   ^ :     ::: |  0                  |  0        |
    callq   strlen@PLT                            // |  6 ::     x     ::: |  0                  |  0        |
    leaq    1(%rax), %rdi                         // |  7 v:   ^ :     ::: |  0                  |  0        |
    callq   malloc@PLT                            // |  6 ::     x     ::: |  0                  |  0        |
    movq    %rax, (%r13,%r15,8)                   // |  6 v:     :     v:v |  0                  |  0        |
    movq    %rax, %rdi                            // |  7 v:   ^ :     ::: |  0                  |  0        |
    movq    %rbx, %rsi                            // |  6  v  ^  :     ::: |  0                  |  0        |
    callq   strcpy@PLT                            // |  5  :     x     ::: |  0                  |  0        |
    incq    %r15                                  // |  5  :     :     ::x |  0                  |  5  ^^^^^ |
    cmpq    %r15, %r14                            // |  5  :     :     :vv |  0                  |  6 ^^^^^^ |
    jne .LBB0_2                                   // |  3  :     :     :   |  0                  |  1  v     |
.LBB0_3:                                          // |                     |                     |           |
    movq    %rbx, %rdi                            // |  4  v   ^ :     :   |  0                  |  0        |
    callq   free@PLT                              // |  2        x     :   |  0                  |  0        |
    movq    16(%rsp), %rax                        // |  3 ^      v     :   |  0                  |  0        |
    movq    8(%rsp), %rcx                         // |  4 : ^    v     :   |  0                  |  0        |
    movl    %ecx, (%rax)                          // |  4 v v    :     :   |  0                  |  0        |
    movq    %r13, %rax                            // |  3 ^      :     v   |  0                  |  0        |
    addq    $24, %rsp                             // |  1        x         |  0                  |  6 ^^^^^^ |
    .cfi_def_cfa_offset 56                        // |                     |                     |           |
    popq    %rbx                                  // |  2  ^     x         |  0                  |  0        |
    .cfi_def_cfa_offset 48                        // |                     |                     |           |
    popq    %r12                                  // |  2        x    ^    |  0                  |  0        |
    .cfi_def_cfa_offset 40                        // |                     |                     |           |
    popq    %r13                                  // |  2        x     ^   |  0                  |  0        |
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
