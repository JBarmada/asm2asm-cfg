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
    pushq   %rbx                                    // |  2  v     x         |  0                  |  0        |
    .cfi_def_cfa_offset 24                          // |                     |                     |           |
    .cfi_offset %rbx, -24                           // |                     |                     |           |
    .cfi_offset %rbp, -16                           // |                     |                     |           |
    xorps   %xmm0, %xmm0                            // |  1        :         |  1 ^                |  5 ^^^^^  |
    movaps  %xmm0, -24(%rsp)                        // |  1        v         |  1 v                |  0        |
    movaps  %xmm0, -40(%rsp)                        // |  1        v         |  1 v                |  0        |
    movq    $0, -8(%rsp)                            // |  1        v         |  0                  |  0        |
    cmpb    $0, (%rdi)                              // |  2      v :         |  0                  |  6 ^^^^^^ |
    je  .LBB0_9                                     // |  1        :         |  0                  |  1  v     |
    movl    $1869768058, %eax                       // |  2 ^      :         |  0                  |  0        |
    movl    $1701996660, %ecx                       // |  3 : ^    :         |  0                  |  0        |
    movl    $1920298854, %edx                       // |  4 : :^   :         |  0                  |  0        |
    movl    $1702259046, %r11d                      // |  5 : ::   :   ^     |  0                  |  0        |
    movl    $1702258035, %r8d                       // |  6 : ::   :^  :     |  0                  |  0        |
    movl    $1751607653, %r9d                       // |  7 : ::   ::^ :     |  0                  |  0        |
    movl    $1701734766, %r10d                      // |  8 : ::   :::^:     |  0                  |  0        |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_2:                                            // |                     |                     |           |
    xorl    %esi, %esi                              // |  9 : ::^  :::::     |  0                  |  5 ^^^^^  |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_3:                                            // |                     |                     |           |
    movzbl  (%rdi,%rsi), %ebx                       // | 11 :^::vv :::::     |  0                  |  0        |
    testb   $-33, %bl                               // | 10 :v:::  :::::     |  0                  |  6 ^^^^^^ |
    je  .LBB0_5                                     // | 10 :::::  :::::     |  0                  |  1  v     |
    movb    %bl, -46(%rsp,%rsi)                     // | 10 :v::v  v::::     |  0                  |  0        |
    incq    %rsi                                    // |  9 : ::x  :::::     |  0                  |  5  ^^^^^ |
    jmp .LBB0_3                                     // |  9 : :::  :::::     |  0                  |  0        |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_5:                                            // |                     |                     |           |
    movl    %esi, %ebx                              // | 10 :^::v  :::::     |  0                  |  0        |
    movb    $0, -46(%rsp,%rbx)                      // | 10 :v:::  v::::     |  0                  |  0        |
    movl    -46(%rsp), %ebx                         // | 10 :^:::  v::::     |  0                  |  0        |
    xorl    %eax, %ebx                              // | 10 v^:::  :::::     |  0                  |  5 ^^^^^  |
    movzbl  -42(%rsp), %ebp                         // | 10  :::: ^v::::     |  0                  |  0        |
    orl %ebx, %ebp                                  // | 10  v::: x:::::     |  0                  |  5 ^^^^^  |
    je  .LBB0_6                                     // |  8   :::  :::::     |  0                  |  1  v     |
    cmpl    $6647407, -46(%rsp)                     // |  8   :::  v::::     |  0                  |  6 ^^^^^^ |
    je  .LBB0_21                                    // |  8   :::  :::::     |  0                  |  1  v     |
    cmpl    $7305076, -46(%rsp)                     // |  8   :::  v::::     |  0                  |  6 ^^^^^^ |
    je  .LBB0_23                                    // |  8   :::  :::::     |  0                  |  1  v     |
    movl    -46(%rsp), %ebx                         // |  9  ^:::  v::::     |  0                  |  0        |
    xorl    %ecx, %ebx                              // |  9  ^v::  :::::     |  0                  |  5 ^^^^^  |
    movzwl  -42(%rsp), %ebp                         // |  9  : :: ^v::::     |  0                  |  0        |
    xorl    $101, %ebp                              // |  9  : :: ^:::::     |  0                  |  5 ^^^^^  |
    orl %ebx, %ebp                                  // |  9  v :: x:::::     |  0                  |  5 ^^^^^  |
    je  .LBB0_25                                    // |  7    ::  :::::     |  0                  |  1  v     |
    movl    -46(%rsp), %ebx                         // |  8  ^ ::  v::::     |  0                  |  0        |
    xorl    %edx, %ebx                              // |  8  ^ v:  :::::     |  0                  |  5 ^^^^^  |
    movzbl  -42(%rsp), %ebp                         // |  8  :  : ^v::::     |  0                  |  0        |
    orl %ebx, %ebp                                  // |  8  v  : x:::::     |  0                  |  5 ^^^^^  |
    je  .LBB0_27                                    // |  6     :  :::::     |  0                  |  1  v     |
    movl    -46(%rsp), %ebx                         // |  7  ^  :  v::::     |  0                  |  0        |
    xorl    %r11d, %ebx                             // |  7  ^  :  ::::v     |  0                  |  5 ^^^^^  |
    movzbl  -42(%rsp), %ebp                         // |  7  :  : ^v:::      |  0                  |  0        |
    orl %ebx, %ebp                                  // |  7  v  : x::::      |  0                  |  5 ^^^^^  |
    je  .LBB0_29                                    // |  5     :  ::::      |  0                  |  1  v     |
    cmpl    $7891315, -46(%rsp)                     // |  5     :  v:::      |  0                  |  6 ^^^^^^ |
    je  .LBB0_31                                    // |  5     :  ::::      |  0                  |  1  v     |
    movl    -46(%rsp), %ebx                         // |  6  ^  :  v:::      |  0                  |  0        |
    xorl    %r8d, %ebx                              // |  6  ^  :  :v::      |  0                  |  5 ^^^^^  |
    movzwl  -42(%rsp), %ebp                         // |  6  :  : ^v ::      |  0                  |  0        |
    xorl    $110, %ebp                              // |  6  :  : ^: ::      |  0                  |  5 ^^^^^  |
    orl %ebx, %ebp                                  // |  6  v  : x: ::      |  0                  |  5 ^^^^^  |
    je  .LBB0_33                                    // |  4     :  : ::      |  0                  |  1  v     |
    movl    -46(%rsp), %ebx                         // |  5  ^  :  v ::      |  0                  |  0        |
    xorl    %r9d, %ebx                              // |  5  ^  :  : v:      |  0                  |  5 ^^^^^  |
    movzwl  -42(%rsp), %ebp                         // |  5  :  : ^v  :      |  0                  |  0        |
    xorl    $116, %ebp                              // |  5  :  : ^:  :      |  0                  |  5 ^^^^^  |
    orl %ebx, %ebp                                  // |  5  v  : x:  :      |  0                  |  5 ^^^^^  |
    je  .LBB0_35                                    // |  3     :  :  :      |  0                  |  1  v     |
    movl    -46(%rsp), %ebx                         // |  4  ^  :  v  :      |  0                  |  0        |
    xorl    %r10d, %ebx                             // |  4  ^  :  :  v      |  0                  |  5 ^^^^^  |
    movzbl  -42(%rsp), %ebp                         // |  4  :  : ^v         |  0                  |  0        |
    orl %ebx, %ebp                                  // |  4  v  : x:         |  0                  |  5 ^^^^^  |
    jne .LBB0_8                                     // |  2     :  :         |  0                  |  1  v     |
    movl    $9, %ebx                                // |  3  ^  :  :         |  0                  |  0        |
    jmp .LBB0_7                                     // |  2     :  :         |  0                  |  0        |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_6:                                            // |                     |                     |           |
    xorl    %ebx, %ebx                              // |  3  ^  :  :         |  0                  |  5 ^^^^^  |
    jmp .LBB0_7                                     // |  2     :  :         |  0                  |  0        |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_21:                                           // |                     |                     |           |
    movl    $1, %ebx                                // |  3  ^  :  :         |  0                  |  0        |
    jmp .LBB0_7                                     // |  2     :  :         |  0                  |  0        |
