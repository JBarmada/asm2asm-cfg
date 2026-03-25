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
    pushq   %r15                                  // |  2        x       v |  0                  |  0        |
    .cfi_def_cfa_offset 16                        // |                     |                     |           |
    pushq   %r14                                  // |  2        x      v  |  0                  |  0        |
    .cfi_def_cfa_offset 24                        // |                     |                     |           |
    pushq   %r13                                  // |  2        x     v   |  0                  |  0        |
    .cfi_def_cfa_offset 32                        // |                     |                     |           |
    pushq   %r12                                  // |  2        x    v    |  0                  |  0        |
    .cfi_def_cfa_offset 40                        // |                     |                     |           |
    pushq   %rbx                                  // |  2  v     x         |  0                  |  0        |
    .cfi_def_cfa_offset 48                        // |                     |                     |           |
    .cfi_offset %rbx, -48                         // |                     |                     |           |
    .cfi_offset %r12, -40                         // |                     |                     |           |
    .cfi_offset %r13, -32                         // |                     |                     |           |
    .cfi_offset %r14, -24                         // |                     |                     |           |
    .cfi_offset %r15, -16                         // |                     |                     |           |
    movq    %rdx, %r14                            // |  3    v   :      ^  |  0                  |  0        |
    movl    %esi, %r15d                           // |  4     v  :      :^ |  0                  |  0        |
    movq    %rdi, %r12                            // |  5      v :    ^ :: |  0                  |  0        |
    movslq  %esi, %rbx                            // |  6  ^  v  :    : :: |  0                  |  0        |
    imulq   $1431655766, %rbx, %rax               // |  7 x: x   :    : :: |  0                  |  2 ^  ^   |
    movq    %rax, %rcx                            // |  8 v:^:   :    : :: |  0                  |  0        |
    shrq    $63, %rcx                             // |  8 ::x:   :    : :: |  0                  |  5 ^^^^^  |
    shrq    $32, %rax                             // |  8 x:::   :    : :: |  0                  |  5 ^^^^^  |
    addl    %ecx, %eax                            // |  8 x:v:   :    : :: |  0                  |  6 ^^^^^^ |
    cltq                                          // |  7 :: :   :    : :: |  0                  |  0        |
    leaq    4(,%rax,4), %rdi                      // |  8 v: : ^ :    : :: |  0                  |  0        |
    callq   malloc@PLT                            // |  7 :: :   x    : :: |  0                  |  0        |
    testl   %ebx, %ebx                            // |  7 :v :   :    : :: |  0                  |  6 ^^^^^^ |
    jle .LBB0_17                                  // |  6 :  :   :    : :: |  0                  |  3  vvv   |
    leal    -1(%r15), %esi                        // |  7 :  :^  :    : :v |  0                  |  0        |
    movl    $2863311531, %ecx                     // |  8 : ^::  :    : :: |  0                  |  0        |
    imulq   %rsi, %rcx                            // |  8 x ^xv  :    : :: |  0                  |  2 ^  ^   |
    shrq    $33, %rcx                             // |  7 : x :  :    : :: |  0                  |  5 ^^^^^  |
    leal    1(%rcx), %edx                         // |  8 : v^:  :    : :: |  0                  |  0        |
    cmpl    $23, %esi                             // |  8 : ::v  :    : :: |  0                  |  6 ^^^^^^ |
    ja  .LBB0_18                                  // |  7 : ::   :    : :: |  0                  |  2 vv     |
    xorl    %esi, %esi                            // |  8 : ::^  :    : :: |  0                  |  5 ^^^^^  |
    xorl    %r8d, %r8d                            // |  8 : ::   :^   : :: |  0                  |  5 ^^^^^  |
    jmp .LBB0_3                                   // |  7 : ::   :    : :: |  0                  |  0        |
