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
	movl	%ecx, 4(%rsp)                   # 4-byte Spill
	movq	%rdx, %r12
	movq	%rdi, %rbp
	xorl	%r14d, %r14d
	movl	$0, %ebx
	testl	%esi, %esi
	jle	.LBB0_3
# %bb.1:
	movl	%esi, %r13d
	xorl	%r15d, %r15d
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
	movq	(%rbp,%r15,8), %rdi
	callq	strlen@PLT
	addl	%eax, %ebx
	incq	%r15
	cmpq	%r15, %r13
	jne	.LBB0_2
.LBB0_3:
	movq	%rbp, %r13
	movl	4(%rsp), %eax                   # 4-byte Reload
	testl	%eax, %eax
	jle	.LBB0_6
# %bb.4:
	movl	%eax, %r15d
	xorl	%ebp, %ebp
	xorl	%r14d, %r14d
	.p2align	4, 0x90
.LBB0_5:                                # =>This Inner Loop Header: Depth=1
	movq	(%r12,%rbp,8), %rdi
	callq	strlen@PLT
	addl	%eax, %r14d
	incq	%rbp
	cmpq	%rbp, %r15
	jne	.LBB0_5
.LBB0_6:
	cmpl	%r14d, %ebx
	cmovleq	%r13, %r12
	cmovlq	%r13, %r12
	movq	%r12, %rax
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
