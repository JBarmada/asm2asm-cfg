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
	movq	%rdi, %r14
	callq	strlen@PLT
	movq	%rax, %rbx
	xorl	%r15d, %r15d
	testl	%ebx, %ebx
	je	.LBB0_4
# %bb.1:
	movl	%ebx, %ebp
	shlq	$32, %rbx
	movabsq	$-4294967296, %rax              # imm = 0xFFFFFFFF00000000
	addq	%rbx, %rax
	sarq	$32, %rax
	movzbl	(%r14,%rax), %r12d
	callq	__ctype_b_loc@PLT
	movq	(%rax), %rax
	testb	$4, 1(%rax,%r12,2)
	je	.LBB0_4
# %bb.2:
	movl	$1, %r15d
	cmpl	$1, %ebp
	je	.LBB0_4
# %bb.3:
	movabsq	$-8589934592, %rcx              # imm = 0xFFFFFFFE00000000
	addq	%rcx, %rbx
	sarq	$32, %rbx
	movzbl	(%r14,%rbx), %ecx
	xorl	%r15d, %r15d
	testb	$4, 1(%rax,%rcx,2)
	sete	%r15b
.LBB0_4:
	movl	%r15d, %eax
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
