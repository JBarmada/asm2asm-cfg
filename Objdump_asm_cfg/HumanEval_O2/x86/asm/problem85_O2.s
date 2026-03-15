	.text
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	4, 0x90
	.type	func0,@function
func0:                                  # @func0
	.cfi_startproc
# %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	movl	%edi, %edx
	leaq	.L.str(%rip), %rsi
	xorl	%ebx, %ebx
	leaq	10(%rsp), %rdi
	xorl	%eax, %eax
	callq	sprintf@PLT
	movzbl	10(%rsp), %eax
	testb	%al, %al
	je	.LBB0_10
# %bb.1:
	leaq	11(%rsp), %rcx
	.p2align	4, 0x90
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
	movsbl	%al, %eax
	addl	%eax, %ebx
	addl	$-48, %ebx
	movzbl	(%rcx), %eax
	incq	%rcx
	testb	%al, %al
	jne	.LBB0_2
# %bb.3:
	movl	$33, %edi
	callq	malloc@PLT
	testl	%ebx, %ebx
	je	.LBB0_11
# %bb.4:
	jle	.LBB0_14
# %bb.5:
	xorl	%esi, %esi
	movl	%ebx, %edx
	.p2align	4, 0x90
.LBB0_6:                                # =>This Inner Loop Header: Depth=1
	movl	%ebx, %ecx
	andb	$1, %cl
	orb	$48, %cl
	movb	%cl, (%rax,%rsi)
	incq	%rsi
	shrl	%edx
	cmpl	$2, %ebx
	movl	%edx, %ebx
	jae	.LBB0_6
# %bb.7:
	movb	$0, (%rax,%rsi)
	testl	$-2, %esi
	je	.LBB0_13
# %bb.8:
	movq	%rsi, %r8
	shrq	%r8
	cmpq	$1, %r8
	jne	.LBB0_15
# %bb.9:
	xorl	%edx, %edx
	jmp	.LBB0_17
.LBB0_10:
	movl	$33, %edi
	callq	malloc@PLT
.LBB0_11:
	movb	$48, (%rax)
	movl	$1, %ecx
.LBB0_12:
	movb	$0, (%rax,%rcx)
.LBB0_13:
	addq	$16, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.LBB0_14:
	.cfi_def_cfa_offset 32
	xorl	%ecx, %ecx
	jmp	.LBB0_12
.LBB0_15:
	leaq	-1(%rsi), %rdi
	andq	$-2, %r8
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB0_16:                               # =>This Inner Loop Header: Depth=1
	movzbl	(%rax,%rdx), %ebx
	movzbl	(%rax,%rdi), %ecx
	movb	%cl, (%rax,%rdx)
	movb	%bl, (%rax,%rdi)
	movzbl	1(%rax,%rdx), %ecx
	movzbl	-1(%rax,%rdi), %ebx
	movb	%bl, 1(%rax,%rdx)
	movb	%cl, -1(%rax,%rdi)
	addq	$2, %rdx
	addq	$-2, %rdi
	cmpq	%rdx, %r8
	jne	.LBB0_16
.LBB0_17:
	testb	$2, %sil
	je	.LBB0_13
# %bb.18:
	movzbl	(%rax,%rdx), %ecx
	movq	%rax, %rdi
	subq	%rdx, %rdi
	movzbl	-1(%rdi,%rsi), %ebx
	movb	%bl, (%rax,%rdx)
	movb	%cl, -1(%rdi,%rsi)
	jmp	.LBB0_13
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%d"
	.size	.L.str, 3

	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
