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
	movq	%rcx, 8(%rsp)                   # 8-byte Spill
	movq	%rdx, 16(%rsp)                  # 8-byte Spill
	testl	%esi, %esi
	jle	.LBB0_1
# %bb.3:
	movq	%rdi, %r12
	movl	%esi, %r13d
	xorl	%r14d, %r14d
	xorl	%ebp, %ebp
	xorl	%ebx, %ebx
	jmp	.LBB0_4
	.p2align	4, 0x90
.LBB0_6:                                #   in Loop: Header=BB0_4 Depth=1
	incq	%r14
	cmpq	%r14, %r13
	je	.LBB0_2
.LBB0_4:                                # =>This Inner Loop Header: Depth=1
	movq	(%r12,%r14,8), %rdi
	movq	16(%rsp), %rsi                  # 8-byte Reload
	callq	strstr@PLT
	testq	%rax, %rax
	je	.LBB0_6
# %bb.5:                                #   in Loop: Header=BB0_4 Depth=1
	movslq	%ebp, %r15
	incl	%ebp
	leaq	8(,%r15,8), %rsi
	movq	%rbx, %rdi
	callq	realloc@PLT
	movq	%rax, %rbx
	movq	(%r12,%r14,8), %rax
	movq	%rax, (%rbx,%r15,8)
	jmp	.LBB0_6
.LBB0_1:
	xorl	%ebx, %ebx
	xorl	%ebp, %ebp
.LBB0_2:
	movq	8(%rsp), %rax                   # 8-byte Reload
	movl	%ebp, (%rax)
	movq	%rbx, %rax
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
