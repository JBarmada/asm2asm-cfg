	.text
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	4, 0x90
	.type	func0,@function
func0:                                  # @func0
	.cfi_startproc
# %bb.0:
	xorl	%eax, %eax
	cmpl	$2, %edi
	jl	.LBB0_8
# %bb.1:
	xorl	%ecx, %ecx
	cmpl	$4, %edi
	jae	.LBB0_2
.LBB0_7:
	xorl	%edx, %edx
	cmpl	$2, %edi
	setge	%dl
	addl	%ecx, %edx
	xorl	%eax, %eax
	cmpl	$3, %edx
	sete	%al
.LBB0_8:
	retq
.LBB0_2:
	xorl	%ecx, %ecx
	movl	$2, %esi
	jmp	.LBB0_3
	.p2align	4, 0x90
.LBB0_6:                                #   in Loop: Header=BB0_3 Depth=1
	incl	%esi
	movl	%esi, %eax
	imull	%esi, %eax
	cmpl	%edi, %eax
	jg	.LBB0_7
.LBB0_3:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_5 Depth 2
	movl	%edi, %eax
	.p2align	4, 0x90
.LBB0_5:                                #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cltd
	idivl	%esi
	testl	%edx, %edx
	jne	.LBB0_6
# %bb.4:                                #   in Loop: Header=BB0_5 Depth=2
	movl	%edi, %eax
	cltd
	idivl	%esi
	incl	%ecx
	movl	%eax, %edi
	jmp	.LBB0_5
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
