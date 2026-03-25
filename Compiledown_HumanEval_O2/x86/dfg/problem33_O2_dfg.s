                                                   // +---------------------+---------------------+-----------+
                                                   // |         GPR         |        VECTOR       |   FLAGS   |
                                                   // |                     |                     |           |
                                                   // |    RRRRRRRRRRRRRRRR |    XXXXXXXXXXXXXXXX |    CZSOPA |
                                                   // |    ABCDSDBS89111111 |    MMMMMMMMMMMMMMMM |    FFFFFF |
                                                   // |    XXXXIIPP  012345 |    MMMMMMMMMMMMMMMM |           |
                                                   // |                     |    0123456789111111 |           |
                                                   // |  #                  |  #           012345 |  #        |
                                                   // +---------------------+---------------------+-----------+
    .text                                          // |                     |                     |           |
    .file   "code.c"                               // |                     |                     |           |
    .section    .rodata.cst8,"aM",@progbits,8      // |                     |                     |           |
    .p2align    3                                  // |                     |                     |           |
.LCPI0_0:                                          // |                     |                     |           |
    .quad   0x3ff0000000000000                     // |                     |                     |           |
.LCPI0_2:                                          // |                     |                     |           |
    .quad   0x3eb0c6f7a0b5ed8d                     // |                     |                     |           |
.LCPI0_3:                                          // |                     |                     |           |
    .quad   0x8000000000000000                     // |                     |                     |           |
    .section    .rodata.cst16,"aM",@progbits,16    // |                     |                     |           |
    .p2align    4                                  // |                     |                     |           |
.LCPI0_1:                                          // |                     |                     |           |
    .quad   0x7fffffffffffffff                     // |                     |                     |           |
    .quad   0x7fffffffffffffff                     // |                     |                     |           |
    .text                                          // |                     |                     |           |
    .globl  func0                                  // |                     |                     |           |
    .p2align    4, 0x90                            // |                     |                     |           |
    .type   func0,@function                        // |                     |                     |           |
func0:                                             // |                     |                     |           |
    .cfi_startproc                                 // |                     |                     |           |
    movsd   (%rdi), %xmm1                          // |  1      v           |  1  ^               |  0        |
    movl    %esi, %r9d                             // |  2     v    ^       |  1  :               |  0        |
    movapd  %xmm1, %xmm2                           // |  1          :       |  2  v^              |  0        |
    cmpl    $2, %esi                               // |  2     v    :       |  1  :               |  6 ^^^^^^ |
    jl  .LBB0_9                                    // |  1          :       |  1  :               |  2   vv   |
    movl    $1, %edx                               // |  2    ^     :       |  1  :               |  0        |
    xorl    %r8d, %r8d                             // |  3    :    ^:       |  1  :               |  5 ^^^^^  |
    movsd   .LCPI0_0(%rip), %xmm0                  // |  3    :    ::       |  2 ^:               |  0        |
    xorpd   %xmm3, %xmm3                           // |  3    :    ::       |  3 :: ^             |  5 ^^^^^  |
    movapd  %xmm1, %xmm2                           // |  3    :    ::       |  4 :v^:             |  0        |
    jmp .LBB0_2                                    // |  3    :    ::       |  4 ::::             |  0        |
    .p2align    4, 0x90                            // |                     |                     |           |
.LBB0_8:                                           // |                     |                     |           |
    mulsd   (%rdi,%rdx,8), %xmm4                   // |  5 x  x v  ::       |  5 ::::^            |  2 ^  ^   |
    addsd   %xmm4, %xmm2                           // |  4 :  :    ::       |  5 ::x:v            |  6 ^^^^^^ |
    incq    %rdx                                   // |  4 :  x    ::       |  4 ::::             |  5  ^^^^^ |
    incq    %r8                                    // |  4 :  :    x:       |  4 ::::             |  5  ^^^^^ |
    cmpq    %r9, %rdx                              // |  4 :  v    :v       |  4 ::::             |  6 ^^^^^^ |
    je  .LBB0_9                                    // |  4 :  :    ::       |  4 ::::             |  1  v     |
