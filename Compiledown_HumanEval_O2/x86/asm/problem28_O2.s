	.text
	.file	"code.c"
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4                               # -- Begin function func0
.LCPI0_0:
	.zero	16,133
.LCPI0_1:
	.zero	16,229
.LCPI0_2:
	.zero	16,191
.LCPI0_3:
	.zero	16,25
.LCPI0_4:
	.zero	16,32
.LCPI0_5:
	.zero	16,224
.LCPI0_6:
	.byte	133                             # 0x85
	.byte	133                             # 0x85
	.byte	133                             # 0x85
	.byte	133                             # 0x85
	.byte	133                             # 0x85
	.byte	133                             # 0x85
	.byte	133                             # 0x85
	.byte	133                             # 0x85
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
.LCPI0_7:
	.byte	230                             # 0xe6
	.byte	230                             # 0xe6
	.byte	230                             # 0xe6
	.byte	230                             # 0xe6
	.byte	230                             # 0xe6
	.byte	230                             # 0xe6
	.byte	230                             # 0xe6
	.byte	230                             # 0xe6
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
.LCPI0_8:
	.byte	191                             # 0xbf
	.byte	191                             # 0xbf
	.byte	191                             # 0xbf
	.byte	191                             # 0xbf
	.byte	191                             # 0xbf
	.byte	191                             # 0xbf
	.byte	191                             # 0xbf
	.byte	191                             # 0xbf
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
.LCPI0_9:
	.byte	26                              # 0x1a
	.byte	26                              # 0x1a
	.byte	26                              # 0x1a
	.byte	26                              # 0x1a
	.byte	26                              # 0x1a
	.byte	26                              # 0x1a
	.byte	26                              # 0x1a
	.byte	26                              # 0x1a
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
.LCPI0_10:
	.byte	32                              # 0x20
	.byte	32                              # 0x20
	.byte	32                              # 0x20
	.byte	32                              # 0x20
	.byte	32                              # 0x20
	.byte	32                              # 0x20
	.byte	32                              # 0x20
	.byte	32                              # 0x20
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
.LCPI0_11:
	.byte	224                             # 0xe0
	.byte	224                             # 0xe0
	.byte	224                             # 0xe0
	.byte	224                             # 0xe0
	.byte	224                             # 0xe0
	.byte	224                             # 0xe0
	.byte	224                             # 0xe0
	.byte	224                             # 0xe0
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
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rsi, %r14
	movq	%rdi, %rbx
	callq	strlen@PLT
	testl	%eax, %eax
	jle	.LBB0_16
# %bb.1:
	movl	%eax, %r8d
	xorl	%edx, %edx
	cmpq	$8, %r8
	jb	.LBB0_12
# %bb.2:
	movq	%r14, %rsi
	subq	%rbx, %rsi
	cmpq	$32, %rsi
	jb	.LBB0_12
# %bb.3:
	cmpl	$32, %r8d
	jae	.LBB0_5
# %bb.4:
	xorl	%edx, %edx
	jmp	.LBB0_9
.LBB0_5:
	movl	%eax, %esi
	andl	$31, %esi
	movq	%r8, %rdx
	subq	%rsi, %rdx
	xorl	%edi, %edi
	movdqa	.LCPI0_0(%rip), %xmm8           # xmm8 = [133,133,133,133,133,133,133,133,133,133,133,133,133,133,133,133]
	movdqa	.LCPI0_1(%rip), %xmm9           # xmm9 = [229,229,229,229,229,229,229,229,229,229,229,229,229,229,229,229]
	movdqa	.LCPI0_2(%rip), %xmm10          # xmm10 = [191,191,191,191,191,191,191,191,191,191,191,191,191,191,191,191]
	movdqa	.LCPI0_3(%rip), %xmm11          # xmm11 = [25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25]
	movdqa	.LCPI0_4(%rip), %xmm12          # xmm12 = [32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32]
	movdqa	.LCPI0_5(%rip), %xmm13          # xmm13 = [224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224]
	.p2align	4, 0x90
