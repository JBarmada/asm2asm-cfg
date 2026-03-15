	.text
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	4, 0x90
	.type	func0,@function
func0:                                  # @func0
	.cfi_startproc
# %bb.0:
	xorps	%xmm0, %xmm0
	movaps	%xmm0, -24(%rsp)
	movaps	%xmm0, -40(%rsp)
	movaps	%xmm0, -56(%rsp)
	movaps	%xmm0, -72(%rsp)
	movaps	%xmm0, -88(%rsp)
	movaps	%xmm0, -104(%rsp)
	movq	$0, -8(%rsp)
	xorl	%r9d, %r9d
	jmp	.LBB0_1
	.p2align	4, 0x90
.LBB0_11:                               #   in Loop: Header=BB0_1 Depth=1
	incq	%rdi
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	movzbl	(%rdi), %eax
	cmpl	$32, %eax
	je	.LBB0_11
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	testl	%eax, %eax
	je	.LBB0_3
# %bb.10:                               #   in Loop: Header=BB0_1 Depth=1
	movsbq	%al, %rax
	movl	-492(%rsp,%rax,4), %r8d
	leal	1(%r8), %r10d
	movl	%r10d, -492(%rsp,%rax,4)
	cmpl	%r9d, %r8d
	cmovgel	%r10d, %r9d
	jmp	.LBB0_11
.LBB0_3:
	xorl	%edi, %edi
	xorl	%r8d, %r8d
	jmp	.LBB0_4
	.p2align	4, 0x90
.LBB0_8:                                #   in Loop: Header=BB0_4 Depth=1
	addq	$2, %rdi
	cmpq	$26, %rdi
	je	.LBB0_9
.LBB0_4:                                # =>This Inner Loop Header: Depth=1
	movl	-104(%rsp,%rdi,4), %eax
	movl	%eax, (%rsi,%rdi,4)
	cmpl	%r9d, %eax
	jne	.LBB0_6
# %bb.5:                                #   in Loop: Header=BB0_4 Depth=1
	movslq	%r8d, %r10
	incl	%r8d
	leal	97(%rdi), %eax
	movb	%al, (%rcx,%r10)
.LBB0_6:                                #   in Loop: Header=BB0_4 Depth=1
	movl	-100(%rsp,%rdi,4), %eax
	movl	%eax, 4(%rsi,%rdi,4)
	cmpl	%r9d, %eax
	jne	.LBB0_8
# %bb.7:                                #   in Loop: Header=BB0_4 Depth=1
	movslq	%r8d, %r10
	incl	%r8d
	leal	98(%rdi), %eax
	movb	%al, (%rcx,%r10)
	jmp	.LBB0_8
.LBB0_9:
	movl	%r9d, (%rdx)
	movslq	%r8d, %rax
	movb	$0, (%rcx,%rax)
	retq
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
