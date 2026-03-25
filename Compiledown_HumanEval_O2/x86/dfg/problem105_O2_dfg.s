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
    movq    %rcx, %r14                            // |  3   v    :      ^  |  0                  |  0        |
    movq    %rdx, %r15                            // |  4    v   :      :^ |  0                  |  0        |
    movl    %esi, %ebp                            // |  5     v ^:      :: |  0                  |  0        |
    movq    %rdi, %r12                            // |  6      v::    ^ :: |  0                  |  0        |
    movslq  %esi, %rbx                            // |  7  ^  v ::    : :: |  0                  |  0        |
    leaq    (,%rbx,4), %rdi                       // |  7  v   ^::    : :: |  0                  |  0        |
    callq   malloc@PLT                            // |  6  :    :x    : :: |  0                  |  0        |
    movq    %rax, (%r15)                          // |  7 v:    ::    : :v |  0                  |  0        |
    movl    $0, (%r14)                            // |  5  :    ::    : v  |  0                  |  0        |
    testl   %ebx, %ebx                            // |  5  v    ::    : :  |  0                  |  6 ^^^^^^ |
    jle .LBB0_18                                  // |  4       ::    : :  |  0                  |  3  vvv   |
    movl    %ebp, %r8d                            // |  5       v:^   : :  |  0                  |  0        |
    xorl    %r9d, %r9d                            // |  5        ::^  : :  |  0                  |  5 ^^^^^  |
    movl    $1, %esi                              // |  5     ^  ::   : :  |  0                  |  0        |
    movl    $3435973837, %edi                     // |  6     :^ ::   : :  |  0                  |  0        |
    xorl    %ebp, %ebp                            // |  7     ::^::   : :  |  0                  |  5 ^^^^^  |
    jmp .LBB0_2                                   // |  7     :::::   : :  |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_8:                                          // |                     |                     |           |
    incq    %rbp                                  // |  7     ::x::   : :  |  0                  |  5  ^^^^^ |
    cmpq    %r8, %rbp                             // |  7     ::v:v   : :  |  0                  |  6 ^^^^^^ |
    je  .LBB0_9                                   // |  6     ::::    : :  |  0                  |  1  v     |
.LBB0_2:                                          // |                     |                     |           |
    movl    (%r12,%rbp,4), %r10d                  // |  7     ::v:  ^ v :  |  0                  |  0        |
    testl   %r10d, %r10d                          // |  6     ::::  v   :  |  0                  |  6 ^^^^^^ |
    setne   %r11b                                 // |  7     ::::  :x  :  |  0                  |  3  v::   |
    jle .LBB0_6                                   // |  7     ::::  ::  :  |  0                  |  3  vvv   |
    sete    %cl                                   // |  8   x ::::  ::  :  |  0                  |  1  v     |
    movl    %r10d, %edx                           // |  8    ^::::  v:  :  |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_4:                                          // |                     |                     |           |
    testb   $1, %dl                               // |  8    v::::  ::  :  |  0                  |  6 ^^^^^^ |
    movzbl  %cl, %ecx                             // |  9   ^:::::  ::  :  |  0                  |  0        |
    cmovel  %esi, %ecx                            // |  9   ^:v:::  ::  :  |  0                  |  0        |
    movl    %ecx, %ebx                            // |  9  ^v: :::  ::  :  |  0                  |  0        |
    andb    $1, %bl                               // |  8  x : :::  ::  :  |  0                  |  5 ^^^^^  |
    sete    %r11b                                 // |  8  : : :::  :x  :  |  0                  |  1  v     |
    cmpl    $10, %edx                             // |  8  : v :::  ::  :  |  0                  |  6 ^^^^^^ |
    jb  .LBB0_6                                   // |  7  :   :::  ::  :  |  0                  |  1 v      |
    movl    %edx, %edx                            // |  8  : ^ :::  ::  :  |  0                  |  0        |
    imulq   %rdi, %rdx                            // |  9 x: ^ v::  ::  :  |  0                  |  2 ^  ^   |
    shrq    $35, %rdx                             // |  8 :: x  ::  ::  :  |  0                  |  5 ^^^^^  |
    testb   %bl, %bl                              // |  7 :v    ::  ::  :  |  0                  |  6 ^^^^^^ |
    je  .LBB0_4                                   // |  6 :     ::  ::  :  |  0                  |  1  v     |
.LBB0_6:                                          // |                     |                     |           |
    testb   %r11b, %r11b                          // |  6 :     ::  :v  :  |  0                  |  6 ^^^^^^ |
    je  .LBB0_8                                   // |  5 :     ::  :   :  |  0                  |  1  v     |
    movslq  %r9d, %r9                             // |  6 :     :: ^:   :  |  0                  |  0        |
    movl    %r10d, (%rax,%r9,4)                   // |  6 v     :: vv   :  |  0                  |  0        |
    incl    %r9d                                  // |  5 :     :: x    :  |  0                  |  5  ^^^^^ |
    movl    %r9d, (%r14)                          // |  5 :     :: v    v  |  0                  |  0        |
    jmp .LBB0_8                                   // |  4 :     :: :       |  0                  |  0        |
