	.text
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	4, 0x90
	.type	func0,@function
func0:                                  # @func0
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rsi, %r14
	movq	%rdi, %r12
	xorl	%ebx, %ebx
	xorl	%ebp, %ebp
	xorl	%r15d, %r15d
	jmp	.LBB0_1
.LBB0_11:                               #   in Loop: Header=BB0_1 Depth=1
	movslq	%r15d, %r15
	leaq	(%r14,%r15), %rdi
	movslq	%ebp, %rdx
	subq	%rdx, %rsi
	callq	memcpy@PLT
	addl	%ebp, %r15d
	.p2align	4, 0x90
.LBB0_12:                               #   in Loop: Header=BB0_1 Depth=1
	incq	%rbx
	movl	%r13d, %ebp
.LBB0_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_8 Depth 2
	leaq	(%r12,%rbx), %rsi
	movzbl	(%r12,%rbx), %eax
	cmpl	$32, %eax
	je	.LBB0_4
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	testl	%eax, %eax
	je	.LBB0_13
# %bb.3:                                #   in Loop: Header=BB0_1 Depth=1
	incl	%ebp
	movl	%ebp, %r13d
	jmp	.LBB0_12
	.p2align	4, 0x90
.LBB0_4:                                #   in Loop: Header=BB0_1 Depth=1
	xorl	%r13d, %r13d
	cmpl	$2, %ebp
	jl	.LBB0_12
# %bb.5:                                #   in Loop: Header=BB0_1 Depth=1
	cmpl	$4, %ebp
	jb	.LBB0_9
# %bb.6:                                #   in Loop: Header=BB0_1 Depth=1
	movl	$2, %ecx
	.p2align	4, 0x90
.LBB0_8:                                #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	%ebp, %eax
	cltd
	idivl	%ecx
	testl	%edx, %edx
	je	.LBB0_12
# %bb.7:                                #   in Loop: Header=BB0_8 Depth=2
	incl	%ecx
	movl	%ecx, %eax
	imull	%ecx, %eax
	cmpl	%ebp, %eax
	jle	.LBB0_8
.LBB0_9:                                #   in Loop: Header=BB0_1 Depth=1
	testl	%r15d, %r15d
	jle	.LBB0_11
# %bb.10:                               #   in Loop: Header=BB0_1 Depth=1
	movl	%r15d, %eax
	incl	%r15d
	movb	$32, (%r14,%rax)
	jmp	.LBB0_11
.LBB0_13:
	cmpl	$2, %ebp
	jl	.LBB0_21
# %bb.14:
	cmpl	$4, %ebp
	jb	.LBB0_18
# %bb.15:
	movl	$2, %ecx
	.p2align	4, 0x90
.LBB0_17:                               # =>This Inner Loop Header: Depth=1
	movl	%ebp, %eax
	cltd
	idivl	%ecx
	testl	%edx, %edx
	je	.LBB0_21
# %bb.16:                               #   in Loop: Header=BB0_17 Depth=1
	incl	%ecx
	movl	%ecx, %eax
	imull	%ecx, %eax
	cmpl	%ebp, %eax
	jle	.LBB0_17
.LBB0_18:
	testl	%r15d, %r15d
	jle	.LBB0_20
# %bb.19:
	movl	%r15d, %eax
	incl	%r15d
	movb	$32, (%r14,%rax)
.LBB0_20:
	movslq	%r15d, %r15
	leaq	(%r14,%r15), %rdi
	movslq	%ebp, %rdx
	subq	%rdx, %rsi
	callq	memcpy@PLT
	addl	%ebp, %r15d
.LBB0_21:
	movslq	%r15d, %rax
	movb	$0, (%r14,%rax)
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
