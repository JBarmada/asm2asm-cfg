	.text
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	4, 0x90
	.type	func0,@function
func0:                                  # @func0
	.cfi_startproc
# %bb.0:
	cmpl	%edx, %edi
	cmovgl	%edi, %edx
	cmpl	%ecx, %esi
	cmovll	%esi, %ecx
	subl	%edx, %ecx
	leaq	.L.str(%rip), %rsi
	cmpl	$2, %ecx
	jge	.LBB0_1
.LBB0_7:
	movq	%rsi, %rax
	retq
.LBB0_1:
	leaq	.L.str.1(%rip), %r8
	cmpl	$4, %ecx
	jae	.LBB0_5
# %bb.2:
	movq	%r8, %rax
	retq
.LBB0_5:
	movl	$2, %edi
	.p2align	4, 0x90
.LBB0_6:                                # =>This Inner Loop Header: Depth=1
	movl	%ecx, %eax
	cltd
	idivl	%edi
	testl	%edx, %edx
	je	.LBB0_7
# %bb.3:                                #   in Loop: Header=BB0_6 Depth=1
	incl	%edi
	movl	%edi, %eax
	imull	%edi, %eax
	cmpl	%ecx, %eax
	jle	.LBB0_6
# %bb.4:
	movq	%r8, %rax
	retq
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"NO"
	.size	.L.str, 3

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"YES"
	.size	.L.str.1, 4

	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