.LBB0_6:                                # =>This Inner Loop Header: Depth=1
	movdqu	(%rbx,%rdi), %xmm1
	movdqu	16(%rbx,%rdi), %xmm5
	movdqa	%xmm1, %xmm0
	paddb	%xmm8, %xmm0
	movdqa	%xmm0, %xmm6
	pminub	%xmm9, %xmm6
	pcmpeqb	%xmm0, %xmm6
	movdqa	%xmm5, %xmm2
	paddb	%xmm8, %xmm2
	movdqa	%xmm2, %xmm0
	pminub	%xmm9, %xmm0
	pcmpeqb	%xmm2, %xmm0
	movdqa	%xmm1, %xmm2
	paddb	%xmm10, %xmm2
	movdqa	%xmm5, %xmm7
	paddb	%xmm10, %xmm7
	movdqa	%xmm2, %xmm3
	pminub	%xmm11, %xmm3
	pcmpeqb	%xmm2, %xmm3
	movdqa	%xmm7, %xmm2
	pminub	%xmm11, %xmm2
	pcmpeqb	%xmm7, %xmm2
	movdqa	%xmm1, %xmm7
	paddb	%xmm12, %xmm7
	movdqa	%xmm5, %xmm4
	paddb	%xmm12, %xmm4
	pand	%xmm3, %xmm7
	pandn	%xmm1, %xmm3
	por	%xmm7, %xmm3
	pand	%xmm2, %xmm4
	pandn	%xmm5, %xmm2
	por	%xmm4, %xmm2
	paddb	%xmm13, %xmm1
	paddb	%xmm13, %xmm5
	pand	%xmm6, %xmm3
	pandn	%xmm1, %xmm6
	por	%xmm3, %xmm6
	pand	%xmm0, %xmm2
	pandn	%xmm5, %xmm0
	por	%xmm2, %xmm0
	movdqu	%xmm6, (%r14,%rdi)
	movdqu	%xmm0, 16(%r14,%rdi)
	addq	$32, %rdi
	cmpq	%rdi, %rdx
	jne	.LBB0_6
# %bb.7:
	testq	%rsi, %rsi
	je	.LBB0_16
# %bb.8:
	cmpl	$8, %esi
	jb	.LBB0_12
.LBB0_9:
	movq	%rdx, %rsi
	movl	%eax, %edi
	andl	$7, %edi
	movq	%r8, %rdx
	subq	%rdi, %rdx
	movdqa	.LCPI0_6(%rip), %xmm8           # xmm8 = <133,133,133,133,133,133,133,133,u,u,u,u,u,u,u,u>
	movdqa	.LCPI0_7(%rip), %xmm9           # xmm9 = <230,230,230,230,230,230,230,230,u,u,u,u,u,u,u,u>
	movdqa	.LCPI0_8(%rip), %xmm10          # xmm10 = <191,191,191,191,191,191,191,191,u,u,u,u,u,u,u,u>
	movdqa	.LCPI0_9(%rip), %xmm3           # xmm3 = <26,26,26,26,26,26,26,26,u,u,u,u,u,u,u,u>
	movdqa	.LCPI0_10(%rip), %xmm4          # xmm4 = <32,32,32,32,32,32,32,32,u,u,u,u,u,u,u,u>
	movdqa	.LCPI0_11(%rip), %xmm5          # xmm5 = <224,224,224,224,224,224,224,224,u,u,u,u,u,u,u,u>
	.p2align	4, 0x90
.LBB0_10:                               # =>This Inner Loop Header: Depth=1
	movq	(%rbx,%rsi), %xmm6              # xmm6 = mem[0],zero
	movdqa	%xmm6, %xmm7
	paddb	%xmm8, %xmm7
	movdqa	%xmm7, %xmm0
	pmaxub	%xmm9, %xmm0
	pcmpeqb	%xmm7, %xmm0
	movdqa	%xmm6, %xmm1
	paddb	%xmm10, %xmm1
	movdqa	%xmm1, %xmm7
	pmaxub	%xmm3, %xmm7
	pcmpeqb	%xmm1, %xmm7
	movdqa	%xmm6, %xmm1
	paddb	%xmm4, %xmm1
	movdqa	%xmm7, %xmm2
	pand	%xmm6, %xmm2
	pandn	%xmm1, %xmm7
	por	%xmm2, %xmm7
	paddb	%xmm5, %xmm6
	pand	%xmm0, %xmm6
	pandn	%xmm7, %xmm0
	por	%xmm0, %xmm6
	movq	%xmm6, (%r14,%rsi)
	addq	$8, %rsi
	cmpq	%rsi, %rdx
	jne	.LBB0_10
# %bb.11:
	testq	%rdi, %rdi
	jne	.LBB0_12
.LBB0_16:
	cltq
	movb	$0, (%r14,%rax)
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	retq
	.p2align	4, 0x90
.LBB0_14:                               #   in Loop: Header=BB0_12 Depth=1
	.cfi_def_cfa_offset 32
	leal	-65(%rsi), %edi
	leal	32(%rsi), %ecx
	cmpb	$26, %dil
	movzbl	%sil, %edi
	movzbl	%cl, %esi
	cmovael	%edi, %esi
.LBB0_15:                               #   in Loop: Header=BB0_12 Depth=1
	movb	%sil, (%r14,%rdx)
	incq	%rdx
	cmpq	%rdx, %r8
	je	.LBB0_16
.LBB0_12:                               # =>This Inner Loop Header: Depth=1
	movzbl	(%rbx,%rdx), %esi
	leal	-97(%rsi), %edi
	cmpb	$25, %dil
	ja	.LBB0_14
# %bb.13:                               #   in Loop: Header=BB0_12 Depth=1
	addb	$-32, %sil
	jmp	.LBB0_15
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
