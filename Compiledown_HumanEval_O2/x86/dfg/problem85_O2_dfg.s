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
    subq    $16, %rsp                               // |  1        x         |  0                  |  6 ^^^^^^ |
    .cfi_def_cfa_offset 32                          // |                     |                     |           |
    .cfi_offset %rbx, -16                           // |                     |                     |           |
    movl    %edi, %edx                              // |  3    ^ v :         |  0                  |  0        |
    leaq    .L.str(%rip), %rsi                      // |  2     ^  :         |  0                  |  0        |
    xorl    %ebx, %ebx                              // |  2  ^     :         |  0                  |  5 ^^^^^  |
    leaq    10(%rsp), %rdi                          // |  3  :   ^ v         |  0                  |  0        |
    xorl    %eax, %eax                              // |  3 ^:     :         |  0                  |  5 ^^^^^  |
    callq   sprintf@PLT                             // |  2  :     x         |  0                  |  0        |
    movzbl  10(%rsp), %eax                          // |  3 ^:     v         |  0                  |  0        |
    testb   %al, %al                                // |  3 v:     :         |  0                  |  6 ^^^^^^ |
    je  .LBB0_10                                    // |  2  :     :         |  0                  |  1  v     |
    leaq    11(%rsp), %rcx                          // |  3  :^    v         |  0                  |  0        |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_2:                                            // |                     |                     |           |
    movsbl  %al, %eax                               // |  4 ^::    :         |  0                  |  0        |
    addl    %eax, %ebx                              // |  4 vx:    :         |  0                  |  6 ^^^^^^ |
    addl    $-48, %ebx                              // |  3  x:    :         |  0                  |  6 ^^^^^^ |
    movzbl  (%rcx), %eax                            // |  4 ^:v    :         |  0                  |  0        |
    incq    %rcx                                    // |  4 ::x    :         |  0                  |  5  ^^^^^ |
    testb   %al, %al                                // |  3 v:     :         |  0                  |  6 ^^^^^^ |
    jne .LBB0_2                                     // |  3 ::     :         |  0                  |  1  v     |
    movl    $33, %edi                               // |  4 ::   ^ :         |  0                  |  0        |
    callq   malloc@PLT                              // |  3 ::     x         |  0                  |  0        |
    testl   %ebx, %ebx                              // |  3 :v     :         |  0                  |  6 ^^^^^^ |
    je  .LBB0_11                                    // |  3 ::     :         |  0                  |  3  v::   |
    jle .LBB0_14                                    // |  3 ::     :         |  0                  |  3  vvv   |
    xorl    %esi, %esi                              // |  4 ::  ^  :         |  0                  |  5 ^^^^^  |
    movl    %ebx, %edx                              // |  5 :v ^:  :         |  0                  |  0        |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_6:                                            // |                     |                     |           |
    movl    %ebx, %ecx                              // |  6 :v^::  :         |  0                  |  0        |
    andb    $1, %cl                                 // |  6 ::x::  :         |  0                  |  5 ^^^^^  |
    orb $48, %cl                                    // |  6 ::x::  :         |  0                  |  5 ^^^^^  |
    movb    %cl, (%rax,%rsi)                        // |  6 v:v:v  :         |  0                  |  0        |
    incq    %rsi                                    // |  5 :: :x  :         |  0                  |  5  ^^^^^ |
    shrl    %edx                                    // |  5 :: x:  :         |  0                  |  5 ^^^^^  |
    cmpl    $2, %ebx                                // |  5 :v ::  :         |  0                  |  6 ^^^^^^ |
    movl    %edx, %ebx                              // |  5 :^ v:  :         |  0                  |  1 :      |
    jae .LBB0_6                                     // |  3 :   :  :         |  0                  |  1 v      |
    movb    $0, (%rax,%rsi)                         // |  3 v   v  :         |  0                  |  0        |
    testl   $-2, %esi                               // |  3 :   v  :         |  0                  |  6 ^^^^^^ |
    je  .LBB0_13                                    // |  3 :   :  :         |  0                  |  1  v     |
    movq    %rsi, %r8                               // |  4 :   v  :^        |  0                  |  0        |
    shrq    %r8                                     // |  4 :   :  :x        |  0                  |  5 ^^^^^  |
    cmpq    $1, %r8                                 // |  4 :   :  :v        |  0                  |  6 ^^^^^^ |
    jne .LBB0_15                                    // |  4 :   :  ::        |  0                  |  1  v     |
    xorl    %edx, %edx                              // |  5 :  ^:  ::        |  0                  |  5 ^^^^^  |
    jmp .LBB0_17                                    // |  4 :   :  ::        |  0                  |  0        |
