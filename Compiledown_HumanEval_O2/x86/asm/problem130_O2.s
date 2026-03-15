	.text
	.file	"code.c"
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4                               # -- Begin function func0
.LCPI0_0:
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	1                               # 0x1
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
.LCPI0_1:
	.quad	2                               # 0x2
	.quad	3                               # 0x3
.LCPI0_2:
	.quad	1                               # 0x1
	.quad	1                               # 0x1
.LCPI0_3:
	.quad	16                              # 0x10
	.quad	16                              # 0x10
	.text
	.globl	func0
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
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	%edx, %r14d
	testl	%esi, %esi
	jle	.LBB0_1
# %bb.2:
	movl	%esi, %r9d
	leaq	-1(%r9), %r8
	movl	%r9d, %r10d
	andl	$3, %r10d
	movl	%r9d, %r11d
	andl	$-4, %r11d
	xorl	%r15d, %r15d
                                        # implicit-def: $eax
                                        # implicit-def: $edx
	jmp	.LBB0_3
	.p2align	4, 0x90
.LBB0_8:                                #   in Loop: Header=BB0_3 Depth=1
	incq	%r15
	cmpq	%r9, %r15
	je	.LBB0_9
.LBB0_3:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_4 Depth 2
                                        #     Child Loop BB0_7 Depth 2
	movq	(%rdi,%r15,8), %r12
	xorl	%ebp, %ebp
	cmpq	$3, %r8
	jb	.LBB0_5
	.p2align	4, 0x90
.LBB0_4:                                #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	leal	1(%rbp), %ebx
	cmpl	$1, (%r12,%rbp,4)
	cmovel	%ebp, %eax
	cmovel	%r15d, %edx
	cmpl	$1, 4(%r12,%rbp,4)
	cmovel	%ebx, %eax
	cmovel	%r15d, %edx
	cmpl	$1, 8(%r12,%rbp,4)
	leal	2(%rbp), %r13d
	movl	%eax, %ebx
	cmovel	%r13d, %ebx
	cmovel	%r15d, %edx
	leal	3(%rbp), %eax
	cmpl	$1, 12(%r12,%rbp,4)
	cmovel	%r15d, %edx
	cmovnel	%ebx, %eax
	addq	$4, %rbp
	cmpq	%r11, %rbp
	jne	.LBB0_4
.LBB0_5:                                #   in Loop: Header=BB0_3 Depth=1
	testq	%r10, %r10
	je	.LBB0_8
# %bb.6:                                #   in Loop: Header=BB0_3 Depth=1
	movq	%r10, %rbx
	.p2align	4, 0x90
.LBB0_7:                                #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$1, (%r12,%rbp,4)
	cmovel	%r15d, %edx
	cmovel	%ebp, %eax
	incq	%rbp
	decq	%rbx
	jne	.LBB0_7
	jmp	.LBB0_8
.LBB0_9:
	movl	%esi, %ebp
	imull	%esi, %ebp
	movslq	%eax, %r8
	testl	%edx, %edx
	jle	.LBB0_11
# %bb.10:
	leal	-1(%rdx), %ebx
	movq	(%rdi,%rbx,8), %rbx
	movl	(%rbx,%r8,4), %ebx
	cmpl	%ebp, %ebx
	cmovll	%ebx, %ebp
.LBB0_11:
	decl	%esi
	movslq	%edx, %rbx
	cmpl	%esi, %edx
	jge	.LBB0_13
# %bb.12:
	movq	8(%rdi,%rbx,8), %rdx
	movl	(%rdx,%r8,4), %edx
	cmpl	%ebp, %edx
	cmovll	%edx, %ebp
.LBB0_13:
	testl	%eax, %eax
	jle	.LBB0_15
# %bb.14:
	movq	(%rdi,%rbx,8), %r9
	leal	-1(%rax), %edx
	movl	(%r9,%rdx,4), %edx
	cmpl	%ebp, %edx
	cmovll	%edx, %ebp
.LBB0_15:
	cmpl	%esi, %eax
	jge	.LBB0_17
# %bb.16:
	movq	(%rdi,%rbx,8), %rax
	movl	4(%rax,%r8,4), %eax
	cmpl	%ebp, %eax
	cmovll	%eax, %ebp
	jmp	.LBB0_17
.LBB0_1:
	imull	%esi, %esi
	movl	%esi, %ebp
.LBB0_17:
	movl	%r14d, (%rcx)
	movslq	%r14d, %rbx
	leaq	(,%rbx,4), %rdi
	callq	malloc@PLT
	testl	%ebx, %ebx
	jle	.LBB0_29
