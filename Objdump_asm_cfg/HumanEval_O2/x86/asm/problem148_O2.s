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
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	%edi, %ebx
	movslq	%edi, %rbp
	leaq	(,%rbp,4), %rdi
	callq	malloc@PLT
	movq	%rax, 16(%rsp)                  # 8-byte Spill
	movq	%rbp, 8(%rsp)                   # 8-byte Spill
	leal	1(%rbp), %r12d
	movslq	%r12d, %r15
	shlq	$3, %r15
	movq	%r15, %rdi
	callq	malloc@PLT
	movq	%rax, %r14
	movq	%r15, %rdi
	callq	malloc@PLT
	movq	%rax, %r15
	xorl	%r13d, %r13d
	.p2align	4, 0x90
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	movl	$3, %edi
	movl	$4, %esi
	callq	calloc@PLT
	movq	%rax, (%r14,%r13,8)
	movl	$3, %edi
	movl	$4, %esi
	callq	calloc@PLT
	movq	%rax, (%r15,%r13,8)
	incq	%r13
	cmpq	%r13, %r12
	jne	.LBB0_1
# %bb.2:
	movq	(%r14), %rax
	movq	(%r15), %r9
	movl	$0, 8(%rax)
	movq	$0, (%rax)
	movl	$0, 8(%r9)
	movq	$0, (%r9)
	movl	%ebx, %r11d
	testl	%ebx, %ebx
	movq	16(%rsp), %r10                  # 8-byte Reload
	jle	.LBB0_8
# %bb.3:
	movl	$1, %edx
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB0_4:                                # =>This Inner Loop Header: Depth=1
	movl	%edx, %edi
	imull	%edx, %edi
	addl	%esi, %edi
	movslq	%edi, %rdi
	imulq	$1431655766, %rdi, %rbp         # imm = 0x55555556
	movq	%rbp, %rbx
	shrq	$63, %rbx
	shrq	$32, %rbp
	addl	%ebx, %ebp
	leal	(%rbp,%rbp,2), %ebp
	subl	%ebp, %edi
	movl	%edi, -4(%r10,%rdx,4)
	movq	(%r14,%rdx,8), %rcx
	movl	(%rax), %ebp
	movl	%ebp, (%rcx)
	movl	4(%rax), %ebp
	movl	%ebp, 4(%rcx)
	movl	8(%rax), %eax
	movl	%eax, 8(%rcx)
	movslq	%edi, %rax
	incl	(%rcx,%rax,4)
	incq	%rdx
	decl	%esi
	movq	%rcx, %rax
	cmpq	%rdx, %r12
	jne	.LBB0_4
# %bb.5:
	testl	%r11d, %r11d
	jle	.LBB0_8
# %bb.6:
	leaq	-1(%r12), %r8
	xorl	%edx, %edx
	movq	%r9, %rcx
	.p2align	4, 0x90
.LBB0_7:                                # =>This Inner Loop Header: Depth=1
	movq	8(%r15,%rdx,8), %rsi
	movl	(%rcx), %eax
	movl	%eax, (%rsi)
	movl	4(%rcx), %eax
	movl	%eax, 4(%rsi)
	movl	8(%rcx), %eax
	movl	%eax, 8(%rsi)
	movq	(%r14,%rdx,8), %rdi
	movslq	(%r10,%rdx,4), %rcx
	imulq	$1431655766, %rcx, %rax         # imm = 0x55555556
	movq	%rax, %rbp
	shrq	$63, %rbp
	shrq	$32, %rax
	addl	%ebp, %eax
	leal	(%rax,%rax,2), %eax
	leal	1(%rcx), %ebp
	movslq	%ebp, %rbp
	imulq	$1431655766, %rbp, %rbp         # imm = 0x55555556
	movq	%rbp, %rbx
	shrq	$63, %rbx
	shrq	$32, %rbp
	addl	%ebx, %ebp
	leal	(%rbp,%rbp,2), %ebp
	negl	%ebp
	addl	%ecx, %ebp
	incl	%ebp
	movl	%ecx, %ebx
	subl	%eax, %ebx
	movl	(%rdi), %eax
	movslq	%ebx, %rbx
	addl	%eax, (%rsi,%rbx,4)
	leal	2(%rcx), %eax
	cltq
	imulq	$1431655766, %rax, %rax         # imm = 0x55555556
	movq	%rax, %rbx
	shrq	$63, %rbx
	shrq	$32, %rax
	addl	%ebx, %eax
	leal	(%rax,%rax,2), %eax
	negl	%eax
	addl	%ecx, %eax
	addl	$2, %eax
	movl	4(%rdi), %ecx
	movslq	%ebp, %rbp
	addl	%ecx, (%rsi,%rbp,4)
	movl	8(%rdi), %ecx
	cltq
	addl	%ecx, (%rsi,%rax,4)
	incq	%rdx
	movq	%rsi, %rcx
	cmpq	%rdx, %r8
	jne	.LBB0_7
