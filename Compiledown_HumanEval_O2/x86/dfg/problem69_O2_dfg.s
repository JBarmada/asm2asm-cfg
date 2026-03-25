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
    pushq   %rbx                                  // |  2  v     x         |  0                  |  0        |
    .cfi_def_cfa_offset 16                        // |                     |                     |           |
    .cfi_offset %rbx, -16                         // |                     |                     |           |
    testl   %esi, %esi                            // |  2     v  :         |  0                  |  6 ^^^^^^ |
    jle .LBB0_8                                   // |  1        :         |  0                  |  3  vvv   |
    movq    %rdx, %rax                            // |  3 ^  v   :         |  0                  |  0        |
    movl    %esi, %r8d                            // |  4 :   v  :^        |  0                  |  0        |
    cmpl    $1, %esi                              // |  4 :   v  ::        |  0                  |  6 ^^^^^^ |
    jne .LBB0_9                                   // |  3 :      ::        |  0                  |  1  v     |
    movl    $2147483647, %r10d                    // |  4 :      :: ^      |  0                  |  0        |
    movl    $-1, %r11d                            // |  5 :      :: :^     |  0                  |  0        |
    xorl    %esi, %esi                            // |  6 :   ^  :: ::     |  0                  |  5 ^^^^^  |
.LBB0_3:                                          // |                     |                     |           |
    testb   $1, %r8b                              // |  6 :   :  :v ::     |  0                  |  6 ^^^^^^ |
    je  .LBB0_6                                   // |  6 :   :  :: ::     |  0                  |  1  v     |
    movl    (%rdi,%rsi,4), %edi                   // |  7 :   v^ :: ::     |  0                  |  0        |
    testb   $1, %dil                              // |  6 :    v :: ::     |  0                  |  6 ^^^^^^ |
    jne .LBB0_6                                   // |  6 :    : :: ::     |  0                  |  1  v     |
    cmpl    %r10d, %edi                           // |  6 :    v :: v:     |  0                  |  6 ^^^^^^ |
    setl    %r8b                                  // |  5 :    : :x  :     |  0                  |  2   vv   |
    cmpl    $-1, %r11d                            // |  5 :    : ::  v     |  0                  |  6 ^^^^^^ |
    sete    %cl                                   // |  6 : x  : ::  :     |  0                  |  1  v     |
    orb %r8b, %cl                                 // |  6 : x  : :v  :     |  0                  |  5 ^^^^^  |
    cmovnel %edi, %r10d                           // |  6 :    v :: ^:     |  0                  |  0        |
    cmovel  %r11d, %esi                           // |  7 :   ^: :: :v     |  0                  |  0        |
    movl    %esi, %r11d                           // |  7 :   v: :: :^     |  0                  |  0        |
.LBB0_6:                                          // |                     |                     |           |
    cmpl    $-1, %r11d                            // |  6 :    : :: :v     |  0                  |  6 ^^^^^^ |
    je  .LBB0_8                                   // |  6 :    : :: ::     |  0                  |  1  v     |
    movl    %r10d, (%rax)                         // |  6 v    : :: v:     |  0                  |  0        |
    movl    %r11d, 4(%rax)                        // |  5 v    : ::  v     |  0                  |  0        |
    popq    %rbx                                  // |  4  ^   : x:        |  0                  |  0        |
    .cfi_def_cfa_offset 8                         // |                     |                     |           |
    retq                                          // |  3      : x:        |  0                  |  0        |
.LBB0_8:                                          // |                     |                     |           |
    .cfi_def_cfa_offset 16                        // |                     |                     |           |
    xorl    %eax, %eax                            // |  4 ^    : ::        |  0                  |  5 ^^^^^  |
    popq    %rbx                                  // |  4  ^   : x:        |  0                  |  0        |
    .cfi_def_cfa_offset 8                         // |                     |                     |           |
    retq                                          // |  4  :   : x:        |  0                  |  0        |
.LBB0_9:                                          // |                     |                     |           |
    .cfi_def_cfa_offset 16                        // |                     |                     |           |
    movl    %r8d, %r9d                            // |  4  :   :  v^       |  0                  |  0        |
    andl    $-2, %r9d                             // |  3  :   :   x       |  0                  |  5 ^^^^^  |
    movl    $2147483647, %r10d                    // |  4  :   :   :^      |  0                  |  0        |
    movl    $-1, %r11d                            // |  5  :   :   ::^     |  0                  |  0        |
    xorl    %esi, %esi                            // |  6  :  ^:   :::     |  0                  |  5 ^^^^^  |
    jmp .LBB0_11                                  // |  6  :  ::   :::     |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_10:                                         // |                     |                     |           |
    addq    $2, %rsi                              // |  6  :  x:   :::     |  0                  |  6 ^^^^^^ |
    cmpq    %rsi, %r9                             // |  6  :  v:   v::     |  0                  |  6 ^^^^^^ |
    je  .LBB0_3                                   // |  5  :  ::    ::     |  0                  |  1  v     |
.LBB0_11:                                         // |                     |                     |           |
    movl    (%rdi,%rsi,4), %ecx                   // |  6  :^ vv    ::     |  0                  |  0        |
    testb   $1, %cl                               // |  6  :v ::    ::     |  0                  |  6 ^^^^^^ |
    jne .LBB0_13                                  // |  6  :: ::    ::     |  0                  |  1  v     |
    cmpl    %r10d, %ecx                           // |  6  :v ::    v:     |  0                  |  6 ^^^^^^ |
    setl    %dl                                   // |  6  ::x::     :     |  0                  |  2   vv   |
    cmpl    $-1, %r11d                            // |  6  :::::     v     |  0                  |  6 ^^^^^^ |
    sete    %bl                                   // |  5  x::::           |  0                  |  1  v     |
    orb %dl, %bl                                  // |  5  x:v::           |  0                  |  5 ^^^^^  |
    cmovnel %ecx, %r10d                           // |  6  :v:::    ^      |  0                  |  0        |
    cmovnel %esi, %r11d                           // |  6  : :v:    :^     |  0                  |  0        |
.LBB0_13:                                         // |                     |                     |           |
    movl    4(%rdi,%rsi,4), %ecx                  // |  7  :^:vv    ::     |  0                  |  0        |
    testb   $1, %cl                               // |  6  :v::     ::     |  0                  |  6 ^^^^^^ |
    jne .LBB0_10                                  // |  6  ::::     ::     |  0                  |  1  v     |
    cmpl    %r10d, %ecx                           // |  6  :v::     v:     |  0                  |  6 ^^^^^^ |
    setl    %dl                                   // |  5  ::x:      :     |  0                  |  2   vv   |
    cmpl    $-1, %r11d                            // |  5  ::::      v     |  0                  |  6 ^^^^^^ |
    sete    %bl                                   // |  4  x:::            |  0                  |  1  v     |
    orb %dl, %bl                                  // |  4  x:v:            |  0                  |  5 ^^^^^  |
    leal    1(%rsi), %edx                         // |  4  ::^v            |  0                  |  0        |
    testb   %bl, %bl                              // |  3  v::             |  0                  |  6 ^^^^^^ |
    cmovnel %ecx, %r10d                           // |  3   v:      ^      |  0                  |  0        |
    cmovnel %edx, %r11d                           // |  2    v       ^     |  0                  |  0        |
    jmp .LBB0_10                                  // |  0                  |  0                  |  0        |
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