.LBB0_9:                                          // |                     |                     |           |
    cmpl    $2, %r9d                              // |  4 :     :: v       |  0                  |  6 ^^^^^^ |
    jl  .LBB0_18                                  // |  4 :     :: :       |  0                  |  2   vv   |
    leal    -1(%r9), %r8d                         // |  5 :     ::^v       |  0                  |  0        |
    xorl    %esi, %esi                            // |  6 :   ^ ::::       |  0                  |  5 ^^^^^  |
    movl    %r8d, %r11d                           // |  7 :   : ::v: ^     |  0                  |  0        |
    jmp .LBB0_11                                  // |  7 :   : :::: :     |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_17:                                         // |                     |                     |           |
    incl    %esi                                  // |  7 :   x :::: :     |  0                  |  5  ^^^^^ |
    decl    %r11d                                 // |  7 :   : :::: x     |  0                  |  5  ^^^^^ |
    cmpl    %r8d, %esi                            // |  7 :   v ::v: :     |  0                  |  6 ^^^^^^ |
    je  .LBB0_18                                  // |  7 :   : :::: :     |  0                  |  1  v     |
.LBB0_11:                                         // |                     |                     |           |
    movl    %esi, %ecx                            // |  8 : ^ v :::: :     |  0                  |  0        |
    notl    %ecx                                  // |  8 : x : :::: :     |  0                  |  0        |
    addl    %r9d, %ecx                            // |  8 : x : :::v :     |  0                  |  6 ^^^^^^ |
    testl   %ecx, %ecx                            // |  7 : v : :::  :     |  0                  |  6 ^^^^^^ |
    jle .LBB0_17                                  // |  6 :   : :::  :     |  0                  |  3  vvv   |
    movl    %r8d, %r10d                           // |  7 :   : ::v ^:     |  0                  |  0        |
    subl    %esi, %r10d                           // |  6 :   v ::  x:     |  0                  |  6 ^^^^^^ |
    movl    (%rax), %edx                          // |  6 v  ^  ::  ::     |  0                  |  0        |
    cmpl    $1, %r10d                             // |  6 :  :  ::  v:     |  0                  |  6 ^^^^^^ |
    jne .LBB0_19                                  // |  6 :  :  ::  ::     |  0                  |  1  v     |
    xorl    %ebx, %ebx                            // |  7 :^ :  ::  ::     |  0                  |  5 ^^^^^  |
.LBB0_14:                                         // |                     |                     |           |
    testb   $1, %r10b                             // |  7 :: :  ::  v:     |  0                  |  6 ^^^^^^ |
    je  .LBB0_17                                  // |  6 :: :  ::   :     |  0                  |  1  v     |
    movl    4(%rax,%rbx,4), %ecx                  // |  7 vv^:  ::   :     |  0                  |  0        |
    cmpl    %ecx, %edx                            // |  7 ::vv  ::   :     |  0                  |  6 ^^^^^^ |
    jle .LBB0_17                                  // |  7 ::::  ::   :     |  0                  |  3  vvv   |
    movl    %ecx, (%rax,%rbx,4)                   // |  7 vvv:  ::   :     |  0                  |  0        |
    movl    %edx, 4(%rax,%rbx,4)                  // |  6 vv v  ::   :     |  0                  |  0        |
    jmp .LBB0_17                                  // |  6 :: :  ::   :     |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_19:                                         // |                     |                     |           |
    movl    %r11d, %edi                           // |  7 :: : ^::   v     |  0                  |  0        |
    andl    $-2, %edi                             // |  6 :: : x::         |  0                  |  5 ^^^^^  |
    xorl    %ecx, %ecx                            // |  7 ::^: :::         |  0                  |  5 ^^^^^  |
    jmp .LBB0_20                                  // |  7 :::: :::         |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_25:                                         // |                     |                     |           |
    movl    %ebp, 4(%rax,%rcx,4)                  // |  7 v:v: :v:         |  0                  |  0        |
    movl    %edx, 8(%rax,%rcx,4)                  // |  6 v:vv : :         |  0                  |  0        |
.LBB0_26:                                         // |                     |                     |           |
    movq    %rbx, %rcx                            // |  6 :v^: : :         |  0                  |  0        |
    cmpq    %rbx, %rdi                            // |  6 :v:: v :         |  0                  |  6 ^^^^^^ |
    je  .LBB0_14                                  // |  4 : ::   :         |  0                  |  1  v     |
.LBB0_20:                                         // |                     |                     |           |
    movl    4(%rax,%rcx,4), %ebp                  // |  5 v v:  ^:         |  0                  |  0        |
    cmpl    %ebp, %edx                            // |  5 : :v  v:         |  0                  |  6 ^^^^^^ |
    jle .LBB0_21                                  // |  5 : ::  ::         |  0                  |  3  vvv   |
    movl    %ebp, (%rax,%rcx,4)                   // |  5 v v:  v:         |  0                  |  0        |
    movl    %edx, 4(%rax,%rcx,4)                  // |  5 v vv  ::         |  0                  |  0        |
    jmp .LBB0_23                                  // |  4 : :   ::         |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_21:                                         // |                     |                     |           |
    movl    %ebp, %edx                            // |  5 : :^  v:         |  0                  |  0        |
.LBB0_23:                                         // |                     |                     |           |
    leaq    2(%rcx), %rbx                         // |  5 :^v:   :         |  0                  |  0        |
    movl    8(%rax,%rcx,4), %ebp                  // |  5 v v:  ^:         |  0                  |  0        |
    cmpl    %ebp, %edx                            // |  3    v  v:         |  0                  |  6 ^^^^^^ |
    jg  .LBB0_25                                  // |  2       ::         |  0                  |  3  vvv   |
    movl    %ebp, %edx                            // |  3    ^  v:         |  0                  |  0        |
    jmp .LBB0_26                                  // |  1        :         |  0                  |  0        |
.LBB0_18:                                         // |                     |                     |           |
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
