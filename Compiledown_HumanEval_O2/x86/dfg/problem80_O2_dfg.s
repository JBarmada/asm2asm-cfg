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
    pushq   %r14                                    // |  2        x      v  |  0                  |  0        |
    .cfi_def_cfa_offset 24                          // |                     |                     |           |
    pushq   %rbx                                    // |  2  v     x         |  0                  |  0        |
    .cfi_def_cfa_offset 32                          // |                     |                     |           |
    .cfi_offset %rbx, -32                           // |                     |                     |           |
    .cfi_offset %r14, -24                           // |                     |                     |           |
    .cfi_offset %rbp, -16                           // |                     |                     |           |
    movl    %edi, %ebp                              // |  3      v^:         |  0                  |  0        |
    movl    $64, %edi                               // |  3      ^::         |  0                  |  0        |
    callq   malloc@PLT                              // |  2       :x         |  0                  |  0        |
    testq   %rax, %rax                              // |  3 v     ::         |  0                  |  6 ^^^^^^ |
    je  .LBB0_1                                     // |  2       ::         |  0                  |  1  v     |
    movq    %rax, %rbx                              // |  4 v^    ::         |  0                  |  0        |
    movb    $0, 63(%rax)                            // |  4 v:    ::         |  0                  |  0        |
    testl   %ebp, %ebp                              // |  3  :    v:         |  0                  |  6 ^^^^^^ |
    je  .LBB0_5                                     // |  3  :    ::         |  0                  |  3  v::   |
    jle .LBB0_4                                     // |  3  :    ::         |  0                  |  3  vvv   |
    movl    $62, %eax                               // |  4 ^:    ::         |  0                  |  0        |
    movl    %ebp, %ecx                              // |  5 ::^   v:         |  0                  |  0        |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_7:                                            // |                     |                     |           |
    movl    %ebp, %edx                              // |  6 :::^  v:         |  0                  |  0        |
    andb    $1, %dl                                 // |  6 :::x  ::         |  0                  |  5 ^^^^^  |
    orb $48, %dl                                    // |  6 :::x  ::         |  0                  |  5 ^^^^^  |
    movb    %dl, (%rbx,%rax)                        // |  6 vv:v  ::         |  0                  |  0        |
    decq    %rax                                    // |  5 x::   ::         |  0                  |  5  ^^^^^ |
    shrl    %ecx                                    // |  4  :x   ::         |  0                  |  5 ^^^^^  |
    cmpl    $1, %ebp                                // |  4  ::   v:         |  0                  |  6 ^^^^^^ |
    movl    %ecx, %ebp                              // |  4  :v   ^:         |  0                  |  2 ::     |
    ja  .LBB0_7                                     // |  2  :     :         |  0                  |  2 vv     |
    jmp .LBB0_8                                     // |  2  :     :         |  0                  |  0        |
.LBB0_1:                                            // |                     |                     |           |
    xorl    %ebp, %ebp                              // |  3  :    ^:         |  0                  |  5 ^^^^^  |
    jmp .LBB0_12                                    // |  2  :     :         |  0                  |  0        |
.LBB0_5:                                            // |                     |                     |           |
    movb    $48, 62(%rbx)                           // |  2  v     :         |  0                  |  0        |
    movl    $61, %eax                               // |  3 ^:     :         |  0                  |  0        |
    jmp .LBB0_8                                     // |  2  :     :         |  0                  |  0        |
.LBB0_4:                                            // |                     |                     |           |
    movl    $62, %eax                               // |  3 ^:     :         |  0                  |  0        |
.LBB0_8:                                            // |                     |                     |           |
    movslq  %eax, %r14                              // |  4 v:     :      ^  |  0                  |  0        |
    movw    $25188, -1(%r14,%rbx)                   // |  3  v     :      v  |  0                  |  0        |
    movl    $66, %eax                               // |  4 ^:     :      :  |  0                  |  0        |
    subl    %r14d, %eax                             // |  4 x:     :      v  |  0                  |  6 ^^^^^^ |
    movslq  %eax, %rdi                              // |  5 v:   ^ :      :  |  0                  |  0        |
    callq   malloc@PLT                              // |  4 ::     x      :  |  0                  |  0        |
    testq   %rax, %rax                              // |  4 v:     :      :  |  0                  |  6 ^^^^^^ |
    je  .LBB0_9                                     // |  4 ::     :      :  |  0                  |  1  v     |
    movq    %rax, %rbp                              // |  5 v:    ^:      :  |  0                  |  0        |
    leaq    (%r14,%rbx), %rsi                       // |  6 :v  ^ ::      v  |  0                  |  0        |
    decq    %rsi                                    // |  5 ::  x ::         |  0                  |  5  ^^^^^ |
    movq    %rax, %rdi                              // |  5 v:   ^::         |  0                  |  0        |
    callq   strcpy@PLT                              // |  4 ::    :x         |  0                  |  0        |
    movq    %rbp, %rdi                              // |  5 ::   ^v:         |  0                  |  0        |
    callq   strlen@PLT                              // |  4 ::    :x         |  0                  |  0        |
    movw    $25188, (%rbp,%rax)                     // |  4 v:    v:         |  0                  |  0        |
    movb    $0, 2(%rbp,%rax)                        // |  4 v:    v:         |  0                  |  0        |
    jmp .LBB0_11                                    // |  2  :     :         |  0                  |  0        |
.LBB0_9:                                            // |                     |                     |           |
    xorl    %ebp, %ebp                              // |  3  :    ^:         |  0                  |  5 ^^^^^  |
.LBB0_11:                                           // |                     |                     |           |
    movq    %rbx, %rdi                              // |  4  v   ^::         |  0                  |  0        |
    callq   free@PLT                                // |  2       :x         |  0                  |  0        |
.LBB0_12:                                           // |                     |                     |           |
    movq    %rbp, %rax                              // |  3 ^     v:         |  0                  |  0        |
    popq    %rbx                                    // |  2  ^     x         |  0                  |  0        |
    .cfi_def_cfa_offset 24                          // |                     |                     |           |
    popq    %r14                                    // |  2        x      ^  |  0                  |  0        |
    .cfi_def_cfa_offset 16                          // |                     |                     |           |
    popq    %rbp                                    // |  2       ^x         |  0                  |  0        |
    .cfi_def_cfa_offset 8                           // |                     |                     |           |
    retq                                            // |  1        x         |  0                  |  0        |
.Lfunc_end0:                                        // |                     |                     |           |
    .size   func0, .Lfunc_end0-func0                // |                     |                     |           |
    .cfi_endproc                                    // |                     |                     |           |
    .type   .L.str,@object                          // |                     |                     |           |
    .section    .rodata.str1.1,"aMS",@progbits,1    // |                     |                     |           |
.L.str:                                             // |                     |                     |           |
    .asciz  "db"                                    // |                     |                     |           |
    .size   .L.str, 3                               // |                     |                     |           |
    .ident  "clang version 15.0.4"                  // |                     |                     |           |
    .section    ".note.GNU-stack","",@progbits      // |                     |                     |           |
    .addrsig                                        // |                     |                     |           |
                                                    // +.....................+.....................+...........+
                                                    // Legend:
                                                    //     ^       : Register assignment (write)
                                                    //     v       : Register usage (read)
                                                    //     x       : Register usage and reassignment (R/W)
                                                    //     :       : Register in use (live)
                                                    //     <space> : Register not in use
                                                    //     #       : Number of occupied registers
