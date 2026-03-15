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
	movq	%rsi, %r15
	movq	%rdi, 16(%rsp)                  # 8-byte Spill
	movq	%rsi, %rdi
	callq	strlen@PLT
	movq	%rax, %rbx
	addl	%eax, %eax
	incl	%eax
	movslq	%eax, %rdi
	callq	malloc@PLT
	movq	%rax, %r13
	testl	%ebx, %ebx
	jle	.LBB0_1
# %bb.2:
	movslq	%ebx, %r14
	movl	%r14d, %eax
	movq	%rax, 8(%rsp)                   # 8-byte Spill
	movb	$1, %r12b
	xorl	%ebp, %ebp
	movq	%r14, %rbx
	.p2align	4, 0x90
.LBB0_4:                                # =>This Inner Loop Header: Depth=1
	leaq	(%r15,%rbp), %rsi
	movq	%r13, %rdi
	movq	%rbx, %rdx
	callq	strncpy@PLT
	leaq	(%rbx,%r13), %rdi
	movq	%r15, %rsi
	movq	%rbp, %rdx
	callq	strncpy@PLT
	movb	$0, (%r13,%r14)
	movq	16(%rsp), %rdi                  # 8-byte Reload
	movq	%r13, %rsi
	callq	strstr@PLT
	testq	%rax, %rax
	jne	.LBB0_5
# %bb.3:                                #   in Loop: Header=BB0_4 Depth=1
	incq	%rbp
	cmpq	%r14, %rbp
	setl	%r12b
	decq	%rbx
	cmpq	%rbp, 8(%rsp)                   # 8-byte Folded Reload
	jne	.LBB0_4
	jmp	.LBB0_5
.LBB0_1:
	xorl	%r12d, %r12d
.LBB0_5:
	movq	%r13, %rdi
	callq	free@PLT
	andb	$1, %r12b
	movl	%r12d, %eax
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
