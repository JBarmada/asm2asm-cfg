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
# %bb.3:
	movl	%esi, %r9d
	xorl	%edx, %edx
	movl	$2863311531, %r8d               # imm = 0xAAAAAAAB
	xorl	%eax, %eax
	jmp	.LBB0_4
	.p2align	4, 0x90
.LBB0_5:                                #   in Loop: Header=BB0_4 Depth=1
	movl	(%rdi,%rdx,4), %ecx
	imull	%ecx, %ecx
.LBB0_8:                                #   in Loop: Header=BB0_4 Depth=1
	addl	%ecx, %eax
	incq	%rdx
	cmpq	%rdx, %r9
	je	.LBB0_2
.LBB0_4:                                # =>This Inner Loop Header: Depth=1
	movl	%edx, %esi
	imulq	%r8, %rsi
	shrq	$33, %rsi
	leal	(%rsi,%rsi,2), %esi
	cmpl	%esi, %edx
	je	.LBB0_5
# %bb.6:                                #   in Loop: Header=BB0_4 Depth=1
	movl	(%rdi,%rdx,4), %ecx
	testb	$3, %dl
	jne	.LBB0_8
# %bb.7:                                #   in Loop: Header=BB0_4 Depth=1
	movl	%ecx, %esi
	imull	%ecx, %esi
	imull	%esi, %ecx
	jmp	.LBB0_8
.LBB0_1:
	xorl	%eax, %eax
.LBB0_2:
	retq
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