.LBB0_10:                                           // |                     |                     |           |
    movl    $33, %edi                               // |  5 :   :^ ::        |  0                  |  0        |
    callq   malloc@PLT                              // |  4 :   :  x:        |  0                  |  0        |
.LBB0_11:                                           // |                     |                     |           |
    movb    $48, (%rax)                             // |  4 v   :  ::        |  0                  |  0        |
    movl    $1, %ecx                                // |  5 : ^ :  ::        |  0                  |  0        |
.LBB0_12:                                           // |                     |                     |           |
    movb    $0, (%rax,%rcx)                         // |  5 v v :  ::        |  0                  |  0        |
.LBB0_13:                                           // |                     |                     |           |
    addq    $16, %rsp                               // |  4 :   :  x:        |  0                  |  6 ^^^^^^ |
    .cfi_def_cfa_offset 16                          // |                     |                     |           |
    popq    %rbx                                    // |  5 :^  :  x:        |  0                  |  0        |
    .cfi_def_cfa_offset 8                           // |                     |                     |           |
    retq                                            // |  4 :   :  x:        |  0                  |  0        |
.LBB0_14:                                           // |                     |                     |           |
    .cfi_def_cfa_offset 32                          // |                     |                     |           |
    xorl    %ecx, %ecx                              // |  4 : ^ :   :        |  0                  |  5 ^^^^^  |
    jmp .LBB0_12                                    // |  3 :   :   :        |  0                  |  0        |
.LBB0_15:                                           // |                     |                     |           |
    leaq    -1(%rsi), %rdi                          // |  4 :   v^  :        |  0                  |  0        |
    andq    $-2, %r8                                // |  4 :   ::  x        |  0                  |  5 ^^^^^  |
    xorl    %edx, %edx                              // |  5 :  ^::  :        |  0                  |  5 ^^^^^  |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_16:                                           // |                     |                     |           |
    movzbl  (%rax,%rdx), %ebx                       // |  6 v^ v::  :        |  0                  |  0        |
    movzbl  (%rax,%rdi), %ecx                       // |  7 v:^::v  :        |  0                  |  0        |
    movb    %cl, (%rax,%rdx)                        // |  7 v:vv::  :        |  0                  |  0        |
    movb    %bl, (%rax,%rdi)                        // |  6 vv ::v  :        |  0                  |  0        |
    movzbl  1(%rax,%rdx), %ecx                      // |  6 v ^v::  :        |  0                  |  0        |
    movzbl  -1(%rax,%rdi), %ebx                     // |  7 v^:::v  :        |  0                  |  0        |
    movb    %bl, 1(%rax,%rdx)                       // |  7 vv:v::  :        |  0                  |  0        |
    movb    %cl, -1(%rax,%rdi)                      // |  6 v v::v  :        |  0                  |  0        |
    addq    $2, %rdx                                // |  5 :  x::  :        |  0                  |  6 ^^^^^^ |
    addq    $-2, %rdi                               // |  5 :  ::x  :        |  0                  |  6 ^^^^^^ |
    cmpq    %rdx, %r8                               // |  4 :  v:   v        |  0                  |  6 ^^^^^^ |
    jne .LBB0_16                                    // |  3 :  ::            |  0                  |  1  v     |
.LBB0_17:                                           // |                     |                     |           |
    testb   $2, %sil                                // |  3 :  :v            |  0                  |  6 ^^^^^^ |
    je  .LBB0_13                                    // |  3 :  ::            |  0                  |  1  v     |
    movzbl  (%rax,%rdx), %ecx                       // |  4 v ^v:            |  0                  |  0        |
    movq    %rax, %rdi                              // |  5 v :::^           |  0                  |  0        |
    subq    %rdx, %rdi                              // |  5 : :v:x           |  0                  |  6 ^^^^^^ |
    movzbl  -1(%rdi,%rsi), %ebx                     // |  6 :^::vv           |  0                  |  0        |
    movb    %bl, (%rax,%rdx)                        // |  6 vv:v::           |  0                  |  0        |
    movb    %cl, -1(%rdi,%rsi)                      // |  3   v vv           |  0                  |  0        |
    jmp .LBB0_13                                    // |  0                  |  0                  |  0        |
.Lfunc_end0:                                        // |                     |                     |           |
    .size   func0, .Lfunc_end0-func0                // |                     |                     |           |
    .cfi_endproc                                    // |                     |                     |           |
    .type   .L.str,@object                          // |                     |                     |           |
    .section    .rodata.str1.1,"aMS",@progbits,1    // |                     |                     |           |
.L.str:                                             // |                     |                     |           |
    .asciz  "%d"                                    // |                     |                     |           |
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
