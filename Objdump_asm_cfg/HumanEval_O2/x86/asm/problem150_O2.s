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
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	$0, (%rdx)
	testl	%esi, %esi
	movq	%rdi, 8(%rsp)                   # 8-byte Spill
	jle	.LBB0_1
# %bb.9:
	movq	%rdx, %r15
	movq	%rdi, %rbx
	movl	%esi, %r12d
	xorl	%r13d, %r13d
	xorl	%ebp, %ebp
	jmp	.LBB0_10
	.p2align	4, 0x90
.LBB0_12:                               #   in Loop: Header=BB0_10 Depth=1
	incq	%rbp
	cmpq	%rbp, %r12
	je	.LBB0_2
.LBB0_10:                               # =>This Inner Loop Header: Depth=1
	movq	(%rbx,%rbp,8), %r14
	movq	%r14, %rdi
	callq	strlen@PLT
	testb	$1, %al
	jne	.LBB0_12
# %bb.11:                               #   in Loop: Header=BB0_10 Depth=1
	movslq	%r13d, %r13
	movq	%r14, (%rbx,%r13,8)
	incl	%r13d
	movl	%r13d, (%r15)
	jmp	.LBB0_12
.LBB0_2:
	cmpl	$2, %r13d
	jl	.LBB0_18
# %bb.3:
	movq	%r13, 24(%rsp)                  # 8-byte Spill
	leal	-1(%r13), %eax
	xorl	%ecx, %ecx
	movl	%eax, 20(%rsp)                  # 4-byte Spill
	movl	%eax, %r13d
	jmp	.LBB0_4
	.p2align	4, 0x90
.LBB0_16:                               #   in Loop: Header=BB0_4 Depth=1
	movq	32(%rsp), %rcx                  # 8-byte Reload
	incl	%ecx
	decl	%r13d
	cmpl	20(%rsp), %ecx                  # 4-byte Folded Reload
	je	.LBB0_17
.LBB0_4:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_6 Depth 2
	movl	%r13d, %r13d
	movq	%rcx, 32(%rsp)                  # 8-byte Spill
	movl	%ecx, %eax
	notl	%eax
	addl	24(%rsp), %eax                  # 4-byte Folded Reload
	testl	%eax, %eax
	jle	.LBB0_16
# %bb.5:                                #   in Loop: Header=BB0_4 Depth=1
	movq	(%rbx), %r15
	xorl	%r14d, %r14d
	jmp	.LBB0_6
	.p2align	4, 0x90
.LBB0_14:                               #   in Loop: Header=BB0_6 Depth=2
	movq	8(%rsp), %rax                   # 8-byte Reload
	movq	%rbx, (%rax,%rbp,8)
	movq	%rax, %rbx
	movq	%r15, 8(%rax,%rbp,8)
	cmpq	%r14, %r13
	je	.LBB0_16
.LBB0_6:                                #   Parent Loop BB0_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	%r14, %rbp
	movq	%r15, %rdi
	callq	strlen@PLT
	movq	%rax, %r12
	incq	%r14
	movq	8(%rbx,%rbp,8), %rbx
	movq	%rbx, %rdi
	callq	strlen@PLT
	cmpq	%rax, %r12
	ja	.LBB0_14
# %bb.7:                                #   in Loop: Header=BB0_6 Depth=2
	jne	.LBB0_8
# %bb.13:                               #   in Loop: Header=BB0_6 Depth=2
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	strcmp@PLT
	testl	%eax, %eax
	jg	.LBB0_14
.LBB0_8:                                #   in Loop: Header=BB0_6 Depth=2
	movq	%rbx, %r15
	movq	8(%rsp), %rbx                   # 8-byte Reload
	cmpq	%r14, %r13
	jne	.LBB0_6
	jmp	.LBB0_16
.LBB0_1:
	xorl	%r13d, %r13d
	jmp	.LBB0_18
.LBB0_17:
	movq	24(%rsp), %r13                  # 8-byte Reload
.LBB0_18:
	movslq	%r13d, %rbp
	leaq	(,%rbp,8), %rdi
	callq	malloc@PLT
	movq	%rax, %rbx
	testl	%ebp, %ebp
	jle	.LBB0_20
# %bb.19:
	movl	%r13d, %edx
	shlq	$3, %rdx
	movq	%rbx, %rdi
	movq	8(%rsp), %rsi                   # 8-byte Reload
	callq	memcpy@PLT
.LBB0_20:
	movq	%rbx, %rax
	addq	$40, %rsp
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