.LBB0_18:                                         // |                     |                     |           |
    movl    %edx, %esi                            // |  8 : :v^  :    : :: |  0                  |  0        |
    andl    $7, %esi                              // |  8 : ::x  :    : :: |  0                  |  5 ^^^^^  |
    movl    $8, %edi                              // |  9 : :::^ :    : :: |  0                  |  0        |
    cmovneq %rsi, %rdi                            // |  9 : ::v^ :    : :: |  0                  |  0        |
    movq    %rdx, %rsi                            // |  9 : :v^: :    : :: |  0                  |  0        |
    subq    %rdi, %rsi                            // |  9 : ::xv :    : :: |  0                  |  6 ^^^^^^ |
    leaq    (%rsi,%rsi,2), %r8                    // |  9 : ::v  :^   : :: |  0                  |  0        |
    xorl    %edi, %edi                            // | 10 : :::^ ::   : :: |  0                  |  5 ^^^^^  |
    movq    %r12, %rbx                            // | 11 :^:::: ::   v :: |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_19:                                         // |                     |                     |           |
    movss   36(%rbx), %xmm0                       // | 11 :v:::: ::   : :: |  1 ^                |  0        |
    movss   24(%rbx), %xmm1                       // | 11 :v:::: ::   : :: |  2 :^               |  0        |
    unpcklps    %xmm0, %xmm1                      // | 11 :::::: ::   : :: |  2 v^               |  0        |
    movss   12(%rbx), %xmm0                       // | 11 :v:::: ::   : :: |  2 ^:               |  0        |
    movss   (%rbx), %xmm2                         // | 11 :v:::: ::   : :: |  3 ::^              |  0        |
    unpcklps    %xmm0, %xmm2                      // | 11 :::::: ::   : :: |  3 v:^              |  0        |
    movlhps %xmm1, %xmm2                          // | 11 :::::: ::   : :: |  2  v^              |  0        |
    movss   84(%rbx), %xmm0                       // | 11 :v:::: ::   : :: |  2 ^ :              |  0        |
    movss   72(%rbx), %xmm1                       // | 11 :v:::: ::   : :: |  3 :^:              |  0        |
    unpcklps    %xmm0, %xmm1                      // | 11 :::::: ::   : :: |  3 v^:              |  0        |
    movss   60(%rbx), %xmm0                       // | 11 :v:::: ::   : :: |  3 ^::              |  0        |
    movss   48(%rbx), %xmm3                       // | 11 :v:::: ::   : :: |  4 :::^             |  0        |
    unpcklps    %xmm0, %xmm3                      // | 11 :::::: ::   : :: |  4 v::^             |  0        |
    movlhps %xmm1, %xmm3                          // | 11 :::::: ::   : :: |  3  v:^             |  0        |
    movups  %xmm2, (%rax,%rdi,4)                  // | 11 v::::v ::   : :: |  2   v:             |  0        |
    movups  %xmm3, 16(%rax,%rdi,4)                // | 11 v::::v ::   : :: |  1    v             |  0        |
    addq    $8, %rdi                              // | 11 :::::x ::   : :: |  0                  |  6 ^^^^^^ |
    addq    $96, %rbx                             // | 11 :x:::: ::   : :: |  0                  |  6 ^^^^^^ |
    cmpq    %rdi, %rsi                            // | 10 : ::vv ::   : :: |  0                  |  6 ^^^^^^ |
    jne .LBB0_19                                  // |  9 : :::  ::   : :: |  0                  |  1  v     |