.LBB0_2:                                           // |                     |                     |           |
    movapd  %xmm0, %xmm4                           // |  4 :  :    ::       |  5 v:::^            |  0        |
    cmpq    $7, %r8                                // |  4 :  :    v:       |  4 ::::             |  6 ^^^^^^ |
    jb  .LBB0_5                                    // |  3 :  :     :       |  4 ::::             |  1 v      |
    movq    %rdx, %rcx                             // |  4 : ^v     :       |  4 ::::             |  0        |
    andq    $-8, %rcx                              // |  4 : x:     :       |  4 ::::             |  5 ^^^^^  |
    movapd  %xmm0, %xmm4                           // |  4 : ::     :       |  5 v:::^            |  0        |
    .p2align    4, 0x90                            // |                     |                     |           |
.LBB0_4:                                           // |                     |                     |           |
    mulsd   %xmm3, %xmm4                           // |  4 x :x     :       |  4  ::v^            |  2 ^  ^   |
    mulsd   %xmm3, %xmm4                           // |  4 x :x     :       |  4  ::v^            |  2 ^  ^   |
    mulsd   %xmm3, %xmm4                           // |  4 x :x     :       |  4  ::v^            |  2 ^  ^   |
    mulsd   %xmm3, %xmm4                           // |  4 x :x     :       |  4  ::v^            |  2 ^  ^   |
    mulsd   %xmm3, %xmm4                           // |  4 x :x     :       |  4  ::v^            |  2 ^  ^   |
    mulsd   %xmm3, %xmm4                           // |  4 x :x     :       |  4  ::v^            |  2 ^  ^   |
    mulsd   %xmm3, %xmm4                           // |  4 x :x     :       |  4  ::v^            |  2 ^  ^   |
    mulsd   %xmm3, %xmm4                           // |  4 x :x     :       |  4  ::v^            |  2 ^  ^   |
    addq    $-8, %rcx                              // |  3   x:     :       |  3  :::             |  6 ^^^^^^ |
    jne .LBB0_4                                    // |  2    :     :       |  3  :::             |  1  v     |
.LBB0_5:                                           // |                     |                     |           |
    testb   $7, %dl                                // |  2    v     :       |  3  :::             |  6 ^^^^^^ |
    je  .LBB0_8                                    // |  2    :     :       |  3  :::             |  1  v     |
    movl    %edx, %eax                             // |  3 ^  v     :       |  3  :::             |  0        |
    andl    $7, %eax                               // |  3 x  :     :       |  3  :::             |  5 ^^^^^  |
    .p2align    4, 0x90                            // |                     |                     |           |
.LBB0_7:                                           // |                     |                     |           |
    mulsd   %xmm3, %xmm4                           // |  3 x  x     :       |  4  ::v^            |  2 ^  ^   |
    decq    %rax                                   // |  3 x  :     :       |  2  ::              |  5  ^^^^^ |
    jne .LBB0_7                                    // |  3 :  :     :       |  2  ::              |  1  v     |
    jmp .LBB0_8                                    // |  3 :  :     :       |  2  ::              |  0        |
.LBB0_9:                                           // |                     |                     |           |
    movapd  .LCPI0_1(%rip), %xmm3                  // |  3 :  :     :       |  3  ::^             |  0        |
    andpd   %xmm2, %xmm3                           // |  3 :  :     :       |  3  :vx             |  5 ^^^^^  |
    xorpd   %xmm0, %xmm0                           // |  3 :  :     :       |  2 ^:               |  5 ^^^^^  |
    ucomisd .LCPI0_2(%rip), %xmm3                  // |  3 :  :     :       |  2  : ^             |  2 ::     |
    jbe .LBB0_33                                   // |  3 :  :     :       |  1  :               |  2 vv     |
    xorpd   %xmm0, %xmm0                           // |  3 :  :     :       |  2 ^:               |  5 ^^^^^  |
    movsd   .LCPI0_0(%rip), %xmm6                  // |  3 :  :     :       |  3 ::    ^          |  0        |
    movapd  .LCPI0_1(%rip), %xmm9                  // |  3 :  :     :       |  4 ::    :  ^       |  0        |
    movsd   .LCPI0_2(%rip), %xmm5                  // |  3 :  :     :       |  5 ::   ^:  :       |  0        |
    movsd   .LCPI0_3(%rip), %xmm8                  // |  3 :  :     :       |  6 ::   :: ^:       |  0        |
    jmp .LBB0_14                                   // |  3 :  :     :       |  6 ::   :: ::       |  0        |
    .p2align    4, 0x90                            // |                     |                     |           |
