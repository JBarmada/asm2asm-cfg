	.text
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	4, 0x90
	.type	func0,@function
func0:                                  # @func0
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movb	$0, (%rsi)
	testl	%edi, %edi
	jle	.LBB0_6
# %bb.1:
	movq	%rsi, %r14
	movl	%edi, %ebp
	xorl	%eax, %eax
	leaq	.Lreltable.func0(%rip), %r12
	jmp	.LBB0_2
	.p2align	4, 0x90
.LBB0_5:                                #   in Loop: Header=BB0_2 Depth=1
	xorl	%eax, %eax
	testl	%ebp, %ebp
	setg	%al
	addl	%r13d, %eax
	testl	%ebp, %ebp
	jle	.LBB0_6
.LBB0_2:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_4 Depth 2
	movl	%eax, %r13d
	leaq	.L__const.func0.num(%rip), %rax
	movl	(%rax,%r13,4), %r15d
	cmpl	%r15d, %ebp
	jl	.LBB0_5
# %bb.3:                                #   in Loop: Header=BB0_2 Depth=1
	movslq	(%r12,%r13,4), %rbx
	addq	%r12, %rbx
	.p2align	4, 0x90
.LBB0_4:                                #   Parent Loop BB0_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	strcat@PLT
	subl	%r15d, %ebp
	cmpl	%r15d, %ebp
	jge	.LBB0_4
	jmp	.LBB0_5
.LBB0_6:
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"m"
	.size	.L.str, 2

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"cm"
	.size	.L.str.1, 3

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"d"
	.size	.L.str.2, 2

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"cd"
	.size	.L.str.3, 3

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"c"
	.size	.L.str.4, 2

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	"xc"
	.size	.L.str.5, 3

	.type	.L.str.6,@object                # @.str.6
.L.str.6:
	.asciz	"l"
	.size	.L.str.6, 2

	.type	.L.str.7,@object                # @.str.7
.L.str.7:
	.asciz	"xl"
	.size	.L.str.7, 3

	.type	.L.str.8,@object                # @.str.8
.L.str.8:
	.asciz	"x"
	.size	.L.str.8, 2

	.type	.L.str.9,@object                # @.str.9
.L.str.9:
	.asciz	"ix"
	.size	.L.str.9, 3

	.type	.L.str.10,@object               # @.str.10
.L.str.10:
	.asciz	"v"
	.size	.L.str.10, 2

	.type	.L.str.11,@object               # @.str.11
.L.str.11:
	.asciz	"iv"
	.size	.L.str.11, 3

	.type	.L.str.12,@object               # @.str.12
.L.str.12:
	.asciz	"i"
	.size	.L.str.12, 2

	.type	.Lreltable.func0,@object        # @reltable.func0
	.section	.rodata,"a",@progbits
	.p2align	2
.Lreltable.func0:
	.long	.L.str-.Lreltable.func0
	.long	.L.str.1-.Lreltable.func0
	.long	.L.str.2-.Lreltable.func0
	.long	.L.str.3-.Lreltable.func0
	.long	.L.str.4-.Lreltable.func0
	.long	.L.str.5-.Lreltable.func0
	.long	.L.str.6-.Lreltable.func0
	.long	.L.str.7-.Lreltable.func0
	.long	.L.str.8-.Lreltable.func0
	.long	.L.str.9-.Lreltable.func0
	.long	.L.str.10-.Lreltable.func0
	.long	.L.str.11-.Lreltable.func0
	.long	.L.str.12-.Lreltable.func0
	.size	.Lreltable.func0, 52

	.type	.L__const.func0.num,@object     # @__const.func0.num
	.p2align	4
.L__const.func0.num:
	.long	1000                            # 0x3e8
	.long	900                             # 0x384
	.long	500                             # 0x1f4
	.long	400                             # 0x190
	.long	100                             # 0x64
	.long	90                              # 0x5a
	.long	50                              # 0x32
	.long	40                              # 0x28
	.long	10                              # 0xa
	.long	9                               # 0x9
	.long	5                               # 0x5
	.long	4                               # 0x4
	.long	1                               # 0x1
	.size	.L__const.func0.num, 52

	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
