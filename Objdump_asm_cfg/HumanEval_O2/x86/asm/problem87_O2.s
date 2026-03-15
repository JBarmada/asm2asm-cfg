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
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %rbx
	callq	strlen@PLT
	movq	%rax, %rbp
	addl	$2, %eax
	movslq	%eax, %rdi
	callq	malloc@PLT
	movq	%rbp, %r11
	movq	%rax, 8(%rsp)                   # 8-byte Spill
	xorl	%r14d, %r14d
	testl	$-2147483648, %r11d             # imm = 0x80000000
	jne	.LBB0_17
# %bb.1:
	movq	%rbx, %r10
	incl	%r11d
	xorl	%r13d, %r13d
	xorl	%r14d, %r14d
	xorl	%r12d, %r12d
	jmp	.LBB0_2
	.p2align	4, 0x90
.LBB0_15:                               #   in Loop: Header=BB0_2 Depth=1
	movslq	%r12d, %rcx
	incl	%r12d
	movb	%al, 16(%rsp,%rcx)
	movl	%r12d, %r15d
.LBB0_16:                               #   in Loop: Header=BB0_2 Depth=1
	incq	%r13
	movl	%r15d, %r12d
	cmpq	%r11, %r13
	je	.LBB0_17
.LBB0_2:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_5 Depth 2
                                        #       Child Loop BB0_12 Depth 3
	movzbl	(%r10,%r13), %eax
	testb	$-33, %al
	jne	.LBB0_15
# %bb.3:                                #   in Loop: Header=BB0_2 Depth=1
	cmpl	$2, %r12d
	jl	.LBB0_7
# %bb.4:                                #   in Loop: Header=BB0_2 Depth=1
	leal	-1(%r12), %r8d
	movl	%r12d, %r9d
	leaq	-1(%r9), %rdx
	leaq	17(%rsp), %rsi
	xorl	%ebx, %ebx
	jmp	.LBB0_5
	.p2align	4, 0x90
.LBB0_6:                                #   in Loop: Header=BB0_5 Depth=2
	incq	%rsi
	decq	%rdx
	cmpq	%r8, %rbx
	je	.LBB0_7
.LBB0_5:                                #   Parent Loop BB0_2 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_12 Depth 3
	movq	%rbx, %rdi
	incq	%rbx
	cmpq	%r9, %rbx
	jae	.LBB0_6
# %bb.11:                               #   in Loop: Header=BB0_5 Depth=2
	xorl	%ebp, %ebp
	jmp	.LBB0_12
	.p2align	4, 0x90
.LBB0_14:                               #   in Loop: Header=BB0_12 Depth=3
	incq	%rbp
	cmpq	%rbp, %rdx
	je	.LBB0_6
.LBB0_12:                               #   Parent Loop BB0_2 Depth=1
                                        #     Parent Loop BB0_5 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movzbl	16(%rsp,%rdi), %eax
	movzbl	(%rsi,%rbp), %ecx
	cmpb	%cl, %al
	jle	.LBB0_14
# %bb.13:                               #   in Loop: Header=BB0_12 Depth=3
	movb	%cl, 16(%rsp,%rdi)
	movb	%al, (%rsi,%rbp)
	jmp	.LBB0_14
	.p2align	4, 0x90
.LBB0_7:                                #   in Loop: Header=BB0_2 Depth=1
	testl	%r14d, %r14d
	jle	.LBB0_9
# %bb.8:                                #   in Loop: Header=BB0_2 Depth=1
	movl	%r14d, %eax
	incl	%r14d
	movq	8(%rsp), %rcx                   # 8-byte Reload
	movb	$32, (%rcx,%rax)
.LBB0_9:                                #   in Loop: Header=BB0_2 Depth=1
	xorl	%r15d, %r15d
	testl	%r12d, %r12d
	jle	.LBB0_16
# %bb.10:                               #   in Loop: Header=BB0_2 Depth=1
	movslq	%r14d, %r14
	movq	8(%rsp), %rax                   # 8-byte Reload
	leaq	(%rax,%r14), %rdi
	movl	%r12d, %edx
	leaq	16(%rsp), %rsi
	movq	%r10, %rbx
	movq	%r11, %rbp
	callq	memcpy@PLT
	movq	%rbp, %r11
	movq	%rbx, %r10
	addl	%r12d, %r14d
	jmp	.LBB0_16
.LBB0_17:
	movslq	%r14d, %rcx
	movq	8(%rsp), %rax                   # 8-byte Reload
	movb	$0, (%rax,%rcx)
	addq	$72, %rsp
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
