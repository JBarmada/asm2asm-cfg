	.text
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	4, 0x90
	.type	func0,@function
func0:                                  # @func0
	.cfi_startproc
# %bb.0:
	xorl	%r9d, %r9d
	movl	$2, %eax
	movl	$1, %r8d
	jmp	.LBB0_1
	.p2align	4, 0x90
.LBB0_7:                                #   in Loop: Header=BB0_1 Depth=1
	testl	%edx, %edx
	setne	%dl
.LBB0_8:                                #   in Loop: Header=BB0_1 Depth=1
	movl	%r8d, %eax
	addl	%ecx, %eax
	movzbl	%dl, %edx
	addl	%edx, %r9d
	movl	%ecx, %r8d
	cmpl	%edi, %r9d
	je	.LBB0_9
.LBB0_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_6 Depth 2
	cmpl	%edi, %r9d
	jge	.LBB0_2
# %bb.3:                                #   in Loop: Header=BB0_1 Depth=1
	movl	%eax, %ecx
	movb	$1, %dl
	cmpl	$4, %eax
	jl	.LBB0_8
# %bb.4:                                #   in Loop: Header=BB0_1 Depth=1
	movl	$2, %esi
	.p2align	4, 0x90
.LBB0_6:                                #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	%ecx, %eax
	cltd
	idivl	%esi
	testl	%edx, %edx
	je	.LBB0_7
# %bb.5:                                #   in Loop: Header=BB0_6 Depth=2
	incl	%esi
	movl	%esi, %eax
	imull	%esi, %eax
	cmpl	%ecx, %eax
	jle	.LBB0_6
	jmp	.LBB0_7
.LBB0_9:
	movl	%ecx, %eax
	retq
.LBB0_2:
	xorl	%eax, %eax
	retq
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
