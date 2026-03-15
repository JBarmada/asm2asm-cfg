	.text
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	4, 0x90
	.type	func0,@function
func0:                                  # @func0
	.cfi_startproc
# %bb.0:
	movzbl	(%rdi), %ecx
	testb	%cl, %cl
	je	.LBB0_1
# %bb.2:
	xorl	%r8d, %r8d
	.p2align	4, 0x90
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	movsbl	%cl, %ecx
	addl	$-93, %ecx
	imull	$20165, %ecx, %edx              # imm = 0x4EC5
	movl	%edx, %eax
	shrl	$31, %eax
	shrl	$19, %edx
	addl	%eax, %edx
	leal	(%rdx,%rdx,4), %eax
	leal	(%rax,%rax,4), %eax
	addl	%edx, %eax
	subl	%eax, %ecx
	addb	$97, %cl
	movb	%cl, (%rsi,%r8)
	movzbl	1(%rdi,%r8), %ecx
	incq	%r8
	testb	%cl, %cl
	jne	.LBB0_3
# %bb.4:
	movl	%r8d, %eax
	movb	$0, (%rsi,%rax)
	retq
.LBB0_1:
	xorl	%eax, %eax
	movb	$0, (%rsi,%rax)
	retq
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
