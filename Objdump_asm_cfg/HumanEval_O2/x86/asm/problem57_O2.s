	.text
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	4, 0x90
	.type	func0,@function
func0:                                  # @func0
	.cfi_startproc
# %bb.0:
	xorl	%eax, %eax
	jmp	.LBB0_1
	.p2align	4, 0x90
.LBB0_4:                                #   in Loop: Header=BB0_1 Depth=1
	incl	%eax
.LBB0_5:                                #   in Loop: Header=BB0_1 Depth=1
	xorl	%edx, %edx
	cmpb	$62, %cl
	sete	%dl
	incq	%rdi
	subl	%edx, %eax
	js	.LBB0_6
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	movzbl	(%rdi), %ecx
	cmpl	$60, %ecx
	je	.LBB0_4
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	testl	%ecx, %ecx
	jne	.LBB0_5
# %bb.3:
	testl	%eax, %eax
	sete	%al
                                        # kill: def $al killed $al killed $eax
	retq
.LBB0_6:
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
