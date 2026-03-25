                                                    // +---------------------+---------------------+-----------+
                                                    // |         GPR         |        VECTOR       |   FLAGS   |
                                                    // |                     |                     |           |
                                                    // |    RRRRRRRRRRRRRRRR |    XXXXXXXXXXXXXXXX |    CZSOPA |
                                                    // |    ABCDSDBS89111111 |    MMMMMMMMMMMMMMMM |    FFFFFF |
                                                    // |    XXXXIIPP  012345 |    MMMMMMMMMMMMMMMM |           |
                                                    // |                     |    0123456789111111 |           |
                                                    // |  #                  |  #           012345 |  #        |
                                                    // +---------------------+---------------------+-----------+
    .text                                           // |                     |                     |           |
    .file   "code.c"                                // |                     |                     |           |
    .globl  func0                                   // |                     |                     |           |
    .p2align    4, 0x90                             // |                     |                     |           |
    .type   func0,@function                         // |                     |                     |           |
func0:                                              // |                     |                     |           |
    .cfi_startproc                                  // |                     |                     |           |
    pushq   %rbp                                    // |  2       vx         |  0                  |  0        |
    .cfi_def_cfa_offset 16                          // |                     |                     |           |
    pushq   %r15                                    // |  2        x       v |  0                  |  0        |
    .cfi_def_cfa_offset 24                          // |                     |                     |           |
    pushq   %r14                                    // |  2        x      v  |  0                  |  0        |
    .cfi_def_cfa_offset 32                          // |                     |                     |           |
    pushq   %r12                                    // |  2        x    v    |  0                  |  0        |
    .cfi_def_cfa_offset 40                          // |                     |                     |           |
    pushq   %rbx                                    // |  2  v     x         |  0                  |  0        |
    .cfi_def_cfa_offset 48                          // |                     |                     |           |
    .cfi_offset %rbx, -48                           // |                     |                     |           |
    .cfi_offset %r12, -40                           // |                     |                     |           |
    .cfi_offset %r14, -32                           // |                     |                     |           |
    .cfi_offset %r15, -24                           // |                     |                     |           |
    .cfi_offset %rbp, -16                           // |                     |                     |           |
    movq    %rdi, %r15                              // |  3      v :       ^ |  0                  |  0        |
    callq   strlen@PLT                              // |  2        x       : |  0                  |  0        |
    addl    $-2, %eax                               // |  3 x      :       : |  0                  |  6 ^^^^^^ |
    testl   %eax, %eax                              // |  3 v      :       : |  0                  |  6 ^^^^^^ |
    jle .LBB0_6                                     // |  3 :      :       : |  0                  |  3  vvv   |
    movl    %eax, %ebx                              // |  4 v^     :       : |  0                  |  0        |
    movl    $4294967295, %r12d                      // |  5 ::     :    ^  : |  0                  |  0        |
    addq    %rbx, %r12                              // |  5 :v     :    x  : |  0                  |  6 ^^^^^^ |
    incq    %rbx                                    // |  5 :x     :    :  : |  0                  |  5  ^^^^^ |
    leaq    .L.str(%rip), %r14                      // |  6 ::     :    : ^: |  0                  |  0        |
    jmp .LBB0_2                                     // |  6 ::     :    : :: |  0                  |  0        |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_5:                                            // |                     |                     |           |
    decq    %r12                                    // |  6 ::     :    x :: |  0                  |  5  ^^^^^ |
    decq    %rbx                                    // |  6 :x     :    : :: |  0                  |  5  ^^^^^ |
    cmpq    $1, %rbx                                // |  6 :v     :    : :: |  0                  |  6 ^^^^^^ |
    jle .LBB0_6                                     // |  6 ::     :    : :: |  0                  |  3  vvv   |
