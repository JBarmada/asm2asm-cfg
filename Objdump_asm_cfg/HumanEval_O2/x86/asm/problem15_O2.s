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
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rsi, 16(%rsp)                  # 8-byte Spill
	movq	%rdi, %r12
	callq	strlen@PLT
	movq	%rax, %rbp
	movq	%rax, %rbx
	shlq	$32, %rbx
	movq	%rbx, %rdi
	sarq	$29, %rdi
	callq	malloc@PLT
	movq	%rax, %r13
	movabsq	$4294967296, %rdi               # imm = 0x100000000
	addq	%rbx, %rdi
	sarq	$32, %rdi
	callq	malloc@PLT
	movq	%rax, %rbx
	movb	$0, (%rax)
	testl	%ebp, %ebp
	movq	%rbp, 8(%rsp)                   # 8-byte Spill
	jle	.LBB0_3
# %bb.1:
	movl	%ebp, %r14d
	xorl	%r15d, %r15d
	.p2align	4, 0x90
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
	movq	%rbx, %rdi
	callq	strlen@PLT
	movq	%rax, %rbp
	leaq	2(%rax), %rsi
	movq	%rbx, %rdi
	callq	realloc@PLT
	movq	%rax, %rbx
	movzbl	(%r12,%r15), %eax
	movb	%al, (%rbx,%rbp)
	movb	$0, 1(%rbx,%rbp)
	movq	%rbx, %rdi
	callq	strlen@PLT
	leaq	1(%rax), %rdi
	callq	malloc@PLT
	movq	%rax, (%r13,%r15,8)
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	strcpy@PLT
	incq	%r15
	cmpq	%r15, %r14
	jne	.LBB0_2
.LBB0_3:
	movq	%rbx, %rdi
	callq	free@PLT
	movq	16(%rsp), %rax                  # 8-byte Reload
	movq	8(%rsp), %rcx                   # 8-byte Reload
	movl	%ecx, (%rax)
	movq	%r13, %rax
	addq	$24, %rsp
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