# %bb.18:
	movl	%r14d, %ecx
	cmpl	$8, %r14d
	jae	.LBB0_20
# %bb.19:
	xorl	%edx, %edx
	jmp	.LBB0_27
.LBB0_20:
	movl	%ecx, %edx
	andl	$-8, %edx
	movd	%ebp, %xmm0
	pshufd	$0, %xmm0, %xmm8                # xmm8 = xmm0[0,0,0,0]
	leaq	-8(%rdx), %rsi
	movq	%rsi, %rbx
	shrq	$3, %rbx
	incq	%rbx
	testq	%rsi, %rsi
	je	.LBB0_21
# %bb.22:
	movq	%rbx, %rdi
	andq	$-2, %rdi
	movdqa	.LCPI0_1(%rip), %xmm5           # xmm5 = [2,3]
	movdqa	.LCPI0_0(%rip), %xmm0           # xmm0 = [0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0]
	xorl	%esi, %esi
	movdqa	.LCPI0_2(%rip), %xmm9           # xmm9 = [1,1]
	pxor	%xmm10, %xmm10
	movdqa	.LCPI0_3(%rip), %xmm7           # xmm7 = [16,16]
	.p2align	4, 0x90
.LBB0_23:                               # =>This Inner Loop Header: Depth=1
	movdqa	%xmm5, %xmm3
	pand	%xmm9, %xmm3
	movdqa	%xmm0, %xmm4
	pand	%xmm9, %xmm4
	movdqa	%xmm4, %xmm1
	pcmpeqd	%xmm10, %xmm1
	movdqa	%xmm3, %xmm2
	pcmpeqd	%xmm10, %xmm2
	movdqa	%xmm1, %xmm6
	shufps	$221, %xmm2, %xmm6              # xmm6 = xmm6[1,3],xmm2[1,3]
	shufps	$136, %xmm2, %xmm1              # xmm1 = xmm1[0,2],xmm2[0,2]
	andps	%xmm6, %xmm1
	movaps	%xmm1, %xmm2
	andnps	%xmm8, %xmm2
	movaps	%xmm2, %xmm6
	psubd	%xmm1, %xmm6
	psrld	$31, %xmm1
	por	%xmm2, %xmm1
	movdqu	%xmm6, (%rax,%rsi,4)
	movdqu	%xmm1, 16(%rax,%rsi,4)
	movdqu	%xmm6, 32(%rax,%rsi,4)
	movdqu	%xmm1, 48(%rax,%rsi,4)
	addq	$16, %rsi
	paddq	%xmm7, %xmm0
	paddq	%xmm7, %xmm5
	addq	$-2, %rdi
	jne	.LBB0_23
# %bb.24:
	testb	$1, %bl
	je	.LBB0_26
.LBB0_25:
	pxor	%xmm0, %xmm0
	pcmpeqd	%xmm0, %xmm4
	pcmpeqd	%xmm0, %xmm3
	movdqa	%xmm4, %xmm0
	shufps	$221, %xmm3, %xmm0              # xmm0 = xmm0[1,3],xmm3[1,3]
	shufps	$136, %xmm3, %xmm4              # xmm4 = xmm4[0,2],xmm3[0,2]
	andps	%xmm0, %xmm4
	movaps	%xmm4, %xmm0
	andnps	%xmm8, %xmm0
	movaps	%xmm0, %xmm1
	psubd	%xmm4, %xmm1
	psrld	$31, %xmm4
	por	%xmm0, %xmm4
	movdqu	%xmm1, (%rax,%rsi,4)
	movdqu	%xmm4, 16(%rax,%rsi,4)
.LBB0_26:
	cmpq	%rcx, %rdx
	je	.LBB0_29
.LBB0_27:
	movl	$1, %esi
	.p2align	4, 0x90
.LBB0_28:                               # =>This Inner Loop Header: Depth=1
	testb	$1, %dl
	movl	%ebp, %edi
	cmovel	%esi, %edi
	movl	%edi, (%rax,%rdx,4)
	incq	%rdx
	cmpq	%rdx, %rcx
	jne	.LBB0_28
.LBB0_29:
	addq	$8, %rsp
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
.LBB0_21:
	.cfi_def_cfa_offset 64
	movdqa	.LCPI0_0(%rip), %xmm4           # xmm4 = [0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0]
	xorl	%esi, %esi
	movdqa	%xmm4, %xmm3
	testb	$1, %bl
	jne	.LBB0_25
	jmp	.LBB0_26
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
