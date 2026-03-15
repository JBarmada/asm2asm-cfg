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
	movl	$1, %r9d
	xorl	%ecx, %ecx
	movl	$3435973837, %r8d               # imm = 0xCCCCCCCD
	movl	$1, %eax
	.p2align	4, 0x90
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	movl	%edi, %esi
	imulq	%r8, %rsi
	shrq	$35, %rsi
	leal	(%rsi,%rsi), %edx
	leal	(%rdx,%rdx,4), %r10d
	movl	%edi, %edx
	subl	%r10d, %edx
	testb	$1, %dl
	cmovel	%r9d, %edx
	cmovnel	%r9d, %ecx
	imull	%edx, %eax
	cmpl	$9, %edi
	movl	%esi, %edi
	ja	.LBB0_3
# %bb.4:
	testl	%ecx, %ecx
	cmovel	%ecx, %eax
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
