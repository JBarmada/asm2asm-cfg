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
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdx, %r14
	movl	%esi, %ebp
	movq	%rdi, %r15
	movslq	%esi, %rbx
	leaq	(,%rbx,4), %rdi
	callq	malloc@PLT
	testl	%ebx, %ebx
	jle	.LBB0_1
# %bb.3:
	movl	%ebp, %edx
	xorl	%esi, %esi
	xorl	%r10d, %r10d
	jmp	.LBB0_4
	.p2align	4, 0x90
.LBB0_10:                               #   in Loop: Header=BB0_4 Depth=1
	movslq	%r10d, %rcx
	incl	%r10d
	movl	%edi, (%rax,%rcx,4)
.LBB0_11:                               #   in Loop: Header=BB0_4 Depth=1
	incq	%rsi
	cmpq	%rdx, %rsi
	je	.LBB0_6
.LBB0_4:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_9 Depth 2
	movl	(%r15,%rsi,4), %edi
	testl	%r10d, %r10d
	jle	.LBB0_10
# %bb.5:                                #   in Loop: Header=BB0_4 Depth=1
	movl	%r10d, %ebp
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB0_9:                                #   Parent Loop BB0_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	(%rax,%rbx,4), %edi
	je	.LBB0_11
# %bb.8:                                #   in Loop: Header=BB0_9 Depth=2
	incq	%rbx
	cmpq	%rbx, %rbp
	jne	.LBB0_9
	jmp	.LBB0_10
.LBB0_6:
	cmpl	$2, %r10d
	jl	.LBB0_2
# %bb.7:
	leal	-1(%r10), %r8d
	movl	%r10d, %r9d
	xorl	%r11d, %r11d
	movq	%r9, %rdi
	movq	%rax, %rbp
	jmp	.LBB0_13
	.p2align	4, 0x90
.LBB0_12:                               #   in Loop: Header=BB0_13 Depth=1
	addq	$4, %rbp
	decq	%rdi
	cmpq	%r8, %r11
	je	.LBB0_2
.LBB0_13:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_15 Depth 2
	movq	%r11, %rbx
	incq	%r11
	cmpq	%r9, %r11
	jae	.LBB0_12
# %bb.14:                               #   in Loop: Header=BB0_13 Depth=1
	movl	$1, %esi
	jmp	.LBB0_15
	.p2align	4, 0x90
.LBB0_17:                               #   in Loop: Header=BB0_15 Depth=2
	incq	%rsi
	cmpq	%rsi, %rdi
	je	.LBB0_12
.LBB0_15:                               #   Parent Loop BB0_13 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	(%rax,%rbx,4), %ecx
	movl	(%rbp,%rsi,4), %edx
	cmpl	%edx, %ecx
	jle	.LBB0_17
# %bb.16:                               #   in Loop: Header=BB0_15 Depth=2
	movl	%edx, (%rax,%rbx,4)
	movl	%ecx, (%rbp,%rsi,4)
	jmp	.LBB0_17
.LBB0_1:
	xorl	%r10d, %r10d
.LBB0_2:
	movl	%r10d, (%r14)
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
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