.LBB0_2:                                            // |                     |                     |           |
    movzbl  -1(%r15,%rbx), %ebp                     // |  7 :v    ^:    : :v |  0                  |  0        |
    movsbl  %bpl, %esi                              // |  8 ::  ^ v:    : :: |  0                  |  0        |
    movl    $11, %edx                               // |  7 :: ^   :    : :: |  0                  |  0        |
    movq    %r14, %rdi                              // |  7 ::   ^ :    : v: |  0                  |  0        |
    callq   memchr@PLT                              // |  6 ::     x    : :: |  0                  |  0        |
    testq   %rax, %rax                              // |  6 v:     :    : :: |  0                  |  6 ^^^^^^ |
    je  .LBB0_5                                     // |  6 ::     :    : :: |  0                  |  1  v     |
    movsbl  (%r15,%rbx), %esi                       // |  7 :v  ^  :    : :v |  0                  |  0        |
    movl    $11, %edx                               // |  6 :  ^   :    : :: |  0                  |  0        |
    movq    %r14, %rdi                              // |  6 :    ^ :    : v: |  0                  |  0        |
    callq   memchr@PLT                              // |  5 :      x    : :: |  0                  |  0        |
    testq   %rax, %rax                              // |  5 v      :    : :: |  0                  |  6 ^^^^^^ |
    jne .LBB0_5                                     // |  4        :    : :: |  0                  |  1  v     |
    movl    %r12d, %eax                             // |  5 ^      :    v :: |  0                  |  0        |
    movsbl  (%r15,%rax), %esi                       // |  5 v   ^  :      :v |  0                  |  0        |
    movl    $11, %edx                               // |  4 :  ^   :      :  |  0                  |  0        |
    movq    %r14, %rdi                              // |  4 :    ^ :      v  |  0                  |  0        |
    callq   memchr@PLT                              // |  2 :      x         |  0                  |  0        |
    testq   %rax, %rax                              // |  2 v      :         |  0                  |  6 ^^^^^^ |
    jne .LBB0_5                                     // |  1        :         |  0                  |  1  v     |
    jmp .LBB0_7                                     // |  1        :         |  0                  |  0        |
.LBB0_6:                                            // |                     |                     |           |
    xorl    %ebp, %ebp                              // |  2       ^:         |  0                  |  5 ^^^^^  |
.LBB0_7:                                            // |                     |                     |           |
    movb    %bpl, func0.out(%rip)                   // |  2       v:         |  0                  |  0        |
    leaq    func0.out(%rip), %rax                   // |  2 ^      :         |  0                  |  0        |
    popq    %rbx                                    // |  2  ^     x         |  0                  |  0        |
    .cfi_def_cfa_offset 40                          // |                     |                     |           |
    popq    %r12                                    // |  2        x    ^    |  0                  |  0        |
    .cfi_def_cfa_offset 32                          // |                     |                     |           |
    popq    %r14                                    // |  2        x      ^  |  0                  |  0        |
    .cfi_def_cfa_offset 24                          // |                     |                     |           |
    popq    %r15                                    // |  2        x       ^ |  0                  |  0        |
    .cfi_def_cfa_offset 16                          // |                     |                     |           |
    popq    %rbp                                    // |  2       ^x         |  0                  |  0        |
    .cfi_def_cfa_offset 8                           // |                     |                     |           |
    retq                                            // |  1        x         |  0                  |  0        |
.Lfunc_end0:                                        // |                     |                     |           |
    .size   func0, .Lfunc_end0-func0                // |                     |                     |           |
    .cfi_endproc                                    // |                     |                     |           |
    .type   func0.out,@object                       // |                     |                     |           |
    .local  func0.out                               // |                     |                     |           |
    .comm   func0.out,2,1                           // |                     |                     |           |
    .type   .L.str,@object                          // |                     |                     |           |
    .section    .rodata.str1.1,"aMS",@progbits,1    // |                     |                     |           |
.L.str:                                             // |                     |                     |           |
    .asciz  "AEIOUaeiou"                            // |                     |                     |           |
    .size   .L.str, 11                              // |                     |                     |           |
    .ident  "clang version 15.0.4"                  // |                     |                     |           |
    .section    ".note.GNU-stack","",@progbits      // |                     |                     |           |
    .addrsig                                        // |                     |                     |           |
    .addrsig_sym func0.out                          // |                     |                     |           |
                                                    // +.....................+.....................+...........+
                                                    // Legend:
                                                    //     ^       : Register assignment (write)
                                                    //     v       : Register usage (read)
                                                    //     x       : Register usage and reassignment (R/W)
                                                    //     :       : Register in use (live)
                                                    //     <space> : Register not in use
                                                    //     #       : Number of occupied registers
