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
	testl	%esi, %esi
	jle	.LBB0_7
# %bb.1:
	movl	%esi, %r15d
	movq	%rdi, %r12
	movl	%esi, %r13d
	xorl	%ebp, %ebp
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
	movq	(%r12,%rbp,8), %rdi
	callq	strlen@PLT
	addl	%eax, %ebx
	incq	%rbp
	cmpq	%rbp, %r13
	jne	.LBB0_2
# %bb.3:
	incl	%ebx
	movslq	%ebx, %rdi
	callq	malloc@PLT
	testq	%rax, %rax
	je	.LBB0_10
# %bb.4:
	movq	%rax, %r14
	movb	$0, (%rax)
	testl	%r15d, %r15d
	jle	.LBB0_11
# %bb.5:
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB0_6:                                # =>This Inner Loop Header: Depth=1
	movq	(%r12,%rbx,8), %rsi
	movq	%r14, %rdi
	callq	strcat@PLT
	incq	%rbx
	cmpq	%rbx, %r13
	jne	.LBB0_6
	jmp	.LBB0_11
.LBB0_7:
	movl	$1, %edi
	callq	malloc@PLT
	testq	%rax, %rax
	je	.LBB0_10
# %bb.8:
	movq	%rax, %r14
	movb	$0, (%rax)
	jmp	.LBB0_11
.LBB0_10:
	xorl	%r14d, %r14d
.LBB0_11:
	movq	%r14, %rax
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