.LBB0_3:                                          // |                     |                     |           |
    leaq    (%r12,%r8,4), %rdi                    // | 10 : :::^ :v   v :: |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_4:                                          // |                     |                     |           |
    movl    (%rdi), %ebx                          // | 10 :^:::v :    : :: |  0                  |  0        |
    movl    %ebx, (%rax,%rsi,4)                   // | 10 vv::v: :    : :: |  0                  |  0        |
    incq    %rsi                                  // |  9 : ::x: :    : :: |  0                  |  5  ^^^^^ |
    addq    $12, %rdi                             // |  9 : :::x :    : :: |  0                  |  6 ^^^^^^ |
    cmpq    %rsi, %rdx                            // |  9 : :vv: :    : :: |  0                  |  6 ^^^^^^ |
    jne .LBB0_4                                   // |  7 : :  : :    : :: |  0                  |  1  v     |
    testl   %ecx, %ecx                            // |  7 : v  : :    : :: |  0                  |  6 ^^^^^^ |
    jle .LBB0_14                                  // |  7 : :  : :    : :: |  0                  |  3  vvv   |
    movl    %ecx, %r8d                            // |  8 : v  : :^   : :: |  0                  |  0        |
    movq    %r8, %r13                             // |  8 :    : :v   :^:: |  0                  |  0        |
    negq    %r13                                  // |  8 :    : ::   :x:: |  0                  |  0        |
    movl    $1, %r11d                             // |  9 :    : ::  ^:::: |  0                  |  0        |
    xorl    %r9d, %r9d                            // | 10 :    : ::^ ::::: |  0                  |  5 ^^^^^  |
    jmp .LBB0_7                                   // | 10 :    : ::: ::::: |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_13:                                         // |                     |                     |           |
    incq    %r11                                  // | 10 :    : ::: x:::: |  0                  |  5  ^^^^^ |
    cmpq    %r8, %r9                              // | 10 :    : :vv ::::: |  0                  |  6 ^^^^^^ |
    je  .LBB0_14                                  // |  9 :    : : : ::::: |  0                  |  1  v     |
.LBB0_7:                                          // |                     |                     |           |
    movq    %r9, %r10                             // | 10 :    : : v^::::: |  0                  |  0        |
    incq    %r9                                   // | 10 :    : : x:::::: |  0                  |  5  ^^^^^ |
    movq    %r11, %rsi                            // | 10 :   ^: :  :v:::: |  0                  |  0        |
    movl    %r10d, %ecx                           // | 10 : ^ :: :  v :::: |  0                  |  0        |
    jmp .LBB0_8                                   // |  9 :   :: :  : :::: |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_10:                                         // |                     |                     |           |
    leaq    (%rsi,%r13), %rdx                     // | 10 :  ^v: :  : :v:: |  0                  |  0        |
    incq    %rdx                                  // |  9 :  x:: :  : : :: |  0                  |  5  ^^^^^ |
    incq    %rsi                                  // |  9 :  :x: :  : : :: |  0                  |  5  ^^^^^ |
    movl    %edi, %ecx                            // | 10 : ^::v :  : : :: |  0                  |  0        |
    cmpq    $1, %rdx                              // |  9 : :v:  :  : : :: |  0                  |  6 ^^^^^^ |
    je  .LBB0_11                                  // |  8 : : :  :  : : :: |  0                  |  1  v     |
.LBB0_8:                                          // |                     |                     |           |
    movl    (%rax,%rsi,4), %ebx                   // |  9 v^: v  :  : : :: |  0                  |  0        |
    movslq  %ecx, %rdx                            // | 10 ::v^:  :  : : :: |  0                  |  0        |
    movl    %esi, %edi                            // | 11 ::::v^ :  : : :: |  0                  |  0        |
    cmpl    (%rax,%rdx,4), %ebx                   // |  9 vv:v   :  : : :: |  0                  |  6 ^^^^^^ |
    jl  .LBB0_10                                  // |  7 : :    :  : : :: |  0                  |  2   vv   |
    movl    %ecx, %edi                            // |  8 : v  ^ :  : : :: |  0                  |  0        |
    jmp .LBB0_10                                  // |  7 :    : :  : : :: |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_11:                                         // |                     |                     |           |
    movl    %edi, %ecx                            // |  8 : ^  v :  : : :: |  0                  |  0        |
    cmpq    %rcx, %r10                            // |  8 : v  : :  v : :: |  0                  |  6 ^^^^^^ |
    je  .LBB0_13                                  // |  7 :    : :  : : :: |  0                  |  1  v     |
    movl    (%rax,%r10,4), %ecx                   // |  8 v ^  : :  v : :: |  0                  |  0        |
    movslq  %edi, %rdx                            // |  9 : :^ v :  : : :: |  0                  |  0        |
    movl    (%rax,%rdx,4), %esi                   // |  9 v :v^  :  : : :: |  0                  |  0        |
    movl    %esi, (%rax,%r10,4)                   // |  9 v ::v  :  v : :: |  0                  |  0        |
    movl    %ecx, (%rax,%rdx,4)                   // |  7 v vv   :    : :: |  0                  |  0        |
    jmp .LBB0_13                                  // |  5 :      :    : :: |  0                  |  0        |
