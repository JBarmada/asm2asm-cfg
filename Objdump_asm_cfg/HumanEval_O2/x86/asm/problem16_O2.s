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
	testl	%edi, %edi
	jle	.LBB0_7
# %bb.1:
	movl	%edi, %r14d
	movl	%edi, %r12d
	negl	%r12d
	movl	$2, %ebx
	movl	$1, %ebp
	leaq	.L.str(%rip), %r15
	.p2align	4, 0x90
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
	xorl	%edi, %edi
	xorl	%esi, %esi
	movq	%r15, %rdx
	movl	%ebp, %ecx
	xorl	%eax, %eax
	callq	snprintf@PLT
	addl	%eax, %ebx
	leal	(%r12,%rbp), %eax
	incl	%eax
	movl	%ebp, %ecx
	incl	%ecx
	movl	%ecx, %ebp
	cmpl	$1, %eax
	jne	.LBB0_2
# %bb.3:
	movslq	%ebx, %rdi
	callq	malloc@PLT
	testq	%rax, %rax
	je	.LBB0_10
# %bb.4:
	movq	%rax, %r15
	movw	$48, (%rax)
	testl	%r14d, %r14d
	jle	.LBB0_11
# %bb.5:
	movq	%r15, %rbx
	incq	%rbx
	movl	$1, %ebp
	leaq	.L.str(%rip), %r14
	.p2align	4, 0x90
.LBB0_6:                                # =>This Inner Loop Header: Depth=1
	movq	%rbx, %rdi
	movq	%r14, %rsi
	movl	%ebp, %edx
	xorl	%eax, %eax
	callq	sprintf@PLT
	cltq
	addq	%rax, %rbx
	leal	(%r12,%rbp), %eax
	incl	%eax
	movl	%ebp, %ecx
	incl	%ecx
	movl	%ecx, %ebp
	cmpl	$1, %eax
	jne	.LBB0_6
	jmp	.LBB0_11
.LBB0_7:
	movl	$2, %edi
	callq	malloc@PLT
	testq	%rax, %rax
	je	.LBB0_10
# %bb.8:
	movq	%rax, %r15
	movw	$48, (%rax)
	jmp	.LBB0_11
.LBB0_10:
	xorl	%r15d, %r15d
.LBB0_11:
	movq	%r15, %rax
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
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	" %d"
	.size	.L.str, 4

	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