.LBB0_8:
	testl	%r11d, %r11d
	js	.LBB0_15
# %bb.9:
	je	.LBB0_10
# %bb.11:
	movl	%r12d, %edx
	andl	$-2, %edx
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB0_12:                               # =>This Inner Loop Header: Depth=1
	movq	(%r15,%rcx,8), %rax
	movq	(%r14,%rcx,8), %rsi
	movl	(%rax), %edi
	movl	%edi, (%rsi)
	movl	$0, (%rax)
	movl	4(%rax), %edi
	movl	%edi, 4(%rsi)
	movl	$0, 4(%rax)
	movl	8(%rax), %edi
	movl	%edi, 8(%rsi)
	movl	$0, 8(%rax)
	movq	8(%r15,%rcx,8), %rax
	movq	8(%r14,%rcx,8), %rsi
	movl	(%rax), %edi
	movl	%edi, (%rsi)
	movl	$0, (%rax)
	movl	4(%rax), %edi
	movl	%edi, 4(%rsi)
	movl	$0, 4(%rax)
	movl	8(%rax), %edi
	movl	%edi, 8(%rsi)
	movl	$0, 8(%rax)
	addq	$2, %rcx
	cmpq	%rcx, %rdx
	jne	.LBB0_12
# %bb.13:
	testb	$1, %r12b
	je	.LBB0_15
.LBB0_14:
	movq	(%r15,%rcx,8), %rax
	movq	(%r14,%rcx,8), %rcx
	movl	(%rax), %edx
	movl	%edx, (%rcx)
	movl	$0, (%rax)
	movl	4(%rax), %edx
	movl	%edx, 4(%rcx)
	movl	$0, 4(%rax)
	movl	8(%rax), %edx
	movl	%edx, 8(%rcx)
	movl	$0, 8(%rax)
.LBB0_15:
	testl	%r11d, %r11d
	jle	.LBB0_18
# %bb.16:
	leaq	-1(%r12), %r8
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB0_17:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r15,%rdx,8), %rsi
	movl	(%r9), %eax
	movl	%eax, (%rsi)
	movl	4(%r9), %eax
	movl	%eax, 4(%rsi)
	movl	8(%r9), %eax
	movl	%eax, 8(%rsi)
	movq	(%r14,%rdx,8), %rax
	movslq	(%r10,%rdx,4), %rdi
	imulq	$1431655766, %rdi, %rbp         # imm = 0x55555556
	movq	%rbp, %rbx
	shrq	$63, %rbx
	shrq	$32, %rbp
	addl	%ebx, %ebp
	leal	(%rbp,%rbp,2), %ebp
	leal	1(%rdi), %ebx
	movslq	%ebx, %rbx
	imulq	$1431655766, %rbx, %rbx         # imm = 0x55555556
	movq	%rbx, %rcx
	shrq	$63, %rcx
	shrq	$32, %rbx
	addl	%ecx, %ebx
	leal	(%rbx,%rbx,2), %ecx
	negl	%ecx
	addl	%edi, %ecx
	incl	%ecx
	movl	%edi, %ebx
	subl	%ebp, %ebx
	movl	(%rax), %ebp
	movslq	%ebx, %rbx
	addl	%ebp, (%rsi,%rbx,4)
	leal	2(%rdi), %ebp
	movslq	%ebp, %rbp
	imulq	$1431655766, %rbp, %rbp         # imm = 0x55555556
	movq	%rbp, %rbx
	shrq	$63, %rbx
	shrq	$32, %rbp
	addl	%ebx, %ebp
	leal	(%rbp,%rbp,2), %ebp
	negl	%ebp
	addl	%ebp, %edi
	addl	$2, %edi
	movl	4(%rax), %ebp
	movslq	%ecx, %rcx
	addl	%ebp, (%rsi,%rcx,4)
	movl	8(%rax), %eax
	movslq	%edi, %rcx
	addl	%eax, (%rsi,%rcx,4)
	incq	%rdx
	movq	%rsi, %r9
	cmpq	%rdx, %r8
	jne	.LBB0_17
