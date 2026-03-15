	.text
	.file	"code.c"
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4                               # -- Begin function func0
.LCPI0_0:
	.zero	16,49
.LCPI0_1:
	.byte	49                              # 0x31
	.byte	49                              # 0x31
	.byte	49                              # 0x31
	.byte	49                              # 0x31
	.byte	49                              # 0x31
	.byte	49                              # 0x31
	.byte	49                              # 0x31
	.byte	49                              # 0x31
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.text
	.globl	func0
	.p2align	4, 0x90
	.type	func0,@function
func0:                                  # @func0
	.cfi_startproc
# %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r12
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r12, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rsi, %r14
	movq	%rdi, %rbx
	callq	strlen@PLT
	movq	%rax, %r12
	movq	%r14, %rdi
	callq	strlen@PLT
	movq	%rax, %r15
	cmpl	%r15d, %r12d
	cmovll	%r12d, %r15d
	leal	1(%r15), %eax
	movslq	%eax, %rdi
	callq	malloc@PLT
	testq	%rax, %rax
	je	.LBB0_19
# %bb.1:
	testl	%r15d, %r15d
	jle	.LBB0_18
# %bb.2:
	movl	%r15d, %r9d
	cmpl	$8, %r15d
	jae	.LBB0_5
# %bb.3:
	xorl	%edx, %edx
	jmp	.LBB0_4
.LBB0_5:
	cmpl	$32, %r15d
	jae	.LBB0_7
# %bb.6:
	xorl	%edx, %edx
	jmp	.LBB0_15
.LBB0_7:
	movl	%r9d, %edx
	andl	$-32, %edx
	leaq	-32(%rdx), %rsi
	movq	%rsi, %r8
	shrq	$5, %r8
	incq	%r8
	testq	%rsi, %rsi
	je	.LBB0_8
# %bb.9:
	movq	%r8, %rdi
	andq	$-2, %rdi
	xorl	%esi, %esi
	movdqa	.LCPI0_0(%rip), %xmm0           # xmm0 = [49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49]
	.p2align	4, 0x90
.LBB0_10:                               # =>This Inner Loop Header: Depth=1
	movdqu	(%rbx,%rsi), %xmm1
	movdqu	16(%rbx,%rsi), %xmm2
	movdqu	(%r14,%rsi), %xmm3
	pcmpeqb	%xmm1, %xmm3
	movdqu	16(%r14,%rsi), %xmm1
	pcmpeqb	%xmm2, %xmm1
	paddb	%xmm0, %xmm3
	paddb	%xmm0, %xmm1
	movdqu	%xmm3, (%rax,%rsi)
	movdqu	%xmm1, 16(%rax,%rsi)
	movdqu	32(%rbx,%rsi), %xmm1
	movdqu	48(%rbx,%rsi), %xmm2
	movdqu	32(%r14,%rsi), %xmm3
	pcmpeqb	%xmm1, %xmm3
	movdqu	48(%r14,%rsi), %xmm1
	pcmpeqb	%xmm2, %xmm1
	paddb	%xmm0, %xmm3
	paddb	%xmm0, %xmm1
	movdqu	%xmm3, 32(%rax,%rsi)
	movdqu	%xmm1, 48(%rax,%rsi)
	addq	$64, %rsi
	addq	$-2, %rdi
	jne	.LBB0_10
# %bb.11:
	testb	$1, %r8b
	je	.LBB0_13
.LBB0_12:
	movdqu	(%rbx,%rsi), %xmm0
	movdqu	16(%rbx,%rsi), %xmm1
	movdqu	(%r14,%rsi), %xmm2
	pcmpeqb	%xmm0, %xmm2
	movdqu	16(%r14,%rsi), %xmm0
	pcmpeqb	%xmm1, %xmm0
	movdqa	.LCPI0_0(%rip), %xmm1           # xmm1 = [49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49]
	paddb	%xmm1, %xmm2
	paddb	%xmm1, %xmm0
	movdqu	%xmm2, (%rax,%rsi)
	movdqu	%xmm0, 16(%rax,%rsi)
.LBB0_13:
	cmpq	%r9, %rdx
	je	.LBB0_18
# %bb.14:
	testb	$24, %r9b
	je	.LBB0_4
.LBB0_15:
	movq	%rdx, %rsi
	movl	%r9d, %edx
	andl	$-8, %edx
	movdqa	.LCPI0_1(%rip), %xmm0           # xmm0 = <49,49,49,49,49,49,49,49,u,u,u,u,u,u,u,u>
	.p2align	4, 0x90
.LBB0_16:                               # =>This Inner Loop Header: Depth=1
	movq	(%rbx,%rsi), %xmm1              # xmm1 = mem[0],zero
	movq	(%r14,%rsi), %xmm2              # xmm2 = mem[0],zero
	pcmpeqb	%xmm1, %xmm2
	paddb	%xmm0, %xmm2
	movq	%xmm2, (%rax,%rsi)
	addq	$8, %rsi
	cmpq	%rsi, %rdx
	jne	.LBB0_16
# %bb.17:
	cmpq	%r9, %rdx
	je	.LBB0_18
	.p2align	4, 0x90
.LBB0_4:                                # =>This Inner Loop Header: Depth=1
	movzbl	(%rbx,%rdx), %ecx
	cmpb	(%r14,%rdx), %cl
	sete	%cl
	xorb	$49, %cl
	movb	%cl, (%rax,%rdx)
	incq	%rdx
	cmpq	%rdx, %r9
	jne	.LBB0_4
.LBB0_18:
	movslq	%r15d, %rcx
	movb	$0, (%rax,%rcx)
.LBB0_19:
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.LBB0_8:
	.cfi_def_cfa_offset 48
	xorl	%esi, %esi
	testb	$1, %r8b
	jne	.LBB0_12
	jmp	.LBB0_13
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
