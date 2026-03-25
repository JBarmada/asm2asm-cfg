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
    movl    %edi, %ebx                            // |  3  ^   v :         |  0                  |  0        |
    movslq  %edi, %rbp                            // |  4  :   v^:         |  0                  |  0        |
    leaq    (,%rbp,4), %rdi                       // |  4  :   ^v:         |  0                  |  0        |
    callq   malloc@PLT                            // |  3  :    :x         |  0                  |  0        |
    movq    %rax, 16(%rsp)                        // |  4 v:    :v         |  0                  |  0        |
    movq    %rbp, 8(%rsp)                         // |  3  :    vv         |  0                  |  0        |
    leal    1(%rbp), %r12d                        // |  4  :    v:    ^    |  0                  |  0        |
    movslq  %r12d, %r15                           // |  5  :    ::    v  ^ |  0                  |  0        |
    shlq    $3, %r15                              // |  5  :    ::    :  x |  0                  |  5 ^^^^^  |
    movq    %r15, %rdi                            // |  6  :   ^::    :  v |  0                  |  0        |
    callq   malloc@PLT                            // |  5  :    :x    :  : |  0                  |  0        |
    movq    %rax, %r14                            // |  7 v:    ::    : ^: |  0                  |  0        |
    movq    %r15, %rdi                            // |  7  :   ^::    : :v |  0                  |  0        |
    callq   malloc@PLT                            // |  5  :    :x    : :  |  0                  |  0        |
    movq    %rax, %r15                            // |  7 v:    ::    : :^ |  0                  |  0        |
    xorl    %r13d, %r13d                          // |  7  :    ::    :^:: |  0                  |  5 ^^^^^  |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_1:                                          // |                     |                     |           |
    movl    $3, %edi                              // |  8  :   ^::    :::: |  0                  |  0        |
    movl    $4, %esi                              // |  8  :  ^ ::    :::: |  0                  |  0        |
    callq   calloc@PLT                            // |  7  :    :x    :::: |  0                  |  0        |
    movq    %rax, (%r14,%r13,8)                   // |  8 v:    ::    :vv: |  0                  |  0        |
    movl    $3, %edi                              // |  8  :   ^::    :::: |  0                  |  0        |
    movl    $4, %esi                              // |  8  :  ^ ::    :::: |  0                  |  0        |
    callq   calloc@PLT                            // |  7  :    :x    :::: |  0                  |  0        |
    movq    %rax, (%r15,%r13,8)                   // |  8 v:    ::    :v:v |  0                  |  0        |
    incq    %r13                                  // |  7  :    ::    :x:: |  0                  |  5  ^^^^^ |
    cmpq    %r13, %r12                            // |  7  :    ::    vv:: |  0                  |  6 ^^^^^^ |
    jne .LBB0_1                                   // |  6  :    ::    : :: |  0                  |  1  v     |
    movq    (%r14), %rax                          // |  7 ^:    ::    : v: |  0                  |  0        |
    movq    (%r15), %r9                           // |  8 ::    :: ^  : :v |  0                  |  0        |
    movl    $0, 8(%rax)                           // |  8 v:    :: :  : :: |  0                  |  0        |
    movq    $0, (%rax)                            // |  8 v:    :: :  : :: |  0                  |  0        |
    movl    $0, 8(%r9)                            // |  8 ::    :: v  : :: |  0                  |  0        |
    movq    $0, (%r9)                             // |  8 ::    :: v  : :: |  0                  |  0        |
    movl    %ebx, %r11d                           // |  9 :v    :: : ^: :: |  0                  |  0        |
    testl   %ebx, %ebx                            // |  9 :v    :: : :: :: |  0                  |  6 ^^^^^^ |
    movq    16(%rsp), %r10                        // |  9 :     :v :^:: :: |  0                  |  3  :::   |
    jle .LBB0_8                                   // |  9 :     :: :::: :: |  0                  |  3  vvv   |
    movl    $1, %edx                              // | 10 :  ^  :: :::: :: |  0                  |  0        |
    xorl    %esi, %esi                            // | 11 :  :^ :: :::: :: |  0                  |  5 ^^^^^  |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_4:                                          // |                     |                     |           |
    movl    %edx, %edi                            // | 12 :  v:^:: :::: :: |  0                  |  0        |
    imull   %edx, %edi                            // | 12 x  x:^:: :::: :: |  0                  |  2 ^  ^   |
    addl    %esi, %edi                            // | 12 :  :vx:: :::: :: |  0                  |  6 ^^^^^^ |
    movslq  %edi, %rdi                            // | 12 :  ::^:: :::: :: |  0                  |  0        |
    imulq   $1431655766, %rdi, %rbp               // | 12 x  x:::: :::: :: |  0                  |  2 ^  ^   |
    movq    %rbp, %rbx                            // | 13 :^ :::v: :::: :: |  0                  |  0        |
    shrq    $63, %rbx                             // | 13 :x ::::: :::: :: |  0                  |  5 ^^^^^  |
    shrq    $32, %rbp                             // | 13 :: :::x: :::: :: |  0                  |  5 ^^^^^  |
    addl    %ebx, %ebp                            // | 13 :v :::x: :::: :: |  0                  |  6 ^^^^^^ |
    leal    (%rbp,%rbp,2), %ebp                   // | 12 :  :::^: :::: :: |  0                  |  0        |
    subl    %ebp, %edi                            // | 12 :  ::xv: :::: :: |  0                  |  6 ^^^^^^ |
    movl    %edi, -4(%r10,%rdx,4)                 // | 11 :  v:v : :v:: :: |  0                  |  0        |
    movq    (%r14,%rdx,8), %rcx                   // | 12 : ^v:: : :::: v: |  0                  |  0        |
    movl    (%rax), %ebp                          // | 13 v ::::^: :::: :: |  0                  |  0        |
    movl    %ebp, (%rcx)                          // | 13 : v:::v: :::: :: |  0                  |  0        |
    movl    4(%rax), %ebp                         // | 13 v ::::^: :::: :: |  0                  |  0        |
    movl    %ebp, 4(%rcx)                         // | 12   v:::v: :::: :: |  0                  |  0        |
    movl    8(%rax), %eax                         // | 12 ^ :::: : :::: :: |  0                  |  0        |
    movl    %eax, 8(%rcx)                         // | 12 v v::: : :::: :: |  0                  |  0        |
    movslq  %edi, %rax                            // | 12 ^ :::v : :::: :: |  0                  |  0        |
    incl    (%rcx,%rax,4)                         // | 11 v v::  : :::: :: |  0                  |  5  ^^^^^ |
    incq    %rdx                                  // | 10   :x:  : :::: :: |  0                  |  5  ^^^^^ |
    decl    %esi                                  // | 10   ::x  : :::: :: |  0                  |  5  ^^^^^ |
    movq    %rcx, %rax                            // | 10 ^ v:   : :::: :: |  0                  |  0        |
    cmpq    %rdx, %r12                            // |  8    v   : :::v :: |  0                  |  6 ^^^^^^ |
    jne .LBB0_4                                   // |  7        : :::: :: |  0                  |  1  v     |
    testl   %r11d, %r11d                          // |  7        : ::v: :: |  0                  |  6 ^^^^^^ |
    jle .LBB0_8                                   // |  7        : :::: :: |  0                  |  3  vvv   |
    leaq    -1(%r12), %r8                         // |  8        :^:::v :: |  0                  |  0        |
    xorl    %edx, %edx                            // |  9    ^   :::::: :: |  0                  |  5 ^^^^^  |
    movq    %r9, %rcx                             // | 10   ^:   ::v::: :: |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_7:                                          // |                     |                     |           |
    movq    8(%r15,%rdx,8), %rsi                  // | 11   :v^  :::::: :v |  0                  |  0        |
    movl    (%rcx), %eax                          // | 12 ^ v::  :::::: :: |  0                  |  0        |
    movl    %eax, (%rsi)                          // | 12 v ::v  :::::: :: |  0                  |  0        |
    movl    4(%rcx), %eax                         // | 12 ^ v::  :::::: :: |  0                  |  0        |
    movl    %eax, 4(%rsi)                         // | 12 v ::v  :::::: :: |  0                  |  0        |
    movl    8(%rcx), %eax                         // | 12 ^ v::  :::::: :: |  0                  |  0        |
    movl    %eax, 8(%rsi)                         // | 11 v  :v  :::::: :: |  0                  |  0        |
    movq    (%r14,%rdx,8), %rdi                   // | 12 :  v:^ :::::: v: |  0                  |  0        |
    movslq  (%r10,%rdx,4), %rcx                   // | 13 : ^v:: :::v:: :: |  0                  |  0        |
    imulq   $1431655766, %rcx, %rax               // | 13 x :x:: :::::: :: |  0                  |  2 ^  ^   |
    movq    %rax, %rbp                            // | 14 v ::::^:::::: :: |  0                  |  0        |
    shrq    $63, %rbp                             // | 14 : ::::x:::::: :: |  0                  |  5 ^^^^^  |
    shrq    $32, %rax                             // | 14 x ::::::::::: :: |  0                  |  5 ^^^^^  |
    addl    %ebp, %eax                            // | 14 x ::::v:::::: :: |  0                  |  6 ^^^^^^ |
    leal    (%rax,%rax,2), %eax                   // | 13 ^ :::: :::::: :: |  0                  |  0        |
    leal    1(%rcx), %ebp                         // | 14 : v:::^:::::: :: |  0                  |  0        |
    movslq  %ebp, %rbp                            // | 14 : ::::^:::::: :: |  0                  |  0        |
    imulq   $1431655766, %rbp, %rbp               // | 14 x :x::::::::: :: |  0                  |  2 ^  ^   |
    movq    %rbp, %rbx                            // | 15 :^::::v:::::: :: |  0                  |  0        |
    shrq    $63, %rbx                             // | 15 :x::::::::::: :: |  0                  |  5 ^^^^^  |
    shrq    $32, %rbp                             // | 15 ::::::x:::::: :: |  0                  |  5 ^^^^^  |
    addl    %ebx, %ebp                            // | 15 :v::::x:::::: :: |  0                  |  6 ^^^^^^ |
    leal    (%rbp,%rbp,2), %ebp                   // | 14 : ::::^:::::: :: |  0                  |  0        |
    negl    %ebp                                  // | 14 : ::::x:::::: :: |  0                  |  0        |
    addl    %ecx, %ebp                            // | 14 : v:::x:::::: :: |  0                  |  6 ^^^^^^ |
    incl    %ebp                                  // | 14 : ::::x:::::: :: |  0                  |  5  ^^^^^ |
    movl    %ecx, %ebx                            // | 14 :^v::: :::::: :: |  0                  |  0        |
    subl    %eax, %ebx                            // | 14 vx:::: :::::: :: |  0                  |  6 ^^^^^^ |
    movl    (%rdi), %eax                          // | 13 ^ :::v :::::: :: |  0                  |  0        |
    movslq  %ebx, %rbx                            // | 14 :^:::: :::::: :: |  0                  |  0        |
    addl    %eax, (%rsi,%rbx,4)                   // | 14 vv::v: :::::: :: |  0                  |  6 ^^^^^^ |
    leal    2(%rcx), %eax                         // | 13 ^ v::: :::::: :: |  0                  |  0        |
    cltq                                          // | 13 : :::: :::::: :: |  0                  |  0        |
    imulq   $1431655766, %rax, %rax               // | 13 x :x:: :::::: :: |  0                  |  2 ^  ^   |
    movq    %rax, %rbx                            // | 14 v^:::: :::::: :: |  0                  |  0        |
    shrq    $63, %rbx                             // | 14 :x:::: :::::: :: |  0                  |  5 ^^^^^  |
    shrq    $32, %rax                             // | 14 x::::: :::::: :: |  0                  |  5 ^^^^^  |
    addl    %ebx, %eax                            // | 14 xv:::: :::::: :: |  0                  |  6 ^^^^^^ |
    leal    (%rax,%rax,2), %eax                   // | 13 ^ :::: :::::: :: |  0                  |  0        |
    negl    %eax                                  // | 13 x :::: :::::: :: |  0                  |  0        |
    addl    %ecx, %eax                            // | 13 x v::: :::::: :: |  0                  |  6 ^^^^^^ |
    addl    $2, %eax                              // | 12 x  ::: :::::: :: |  0                  |  6 ^^^^^^ |
    movl    4(%rdi), %ecx                         // | 13 : ^::v :::::: :: |  0                  |  0        |
    movslq  %ebp, %rbp                            // | 14 : ::::^:::::: :: |  0                  |  0        |
    addl    %ecx, (%rsi,%rbp,4)                   // | 14 : v:v:v:::::: :: |  0                  |  6 ^^^^^^ |
    movl    8(%rdi), %ecx                         // | 14 : ^::v::::::: :: |  0                  |  0        |
    cltq                                          // | 13 : ::: ::::::: :: |  0                  |  0        |
    addl    %ecx, (%rsi,%rax,4)                   // | 13 v v:v ::::::: :: |  0                  |  6 ^^^^^^ |
    incq    %rdx                                  // | 11    x: ::::::: :: |  0                  |  5  ^^^^^ |
    movq    %rsi, %rcx                            // | 12   ^:v ::::::: :: |  0                  |  0        |
    cmpq    %rdx, %r8                             // | 10    v  ::v:::: :: |  0                  |  6 ^^^^^^ |
    jne .LBB0_7                                   // |  8       :: :::: :: |  0                  |  1  v     |
