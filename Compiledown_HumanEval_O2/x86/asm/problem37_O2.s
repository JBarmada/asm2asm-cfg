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
# %bb.3:
	xorl	%r10d, %r10d
	movl	$3435973837, %r9d               # imm = 0xCCCCCCCD
	xorl	%eax, %eax
	jmp	.LBB0_4
	.p2align	4, 0x90
.LBB0_8:                                #   in Loop: Header=BB0_4 Depth=1
	incl	%r10d
	cmpl	%edi, %r10d
	je	.LBB0_2
.LBB0_4:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_7 Depth 2
	imull	$-1171354717, %r10d, %esi       # imm = 0xBA2E8BA3
	cmpl	$390451573, %esi                # imm = 0x1745D175
	setae	%r8b
	imull	$-991146299, %r10d, %esi        # imm = 0xC4EC4EC5
	cmpl	$330382100, %esi                # imm = 0x13B13B14
	setae	%dl
	testb	%dl, %r8b
	jne	.LBB0_8
# %bb.5:                                #   in Loop: Header=BB0_4 Depth=1
	testl	%r10d, %r10d
	je	.LBB0_8
# %bb.6:                                #   in Loop: Header=BB0_4 Depth=1
	movl	%r10d, %r8d
	.p2align	4, 0x90
.LBB0_7:                                #   Parent Loop BB0_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	%r8d, %edx
	imulq	%r9, %rdx
	shrq	$35, %rdx
	leal	(%rdx,%rdx), %ecx
	leal	(%rcx,%rcx,4), %ecx
	movl	%r8d, %esi
	subl	%ecx, %esi
	xorl	%ecx, %ecx
	cmpl	$7, %esi
	sete	%cl
	addl	%ecx, %eax
	cmpl	$9, %r8d
	movl	%edx, %r8d
	ja	.LBB0_7
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
