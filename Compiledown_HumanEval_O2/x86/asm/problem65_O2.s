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
	movq	%rdi, %r14
	callq	strlen@PLT
	movq	%rax, %r15
	testl	%r15d, %r15d
	jle	.LBB0_1
# %bb.6:
	movl	%r15d, %r13d
	xorl	%ebp, %ebp
	leaq	.L.str(%rip), %r12
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB0_7:                                # =>This Inner Loop Header: Depth=1
	movsbl	(%r14,%rbp), %esi
	movl	$11, %edx
	movq	%r12, %rdi
	callq	memchr@PLT
	cmpq	$1, %rax
	sbbl	$-1, %ebx
	incq	%rbp
	cmpq	%rbp, %r13
	jne	.LBB0_7
# %bb.2:
	testl	%r15d, %r15d
	jle	.LBB0_5
# %bb.3:
	decl	%r15d
	movzbl	(%r14,%r15), %eax
	orl	$32, %eax
	cmpl	$121, %eax
	jne	.LBB0_5
# %bb.4:
	incl	%ebx
	jmp	.LBB0_5
.LBB0_1:
	xorl	%ebx, %ebx
.LBB0_5:
	movl	%ebx, %eax
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
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"aeiouAEIOU"
	.size	.L.str, 11

	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
