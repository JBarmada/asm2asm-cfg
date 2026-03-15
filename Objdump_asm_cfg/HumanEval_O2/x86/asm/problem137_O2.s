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
	movl	%esi, %r8d
	xorl	%esi, %esi
	xorl	%r10d, %r10d
	xorl	%r9d, %r9d
	jmp	.LBB0_4
	.p2align	4, 0x90
.LBB0_5:                                #   in Loop: Header=BB0_4 Depth=1
	cmpl	%r9d, %ecx
	movl	%r9d, %eax
	cmovgl	%ecx, %eax
	testl	%r9d, %r9d
	cmovel	%ecx, %eax
	movl	%eax, %r9d
.LBB0_8:                                #   in Loop: Header=BB0_4 Depth=1
	incq	%rsi
	cmpq	%rsi, %r8
	je	.LBB0_2
.LBB0_4:                                # =>This Inner Loop Header: Depth=1
	movl	(%rdi,%rsi,4), %ecx
	testl	%ecx, %ecx
	js	.LBB0_5
# %bb.6:                                #   in Loop: Header=BB0_4 Depth=1
	je	.LBB0_8
# %bb.7:                                #   in Loop: Header=BB0_4 Depth=1
	cmpl	%r10d, %ecx
	movl	%r10d, %eax
	cmovll	%ecx, %eax
	testl	%r10d, %r10d
	cmovel	%ecx, %eax
	movl	%eax, %r10d
	jmp	.LBB0_8
.LBB0_1:
	xorl	%r9d, %r9d
	xorl	%r10d, %r10d
.LBB0_2:
	movl	%r9d, (%rdx)
	movl	%r10d, 4(%rdx)
	retq
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