.LBB0_23:                                           // |                     |                     |           |
    movl    $2, %ebx                                // |  3  ^  :  :         |  0                  |  0        |
    jmp .LBB0_7                                     // |  2     :  :         |  0                  |  0        |
.LBB0_25:                                           // |                     |                     |           |
    movl    $3, %ebx                                // |  3  ^  :  :         |  0                  |  0        |
    jmp .LBB0_7                                     // |  2     :  :         |  0                  |  0        |
.LBB0_27:                                           // |                     |                     |           |
    movl    $4, %ebx                                // |  3  ^  :  :         |  0                  |  0        |
    jmp .LBB0_7                                     // |  2     :  :         |  0                  |  0        |
.LBB0_29:                                           // |                     |                     |           |
    movl    $5, %ebx                                // |  3  ^  :  :         |  0                  |  0        |
    jmp .LBB0_7                                     // |  2     :  :         |  0                  |  0        |
.LBB0_31:                                           // |                     |                     |           |
    movl    $6, %ebx                                // |  3  ^  :  :         |  0                  |  0        |
    jmp .LBB0_7                                     // |  2     :  :         |  0                  |  0        |
.LBB0_33:                                           // |                     |                     |           |
    movl    $7, %ebx                                // |  3  ^  :  :         |  0                  |  0        |
    jmp .LBB0_7                                     // |  2     :  :         |  0                  |  0        |