.LBB0_14:                                         // |                     |                     |           |
    testl   %r15d, %r15d                          // |  5 :      :    : :v |  0                  |  6 ^^^^^^ |
    jle .LBB0_17                                  // |  5 :      :    : :: |  0                  |  3  vvv   |
    movl    %r15d, %ecx                           // |  6 : ^    :    : :v |  0                  |  0        |
    xorl    %edx, %edx                            // |  6 : :^   :    : :  |  0                  |  5 ^^^^^  |
    movl    $2863311531, %esi                     // |  7 : ::^  :    : :  |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_16:                                         // |                     |                     |           |
    movl    %edx, %edi                            // |  8 : :v:^ :    : :  |  0                  |  0        |
    imulq   %rsi, %rdi                            // |  8 x :xv^ :    : :  |  0                  |  2 ^  ^   |
    shrq    $33, %rdi                             // |  7 : :: x :    : :  |  0                  |  5 ^^^^^  |
    leal    (%rdi,%rdi,2), %ebx                   // |  8 :^:: v :    : :  |  0                  |  0        |
    cmpl    %ebx, %edx                            // |  7 :v:v   :    : :  |  0                  |  6 ^^^^^^ |
    leaq    (%rax,%rdi,4), %rdi                   // |  7 v :: ^ :    : :  |  0                  |  0        |
    cmovneq %r12, %rdi                            // |  7 : :: ^ :    v :  |  0                  |  0        |
    movl    (%rdi), %edi                          // |  7 : :: ^ :    : :  |  0                  |  0        |
    movl    %edi, (%r14,%rdx,4)                   // |  7 : :v v :    : v  |  0                  |  0        |
    incq    %rdx                                  // |  5 : :x   :    :    |  0                  |  5  ^^^^^ |
    addq    $4, %r12                              // |  5 : ::   :    x    |  0                  |  6 ^^^^^^ |
    cmpq    %rdx, %rcx                            // |  4 : vv   :         |  0                  |  6 ^^^^^^ |
    jne .LBB0_16                                  // |  2 :      :         |  0                  |  1  v     |
.LBB0_17:                                         // |                     |                     |           |
    movq    %rax, %rdi                            // |  3 v    ^ :         |  0                  |  0        |
    popq    %rbx                                  // |  2  ^     x         |  0                  |  0        |
    .cfi_def_cfa_offset 40                        // |                     |                     |           |
    popq    %r12                                  // |  2        x    ^    |  0                  |  0        |
    .cfi_def_cfa_offset 32                        // |                     |                     |           |
    popq    %r13                                  // |  2        x     ^   |  0                  |  0        |
    .cfi_def_cfa_offset 24                        // |                     |                     |           |
    popq    %r14                                  // |  2        x      ^  |  0                  |  0        |
    .cfi_def_cfa_offset 16                        // |                     |                     |           |
    popq    %r15                                  // |  2        x       ^ |  0                  |  0        |
    .cfi_def_cfa_offset 8                         // |                     |                     |           |
    jmp free@PLT                                  // |  0                  |  0                  |  0        |
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
