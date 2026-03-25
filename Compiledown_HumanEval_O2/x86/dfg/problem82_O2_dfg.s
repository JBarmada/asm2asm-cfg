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
    .section    .rodata.cst8,"aM",@progbits,8       // |                     |                     |           |
    .p2align    3                                   // |                     |                     |           |
.LCPI0_0:                                           // |                     |                     |           |
    .quad   0x400fffcb923a29c7                      // |                     |                     |           |
.LCPI0_1:                                           // |                     |                     |           |
    .quad   0x400d99ce075f6fd2                      // |                     |                     |           |
.LCPI0_2:                                           // |                     |                     |           |
    .quad   0x400a669ad42c3c9f                      // |                     |                     |           |
.LCPI0_3:                                           // |                     |                     |           |
    .quad   0x400800346dc5d639                      // |                     |                     |           |
.LCPI0_4:                                           // |                     |                     |           |
    .quad   0x400599ce075f6fd2                      // |                     |                     |           |
.LCPI0_5:                                           // |                     |                     |           |
    .quad   0x4002669ad42c3c9f                      // |                     |                     |           |
.LCPI0_6:                                           // |                     |                     |           |
    .quad   0x400000346dc5d639                      // |                     |                     |           |
.LCPI0_7:                                           // |                     |                     |           |
    .quad   0x3ffb339c0ebedfa4                      // |                     |                     |           |
.LCPI0_8:                                           // |                     |                     |           |
    .quad   0x3ff4cd35a858793e                      // |                     |                     |           |
.LCPI0_9:                                           // |                     |                     |           |
    .quad   0x3ff00068db8bac71                      // |                     |                     |           |
.LCPI0_10:                                          // |                     |                     |           |
    .quad   0x3fe667381d7dbf48                      // |                     |                     |           |
.LCPI0_11:                                          // |                     |                     |           |
    .quad   0x3f1a36e2eb1c432d                      // |                     |                     |           |
    .text                                           // |                     |                     |           |
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
    pushq   %r13                                    // |  2        x     v   |  0                  |  0        |
    .cfi_def_cfa_offset 40                          // |                     |                     |           |
    pushq   %r12                                    // |  2        x    v    |  0                  |  0        |
    .cfi_def_cfa_offset 48                          // |                     |                     |           |
    pushq   %rbx                                    // |  2  v     x         |  0                  |  0        |
    .cfi_def_cfa_offset 56                          // |                     |                     |           |
    pushq   %rax                                    // |  2 v      x         |  0                  |  0        |
    .cfi_def_cfa_offset 64                          // |                     |                     |           |
    .cfi_offset %rbx, -56                           // |                     |                     |           |
    .cfi_offset %r12, -48                           // |                     |                     |           |
    .cfi_offset %r13, -40                           // |                     |                     |           |
    .cfi_offset %r14, -32                           // |                     |                     |           |
    .cfi_offset %r15, -24                           // |                     |                     |           |
    .cfi_offset %rbp, -16                           // |                     |                     |           |
    movl    %esi, %r14d                             // |  3     v  :      ^  |  0                  |  0        |
    movq    %rdi, %rbx                              // |  4  ^   v :      :  |  0                  |  0        |
    movslq  %esi, %rbp                              // |  5  :  v ^:      :  |  0                  |  0        |
    leaq    (,%rbp,8), %rdi                         // |  5  :   ^v:      :  |  0                  |  0        |
    callq   malloc@PLT                              // |  4  :    :x      :  |  0                  |  0        |
    testl   %ebp, %ebp                              // |  4  :    v:      :  |  0                  |  6 ^^^^^^ |
    jle .LBB0_28                                    // |  3  :     :      :  |  0                  |  3  vvv   |
    movl    %r14d, %ecx                             // |  4  :^    :      v  |  0                  |  0        |
    xorl    %edx, %edx                              // |  4  ::^   :         |  0                  |  5 ^^^^^  |
    movsd   .LCPI0_0(%rip), %xmm0                   // |  4  :::   :         |  1 ^                |  0        |
    movsd   .LCPI0_1(%rip), %xmm1                   // |  4  :::   :         |  2 :^               |  0        |
    leaq    .L.str.1(%rip), %rsi                    // |  5  :::^  :         |  2 ::               |  0        |
    movsd   .LCPI0_2(%rip), %xmm2                   // |  5  ::::  :         |  3 ::^              |  0        |
    leaq    .L.str.2(%rip), %rdi                    // |  6  ::::^ :         |  3 :::              |  0        |
    movsd   .LCPI0_3(%rip), %xmm3                   // |  6  ::::: :         |  4 :::^             |  0        |
    leaq    .L.str.3(%rip), %rbp                    // |  7  :::::^:         |  4 ::::             |  0        |
    movsd   .LCPI0_4(%rip), %xmm4                   // |  7  :::::::         |  5 ::::^            |  0        |
    leaq    .L.str.4(%rip), %r8                     // |  8  :::::::^        |  5 :::::            |  0        |
    movsd   .LCPI0_5(%rip), %xmm5                   // |  8  ::::::::        |  6 :::::^           |  0        |
    leaq    .L.str.5(%rip), %r9                     // |  9  ::::::::^       |  6 ::::::           |  0        |
    movsd   .LCPI0_6(%rip), %xmm6                   // |  9  :::::::::       |  7 ::::::^          |  0        |
    leaq    .L.str.6(%rip), %r10                    // | 10  :::::::::^      |  7 :::::::          |  0        |
    movsd   .LCPI0_7(%rip), %xmm12                  // | 10  ::::::::::      |  8 :::::::     ^    |  0        |
    leaq    .L.str.7(%rip), %r11                    // | 11  ::::::::::^     |  8 :::::::     :    |  0        |
    movsd   .LCPI0_8(%rip), %xmm8                   // | 11  :::::::::::     |  9 ::::::: ^   :    |  0        |
    leaq    .L.str.8(%rip), %r14                    // | 12  :::::::::::  ^  |  9 ::::::: :   :    |  0        |
    movsd   .LCPI0_9(%rip), %xmm9                   // | 12  :::::::::::  :  | 10 ::::::: :^  :    |  0        |
    movsd   .LCPI0_10(%rip), %xmm10                 // | 12  :::::::::::  :  | 11 ::::::: ::^ :    |  0        |
    leaq    .L.str.10(%rip), %r13                   // | 13  ::::::::::: ^:  | 11 ::::::: ::: :    |  0        |
    movsd   .LCPI0_11(%rip), %xmm11                 // | 12  :::::::::::  :  | 12 ::::::: :::^:    |  0        |
    leaq    .L.str.12(%rip), %r15                   // | 13  :::::::::::  :^ | 12 ::::::: :::::    |  0        |
    leaq    .L.str(%rip), %r12                      // | 14  :::::::::::^ :: | 12 ::::::: :::::    |  0        |
    jmp .LBB0_2                                     // | 14  :::::::::::: :: | 12 ::::::: :::::    |  0        |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_3:                                            // |                     |                     |           |
    movq    %r12, (%rax,%rdx,8)                     // | 15 v::v::::::::v :: | 12 ::::::: :::::    |  0        |