.LBB0_35:                                           // |                     |                     |           |
    movl    $8, %ebx                                // |  3  ^  :  :         |  0                  |  0        |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_7:                                            // |                     |                     |           |
    incl    -40(%rsp,%rbx,4)                        // |  3  v  :  v         |  0                  |  5  ^^^^^ |
.LBB0_8:                                            // |                     |                     |           |
    incl    %esi                                    // |  2     x  :         |  0                  |  5  ^^^^^ |
    cmpb    $0, -1(%rdi,%rsi)                       // |  3     vv :         |  0                  |  6 ^^^^^^ |
    leaq    (%rdi,%rsi), %rdi                       // |  3     v^ :         |  0                  |  1  :     |
    jne .LBB0_2                                     // |  1        :         |  0                  |  1  v     |
.LBB0_9:                                            // |                     |                     |           |
    xorl    %r9d, %r9d                              // |  2        : ^       |  0                  |  5 ^^^^^  |
    leaq    .L__const.func0.numto(%rip), %r8        // |  3        :^:       |  0                  |  0        |
    leaq    func0.out(%rip), %rax                   // |  4 ^      :::       |  0                  |  0        |
    xorl    %r11d, %r11d                            // |  5 :      ::: ^     |  0                  |  5 ^^^^^  |
    jmp .LBB0_10                                    // |  5 :      ::: :     |  0                  |  0        |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_17:                                           // |                     |                     |           |
    incq    %r9                                     // |  5 :      ::x :     |  0                  |  5  ^^^^^ |
    cmpq    $10, %r9                                // |  5 :      ::v :     |  0                  |  6 ^^^^^^ |
    je  .LBB0_18                                    // |  5 :      ::: :     |  0                  |  1  v     |
.LBB0_10:                                           // |                     |                     |           |
    movl    -40(%rsp,%r9,4), %r10d                  // |  6 :      v:v^:     |  0                  |  0        |
    testl   %r10d, %r10d                            // |  6 :      :::v:     |  0                  |  6 ^^^^^^ |
    jle .LBB0_17                                    // |  6 :      :::::     |  0                  |  3  vvv   |
    movq    (%r8,%r9,8), %rsi                       // |  7 :   ^  :vv::     |  0                  |  0        |
    xorl    %edx, %edx                              // |  6 :  ^:  :  ::     |  0                  |  5 ^^^^^  |
    jmp .LBB0_12                                    // |  6 :  ::  :  ::     |  0                  |  0        |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_16:                                           // |                     |                     |           |
    movslq  %r11d, %rcx                             // |  7 : ^::  :  :v     |  0                  |  0        |
    incl    %r11d                                   // |  7 : :::  :  :x     |  0                  |  5  ^^^^^ |
    movb    $32, (%rcx,%rax)                        // |  7 v v::  :  ::     |  0                  |  0        |
    incl    %edx                                    // |  6 :  x:  :  ::     |  0                  |  5  ^^^^^ |
    cmpl    %r10d, %edx                             // |  6 :  v:  :  v:     |  0                  |  6 ^^^^^^ |
    je  .LBB0_17                                    // |  4 :   :  :   :     |  0                  |  1  v     |
.LBB0_12:                                           // |                     |                     |           |
    movzbl  (%rsi), %ebx                            // |  5 :^  v  :   :     |  0                  |  0        |
    testb   %bl, %bl                                // |  5 :v  :  :   :     |  0                  |  6 ^^^^^^ |
    je  .LBB0_16                                    // |  5 ::  :  :   :     |  0                  |  1  v     |
    movslq  %r11d, %rcx                             // |  6 ::^ :  :   v     |  0                  |  0        |
    xorl    %edi, %edi                              // |  7 ::: :^ :   :     |  0                  |  5 ^^^^^  |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_14:                                           // |                     |                     |           |
    leaq    (%rcx,%rdi), %rbp                       // |  8 ::v :v^:   :     |  0                  |  0        |
    movb    %bl, (%rax,%rbp)                        // |  7 vv  ::v:   :     |  0                  |  0        |
    movzbl  1(%rsi,%rdi), %ebx                      // |  6 :^  vv :   :     |  0                  |  0        |
    incq    %rdi                                    // |  5 ::   x :   :     |  0                  |  5  ^^^^^ |
    testb   %bl, %bl                                // |  5 :v   : :   :     |  0                  |  6 ^^^^^^ |
    jne .LBB0_14                                    // |  4 :    : :   :     |  0                  |  1  v     |
    addl    %edi, %r11d                             // |  4 :    v :   x     |  0                  |  6 ^^^^^^ |
    jmp .LBB0_16                                    // |  3 :      :   :     |  0                  |  0        |