.LBB0_8:                                          // |                     |                     |           |
    testl   %r11d, %r11d                          // |  8       :: ::v: :: |  0                  |  6 ^^^^^^ |
    js  .LBB0_15                                  // |  8       :: :::: :: |  0                  |  2  :v    |
    je  .LBB0_10                                  // |  8       :: :::: :: |  0                  |  1  v     |
    movl    %r12d, %edx                           // |  9    ^  :: :::v :: |  0                  |  0        |
    andl    $-2, %edx                             // |  9    x  :: :::: :: |  0                  |  5 ^^^^^  |
    xorl    %ecx, %ecx                            // | 10   ^:  :: :::: :: |  0                  |  5 ^^^^^  |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_12:                                         // |                     |                     |           |
    movq    (%r15,%rcx,8), %rax                   // | 11 ^ v:  :: :::: :v |  0                  |  0        |
    movq    (%r14,%rcx,8), %rsi                   // | 12 : v:^ :: :::: v: |  0                  |  0        |
    movl    (%rax), %edi                          // | 13 v :::^:: :::: :: |  0                  |  0        |
    movl    %edi, (%rsi)                          // | 13 : ::vv:: :::: :: |  0                  |  0        |
    movl    $0, (%rax)                            // | 12 v ::: :: :::: :: |  0                  |  0        |
    movl    4(%rax), %edi                         // | 13 v :::^:: :::: :: |  0                  |  0        |
    movl    %edi, 4(%rsi)                         // | 13 : ::vv:: :::: :: |  0                  |  0        |
    movl    $0, 4(%rax)                           // | 12 v ::: :: :::: :: |  0                  |  0        |
    movl    8(%rax), %edi                         // | 13 v :::^:: :::: :: |  0                  |  0        |
    movl    %edi, 8(%rsi)                         // | 13 : ::vv:: :::: :: |  0                  |  0        |
    movl    $0, 8(%rax)                           // | 11 v ::  :: :::: :: |  0                  |  0        |
    movq    8(%r15,%rcx,8), %rax                  // | 11 ^ v:  :: :::: :v |  0                  |  0        |
    movq    8(%r14,%rcx,8), %rsi                  // | 12 : v:^ :: :::: v: |  0                  |  0        |
    movl    (%rax), %edi                          // | 13 v :::^:: :::: :: |  0                  |  0        |
    movl    %edi, (%rsi)                          // | 13 : ::vv:: :::: :: |  0                  |  0        |
    movl    $0, (%rax)                            // | 12 v ::: :: :::: :: |  0                  |  0        |
    movl    4(%rax), %edi                         // | 13 v :::^:: :::: :: |  0                  |  0        |
    movl    %edi, 4(%rsi)                         // | 13 : ::vv:: :::: :: |  0                  |  0        |
    movl    $0, 4(%rax)                           // | 12 v ::: :: :::: :: |  0                  |  0        |
    movl    8(%rax), %edi                         // | 13 v :::^:: :::: :: |  0                  |  0        |
    movl    %edi, 8(%rsi)                         // | 13 : ::vv:: :::: :: |  0                  |  0        |
    movl    $0, 8(%rax)                           // | 11 v ::  :: :::: :: |  0                  |  0        |
    addq    $2, %rcx                              // | 10   x:  :: :::: :: |  0                  |  6 ^^^^^^ |
    cmpq    %rcx, %rdx                            // | 10   vv  :: :::: :: |  0                  |  6 ^^^^^^ |
    jne .LBB0_12                                  // |  9   :   :: :::: :: |  0                  |  1  v     |
    testb   $1, %r12b                             // |  9   :   :: :::v :: |  0                  |  6 ^^^^^^ |
    je  .LBB0_15                                  // |  9   :   :: :::: :: |  0                  |  1  v     |
