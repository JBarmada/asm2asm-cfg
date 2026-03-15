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
	movq	%rsi, 32(%rsp)                  # 8-byte Spill
	movq	%rdi, %rbx
	movb	$0, 14(%rsp)
	movw	$0, 12(%rsp)
	callq	strlen@PLT
	movq	%rax, %rbp
	addl	$2, %eax
	movslq	%eax, %rdi
	callq	malloc@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%rax, %rbx
	callq	strcpy@PLT
	movq	%rbx, %rdi
	callq	strlen@PLT
	movq	%rbp, %rdx
	movw	$32, (%rbx,%rax)
	cmpl	$2147483646, %edx               # imm = 0x7FFFFFFE
	ja	.LBB0_1
# %bb.3:
	incl	%edx
	xorl	%r14d, %r14d
	xorl	%r13d, %r13d
	xorl	%ebp, %ebp
	xorl	%r12d, %r12d
	movq	%rbx, 24(%rsp)                  # 8-byte Spill
	movq	%rdx, 16(%rsp)                  # 8-byte Spill
	jmp	.LBB0_4
.LBB0_16:                               #   in Loop: Header=BB0_4 Depth=1
	movslq	%ebp, %rax
	incl	%ebp
	movl	$1, (%r13,%rax,4)
.LBB0_17:                               #   in Loop: Header=BB0_4 Depth=1
	movb	$0, 12(%rsp)
.LBB0_21:                               #   in Loop: Header=BB0_4 Depth=1
	incq	%r14
	cmpq	%r14, %rdx
	je	.LBB0_2
.LBB0_4:                                # =>This Inner Loop Header: Depth=1
	movzbl	(%rbx,%r14), %r15d
	cmpb	$32, %r15b
	jne	.LBB0_18
# %bb.5:                                #   in Loop: Header=BB0_4 Depth=1
	cmpw	$111, 12(%rsp)
	jne	.LBB0_9
# %bb.6:                                #   in Loop: Header=BB0_4 Depth=1
	cmpl	%r12d, %ebp
	jne	.LBB0_8
# %bb.7:                                #   in Loop: Header=BB0_4 Depth=1
	leal	(%rbp,%rbp), %r12d
	testl	%ebp, %ebp
	movl	$4, %eax
	cmovlel	%eax, %r12d
	movslq	%r12d, %rsi
	shlq	$2, %rsi
	movq	%r13, %rdi
	callq	realloc@PLT
	movq	16(%rsp), %rdx                  # 8-byte Reload
	movq	%rax, %r13
.LBB0_8:                                #   in Loop: Header=BB0_4 Depth=1
	movslq	%ebp, %rax
	incl	%ebp
	movl	$4, (%r13,%rax,4)
.LBB0_9:                                #   in Loop: Header=BB0_4 Depth=1
	movzwl	12(%rsp), %eax
	xorl	$31855, %eax                    # imm = 0x7C6F
	movzbl	14(%rsp), %ecx
	orw	%ax, %cx
	jne	.LBB0_13
# %bb.10:                               #   in Loop: Header=BB0_4 Depth=1
	cmpl	%r12d, %ebp
	jne	.LBB0_12
# %bb.11:                               #   in Loop: Header=BB0_4 Depth=1
	leal	(%r12,%r12), %ebx
	testl	%r12d, %r12d
	movl	$4, %eax
	cmovlel	%eax, %ebx
	movslq	%ebx, %rsi
	shlq	$2, %rsi
	movq	%r13, %rdi
	callq	realloc@PLT
	movq	16(%rsp), %rdx                  # 8-byte Reload
	movq	%rax, %r13
	movl	%ebx, %r12d
	movq	24(%rsp), %rbx                  # 8-byte Reload
.LBB0_12:                               #   in Loop: Header=BB0_4 Depth=1
	movslq	%ebp, %rax
	incl	%ebp
	movl	$2, (%r13,%rax,4)
.LBB0_13:                               #   in Loop: Header=BB0_4 Depth=1
	movzwl	12(%rsp), %eax
	xorl	$31790, %eax                    # imm = 0x7C2E
	movzbl	14(%rsp), %ecx
	orw	%ax, %cx
	jne	.LBB0_17
# %bb.14:                               #   in Loop: Header=BB0_4 Depth=1
	cmpl	%r12d, %ebp
	jne	.LBB0_16
# %bb.15:                               #   in Loop: Header=BB0_4 Depth=1
	leal	(%r12,%r12), %ebx
	testl	%r12d, %r12d
	movl	$4, %eax
	cmovlel	%eax, %ebx
	movslq	%ebx, %rsi
	shlq	$2, %rsi
	movq	%r13, %rdi
	callq	realloc@PLT
	movq	16(%rsp), %rdx                  # 8-byte Reload
	movq	%rax, %r13
	movl	%ebx, %r12d
	movq	24(%rsp), %rbx                  # 8-byte Reload
	jmp	.LBB0_16
	.p2align	4, 0x90
.LBB0_18:                               #   in Loop: Header=BB0_4 Depth=1
	leaq	12(%rsp), %rdi
	callq	strlen@PLT
	cmpq	$1, %rax
	ja	.LBB0_20
# %bb.19:                               #   in Loop: Header=BB0_4 Depth=1
	movb	%r15b, 12(%rsp,%rax)
	movb	$0, 13(%rsp,%rax)
.LBB0_20:                               #   in Loop: Header=BB0_4 Depth=1
	movq	16(%rsp), %rdx                  # 8-byte Reload
	jmp	.LBB0_21
.LBB0_1:
	xorl	%ebp, %ebp
	xorl	%r13d, %r13d
.LBB0_2:
	movq	%rbx, %rdi
	callq	free@PLT
	movq	32(%rsp), %rax                  # 8-byte Reload
	movl	%ebp, (%rax)
	movq	%r13, %rax
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
	.type	.L.str.1,@object                # @.str.1
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.1:
	.asciz	"o"
	.size	.L.str.1, 2

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"o|"
	.size	.L.str.2, 3

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	".|"
	.size	.L.str.3, 3

	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
