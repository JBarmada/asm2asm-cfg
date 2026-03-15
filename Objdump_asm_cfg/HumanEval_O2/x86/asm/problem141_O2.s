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
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rsi, %r14
	cmpb	$0, (%rdi)
	je	.LBB0_1
# %bb.5:
	movq	%rdi, %r12
	xorl	%ebx, %ebx
	xorl	%r15d, %r15d
	xorl	%ebp, %ebp
	jmp	.LBB0_6
	.p2align	4, 0x90
.LBB0_7:                                #   in Loop: Header=BB0_6 Depth=1
	incl	%ebp
.LBB0_16:                               #   in Loop: Header=BB0_6 Depth=1
	incq	%rbx
	movq	%r12, %rdi
	callq	strlen@PLT
	cmpq	%rbx, %rax
	jbe	.LBB0_2
.LBB0_6:                                # =>This Inner Loop Header: Depth=1
	cmpb	$32, (%r12,%rbx)
	je	.LBB0_7
# %bb.8:                                #   in Loop: Header=BB0_6 Depth=1
	movb	$95, %al
	cmpl	$1, %ebp
	je	.LBB0_13
# %bb.9:                                #   in Loop: Header=BB0_6 Depth=1
	cmpl	$2, %ebp
	jne	.LBB0_11
# %bb.10:                               #   in Loop: Header=BB0_6 Depth=1
	leal	1(%r15), %ecx
	movslq	%r15d, %rdx
	movb	$95, (%r14,%rdx)
	movl	$2, %ebp
	jmp	.LBB0_14
.LBB0_11:                               #   in Loop: Header=BB0_6 Depth=1
	jle	.LBB0_15
# %bb.12:                               #   in Loop: Header=BB0_6 Depth=1
	movb	$45, %al
	movl	$1, %ebp
.LBB0_13:                               #   in Loop: Header=BB0_6 Depth=1
	movl	%r15d, %ecx
.LBB0_14:                               #   in Loop: Header=BB0_6 Depth=1
	addl	%ebp, %r15d
	movslq	%ecx, %rcx
	movb	%al, (%r14,%rcx)
.LBB0_15:                               #   in Loop: Header=BB0_6 Depth=1
	movzbl	(%r12,%rbx), %eax
	movslq	%r15d, %rcx
	incl	%r15d
	movb	%al, (%r14,%rcx)
	xorl	%ebp, %ebp
	jmp	.LBB0_16
.LBB0_2:
	movb	$95, %al
	cmpl	$1, %ebp
	je	.LBB0_19
# %bb.3:
	cmpl	$2, %ebp
	jne	.LBB0_17
# %bb.4:
	leal	1(%r15), %ecx
	movslq	%r15d, %rdx
	movb	$95, (%r14,%rdx)
	movl	$2, %ebp
	jmp	.LBB0_20
.LBB0_1:
	xorl	%r15d, %r15d
	jmp	.LBB0_21
.LBB0_17:
	jle	.LBB0_21
# %bb.18:
	movb	$45, %al
	movl	$1, %ebp
.LBB0_19:
	movl	%r15d, %ecx
.LBB0_20:
	addl	%ebp, %r15d
	movslq	%ecx, %rcx
	movb	%al, (%r14,%rcx)
.LBB0_21:
	movslq	%r15d, %rax
	movb	$0, (%r14,%rax)
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
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