.LBB0_14:                                         // |                     |                     |           |
    movq    (%r15,%rcx,8), %rax                   // | 10 ^ v   :: :::: :v |  0                  |  0        |
    movq    (%r14,%rcx,8), %rcx                   // | 10 : ^   :: :::: v: |  0                  |  0        |
    movl    (%rax), %edx                          // | 11 v :^  :: :::: :: |  0                  |  0        |
    movl    %edx, (%rcx)                          // | 11 : vv  :: :::: :: |  0                  |  0        |
    movl    $0, (%rax)                            // | 10 v :   :: :::: :: |  0                  |  0        |
    movl    4(%rax), %edx                         // | 11 v :^  :: :::: :: |  0                  |  0        |
    movl    %edx, 4(%rcx)                         // | 11 : vv  :: :::: :: |  0                  |  0        |
    movl    $0, 4(%rax)                           // | 10 v :   :: :::: :: |  0                  |  0        |
    movl    8(%rax), %edx                         // | 11 v :^  :: :::: :: |  0                  |  0        |
    movl    %edx, 8(%rcx)                         // | 11 : vv  :: :::: :: |  0                  |  0        |
    movl    $0, 8(%rax)                           // |  9 v     :: :::: :: |  0                  |  0        |
.LBB0_15:                                         // |                     |                     |           |
    testl   %r11d, %r11d                          // |  8       :: ::v: :: |  0                  |  6 ^^^^^^ |
    jle .LBB0_18                                  // |  8       :: :::: :: |  0                  |  3  vvv   |
    leaq    -1(%r12), %r8                         // |  9       ::^:::v :: |  0                  |  0        |
    xorl    %edx, %edx                            // | 10    ^  ::::::: :: |  0                  |  5 ^^^^^  |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_17:                                         // |                     |                     |           |
    movq    8(%r15,%rdx,8), %rsi                  // | 11    v^ ::::::: :v |  0                  |  0        |
    movl    (%r9), %eax                           // | 12 ^  :: :::v::: :: |  0                  |  0        |
    movl    %eax, (%rsi)                          // | 12 v  :v ::::::: :: |  0                  |  0        |
    movl    4(%r9), %eax                          // | 12 ^  :: :::v::: :: |  0                  |  0        |
    movl    %eax, 4(%rsi)                         // | 12 v  :v ::::::: :: |  0                  |  0        |
    movl    8(%r9), %eax                          // | 12 ^  :: :::v::: :: |  0                  |  0        |
    movl    %eax, 8(%rsi)                         // | 11 v  :v ::: ::: :: |  0                  |  0        |
    movq    (%r14,%rdx,8), %rax                   // | 11 ^  v: ::: ::: v: |  0                  |  0        |
    movslq  (%r10,%rdx,4), %rdi                   // | 12 :  v:^::: v:: :: |  0                  |  0        |
    imulq   $1431655766, %rdi, %rbp               // | 11 x  x:::::  :: :: |  0                  |  2 ^  ^   |
    movq    %rbp, %rbx                            // | 12 :^ :::v::  :: :: |  0                  |  0        |
    shrq    $63, %rbx                             // | 12 :x ::::::  :: :: |  0                  |  5 ^^^^^  |
    shrq    $32, %rbp                             // | 12 :: :::x::  :: :: |  0                  |  5 ^^^^^  |
    addl    %ebx, %ebp                            // | 12 :v :::x::  :: :: |  0                  |  6 ^^^^^^ |
    leal    (%rbp,%rbp,2), %ebp                   // | 11 :  :::^::  :: :: |  0                  |  0        |
    leal    1(%rdi), %ebx                         // | 12 :^ ::v:::  :: :: |  0                  |  0        |
    movslq  %ebx, %rbx                            // | 12 :^ ::::::  :: :: |  0                  |  0        |
    imulq   $1431655766, %rbx, %rbx               // | 12 x: x:::::  :: :: |  0                  |  2 ^  ^   |
    movq    %rbx, %rcx                            // | 13 :v^::::::  :: :: |  0                  |  0        |
    shrq    $63, %rcx                             // | 13 ::x::::::  :: :: |  0                  |  5 ^^^^^  |
    shrq    $32, %rbx                             // | 13 :x:::::::  :: :: |  0                  |  5 ^^^^^  |
    addl    %ecx, %ebx                            // | 13 :xv::::::  :: :: |  0                  |  6 ^^^^^^ |
    leal    (%rbx,%rbx,2), %ecx                   // | 13 :v^::::::  :: :: |  0                  |  0        |
    negl    %ecx                                  // | 12 : x::::::  :: :: |  0                  |  0        |
    addl    %edi, %ecx                            // | 12 : x::v:::  :: :: |  0                  |  6 ^^^^^^ |
    incl    %ecx                                  // | 12 : x::::::  :: :: |  0                  |  5  ^^^^^ |
    movl    %edi, %ebx                            // | 12 :^ ::v:::  :: :: |  0                  |  0        |
    subl    %ebp, %ebx                            // | 12 :x :::v::  :: :: |  0                  |  6 ^^^^^^ |
    movl    (%rax), %ebp                          // | 11 v  :::^::  :: :: |  0                  |  0        |
    movslq  %ebx, %rbx                            // | 12 :^ ::::::  :: :: |  0                  |  0        |
    addl    %ebp, (%rsi,%rbx,4)                   // | 12 :v :v:v::  :: :: |  0                  |  6 ^^^^^^ |
    leal    2(%rdi), %ebp                         // | 11 :  ::v^::  :: :: |  0                  |  0        |
    movslq  %ebp, %rbp                            // | 11 :  :::^::  :: :: |  0                  |  0        |
    imulq   $1431655766, %rbp, %rbp               // | 11 x  x:::::  :: :: |  0                  |  2 ^  ^   |
    movq    %rbp, %rbx                            // | 12 :^ :::v::  :: :: |  0                  |  0        |
    shrq    $63, %rbx                             // | 12 :x ::::::  :: :: |  0                  |  5 ^^^^^  |
    shrq    $32, %rbp                             // | 12 :: :::x::  :: :: |  0                  |  5 ^^^^^  |
    addl    %ebx, %ebp                            // | 12 :v :::x::  :: :: |  0                  |  6 ^^^^^^ |
    leal    (%rbp,%rbp,2), %ebp                   // | 11 :  :::^::  :: :: |  0                  |  0        |
    negl    %ebp                                  // | 11 :  :::x::  :: :: |  0                  |  0        |
    addl    %ebp, %edi                            // | 11 :  ::xv::  :: :: |  0                  |  6 ^^^^^^ |
    addl    $2, %edi                              // | 10 :  ::x ::  :: :: |  0                  |  6 ^^^^^^ |
    movl    4(%rax), %ebp                         // | 11 v  :::^::  :: :: |  0                  |  0        |
    movslq  %ecx, %rcx                            // | 11   ^::::::  :: :: |  0                  |  0        |
    addl    %ebp, (%rsi,%rcx,4)                   // | 11   v:v:v::  :: :: |  0                  |  6 ^^^^^^ |
    movl    8(%rax), %eax                         // | 10 ^  ::: ::  :: :: |  0                  |  0        |
    movslq  %edi, %rcx                            // | 11 : ^::v ::  :: :: |  0                  |  0        |
    addl    %eax, (%rsi,%rcx,4)                   // | 10 v v:v  ::  :: :: |  0                  |  6 ^^^^^^ |
    incq    %rdx                                  // |  8    x:  ::  :: :: |  0                  |  5  ^^^^^ |
    movq    %rsi, %r9                             // |  9    :v  ::^ :: :: |  0                  |  0        |
    cmpq    %rdx, %r8                             // |  7    v   :v  :: :: |  0                  |  6 ^^^^^^ |
    jne .LBB0_17                                  // |  5        :   :: :: |  0                  |  1  v     |
