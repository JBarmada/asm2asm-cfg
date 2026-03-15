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
	movq	%rcx, %r14
	movq	%rdx, %r15
	movl	%esi, %ebp
	movq	%rdi, %r12
	movslq	%esi, %rbx
	leaq	(,%rbx,4), %rdi
	callq	malloc@PLT
	movq	%rax, (%r15)
	movl	$0, (%r14)
	testl	%ebx, %ebx
	jle	.LBB0_18
# %bb.1:
	movl	%ebp, %r8d
	xorl	%r9d, %r9d
	movl	$1, %esi
	movl	$3435973837, %edi               # imm = 0xCCCCCCCD
	xorl	%ebp, %ebp
	jmp	.LBB0_2
	.p2align	4, 0x90
.LBB0_8:                                #   in Loop: Header=BB0_2 Depth=1
	incq	%rbp
	cmpq	%r8, %rbp
	je	.LBB0_9
.LBB0_2:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_4 Depth 2
	movl	(%r12,%rbp,4), %r10d
	testl	%r10d, %r10d
	setne	%r11b
	jle	.LBB0_6
# %bb.3:                                #   in Loop: Header=BB0_2 Depth=1
	sete	%cl
	movl	%r10d, %edx
	.p2align	4, 0x90
.LBB0_4:                                #   Parent Loop BB0_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	testb	$1, %dl
	movzbl	%cl, %ecx
	cmovel	%esi, %ecx
	movl	%ecx, %ebx
	andb	$1, %bl
	sete	%r11b
	cmpl	$10, %edx
	jb	.LBB0_6
# %bb.5:                                #   in Loop: Header=BB0_4 Depth=2
	movl	%edx, %edx
	imulq	%rdi, %rdx
	shrq	$35, %rdx
	testb	%bl, %bl
	je	.LBB0_4
.LBB0_6:                                #   in Loop: Header=BB0_2 Depth=1
	testb	%r11b, %r11b
	je	.LBB0_8
# %bb.7:                                #   in Loop: Header=BB0_2 Depth=1
	movslq	%r9d, %r9
	movl	%r10d, (%rax,%r9,4)
	incl	%r9d
	movl	%r9d, (%r14)
	jmp	.LBB0_8
.LBB0_9:
	cmpl	$2, %r9d
	jl	.LBB0_18
# %bb.10:
	leal	-1(%r9), %r8d
	xorl	%esi, %esi
	movl	%r8d, %r11d
	jmp	.LBB0_11
	.p2align	4, 0x90
.LBB0_17:                               #   in Loop: Header=BB0_11 Depth=1
	incl	%esi
	decl	%r11d
	cmpl	%r8d, %esi
	je	.LBB0_18
.LBB0_11:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_20 Depth 2
	movl	%esi, %ecx
	notl	%ecx
	addl	%r9d, %ecx
	testl	%ecx, %ecx
	jle	.LBB0_17
# %bb.12:                               #   in Loop: Header=BB0_11 Depth=1
	movl	%r8d, %r10d
	subl	%esi, %r10d
	movl	(%rax), %edx
	cmpl	$1, %r10d
	jne	.LBB0_19
# %bb.13:                               #   in Loop: Header=BB0_11 Depth=1
	xorl	%ebx, %ebx
.LBB0_14:                               #   in Loop: Header=BB0_11 Depth=1
	testb	$1, %r10b
	je	.LBB0_17
# %bb.15:                               #   in Loop: Header=BB0_11 Depth=1
	movl	4(%rax,%rbx,4), %ecx
	cmpl	%ecx, %edx
	jle	.LBB0_17
# %bb.16:                               #   in Loop: Header=BB0_11 Depth=1
	movl	%ecx, (%rax,%rbx,4)
	movl	%edx, 4(%rax,%rbx,4)
	jmp	.LBB0_17
	.p2align	4, 0x90
.LBB0_19:                               #   in Loop: Header=BB0_11 Depth=1
	movl	%r11d, %edi
	andl	$-2, %edi
	xorl	%ecx, %ecx
	jmp	.LBB0_20
	.p2align	4, 0x90
.LBB0_25:                               #   in Loop: Header=BB0_20 Depth=2
	movl	%ebp, 4(%rax,%rcx,4)
	movl	%edx, 8(%rax,%rcx,4)
.LBB0_26:                               #   in Loop: Header=BB0_20 Depth=2
	movq	%rbx, %rcx
	cmpq	%rbx, %rdi
	je	.LBB0_14
.LBB0_20:                               #   Parent Loop BB0_11 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	4(%rax,%rcx,4), %ebp
	cmpl	%ebp, %edx
	jle	.LBB0_21
# %bb.22:                               #   in Loop: Header=BB0_20 Depth=2
	movl	%ebp, (%rax,%rcx,4)
	movl	%edx, 4(%rax,%rcx,4)
	jmp	.LBB0_23
	.p2align	4, 0x90
.LBB0_21:                               #   in Loop: Header=BB0_20 Depth=2
	movl	%ebp, %edx
.LBB0_23:                               #   in Loop: Header=BB0_20 Depth=2
	leaq	2(%rcx), %rbx
	movl	8(%rax,%rcx,4), %ebp
	cmpl	%ebp, %edx
	jg	.LBB0_25
# %bb.24:                               #   in Loop: Header=BB0_20 Depth=2
	movl	%ebp, %edx
	jmp	.LBB0_26
.LBB0_18:
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
