	.text
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	4, 0x90
	.type	func0,@function
func0:                                  # @func0
	.cfi_startproc
# %bb.0:
	movl	$-1, %eax
	cmpl	%edi, %esi
	jl	.LBB0_4
# %bb.1:
	movl	%esi, %ecx
	andl	$-2147483647, %ecx              # imm = 0x80000001
	cmpl	%edi, %esi
	jne	.LBB0_3
# %bb.2:
	cmpl	$1, %ecx
	jne	.LBB0_3
.LBB0_4:
	retq
.LBB0_3:
	xorl	%eax, %eax
	cmpl	$1, %ecx
	sete	%al
	subl	%eax, %esi
	movl	%esi, %eax
	retq
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