.LBB0_18:                                         // |                     |                     |           |
    testl   %r11d, %r11d                          // |  5        :   v: :: |  0                  |  6 ^^^^^^ |
    js  .LBB0_19                                  // |  5        :   :: :: |  0                  |  2  :v    |
    je  .LBB0_21                                  // |  5        :   :: :: |  0                  |  1  v     |
    movl    %r12d, %ecx                           // |  6   ^    :   :v :: |  0                  |  0        |
    andl    $-2, %ecx                             // |  6   x    :   :: :: |  0                  |  5 ^^^^^  |
    xorl    %eax, %eax                            // |  7 ^ :    :   :: :: |  0                  |  5 ^^^^^  |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_23:                                         // |                     |                     |           |
    movq    (%r15,%rax,8), %rdx                   // |  8 v :^   :   :: :v |  0                  |  0        |
    movq    (%r14,%rax,8), %rsi                   // |  9 v ::^  :   :: v: |  0                  |  0        |
    movl    (%rdx), %edi                          // | 10 : :v:^ :   :: :: |  0                  |  0        |
    movl    %edi, (%rsi)                          // | 10 : ::vv :   :: :: |  0                  |  0        |
    movl    $0, (%rdx)                            // |  9 : :v:  :   :: :: |  0                  |  0        |
    movl    4(%rdx), %edi                         // | 10 : :v:^ :   :: :: |  0                  |  0        |
    movl    %edi, 4(%rsi)                         // | 10 : ::vv :   :: :: |  0                  |  0        |
    movl    $0, 4(%rdx)                           // |  9 : :v:  :   :: :: |  0                  |  0        |
    movl    8(%rdx), %edi                         // | 10 : :v:^ :   :: :: |  0                  |  0        |
    movl    %edi, 8(%rsi)                         // | 10 : ::vv :   :: :: |  0                  |  0        |
    movl    $0, 8(%rdx)                           // |  8 : :v   :   :: :: |  0                  |  0        |
    movq    8(%r15,%rax,8), %rdx                  // |  8 v :^   :   :: :v |  0                  |  0        |
    movq    8(%r14,%rax,8), %rsi                  // |  9 v ::^  :   :: v: |  0                  |  0        |
    movl    (%rdx), %edi                          // | 10 : :v:^ :   :: :: |  0                  |  0        |
    movl    %edi, (%rsi)                          // | 10 : ::vv :   :: :: |  0                  |  0        |
    movl    $0, (%rdx)                            // |  9 : :v:  :   :: :: |  0                  |  0        |
    movl    4(%rdx), %edi                         // | 10 : :v:^ :   :: :: |  0                  |  0        |
    movl    %edi, 4(%rsi)                         // | 10 : ::vv :   :: :: |  0                  |  0        |
    movl    $0, 4(%rdx)                           // |  9 : :v:  :   :: :: |  0                  |  0        |
    movl    8(%rdx), %edi                         // | 10 : :v:^ :   :: :: |  0                  |  0        |
    movl    %edi, 8(%rsi)                         // | 10 : ::vv :   :: :: |  0                  |  0        |
    movl    $0, 8(%rdx)                           // |  8 : :v   :   :: :: |  0                  |  0        |
    addq    $2, %rax                              // |  7 x :    :   :: :: |  0                  |  6 ^^^^^^ |
    cmpq    %rax, %rcx                            // |  7 v v    :   :: :: |  0                  |  6 ^^^^^^ |
    jne .LBB0_23                                  // |  6 :      :   :: :: |  0                  |  1  v     |
    testb   $1, %r12b                             // |  6 :      :   :v :: |  0                  |  6 ^^^^^^ |
    je  .LBB0_26                                  // |  6 :      :   :: :: |  0                  |  1  v     |