.LBB0_18:
	testl	%r11d, %r11d
	js	.LBB0_19
# %bb.20:
	je	.LBB0_21
# %bb.22:
	movl	%r12d, %ecx
	andl	$-2, %ecx
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB0_23:                               # =>This Inner Loop Header: Depth=1
	movq	(%r15,%rax,8), %rdx
	movq	(%r14,%rax,8), %rsi
	movl	(%rdx), %edi
	movl	%edi, (%rsi)
	movl	$0, (%rdx)
	movl	4(%rdx), %edi
	movl	%edi, 4(%rsi)
	movl	$0, 4(%rdx)
	movl	8(%rdx), %edi
	movl	%edi, 8(%rsi)
	movl	$0, 8(%rdx)
	movq	8(%r15,%rax,8), %rdx
	movq	8(%r14,%rax,8), %rsi
	movl	(%rdx), %edi
	movl	%edi, (%rsi)
	movl	$0, (%rdx)
	movl	4(%rdx), %edi
	movl	%edi, 4(%rsi)
	movl	$0, 4(%rdx)
	movl	8(%rdx), %edi
	movl	%edi, 8(%rsi)
	movl	$0, 8(%rdx)
	addq	$2, %rax
	cmpq	%rax, %rcx
	jne	.LBB0_23
# %bb.24:
	testb	$1, %r12b
	je	.LBB0_26
.LBB0_25:
	movq	(%r15,%rax,8), %rcx
	movq	(%r14,%rax,8), %rax
	movl	(%rcx), %edx
	movl	%edx, (%rax)
	movl	$0, (%rcx)
	movl	4(%rcx), %edx
	movl	%edx, 4(%rax)
	movl	$0, 4(%rcx)
	movl	8(%rcx), %edx
	movl	%edx, 8(%rax)
	movl	$0, 8(%rcx)
.LBB0_26:
	movq	8(%rsp), %rax                   # 8-byte Reload
	movq	(%r14,%rax,8), %rax
	movl	(%rax), %r13d
	testl	%r11d, %r11d
	js	.LBB0_29
# %bb.27:
	xorl	%ebp, %ebp
	.p2align	4, 0x90
.LBB0_28:                               # =>This Inner Loop Header: Depth=1
	movq	(%r14,%rbp,8), %rdi
	callq	free@PLT
	movq	(%r15,%rbp,8), %rdi
	callq	free@PLT
	incq	%rbp
	cmpq	%rbp, %r12
	jne	.LBB0_28
	jmp	.LBB0_29
.LBB0_19:
	movq	8(%rsp), %rax                   # 8-byte Reload
	movq	(%r14,%rax,8), %rax
	movl	(%rax), %r13d
.LBB0_29:
	movq	%r14, %rdi
	callq	free@PLT
	movq	%r15, %rdi
	callq	free@PLT
	movq	16(%rsp), %rdi                  # 8-byte Reload
	callq	free@PLT
	movl	%r13d, %eax
	addq	$24, %rsp
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
.LBB0_10:
	.cfi_def_cfa_offset 80
	xorl	%ecx, %ecx
	testb	$1, %r12b
	jne	.LBB0_14
	jmp	.LBB0_15
.LBB0_21:
	xorl	%eax, %eax
	testb	$1, %r12b
	jne	.LBB0_25
	jmp	.LBB0_26
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