.LBB0_27:                                           // |                     |                     |           |
    incq    %rdx                                    // | 13  ::x::::::::  :: | 12 ::::::: :::::    |  5  ^^^^^ |
    cmpq    %rdx, %rcx                              // | 13  :vv::::::::  :: | 12 ::::::: :::::    |  6 ^^^^^^ |
    je  .LBB0_28                                    // | 12  : :::::::::  :: | 12 ::::::: :::::    |  2 :v     |
.LBB0_2:                                            // |                     |                     |           |
    movss   (%rbx,%rdx,4), %xmm7                    // | 12  v v::::::::  :: | 13 :::::::^:::::    |  2 ::     |
    cvtss2sd    %xmm7, %xmm7                        // | 11    :::::::::  :: | 13 :::::::^:::::    |  2 ::     |
    ucomisd %xmm0, %xmm7                            // | 11    :::::::::  :: | 13 v::::::^:::::    |  2 ::     |
    jae .LBB0_3                                     // | 11    :::::::::  :: | 11  :::::: :::::    |  2 v:     |
    ucomisd %xmm1, %xmm7                            // | 11    :::::::::  :: | 12  v:::::^:::::    |  2 ::     |
    jbe .LBB0_6                                     // | 11    :::::::::  :: | 10   ::::: :::::    |  2 vv     |
    movq    %rsi, (%rax,%rdx,8)                     // | 12 v  vv:::::::  :: | 10   ::::: :::::    |  2 ::     |
    jmp .LBB0_27                                    // | 10    : :::::::  :: | 10   ::::: :::::    |  2 ::     |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_6:                                            // |                     |                     |           |
    ucomisd %xmm2, %xmm7                            // | 10    : :::::::  :: | 11   v::::^:::::    |  2 ::     |
    jbe .LBB0_8                                     // | 10    : :::::::  :: |  9    :::: :::::    |  2 vv     |
    movq    %rdi, (%rax,%rdx,8)                     // | 11 v  v v::::::  :: |  9    :::: :::::    |  2 ::     |
    jmp .LBB0_27                                    // |  9    :  ::::::  :: |  9    :::: :::::    |  2 ::     |
