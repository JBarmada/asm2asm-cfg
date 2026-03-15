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
	pushq	%rbx
	.cfi_def_cfa_offset 24
	subq	$408, %rsp                      # imm = 0x198
	.cfi_def_cfa_offset 432
	.cfi_offset %rbx, -24
	.cfi_offset %rbp, -16
	movl	%edi, %ebx
	movq	%rsp, %rdi
	xorl	%ebp, %ebp
	movl	$400, %edx                      # imm = 0x190
	xorl	%esi, %esi
	callq	memset@PLT
	movl	$1, 8(%rsp)
	cmpl	$3, %ebx
	jl	.LBB0_5
# %bb.1:
	movl	%ebx, %r8d
	jne	.LBB0_6
# %bb.2:
	movl	$3, %ecx
	movl	$1, %edx
	jmp	.LBB0_3
.LBB0_6:
	leaq	-2(%r8), %rsi
	andq	$-2, %rsi
	negq	%rsi
	movl	$3, %ecx
	movl	$1, %edx
	xorl	%edi, %edi
	.p2align	4, 0x90
.LBB0_7:                                # =>This Inner Loop Header: Depth=1
	movl	-8(%rsp,%rcx,4), %eax
	movl	-4(%rsp,%rcx,4), %ebp
	addl	%eax, %edx
	addl	%edi, %edx
	movl	%edx, (%rsp,%rcx,4)
	addl	%ebp, %edx
	addl	%eax, %edx
	movl	%edx, 4(%rsp,%rcx,4)
	leaq	(%rsi,%rcx), %rax
	addq	$2, %rax
	addq	$2, %rcx
	movl	%ebp, %edi
	cmpq	$3, %rax
	jne	.LBB0_7
.LBB0_3:
	testb	$1, %r8b
	je	.LBB0_5
# %bb.4:
	addl	-8(%rsp,%rcx,4), %edx
	addl	%ebp, %edx
	movl	%edx, (%rsp,%rcx,4)
.LBB0_5:
	movslq	%ebx, %rax
	movl	(%rsp,%rax,4), %eax
	addq	$408, %rsp                      # imm = 0x198
	.cfi_def_cfa_offset 24
	popq	%rbx
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
