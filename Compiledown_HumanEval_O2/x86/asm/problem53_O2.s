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
	cmpl	%edx, (%rdi)
	jge	.LBB0_3
# %bb.4:
	movl	%esi, %eax
	movl	$1, %esi
	.p2align	4, 0x90
.LBB0_5:                                # =>This Inner Loop Header: Depth=1
	movq	%rsi, %rcx
	cmpq	%rsi, %rax
	je	.LBB0_7
# %bb.6:                                #   in Loop: Header=BB0_5 Depth=1
	leaq	1(%rcx), %rsi
	cmpl	%edx, (%rdi,%rcx,4)
	jl	.LBB0_5
.LBB0_7:
	cmpq	%rax, %rcx
	setae	%al
                                        # kill: def $al killed $al killed $eax
	retq
.LBB0_1:
	movb	$1, %al
                                        # kill: def $al killed $al killed $eax
	retq
.LBB0_3:
	xorl	%eax, %eax
                                        # kill: def $al killed $al killed $eax
	retq
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