.LBB0_25:                                         // |                     |                     |           |
    movq    (%r15,%rax,8), %rcx                   // |  7 v ^    :   :: :v |  0                  |  0        |
    movq    (%r14,%rax,8), %rax                   // |  7 ^ :    :   :: v: |  0                  |  0        |
    movl    (%rcx), %edx                          // |  8 : v^   :   :: :: |  0                  |  0        |
    movl    %edx, (%rax)                          // |  8 v :v   :   :: :: |  0                  |  0        |
    movl    $0, (%rcx)                            // |  7 : v    :   :: :: |  0                  |  0        |
    movl    4(%rcx), %edx                         // |  8 : v^   :   :: :: |  0                  |  0        |
    movl    %edx, 4(%rax)                         // |  8 v :v   :   :: :: |  0                  |  0        |
    movl    $0, 4(%rcx)                           // |  7 : v    :   :: :: |  0                  |  0        |
    movl    8(%rcx), %edx                         // |  8 : v^   :   :: :: |  0                  |  0        |
    movl    %edx, 8(%rax)                         // |  8 v :v   :   :: :: |  0                  |  0        |
    movl    $0, 8(%rcx)                           // |  6   v    :   :: :: |  0                  |  0        |
.LBB0_26:                                         // |                     |                     |           |
    movq    8(%rsp), %rax                         // |  6 ^      v   :: :: |  0                  |  0        |
    movq    (%r14,%rax,8), %rax                   // |  6 ^      :   :: v: |  0                  |  0        |
    movl    (%rax), %r13d                         // |  7 v      :   ::^:: |  0                  |  0        |
    testl   %r11d, %r11d                          // |  5        :   v: :: |  0                  |  6 ^^^^^^ |
    js  .LBB0_29                                  // |  4        :    : :: |  0                  |  1   v    |
    xorl    %ebp, %ebp                            // |  5       ^:    : :: |  0                  |  5 ^^^^^  |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_28:                                         // |                     |                     |           |
    movq    (%r14,%rbp,8), %rdi                   // |  6      ^v:    : v: |  0                  |  0        |
    callq   free@PLT                              // |  5       :x    : :: |  0                  |  0        |
    movq    (%r15,%rbp,8), %rdi                   // |  6      ^v:    : :v |  0                  |  0        |
    callq   free@PLT                              // |  5       :x    : :: |  0                  |  0        |
    incq    %rbp                                  // |  5       x:    : :: |  0                  |  5  ^^^^^ |
    cmpq    %rbp, %r12                            // |  5       v:    v :: |  0                  |  6 ^^^^^^ |
    jne .LBB0_28                                  // |  3        :      :: |  0                  |  1  v     |
    jmp .LBB0_29                                  // |  3        :      :: |  0                  |  0        |
