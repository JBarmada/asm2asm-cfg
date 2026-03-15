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
	subq	$56, %rsp
	.cfi_def_cfa_offset 96
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	%esi, %r14d
	movl	%edi, %edx
	leaq	func0.xs(%rip), %r15
	leaq	.L.str(%rip), %rsi
	movq	%r15, %rdi
	xorl	%eax, %eax
	callq	sprintf@PLT
	movq	%r15, %rdi
	callq	strlen@PLT
	movl	%eax, %ebp
	subl	%r14d, %ebp
	jge	.LBB0_9
# %bb.1:
	cmpl	$2, %eax
	jl	.LBB0_8
# %bb.2:
	movq	%rax, %r8
	shrq	%r8
	movl	%r8d, %r11d
	andl	$2147483647, %r11d              # imm = 0x7FFFFFFF
	andl	$1, %r8d
	cmpq	$1, %r11
	jne	.LBB0_4
# %bb.3:
	xorl	%edx, %edx
	jmp	.LBB0_6
.LBB0_9:
	movslq	%eax, %rsi
	addq	%r15, %rsi
	movslq	%r14d, %rbx
	subq	%rbx, %rsi
	movq	%rsp, %r14
	movq	%r14, %rdi
	callq	strcpy@PLT
	movb	$0, (%rsp,%rbx)
	movslq	%ebp, %rdx
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	strncat@PLT
	movq	%r15, %rdi
	movq	%r14, %rsi
	callq	strcpy@PLT
	jmp	.LBB0_8
.LBB0_4:
	movabsq	$-8589934592, %r9               # imm = 0xFFFFFFFE00000000
	subq	%r8, %r11
	movq	%rax, %rdx
	shlq	$32, %rdx
	leaq	(%rdx,%r9), %rsi
	movabsq	$-4294967296, %rdi              # imm = 0xFFFFFFFF00000000
	addq	%rdx, %rdi
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB0_5:                                # =>This Inner Loop Header: Depth=1
	movzbl	(%rdx,%r15), %r10d
	movq	%rdi, %rcx
	sarq	$32, %rcx
	movzbl	(%rcx,%r15), %ebx
	movb	%bl, (%rdx,%r15)
	movb	%r10b, (%rcx,%r15)
	movzbl	1(%rdx,%r15), %ecx
	movq	%rsi, %rbp
	sarq	$32, %rbp
	movzbl	(%rbp,%r15), %ebx
	movb	%bl, 1(%rdx,%r15)
	movb	%cl, (%rbp,%r15)
	addq	$2, %rdx
	addq	%r9, %rsi
	addq	%r9, %rdi
	cmpq	%rdx, %r11
	jne	.LBB0_5
.LBB0_6:
	testq	%r8, %r8
	je	.LBB0_8
# %bb.7:
	movzbl	(%rdx,%r15), %ecx
	movl	%edx, %esi
	notl	%esi
	addl	%eax, %esi
	movslq	%esi, %rax
	movzbl	(%rax,%r15), %ebx
	movb	%bl, (%rdx,%r15)
	movb	%cl, (%rax,%r15)
.LBB0_8:
	leaq	func0.xs(%rip), %rax
	addq	$56, %rsp
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
	.type	func0.xs,@object                # @func0.xs
	.local	func0.xs
	.comm	func0.xs,50,16
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%d"
	.size	.L.str, 3

	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym func0.xs
