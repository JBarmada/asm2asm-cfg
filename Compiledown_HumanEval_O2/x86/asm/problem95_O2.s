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
# %bb.6:
	movl	%esi, %r8d
	xorl	%r10d, %r10d
	xorl	%r9d, %r9d
	jmp	.LBB0_7
	.p2align	4, 0x90
.LBB0_12:                               #   in Loop: Header=BB0_7 Depth=1
	cmpl	%r9d, %ecx
	cmovgl	%ecx, %r9d
.LBB0_13:                               #   in Loop: Header=BB0_7 Depth=1
	incq	%r10
	cmpq	%r8, %r10
	je	.LBB0_2
.LBB0_7:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_10 Depth 2
	movl	(%rdi,%r10,4), %ecx
	cmpl	$2, %ecx
	jl	.LBB0_13
# %bb.8:                                #   in Loop: Header=BB0_7 Depth=1
	cmpl	$4, %ecx
	jb	.LBB0_12
# %bb.9:                                #   in Loop: Header=BB0_7 Depth=1
	movl	$2, %esi
	.p2align	4, 0x90
.LBB0_10:                               #   Parent Loop BB0_7 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	%ecx, %eax
	cltd
	idivl	%esi
	testl	%edx, %edx
	je	.LBB0_13
# %bb.11:                               #   in Loop: Header=BB0_10 Depth=2
	incl	%esi
	movl	%esi, %eax
	imull	%esi, %eax
	cmpl	%ecx, %eax
	jle	.LBB0_10
	jmp	.LBB0_12
.LBB0_2:
	xorl	%eax, %eax
	testl	%r9d, %r9d
	jle	.LBB0_5
# %bb.3:
	movl	$3435973837, %ecx               # imm = 0xCCCCCCCD
	.p2align	4, 0x90
.LBB0_4:                                # =>This Inner Loop Header: Depth=1
	movl	%r9d, %edx
	imulq	%rcx, %rdx
	shrq	$35, %rdx
	leal	(%rdx,%rdx), %esi
	leal	(%rsi,%rsi,4), %esi
	movl	%r9d, %edi
	subl	%esi, %edi
	addl	%edi, %eax
	cmpl	$9, %r9d
	movl	%edx, %r9d
	ja	.LBB0_4
.LBB0_5:
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
