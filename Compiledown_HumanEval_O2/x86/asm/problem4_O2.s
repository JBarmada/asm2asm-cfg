	.text
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	4, 0x90
	.type	func0,@function
func0:                                  # @func0
	.cfi_startproc
# %bb.0:
	testl	%esi, %esi
	jle	.LBB0_1
# %bb.2:
	movl	(%rdi), %eax
	testl	%eax, %eax
	js	.LBB0_3
# %bb.4:
	movl	%esi, %ecx
	movl	$1, %esi
	.p2align	4, 0x90
.LBB0_5:                                # =>This Inner Loop Header: Depth=1
	movq	%rsi, %rdx
	cmpq	%rsi, %rcx
	je	.LBB0_7
# %bb.6:                                #   in Loop: Header=BB0_5 Depth=1
	leaq	1(%rdx), %rsi
	addl	(%rdi,%rdx,4), %eax
	jns	.LBB0_5
.LBB0_7:
	xorl	%eax, %eax
	cmpq	%rcx, %rdx
	setb	%al
	retq
.LBB0_1:
	xorl	%eax, %eax
	retq
.LBB0_3:
	movl	$1, %eax
	retq
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