.LBB0_11:                                          // |                     |                     |           |
    divsd   %xmm8, %xmm2                           // |  3 x  x     :       |  7 ::^  :: v:       |  0        |
    addsd   %xmm2, %xmm0                           // |  2    :     :       |  6 x:v  ::  :       |  6 ^^^^^^ |
.LBB0_12:                                          // |                     |                     |           |
    movapd  %xmm1, %xmm2                           // |  2    :     :       |  6 :v^  ::  :       |  0        |
.LBB0_13:                                          // |                     |                     |           |
    movapd  %xmm2, %xmm3                           // |  2    :     :       |  7 ::v^ ::  :       |  0        |
    andpd   %xmm9, %xmm3                           // |  2    :     :       |  6 :: x ::  v       |  5 ^^^^^  |
    ucomisd %xmm5, %xmm3                           // |  2    :     :       |  5 :: ^ v:          |  2 ::     |
    jbe .LBB0_33                                   // |  2    :     :       |  4 :: :  :          |  2 vv     |
.LBB0_14:                                          // |                     |                     |           |
    cmpl    $2, %esi                               // |  3    :v    :       |  4 :: :  :          |  6 ^^^^^^ |
    jl  .LBB0_11                                   // |  2    :     :       |  4 :: :  :          |  2   vv   |
    xorpd   %xmm7, %xmm7                           // |  2    :     :       |  5 :: :  :^         |  5 ^^^^^  |
    movl    $1, %ecx                               // |  3   ^:     :       |  5 :: :  ::         |  0        |
    xorl    %eax, %eax                             // |  4 ^ ::     :       |  5 :: :  ::         |  5 ^^^^^  |
    jmp .LBB0_16                                   // |  4 : ::     :       |  5 :: :  ::         |  0        |
    .p2align    4, 0x90                            // |                     |                     |           |
.LBB0_23:                                          // |                     |                     |           |
    xorps   %xmm4, %xmm4                           // |  4 : ::     :       |  6 :: :^ ::         |  5 ^^^^^  |
    cvtsi2sd    %ecx, %xmm4                        // |  4 : v:     :       |  6 :: :^ ::         |  0        |
    mulsd   (%rdi,%rcx,8), %xmm4                   // |  5 x vx v   :       |  6 :: :^ ::         |  2 ^  ^   |
    mulsd   %xmm3, %xmm4                           // |  4 x :x     :       |  6 :: v^ ::         |  2 ^  ^   |
    addsd   %xmm4, %xmm7                           // |  3 : :      :       |  5 ::  v :x         |  6 ^^^^^^ |
    incq    %rcx                                   // |  3 : x      :       |  4 ::    ::         |  5  ^^^^^ |
    incq    %rax                                   // |  3 x :      :       |  4 ::    ::         |  5  ^^^^^ |
    cmpq    %r9, %rcx                              // |  3 : v      v       |  4 ::    ::         |  6 ^^^^^^ |
    je  .LBB0_24                                   // |  3 : :      :       |  4 ::    ::         |  1  v     |
.LBB0_16:                                          // |                     |                     |           |
    movapd  %xmm6, %xmm3                           // |  3 : :      :       |  5 :: ^  v:         |  0        |
    cmpq    $2, %rcx                               // |  3 : v      :       |  4 ::    ::         |  6 ^^^^^^ |
    jb  .LBB0_23                                   // |  2 :        :       |  4 ::    ::         |  1 v      |
    leaq    -1(%rax), %rdx                         // |  3 v  ^     :       |  4 ::    ::         |  0        |
    movapd  %xmm6, %xmm3                           // |  3 :  :     :       |  5 :: ^  v:         |  0        |
    cmpq    $7, %rdx                               // |  3 :  v     :       |  4 ::    ::         |  6 ^^^^^^ |
    jb  .LBB0_20                                   // |  2 :        :       |  4 ::    ::         |  1 v      |
    movq    %rax, %rdx                             // |  3 v  ^     :       |  4 ::    ::         |  0        |
    andq    $-8, %rdx                              // |  3 :  x     :       |  4 ::    ::         |  5 ^^^^^  |
    movapd  %xmm6, %xmm3                           // |  3 :  :     :       |  5 :: ^  v:         |  0        |
    .p2align    4, 0x90                            // |                     |                     |           |
