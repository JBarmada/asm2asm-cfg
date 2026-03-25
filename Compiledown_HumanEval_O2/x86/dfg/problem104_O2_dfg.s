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
    pushq   %rbx                                    // |  2  v     x         |  0                  |  0        |
    .cfi_def_cfa_offset 16                          // |                     |                     |           |
    .cfi_offset %rbx, -16                           // |                     |                     |           |
    cmpl    %esi, %edi                              // |  3     vv :         |  0                  |  6 ^^^^^^ |
    jle .LBB0_2                                     // |  1        :         |  0                  |  3  vvv   |
    leaq    .L.str(%rip), %rax                      // |  2 ^      :         |  0                  |  0        |
    popq    %rbx                                    // |  3 :^     x         |  0                  |  0        |
    .cfi_def_cfa_offset 8                           // |                     |                     |           |
    retq                                            // |  2 :      x         |  0                  |  0        |
.LBB0_2:                                            // |                     |                     |           |
    .cfi_def_cfa_offset 16                          // |                     |                     |           |
    movl    %esi, %ebx                              // |  4 :^  v  :         |  0                  |  0        |
    addl    %edi, %ebx                              // |  4 :x   v :         |  0                  |  6 ^^^^^^ |
    movl    $33, %edi                               // |  4 ::   ^ :         |  0                  |  0        |
    callq   malloc@PLT                              // |  3 ::     x         |  0                  |  0        |
    movb    $0, (%rax)                              // |  3 v:     :         |  0                  |  0        |
    movb    $0, 32(%rax)                            // |  3 v:     :         |  0                  |  0        |
    addq    $32, %rax                               // |  3 x:     :         |  0                  |  6 ^^^^^^ |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_3:                                            // |                     |                     |           |
    movl    %ebx, %ecx                              // |  4 :v^    :         |  0                  |  0        |
    shrl    $31, %ecx                               // |  4 ::x    :         |  0                  |  5 ^^^^^  |
    addl    %ebx, %ecx                              // |  4 :vx    :         |  0                  |  6 ^^^^^^ |
    movl    %ecx, %edx                              // |  5 ::v^   :         |  0                  |  0        |
    sarl    %edx                                    // |  5 :::x   :         |  0                  |  5 ^^^^^  |
    shrl    $31, %ecx                               // |  5 ::x:   :         |  0                  |  5 ^^^^^  |
    addl    %edx, %ecx                              // |  5 ::xv   :         |  0                  |  6 ^^^^^^ |
    andl    $254, %ecx                              // |  5 ::x:   :         |  0                  |  5 ^^^^^  |
    movl    %edx, %esi                              // |  6 :::v^  :         |  0                  |  0        |
    subl    %ecx, %esi                              // |  6 ::v:x  :         |  0                  |  6 ^^^^^^ |
    addb    $48, %sil                               // |  5 :: :x  :         |  0                  |  6 ^^^^^^ |
    movb    %sil, -1(%rax)                          // |  5 v: :v  :         |  0                  |  0        |
    decq    %rax                                    // |  4 x: :   :         |  0                  |  5  ^^^^^ |
    cmpl    $3, %ebx                                // |  3  v :   :         |  0                  |  6 ^^^^^^ |
    movl    %edx, %ebx                              // |  3  ^ v   :         |  0                  |  3  :::   |
    jg  .LBB0_3                                     // |  1        :         |  0                  |  3  vvv   |
    popq    %rbx                                    // |  2  ^     x         |  0                  |  0        |
    .cfi_def_cfa_offset 8                           // |                     |                     |           |
    retq                                            // |  1        x         |  0                  |  0        |
.Lfunc_end0:                                        // |                     |                     |           |
    .size   func0, .Lfunc_end0-func0                // |                     |                     |           |
    .cfi_endproc                                    // |                     |                     |           |
    .type   .L.str,@object                          // |                     |                     |           |
    .section    .rodata.str1.1,"aMS",@progbits,1    // |                     |                     |           |
.L.str:                                             // |                     |                     |           |
    .asciz  "-1"                                    // |                     |                     |           |
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
