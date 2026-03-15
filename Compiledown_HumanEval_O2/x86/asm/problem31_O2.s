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
	movl	%esi, %r15d
	movq	%rdi, %rbx
	movslq	%esi, %rbp
	leaq	(,%rbp,4), %rdi
	callq	malloc@PLT
	movl	$0, (%r14)
	testl	%ebp, %ebp
	jle	.LBB0_6
# %bb.1:
	movl	%r15d, %ecx
	cmpl	$1, %r15d
	jne	.LBB0_7
# %bb.2:
	xorl	%edx, %edx
	xorl	%esi, %esi
.LBB0_3:
	testb	$1, %cl
	je	.LBB0_6
# %bb.4:
	movss	(%rbx,%rsi,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	xorps	%xmm1, %xmm1
	ucomiss	%xmm1, %xmm0
	jbe	.LBB0_6
# %bb.5:
	leal	1(%rdx), %ecx
	movl	%ecx, (%r14)
	movslq	%edx, %rcx
	movss	%xmm0, (%rax,%rcx,4)
.LBB0_6:
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
.LBB0_7:
	.cfi_def_cfa_offset 48
	movl	%ecx, %edi
	andl	$-2, %edi
	xorl	%edx, %edx
	xorps	%xmm0, %xmm0
	xorl	%esi, %esi
	jmp	.LBB0_8
	.p2align	4, 0x90
.LBB0_12:                               #   in Loop: Header=BB0_8 Depth=1
	addq	$2, %rsi
	cmpq	%rsi, %rdi
	je	.LBB0_3
.LBB0_8:                                # =>This Inner Loop Header: Depth=1
	movss	(%rbx,%rsi,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	ucomiss	%xmm0, %xmm1
	jbe	.LBB0_10
# %bb.9:                                #   in Loop: Header=BB0_8 Depth=1
	movslq	%edx, %rbp
	incl	%edx
	movl	%edx, (%r14)
	movss	%xmm1, (%rax,%rbp,4)
                                        # kill: def $edx killed $edx def $rdx
.LBB0_10:                               #   in Loop: Header=BB0_8 Depth=1
	movss	4(%rbx,%rsi,4), %xmm1           # xmm1 = mem[0],zero,zero,zero
	ucomiss	%xmm0, %xmm1
	jbe	.LBB0_12
# %bb.11:                               #   in Loop: Header=BB0_8 Depth=1
	movslq	%edx, %rbp
	incl	%edx
	movl	%edx, (%r14)
	movss	%xmm1, (%rax,%rbp,4)
                                        # kill: def $edx killed $edx def $rdx
	jmp	.LBB0_12
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