.LBB0_19:                                         // |                     |                     |           |
    movq    8(%rsp), %rax                         // |  4 ^      v      :: |  0                  |  0        |
    movq    (%r14,%rax,8), %rax                   // |  4 ^      :      v: |  0                  |  0        |
    movl    (%rax), %r13d                         // |  5 v      :     ^:: |  0                  |  0        |
.LBB0_29:                                         // |                     |                     |           |
    movq    %r14, %rdi                            // |  5      ^ :     :v: |  0                  |  0        |
    callq   free@PLT                              // |  3        x     : : |  0                  |  0        |
    movq    %r15, %rdi                            // |  4      ^ :     : v |  0                  |  0        |
    callq   free@PLT                              // |  2        x     :   |  0                  |  0        |
    movq    16(%rsp), %rdi                        // |  3      ^ v     :   |  0                  |  0        |
    callq   free@PLT                              // |  2        x     :   |  0                  |  0        |
    movl    %r13d, %eax                           // |  3 ^      :     v   |  0                  |  0        |
    addq    $24, %rsp                             // |  1        x         |  0                  |  6 ^^^^^^ |
    .cfi_def_cfa_offset 56                        // |                     |                     |           |
    popq    %rbx                                  // |  2  ^     x         |  0                  |  0        |
    .cfi_def_cfa_offset 48                        // |                     |                     |           |
    popq    %r12                                  // |  2        x    ^    |  0                  |  0        |
    .cfi_def_cfa_offset 40                        // |                     |                     |           |
    popq    %r13                                  // |  3        x    :^   |  0                  |  0        |
    .cfi_def_cfa_offset 32                        // |                     |                     |           |
    popq    %r14                                  // |  3        x    : ^  |  0                  |  0        |
    .cfi_def_cfa_offset 24                        // |                     |                     |           |
    popq    %r15                                  // |  3        x    :  ^ |  0                  |  0        |
    .cfi_def_cfa_offset 16                        // |                     |                     |           |
    popq    %rbp                                  // |  3       ^x    :    |  0                  |  0        |
    .cfi_def_cfa_offset 8                         // |                     |                     |           |
    retq                                          // |  2        x    :    |  0                  |  0        |
.LBB0_10:                                         // |                     |                     |           |
    .cfi_def_cfa_offset 80                        // |                     |                     |           |
    xorl    %ecx, %ecx                            // |  2   ^         :    |  0                  |  5 ^^^^^  |
    testb   $1, %r12b                             // |  1             v    |  0                  |  6 ^^^^^^ |
    jne .LBB0_14                                  // |  1             :    |  0                  |  1  v     |
    jmp .LBB0_15                                  // |  1             :    |  0                  |  0        |
.LBB0_21:                                         // |                     |                     |           |
    xorl    %eax, %eax                            // |  2 ^           :    |  0                  |  5 ^^^^^  |
    testb   $1, %r12b                             // |  1             v    |  0                  |  6 ^^^^^^ |
    jne .LBB0_25                                  // |  0                  |  0                  |  1  v     |
    jmp .LBB0_26                                  // |  0                  |  0                  |  0        |
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
