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
	movq	%rdx, %r15
	movl	%esi, (%rcx)
	testl	%esi, %esi
	je	.LBB0_1
# %bb.3:
	movl	%esi, %r12d
	movq	%rdi, %r14
	movslq	%esi, %r13
	leaq	(,%r13,4), %rdi
	callq	malloc@PLT
	movq	%rax, (%r15)
	testq	%rax, %rax
	je	.LBB0_16
# %bb.4:
	movq	%rax, %rbx
	movl	%r12d, %ebp
	testl	%r12d, %r12d
	jle	.LBB0_6
# %bb.5:
	leaq	(,%rbp,4), %rdx
	movq	%rbx, %rdi
	movq	%r14, %rsi
	callq	memcpy@PLT
.LBB0_6:
	cmpl	$2, %r12d
	jl	.LBB0_2
# %bb.7:
	decl	%r12d
	movl	-4(%r14,%r13,4), %r10d
	addl	(%r14), %r10d
	andl	$-2147483647, %r10d             # imm = 0x80000001
	movl	%r12d, %r8d
	xorl	%r9d, %r9d
	movq	%rbx, %rdx
	jmp	.LBB0_9
	.p2align	4, 0x90
.LBB0_8:                                #   in Loop: Header=BB0_9 Depth=1
	addq	$4, %rdx
	decq	%rbp
	cmpq	%r8, %r9
	je	.LBB0_2
.LBB0_9:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_11 Depth 2
	movq	%r9, %rdi
	incq	%r9
	cmpq	%r13, %r9
	jge	.LBB0_8
# %bb.10:                               #   in Loop: Header=BB0_9 Depth=1
	movl	$1, %ecx
	jmp	.LBB0_11
	.p2align	4, 0x90
.LBB0_14:                               #   in Loop: Header=BB0_11 Depth=2
	movl	%eax, (%rbx,%rdi,4)
	movl	%esi, (%rdx,%rcx,4)
.LBB0_15:                               #   in Loop: Header=BB0_11 Depth=2
	incq	%rcx
	cmpq	%rcx, %rbp
	je	.LBB0_8
.LBB0_11:                               #   Parent Loop BB0_9 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	(%rbx,%rdi,4), %esi
	movl	(%rdx,%rcx,4), %eax
	cmpl	$1, %r10d
	jne	.LBB0_13
# %bb.12:                               #   in Loop: Header=BB0_11 Depth=2
	cmpl	%eax, %esi
	jg	.LBB0_14
	jmp	.LBB0_15
	.p2align	4, 0x90
.LBB0_13:                               #   in Loop: Header=BB0_11 Depth=2
	cmpl	%eax, %esi
	jl	.LBB0_14
	jmp	.LBB0_15
.LBB0_1:
	movq	$0, (%r15)
.LBB0_2:
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
.LBB0_16:
	.cfi_def_cfa_offset 64
	movl	$1, %edi
	callq	exit@PLT
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
