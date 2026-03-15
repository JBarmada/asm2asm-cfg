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
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	callq	strlen@PLT
	movb	$1, %cl
	cmpl	$2, %eax
	jl	.LBB0_7
# %bb.1:
	movzbl	(%rbx), %ecx
	leal	-1(%rax), %edx
	movslq	%edx, %rdx
	cmpb	(%rbx,%rdx), %cl
	jne	.LBB0_2
# %bb.3:
	movabsq	$-4294967296, %r8               # imm = 0xFFFFFFFF00000000
	movl	%eax, %r9d
	shrl	%r9d
	shlq	$32, %rax
	movabsq	$-8589934592, %rsi              # imm = 0xFFFFFFFE00000000
	addq	%rax, %rsi
	movl	$1, %edi
	.p2align	4, 0x90
.LBB0_4:                                # =>This Inner Loop Header: Depth=1
	movq	%rdi, %rax
	cmpq	%rdi, %r9
	je	.LBB0_6
# %bb.5:                                #   in Loop: Header=BB0_4 Depth=1
	movzbl	(%rbx,%rax), %edx
	movq	%rsi, %rcx
	sarq	$32, %rcx
	addq	%r8, %rsi
	leaq	1(%rax), %rdi
	cmpb	(%rbx,%rcx), %dl
	je	.LBB0_4
.LBB0_6:
	cmpq	%r9, %rax
	setae	%cl
	jmp	.LBB0_7
.LBB0_2:
	xorl	%ecx, %ecx
.LBB0_7:
	movl	%ecx, %eax
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
