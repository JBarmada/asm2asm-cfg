	.text
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	4, 0x90
	.type	func0,@function
func0:                                  # @func0
	.cfi_startproc
# %bb.0:
	testl	%edi, %edi
	jle	.LBB0_1
# %bb.2:
	xorl	%ecx, %ecx
	movl	$1, %edx
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	cmpl	%edi, %edx
	je	.LBB0_4
# %bb.5:                                #   in Loop: Header=BB0_3 Depth=1
	imull	%esi, %edx
	cmpl	%edi, %edx
	jg	.LBB0_7
# %bb.6:                                #   in Loop: Header=BB0_3 Depth=1
	leal	1(%rcx), %r8d
	cmpl	$99, %ecx
	movl	%r8d, %ecx
	jb	.LBB0_3
.LBB0_7:
	retq
.LBB0_1:
	xorl	%eax, %eax
	retq
.LBB0_4:
	movl	$1, %eax
	retq
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
