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
	xorl	%r10d, %r10d
	movl	$3435973837, %esi               # imm = 0xCCCCCCCD
	xorl	%eax, %eax
	jmp	.LBB0_4
	.p2align	4, 0x90
.LBB0_8:                                #   in Loop: Header=BB0_4 Depth=1
	incq	%r10
	cmpq	%r8, %r10
	je	.LBB0_2
.LBB0_4:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_6 Depth 2
	movl	(%rdi,%r10,4), %r9d
	cmpl	$11, %r9d
	jl	.LBB0_8
# %bb.5:                                #   in Loop: Header=BB0_4 Depth=1
	movl	%r9d, %ecx
	.p2align	4, 0x90
.LBB0_6:                                #   Parent Loop BB0_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	%ecx, %edx
	movl	%ecx, %ecx
	imulq	%rsi, %rcx
	shrq	$35, %rcx
	cmpl	$99, %edx
	ja	.LBB0_6
# %bb.7:                                #   in Loop: Header=BB0_4 Depth=1
	andl	%r9d, %ecx
	andl	$1, %ecx
	addl	%ecx, %eax
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