.LBB0_19:                                          // |                     |                     |           |
    mulsd   %xmm0, %xmm3                           // |  3 x  x     :       |  5 v: ^  ::         |  2 ^  ^   |
    mulsd   %xmm0, %xmm3                           // |  3 x  x     :       |  5 v: ^  ::         |  2 ^  ^   |
    mulsd   %xmm0, %xmm3                           // |  3 x  x     :       |  5 v: ^  ::         |  2 ^  ^   |
    mulsd   %xmm0, %xmm3                           // |  3 x  x     :       |  5 v: ^  ::         |  2 ^  ^   |
    mulsd   %xmm0, %xmm3                           // |  3 x  x     :       |  5 v: ^  ::         |  2 ^  ^   |
    mulsd   %xmm0, %xmm3                           // |  3 x  x     :       |  5 v: ^  ::         |  2 ^  ^   |
    mulsd   %xmm0, %xmm3                           // |  3 x  x     :       |  5 v: ^  ::         |  2 ^  ^   |
    mulsd   %xmm0, %xmm3                           // |  3 x  x     :       |  5 v: ^  ::         |  2 ^  ^   |
    addq    $-8, %rdx                              // |  3 :  x     :       |  4 ::    ::         |  6 ^^^^^^ |
    jne .LBB0_19                                   // |  2 :        :       |  4 ::    ::         |  1  v     |
.LBB0_20:                                          // |                     |                     |           |
    testb   $7, %al                                // |  2 v        :       |  4 ::    ::         |  6 ^^^^^^ |
    je  .LBB0_23                                   // |  2 :        :       |  4 ::    ::         |  1  v     |
    movl    %eax, %edx                             // |  3 v  ^     :       |  4 ::    ::         |  0        |
    andl    $7, %edx                               // |  3 :  x     :       |  4 ::    ::         |  5 ^^^^^  |
    .p2align    4, 0x90                            // |                     |                     |           |
.LBB0_22:                                          // |                     |                     |           |
    mulsd   %xmm0, %xmm3                           // |  3 x  x     :       |  5 v: ^  ::         |  2 ^  ^   |
    decq    %rdx                                   // |  3 :  x     :       |  4 ::    ::         |  5  ^^^^^ |
    jne .LBB0_22                                   // |  3 :  :     :       |  4 ::    ::         |  1  v     |
    jmp .LBB0_23                                   // |  3 :  :     :       |  4 ::    ::         |  0        |
    .p2align    4, 0x90                            // |                     |                     |           |
.LBB0_24:                                          // |                     |                     |           |
    divsd   %xmm7, %xmm2                           // |  3 x  x     :       |  5 ::^   :v         |  0        |
    subsd   %xmm2, %xmm0                           // |  2 :        :       |  4 x:v   :          |  6 ^^^^^^ |
    cmpl    $2, %esi                               // |  3 :   v    :       |  3 ::    :          |  6 ^^^^^^ |
    jl  .LBB0_12                                   // |  2 :        :       |  3 ::    :          |  2   vv   |
    movl    $1, %ecx                               // |  3 : ^      :       |  3 ::    :          |  0        |
    xorl    %edx, %edx                             // |  4 : :^     :       |  3 ::    :          |  5 ^^^^^  |
    movapd  %xmm1, %xmm2                           // |  4 : ::     :       |  4 :v^   :          |  0        |
    jmp .LBB0_26                                   // |  4 : ::     :       |  3 : :   :          |  0        |
    .p2align    4, 0x90                            // |                     |                     |           |
