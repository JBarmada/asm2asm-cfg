	.text
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	4, 0x90
	.type	func0,@function
func0:                                  # @func0
	.cfi_startproc
# %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	callq	strlen@PLT
	movq	%rax, %rcx
	cmpl	$2, %ecx
	jge	.LBB0_2
# %bb.1:
	xorl	%eax, %eax
.LBB0_7:
                                        # kill: def $al killed $al killed $eax
	popq	%rcx
	.cfi_def_cfa_offset 8
	retq
.LBB0_2:
	.cfi_def_cfa_offset 16
	movb	$1, %al
	cmpl	$4, %ecx
	jb	.LBB0_7
# %bb.3:
	movl	$2, %esi
	.p2align	4, 0x90
.LBB0_4:                                # =>This Inner Loop Header: Depth=1
	movl	%ecx, %eax
	cltd
	idivl	%esi
	testl	%edx, %edx
	je	.LBB0_6
# %bb.5:                                #   in Loop: Header=BB0_4 Depth=1
	incl	%esi
	movl	%esi, %eax
	imull	%esi, %eax
	cmpl	%ecx, %eax
	jle	.LBB0_4
.LBB0_6:
	testl	%edx, %edx
	setne	%al
                                        # kill: def $al killed $al killed $eax
	popq	%rcx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
