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
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %rbp, -16
	movl	%edi, %ebp
	movl	$64, %edi
	callq	malloc@PLT
	testq	%rax, %rax
	je	.LBB0_1
# %bb.2:
	movq	%rax, %rbx
	movb	$0, 63(%rax)
	testl	%ebp, %ebp
	je	.LBB0_5
# %bb.3:
	jle	.LBB0_4
# %bb.6:
	movl	$62, %eax
	movl	%ebp, %ecx
	.p2align	4, 0x90
.LBB0_7:                                # =>This Inner Loop Header: Depth=1
	movl	%ebp, %edx
	andb	$1, %dl
	orb	$48, %dl
	movb	%dl, (%rbx,%rax)
	decq	%rax
	shrl	%ecx
	cmpl	$1, %ebp
	movl	%ecx, %ebp
	ja	.LBB0_7
	jmp	.LBB0_8
.LBB0_1:
	xorl	%ebp, %ebp
	jmp	.LBB0_12
.LBB0_5:
	movb	$48, 62(%rbx)
	movl	$61, %eax
	jmp	.LBB0_8
.LBB0_4:
	movl	$62, %eax
.LBB0_8:
	movslq	%eax, %r14
	movw	$25188, -1(%r14,%rbx)           # imm = 0x6264
	movl	$66, %eax
	subl	%r14d, %eax
	movslq	%eax, %rdi
	callq	malloc@PLT
	testq	%rax, %rax
	je	.LBB0_9
# %bb.10:
	movq	%rax, %rbp
	leaq	(%r14,%rbx), %rsi
	decq	%rsi
	movq	%rax, %rdi
	callq	strcpy@PLT
	movq	%rbp, %rdi
	callq	strlen@PLT
	movw	$25188, (%rbp,%rax)             # imm = 0x6264
	movb	$0, 2(%rbp,%rax)
	jmp	.LBB0_11
.LBB0_9:
	xorl	%ebp, %ebp
.LBB0_11:
	movq	%rbx, %rdi
	callq	free@PLT
.LBB0_12:
	movq	%rbp, %rax
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"db"
	.size	.L.str, 3

	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
