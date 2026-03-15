	.text
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	4, 0x90
	.type	func0,@function
func0:                                  # @func0
	.cfi_startproc
# %bb.0:
	movl	%edi, %eax
	negl	%eax
	cmovsl	%edi, %eax
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	movslq	%eax, %r8
	andl	$1, %eax
	addl	%eax, %edx
	xorl	$1, %eax
	addl	%eax, %ecx
	imulq	$1717986919, %r8, %rax          # imm = 0x66666667
	movq	%rax, %rdi
	shrq	$63, %rdi
	sarq	$34, %rax
	addl	%edi, %eax
	cmpl	$9, %r8d
	jg	.LBB0_1
# %bb.2:
	movl	%ecx, (%rsi)
	movl	%edx, 4(%rsi)
	retq
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
