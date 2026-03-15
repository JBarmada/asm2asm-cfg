	.text
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	4, 0x90
	.type	func0,@function
func0:                                  # @func0
	.cfi_startproc
# %bb.0:
	cmpl	$4, %edi
	jge	.LBB0_1
.LBB0_7:
	movl	%edi, %eax
	retq
.LBB0_1:
	movl	$2, %ecx
	jmp	.LBB0_2
	.p2align	4, 0x90
.LBB0_6:                                #   in Loop: Header=BB0_2 Depth=1
	incl	%ecx
	movl	%ecx, %eax
	imull	%ecx, %eax
	cmpl	%edi, %eax
	jg	.LBB0_7
.LBB0_2:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_3 Depth 2
	movl	%edi, %eax
	.p2align	4, 0x90
.LBB0_3:                                #   Parent Loop BB0_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cltd
	idivl	%ecx
	cmpl	%ecx, %edi
	jle	.LBB0_6
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=2
	testl	%edx, %edx
	jne	.LBB0_6
# %bb.5:                                #   in Loop: Header=BB0_3 Depth=2
	movl	%edi, %eax
	cltd
	idivl	%ecx
	movl	%eax, %edi
	jmp	.LBB0_3
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