.LBB0_32:                                          // |                     |                     |           |
    mulsd   (%rdi,%rcx,8), %xmm3                   // |  5 x vx v   :       |  4 : :^  :          |  2 ^  ^   |
    addsd   %xmm3, %xmm2                           // |  3   ::     :       |  4 : xv  :          |  6 ^^^^^^ |
    incq    %rcx                                   // |  3   x:     :       |  2 :     :          |  5  ^^^^^ |
    incq    %rdx                                   // |  3   :x     :       |  2 :     :          |  5  ^^^^^ |
    cmpq    %r9, %rcx                              // |  3   v:     v       |  2 :     :          |  6 ^^^^^^ |
    je  .LBB0_13                                   // |  2   ::             |  2 :     :          |  1  v     |
.LBB0_26:                                          // |                     |                     |           |
    movapd  %xmm6, %xmm3                           // |  2   ::             |  3 :  ^  v          |  0        |
    cmpq    $7, %rdx                               // |  2   :v             |  2 :     :          |  6 ^^^^^^ |
    jb  .LBB0_29                                   // |  2   ::             |  2 :     :          |  1 v      |
    movq    %rcx, %rax                             // |  3 ^ v:             |  2 :     :          |  0        |
    andq    $-8, %rax                              // |  3 x ::             |  2 :     :          |  5 ^^^^^  |
    movapd  %xmm6, %xmm3                           // |  3 : ::             |  3 :  ^  v          |  0        |
    .p2align    4, 0x90                            // |                     |                     |           |
.LBB0_28:                                          // |                     |                     |           |
    mulsd   %xmm0, %xmm3                           // |  3 x :x             |  2 v  ^             |  2 ^  ^   |
    mulsd   %xmm0, %xmm3                           // |  3 x :x             |  2 v  ^             |  2 ^  ^   |
    mulsd   %xmm0, %xmm3                           // |  3 x :x             |  2 v  ^             |  2 ^  ^   |
    mulsd   %xmm0, %xmm3                           // |  3 x :x             |  2 v  ^             |  2 ^  ^   |
    mulsd   %xmm0, %xmm3                           // |  3 x :x             |  2 v  ^             |  2 ^  ^   |
    mulsd   %xmm0, %xmm3                           // |  3 x :x             |  2 v  ^             |  2 ^  ^   |
    mulsd   %xmm0, %xmm3                           // |  3 x :x             |  2 v  ^             |  2 ^  ^   |
    mulsd   %xmm0, %xmm3                           // |  3 x :x             |  2 v  ^             |  2 ^  ^   |
    addq    $-8, %rax                              // |  3 x ::             |  1 :                |  6 ^^^^^^ |
    jne .LBB0_28                                   // |  2   ::             |  1 :                |  1  v     |
.LBB0_29:                                          // |                     |                     |           |
    testb   $7, %cl                                // |  2   v:             |  1 :                |  6 ^^^^^^ |
    je  .LBB0_32                                   // |  2   ::             |  1 :                |  1  v     |
    movl    %ecx, %eax                             // |  3 ^ v:             |  1 :                |  0        |
    andl    $7, %eax                               // |  2 x  :             |  1 :                |  5 ^^^^^  |
    .p2align    4, 0x90                            // |                     |                     |           |
.LBB0_31:                                          // |                     |                     |           |
    mulsd   %xmm0, %xmm3                           // |  2 x  x             |  2 v  ^             |  2 ^  ^   |
    decq    %rax                                   // |  1 x                |  0                  |  5  ^^^^^ |
    jne .LBB0_31                                   // |  0                  |  0                  |  1  v     |
    jmp .LBB0_32                                   // |  0                  |  0                  |  0        |
.LBB0_33:                                          // |                     |                     |           |
    retq                                           // |  1        x         |  0                  |  0        |
.Lfunc_end0:                                       // |                     |                     |           |
    .size   func0, .Lfunc_end0-func0               // |                     |                     |           |
    .cfi_endproc                                   // |                     |                     |           |
    .ident  "clang version 15.0.4"                 // |                     |                     |           |
    .section    ".note.GNU-stack","",@progbits     // |                     |                     |           |
    .addrsig                                       // |                     |                     |           |
                                                   // +.....................+.....................+...........+
                                                   // Legend:
                                                   //     ^       : Register assignment (write)
                                                   //     v       : Register usage (read)
                                                   //     x       : Register usage and reassignment (R/W)
                                                   //     :       : Register in use (live)
                                                   //     <space> : Register not in use
                                                   //     #       : Number of occupied registers