.LBB0_8:                                            // |                     |                     |           |
    ucomisd %xmm3, %xmm7                            // |  9    :  ::::::  :: | 10    v:::^:::::    |  2 ::     |
    jbe .LBB0_10                                    // |  9    :  ::::::  :: |  8     ::: :::::    |  2 vv     |
    movq    %rbp, (%rax,%rdx,8)                     // | 10 v  v  v:::::  :: |  8     ::: :::::    |  2 ::     |
    jmp .LBB0_27                                    // |  8    :   :::::  :: |  8     ::: :::::    |  2 ::     |
.LBB0_10:                                           // |                     |                     |           |
    ucomisd %xmm4, %xmm7                            // |  8    :   :::::  :: |  9     v::^:::::    |  2 ::     |
    jbe .LBB0_12                                    // |  8    :   :::::  :: |  7      :: :::::    |  2 vv     |
    movq    %r8, (%rax,%rdx,8)                      // |  9 v  v   :v:::  :: |  7      :: :::::    |  2 ::     |
    jmp .LBB0_27                                    // |  7    :   : :::  :: |  7      :: :::::    |  2 ::     |
.LBB0_12:                                           // |                     |                     |           |
    ucomisd %xmm5, %xmm7                            // |  7    :   : :::  :: |  8      v:^:::::    |  2 ::     |
    jbe .LBB0_14                                    // |  7    :   : :::  :: |  6       : :::::    |  2 vv     |
    movq    %r9, (%rax,%rdx,8)                      // |  8 v  v   : v::  :: |  6       : :::::    |  2 ::     |
    jmp .LBB0_27                                    // |  6    :   :  ::  :: |  6       : :::::    |  2 ::     |
.LBB0_14:                                           // |                     |                     |           |
    ucomisd %xmm6, %xmm7                            // |  6    :   :  ::  :: |  7       v^:::::    |  2 ::     |
    jbe .LBB0_16                                    // |  6    :   :  ::  :: |  5         :::::    |  2 vv     |
    movq    %r10, (%rax,%rdx,8)                     // |  7 v  v   :  v:  :: |  5         :::::    |  2 ::     |
    jmp .LBB0_27                                    // |  5    :   :   :  :: |  5         :::::    |  2 ::     |
.LBB0_16:                                           // |                     |                     |           |
    ucomisd %xmm12, %xmm7                           // |  5    :   :   :  :: |  6        ^::::v    |  2 ::     |
    jbe .LBB0_18                                    // |  5    :   :   :  :: |  4         ::::     |  2 vv     |
    movq    %r11, (%rax,%rdx,8)                     // |  6 v  v   :   v  :: |  4         ::::     |  2 ::     |
    jmp .LBB0_27                                    // |  4    :   :      :: |  4         ::::     |  2 ::     |
.LBB0_18:                                           // |                     |                     |           |
    ucomisd %xmm8, %xmm7                            // |  4    :   :      :: |  5        ^v:::     |  2 ::     |
    jbe .LBB0_20                                    // |  4    :   :      :: |  3          :::     |  2 vv     |
    movq    %r14, (%rax,%rdx,8)                     // |  5 v  v   :      v: |  3          :::     |  2 ::     |
    jmp .LBB0_27                                    // |  3    :   :       : |  3          :::     |  2 ::     |
.LBB0_20:                                           // |                     |                     |           |
    ucomisd %xmm9, %xmm7                            // |  3    :   :       : |  4        ^ v::     |  2 ::     |
    jbe .LBB0_22                                    // |  3    :   :       : |  2           ::     |  2 vv     |
    leaq    .L.str.9(%rip), %r13                    // |  4    :   :     ^ : |  2           ::     |  2 ::     |
    movq    %r13, (%rax,%rdx,8)                     // |  5 v  v   :     v : |  2           ::     |  2 ::     |
    leaq    .L.str.10(%rip), %r13                   // |  4    :   :     ^ : |  2           ::     |  2 ::     |
    jmp .LBB0_27                                    // |  4    :   :     : : |  2           ::     |  2 ::     |
.LBB0_22:                                           // |                     |                     |           |
    ucomisd %xmm10, %xmm7                           // |  4    :   :     : : |  3        ^  v:     |  2 ::     |
    jbe .LBB0_24                                    // |  4    :   :     : : |  1            :     |  2 vv     |
    movq    %r13, (%rax,%rdx,8)                     // |  5 v  v   :     v : |  1            :     |  2 ::     |
    jmp .LBB0_27                                    // |  3    :   :       : |  1            :     |  2 ::     |