.LBB0_18:                                           // |                     |                     |           |
    testl   %r11d, %r11d                            // |  3 :      :   v     |  0                  |  6 ^^^^^^ |
    jle .LBB0_38                                    // |  3 :      :   :     |  0                  |  3  vvv   |
    decl    %r11d                                   // |  3 :      :   x     |  0                  |  5  ^^^^^ |
    movb    $0, (%r11,%rax)                         // |  3 v      :   v     |  0                  |  0        |
    jmp .LBB0_39                                    // |  1        :         |  0                  |  0        |
.LBB0_38:                                           // |                     |                     |           |
    movb    $0, func0.out(%rip)                     // |  1        :         |  0                  |  0        |
.LBB0_39:                                           // |                     |                     |           |
    leaq    func0.out(%rip), %rax                   // |  2 ^      :         |  0                  |  0        |
    popq    %rbx                                    // |  2  ^     x         |  0                  |  0        |
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
    .asciz  "zero"                                  // |                     |                     |           |
    .size   .L.str, 5                               // |                     |                     |           |
    .type   .L.str.1,@object                        // |                     |                     |           |
.L.str.1:                                           // |                     |                     |           |
    .asciz  "one"                                   // |                     |                     |           |
    .size   .L.str.1, 4                             // |                     |                     |           |
    .type   .L.str.2,@object                        // |                     |                     |           |
.L.str.2:                                           // |                     |                     |           |
    .asciz  "two"                                   // |                     |                     |           |
    .size   .L.str.2, 4                             // |                     |                     |           |
    .type   .L.str.3,@object                        // |                     |                     |           |
.L.str.3:                                           // |                     |                     |           |
    .asciz  "three"                                 // |                     |                     |           |
    .size   .L.str.3, 6                             // |                     |                     |           |
    .type   .L.str.4,@object                        // |                     |                     |           |
.L.str.4:                                           // |                     |                     |           |
    .asciz  "four"                                  // |                     |                     |           |
    .size   .L.str.4, 5                             // |                     |                     |           |
    .type   .L.str.5,@object                        // |                     |                     |           |
.L.str.5:                                           // |                     |                     |           |
    .asciz  "five"                                  // |                     |                     |           |
    .size   .L.str.5, 5                             // |                     |                     |           |
    .type   .L.str.6,@object                        // |                     |                     |           |
.L.str.6:                                           // |                     |                     |           |
    .asciz  "six"                                   // |                     |                     |           |
    .size   .L.str.6, 4                             // |                     |                     |           |
    .type   .L.str.7,@object                        // |                     |                     |           |
.L.str.7:                                           // |                     |                     |           |
    .asciz  "seven"                                 // |                     |                     |           |
    .size   .L.str.7, 6                             // |                     |                     |           |
    .type   .L.str.8,@object                        // |                     |                     |           |
.L.str.8:                                           // |                     |                     |           |
    .asciz  "eight"                                 // |                     |                     |           |
    .size   .L.str.8, 6                             // |                     |                     |           |
    .type   .L.str.9,@object                        // |                     |                     |           |
.L.str.9:                                           // |                     |                     |           |
    .asciz  "nine"                                  // |                     |                     |           |
    .size   .L.str.9, 5                             // |                     |                     |           |
    .type   .L__const.func0.numto,@object           // |                     |                     |           |
    .section    .data.rel.ro,"aw",@progbits         // |                     |                     |           |
    .p2align    4                                   // |                     |                     |           |
.L__const.func0.numto:                              // |                     |                     |           |
    .quad   .L.str                                  // |                     |                     |           |
    .quad   .L.str.1                                // |                     |                     |           |
    .quad   .L.str.2                                // |                     |                     |           |
    .quad   .L.str.3                                // |                     |                     |           |
    .quad   .L.str.4                                // |                     |                     |           |
    .quad   .L.str.5                                // |                     |                     |           |
    .quad   .L.str.6                                // |                     |                     |           |
    .quad   .L.str.7                                // |                     |                     |           |
    .quad   .L.str.8                                // |                     |                     |           |
    .quad   .L.str.9                                // |                     |                     |           |
    .size   .L__const.func0.numto, 80               // |                     |                     |           |
    .type   func0.out,@object                       // |                     |                     |           |
    .local  func0.out                               // |                     |                     |           |
    .comm   func0.out,1000,16                       // |                     |                     |           |
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
