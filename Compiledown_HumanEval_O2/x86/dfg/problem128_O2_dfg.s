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
    cmpl    %edx, %edi                              // |  2    v v           |  0                  |  6 ^^^^^^ |
    cmovgl  %edi, %edx                              // |  2    ^ v           |  0                  |  0        |
    cmpl    %ecx, %esi                              // |  3   v:v            |  0                  |  6 ^^^^^^ |
    cmovll  %esi, %ecx                              // |  3   ^:v            |  0                  |  0        |
    subl    %edx, %ecx                              // |  2   xv             |  0                  |  6 ^^^^^^ |
    leaq    .L.str(%rip), %rsi                      // |  3   ::^            |  0                  |  0        |
    cmpl    $2, %ecx                                // |  3   v::            |  0                  |  6 ^^^^^^ |
    jge .LBB0_1                                     // |  3   :::            |  0                  |  2   vv   |
.LBB0_7:                                            // |                     |                     |           |
    movq    %rsi, %rax                              // |  4 ^ ::v            |  0                  |  0        |
    retq                                            // |  3   ::   x         |  0                  |  0        |
.LBB0_1:                                            // |                     |                     |           |
    leaq    .L.str.1(%rip), %r8                     // |  4   ::   :^        |  0                  |  0        |
    cmpl    $4, %ecx                                // |  4   v:   ::        |  0                  |  6 ^^^^^^ |
    jae .LBB0_5                                     // |  4   ::   ::        |  0                  |  1 v      |
    movq    %r8, %rax                               // |  5 ^ ::   :v        |  0                  |  0        |
    retq                                            // |  4   ::   x:        |  0                  |  0        |
.LBB0_5:                                            // |                     |                     |           |
    movl    $2, %edi                                // |  5   :: ^ ::        |  0                  |  0        |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_6:                                            // |                     |                     |           |
    movl    %ecx, %eax                              // |  6 ^ v: : ::        |  0                  |  0        |
    cltd                                            // |  6 : :: : ::        |  0                  |  0        |
    idivl   %edi                                    // |  6 x :x x ::        |  0                  |  0        |
    testl   %edx, %edx                              // |  5   :v : ::        |  0                  |  6 ^^^^^^ |
    je  .LBB0_7                                     // |  5   :: : ::        |  0                  |  1  v     |
    incl    %edi                                    // |  5   :: x ::        |  0                  |  5  ^^^^^ |
    movl    %edi, %eax                              // |  6 ^ :: v ::        |  0                  |  0        |
    imull   %edi, %eax                              // |  6 ^ :x v ::        |  0                  |  2 ^  ^   |
    cmpl    %ecx, %eax                              // |  4 v v    ::        |  0                  |  6 ^^^^^^ |
    jle .LBB0_6                                     // |  2        ::        |  0                  |  3  vvv   |
    movq    %r8, %rax                               // |  3 ^      :v        |  0                  |  0        |
    retq                                            // |  1        x         |  0                  |  0        |
.Lfunc_end0:                                        // |                     |                     |           |
    .size   func0, .Lfunc_end0-func0                // |                     |                     |           |
    .cfi_endproc                                    // |                     |                     |           |
    .type   .L.str,@object                          // |                     |                     |           |
    .section    .rodata.str1.1,"aMS",@progbits,1    // |                     |                     |           |
.L.str:                                             // |                     |                     |           |
    .asciz  "NO"                                    // |                     |                     |           |
    .size   .L.str, 3                               // |                     |                     |           |
    .type   .L.str.1,@object                        // |                     |                     |           |
.L.str.1:                                           // |                     |                     |           |
    .asciz  "YES"                                   // |                     |                     |           |
    .size   .L.str.1, 4                             // |                     |                     |           |
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
