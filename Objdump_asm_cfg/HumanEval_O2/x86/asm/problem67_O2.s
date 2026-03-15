	.text
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	4, 0x90
	.type	func0,@function
func0:                                  # @func0
	.cfi_startproc
# %bb.0:
	movzbl	(%rdi), %edx
	testb	%dl, %dl
	je	.LBB0_1
# %bb.3:
	incq	%rdi
	xorl	%ecx, %ecx
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB0_4:                                # =>This Inner Loop Header: Depth=1
	leal	-65(%rdx), %esi
	cmpb	$26, %sil
	movzbl	%dl, %edx
	cmovael	%ecx, %edx
	movzbl	%dl, %edx
	addl	%edx, %eax
	movzbl	(%rdi), %edx
	incq	%rdi
	testb	%dl, %dl
	jne	.LBB0_4
# %bb.2:
	retq
.LBB0_1:
	xorl	%eax, %eax
	retq
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