.LBB0_24:                                           // |                     |                     |           |
    ucomisd %xmm11, %xmm7                           // |  3    :   :       : |  2        ^   v     |  2 ::     |
    jbe .LBB0_26                                    // |  3    :   :       : |  0                  |  2 vv     |
    leaq    .L.str.11(%rip), %r14                   // |  4    :   :      ^: |  0                  |  0        |
    movq    %r14, (%rax,%rdx,8)                     // |  5 v  v   :      v: |  0                  |  0        |
    leaq    .L.str.8(%rip), %r14                    // |  4    :   :      ^: |  0                  |  0        |
    jmp .LBB0_27                                    // |  3    :   :       : |  0                  |  0        |
.LBB0_26:                                           // |                     |                     |           |
    movq    %r15, (%rax,%rdx,8)                     // |  4 v  v   :       v |  0                  |  0        |
    jmp .LBB0_27                                    // |  1        :         |  0                  |  0        |
.LBB0_28:                                           // |                     |                     |           |
    addq    $8, %rsp                                // |  1        x         |  0                  |  6 ^^^^^^ |
    .cfi_def_cfa_offset 56                          // |                     |                     |           |
    popq    %rbx                                    // |  2  ^     x         |  0                  |  0        |
    .cfi_def_cfa_offset 48                          // |                     |                     |           |
    popq    %r12                                    // |  2        x    ^    |  0                  |  0        |
    .cfi_def_cfa_offset 40                          // |                     |                     |           |
    popq    %r13                                    // |  2        x     ^   |  0                  |  0        |
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
    .type   .L.str,@object                          // |                     |                     |           |
    .section    .rodata.str1.1,"aMS",@progbits,1    // |                     |                     |           |
.L.str:                                             // |                     |                     |           |
    .asciz  "A+"                                    // |                     |                     |           |
    .size   .L.str, 3                               // |                     |                     |           |
    .type   .L.str.1,@object                        // |                     |                     |           |
.L.str.1:                                           // |                     |                     |           |
    .asciz  "A"                                     // |                     |                     |           |
    .size   .L.str.1, 2                             // |                     |                     |           |
    .type   .L.str.2,@object                        // |                     |                     |           |
.L.str.2:                                           // |                     |                     |           |
    .asciz  "A-"                                    // |                     |                     |           |
    .size   .L.str.2, 3                             // |                     |                     |           |
    .type   .L.str.3,@object                        // |                     |                     |           |
.L.str.3:                                           // |                     |                     |           |
    .asciz  "B+"                                    // |                     |                     |           |
    .size   .L.str.3, 3                             // |                     |                     |           |
    .type   .L.str.4,@object                        // |                     |                     |           |
.L.str.4:                                           // |                     |                     |           |
    .asciz  "B"                                     // |                     |                     |           |
    .size   .L.str.4, 2                             // |                     |                     |           |
    .type   .L.str.5,@object                        // |                     |                     |           |
.L.str.5:                                           // |                     |                     |           |
    .asciz  "B-"                                    // |                     |                     |           |
    .size   .L.str.5, 3                             // |                     |                     |           |
    .type   .L.str.6,@object                        // |                     |                     |           |
.L.str.6:                                           // |                     |                     |           |
    .asciz  "C+"                                    // |                     |                     |           |
    .size   .L.str.6, 3                             // |                     |                     |           |
    .type   .L.str.7,@object                        // |                     |                     |           |
.L.str.7:                                           // |                     |                     |           |
    .asciz  "C"                                     // |                     |                     |           |
    .size   .L.str.7, 2                             // |                     |                     |           |
    .type   .L.str.8,@object                        // |                     |                     |           |
.L.str.8:                                           // |                     |                     |           |
    .asciz  "C-"                                    // |                     |                     |           |
    .size   .L.str.8, 3                             // |                     |                     |           |
    .type   .L.str.9,@object                        // |                     |                     |           |
.L.str.9:                                           // |                     |                     |           |
    .asciz  "D+"                                    // |                     |                     |           |
    .size   .L.str.9, 3                             // |                     |                     |           |
    .type   .L.str.10,@object                       // |                     |                     |           |
.L.str.10:                                          // |                     |                     |           |
    .asciz  "D"                                     // |                     |                     |           |
    .size   .L.str.10, 2                            // |                     |                     |           |
    .type   .L.str.11,@object                       // |                     |                     |           |
.L.str.11:                                          // |                     |                     |           |
    .asciz  "D-"                                    // |                     |                     |           |
    .size   .L.str.11, 3                            // |                     |                     |           |
    .type   .L.str.12,@object                       // |                     |                     |           |
.L.str.12:                                          // |                     |                     |           |
    .asciz  "E"                                     // |                     |                     |           |
    .size   .L.str.12, 2                            // |                     |                     |           |
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
