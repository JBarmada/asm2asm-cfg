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
	subq	$4000, %rsp                     # imm = 0xFA0
	.cfi_def_cfa_offset 4016
	.cfi_offset %rbx, -16
	movl	%edi, %ebx
	movq	%rsp, %rdi
	movl	$4000, %edx                     # imm = 0xFA0
	xorl	%esi, %esi
	callq	memset@PLT
	movl	$1, 4(%rsp)
	cmpl	$2, %ebx
	jl	.LBB0_6
# %bb.1:
	movl	%ebx, %ecx
	leaq	-1(%rcx), %rdx
	addq	$-2, %rcx
	movl	%edx, %eax
	andl	$3, %eax
	cmpq	$3, %rcx
	jae	.LBB0_7
# %bb.2:
	movl	$2, %esi
	movl	$1, %ecx
	jmp	.LBB0_3
.LBB0_7:
	andq	$-4, %rdx
	negq	%rdx
	movl	$2, %esi
	movl	$1, %ecx
	.p2align	4, 0x90
.LBB0_8:                                # =>This Inner Loop Header: Depth=1
	addl	-8(%rsp,%rsi,4), %ecx
	movl	%ecx, (%rsp,%rsi,4)
	movl	-4(%rsp,%rsi,4), %edi
	addl	%ecx, %edi
	movl	%edi, 4(%rsp,%rsi,4)
	addl	%edi, %ecx
	movl	%ecx, 8(%rsp,%rsi,4)
	addl	%edi, %ecx
	movl	%ecx, 12(%rsp,%rsi,4)
	leaq	(%rdx,%rsi), %rdi
	addq	$4, %rdi
	addq	$4, %rsi
	cmpq	$2, %rdi
	jne	.LBB0_8
.LBB0_3:
	testq	%rax, %rax
	je	.LBB0_6
# %bb.4:
	leaq	(%rsp,%rsi,4), %rdx
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB0_5:                                # =>This Inner Loop Header: Depth=1
	addl	-8(%rdx,%rsi,4), %ecx
	movl	%ecx, (%rdx,%rsi,4)
	incq	%rsi
	cmpq	%rsi, %rax
	jne	.LBB0_5
.LBB0_6:
	movslq	%ebx, %rax
	movl	(%rsp,%rax,4), %eax
	addq	$4000, %rsp                     # imm = 0xFA0
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
