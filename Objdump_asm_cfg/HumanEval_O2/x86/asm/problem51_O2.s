	.text
	.file	"code.c"
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4                               # -- Begin function func0
.LCPI0_0:
	.long	1321528399                      # 0x4ec4ec4f
	.long	1321528399                      # 0x4ec4ec4f
	.long	1321528399                      # 0x4ec4ec4f
	.long	1321528399                      # 0x4ec4ec4f
.LCPI0_1:
	.long	26                              # 0x1a
	.long	26                              # 0x1a
	.long	26                              # 0x1a
	.long	26                              # 0x1a
.LCPI0_2:
	.byte	255                             # 0xff
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	255                             # 0xff
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	255                             # 0xff
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	255                             # 0xff
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
.LCPI0_3:
	.zero	16,97
.LCPI0_4:
	.byte	97                              # 0x61
	.byte	97                              # 0x61
	.byte	97                              # 0x61
	.byte	97                              # 0x61
	.byte	97                              # 0x61
	.byte	97                              # 0x61
	.byte	97                              # 0x61
	.byte	97                              # 0x61
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
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %rbp, -16
	movl	%esi, %ebp
	movq	%rdi, %rbx
	callq	strlen@PLT
	testq	%rax, %rax
	je	.LBB0_17
# %bb.1:
	xorl	%ecx, %ecx
	testl	%ebp, %ebp
	sete	%cl
	shll	$4, %ecx
	orl	$-92, %ecx
	cmpq	$8, %rax
	jae	.LBB0_4
# %bb.2:
	xorl	%edx, %edx
	jmp	.LBB0_3
.LBB0_4:
	movd	%ecx, %xmm8
	cmpq	$16, %rax
	jae	.LBB0_6
# %bb.5:
	xorl	%edx, %edx
.LBB0_14:
	movq	%rdx, %rsi
	movq	%rax, %rdx
	andq	$-8, %rdx
	pshufd	$0, %xmm8, %xmm0                # xmm0 = xmm8[0,0,0,0]
	movdqa	.LCPI0_0(%rip), %xmm1           # xmm1 = [1321528399,1321528399,1321528399,1321528399]
	movdqa	.LCPI0_1(%rip), %xmm2           # xmm2 = [26,26,26,26]
	movdqa	.LCPI0_2(%rip), %xmm3           # xmm3 = [255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0]
	movdqa	.LCPI0_4(%rip), %xmm8           # xmm8 = <97,97,97,97,97,97,97,97,u,u,u,u,u,u,u,u>
	.p2align	4, 0x90
.LBB0_15:                               # =>This Inner Loop Header: Depth=1
	movq	(%rbx,%rsi), %xmm5              # xmm5 = mem[0],zero
	punpcklbw	%xmm5, %xmm6            # xmm6 = xmm6[0],xmm5[0],xmm6[1],xmm5[1],xmm6[2],xmm5[2],xmm6[3],xmm5[3],xmm6[4],xmm5[4],xmm6[5],xmm5[5],xmm6[6],xmm5[6],xmm6[7],xmm5[7]
	punpcklwd	%xmm6, %xmm5            # xmm5 = xmm5[0],xmm6[0],xmm5[1],xmm6[1],xmm5[2],xmm6[2],xmm5[3],xmm6[3]
	psrad	$24, %xmm5
	punpckhwd	%xmm6, %xmm6            # xmm6 = xmm6[4,4,5,5,6,6,7,7]
	psrad	$24, %xmm6
	paddd	%xmm0, %xmm6
	paddd	%xmm0, %xmm5
	movdqa	%xmm5, %xmm7
	pmuludq	%xmm1, %xmm7
	pshufd	$237, %xmm7, %xmm7              # xmm7 = xmm7[1,3,2,3]
	pshufd	$245, %xmm5, %xmm4              # xmm4 = xmm5[1,1,3,3]
	pmuludq	%xmm1, %xmm4
	pshufd	$237, %xmm4, %xmm4              # xmm4 = xmm4[1,3,2,3]
	punpckldq	%xmm4, %xmm7            # xmm7 = xmm7[0],xmm4[0],xmm7[1],xmm4[1]
	pxor	%xmm4, %xmm4
	pcmpgtd	%xmm5, %xmm4
	pand	%xmm1, %xmm4
	psubd	%xmm4, %xmm7
	movdqa	%xmm7, %xmm4
	psrld	$31, %xmm4
	psrld	$3, %xmm7
	paddd	%xmm4, %xmm7
	pshufd	$245, %xmm7, %xmm4              # xmm4 = xmm7[1,1,3,3]
	pmuludq	%xmm2, %xmm7
	pshufd	$232, %xmm7, %xmm7              # xmm7 = xmm7[0,2,2,3]
	pmuludq	%xmm2, %xmm4
	pshufd	$232, %xmm4, %xmm4              # xmm4 = xmm4[0,2,2,3]
	punpckldq	%xmm4, %xmm7            # xmm7 = xmm7[0],xmm4[0],xmm7[1],xmm4[1]
	psubd	%xmm7, %xmm5
	movdqa	%xmm6, %xmm4
	pmuludq	%xmm1, %xmm4
	pshufd	$237, %xmm4, %xmm4              # xmm4 = xmm4[1,3,2,3]
	pshufd	$245, %xmm6, %xmm7              # xmm7 = xmm6[1,1,3,3]
	pmuludq	%xmm1, %xmm7
	pshufd	$237, %xmm7, %xmm7              # xmm7 = xmm7[1,3,2,3]
	punpckldq	%xmm7, %xmm4            # xmm4 = xmm4[0],xmm7[0],xmm4[1],xmm7[1]
	pxor	%xmm7, %xmm7
	pcmpgtd	%xmm6, %xmm7
	pand	%xmm1, %xmm7
	psubd	%xmm7, %xmm4
	movdqa	%xmm4, %xmm7
	psrld	$31, %xmm7
	psrld	$3, %xmm4
	paddd	%xmm7, %xmm4
	pshufd	$245, %xmm4, %xmm7              # xmm7 = xmm4[1,1,3,3]
	pmuludq	%xmm2, %xmm4
	pshufd	$232, %xmm4, %xmm4              # xmm4 = xmm4[0,2,2,3]
	pmuludq	%xmm2, %xmm7
	pshufd	$232, %xmm7, %xmm7              # xmm7 = xmm7[0,2,2,3]
	punpckldq	%xmm7, %xmm4            # xmm4 = xmm4[0],xmm7[0],xmm4[1],xmm7[1]
	psubd	%xmm4, %xmm6
	pand	%xmm3, %xmm6
	pand	%xmm3, %xmm5
	packuswb	%xmm6, %xmm5
	packuswb	%xmm5, %xmm5
	paddb	%xmm8, %xmm5
	movq	%xmm5, (%rbx,%rsi)
	addq	$8, %rsi
	cmpq	%rsi, %rdx
	jne	.LBB0_15
	jmp	.LBB0_16
.LBB0_6:
	movq	%rax, %rdx
	andq	$-16, %rdx
	pshufd	$0, %xmm8, %xmm12               # xmm12 = xmm8[0,0,0,0]
	leaq	-16(%rdx), %rsi
	movq	%rsi, %rbp
	shrq	$4, %rbp
	incq	%rbp
	testq	%rsi, %rsi
	je	.LBB0_7
# %bb.8:
	movq	%rbp, %rdi
	andq	$-2, %rdi
	xorl	%esi, %esi
	movdqa	.LCPI0_0(%rip), %xmm2           # xmm2 = [1321528399,1321528399,1321528399,1321528399]
	movdqa	.LCPI0_1(%rip), %xmm3           # xmm3 = [26,26,26,26]
	movdqa	.LCPI0_2(%rip), %xmm10          # xmm10 = [255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0]
	movdqa	.LCPI0_3(%rip), %xmm9           # xmm9 = [97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97]
	.p2align	4, 0x90
.LBB0_9:                                # =>This Inner Loop Header: Depth=1
	movdqu	(%rbx,%rsi), %xmm4
	movdqu	16(%rbx,%rsi), %xmm11
	punpcklbw	%xmm4, %xmm0            # xmm0 = xmm0[0],xmm4[0],xmm0[1],xmm4[1],xmm0[2],xmm4[2],xmm0[3],xmm4[3],xmm0[4],xmm4[4],xmm0[5],xmm4[5],xmm0[6],xmm4[6],xmm0[7],xmm4[7]
	punpcklwd	%xmm0, %xmm6            # xmm6 = xmm6[0],xmm0[0],xmm6[1],xmm0[1],xmm6[2],xmm0[2],xmm6[3],xmm0[3]
	psrad	$24, %xmm6
	punpckhwd	%xmm0, %xmm0            # xmm0 = xmm0[4,4,5,5,6,6,7,7]
	psrad	$24, %xmm0
	punpckhbw	%xmm4, %xmm4            # xmm4 = xmm4[8,8,9,9,10,10,11,11,12,12,13,13,14,14,15,15]
	punpcklwd	%xmm4, %xmm5            # xmm5 = xmm5[0],xmm4[0],xmm5[1],xmm4[1],xmm5[2],xmm4[2],xmm5[3],xmm4[3]
	psrad	$24, %xmm5
	punpckhwd	%xmm4, %xmm4            # xmm4 = xmm4[4,4,5,5,6,6,7,7]
	psrad	$24, %xmm4
	paddd	%xmm12, %xmm4
	paddd	%xmm12, %xmm5
	paddd	%xmm12, %xmm0
	paddd	%xmm12, %xmm6
	movdqa	%xmm6, %xmm7
	pmuludq	%xmm2, %xmm7
	pshufd	$237, %xmm7, %xmm7              # xmm7 = xmm7[1,3,2,3]
	pshufd	$245, %xmm6, %xmm1              # xmm1 = xmm6[1,1,3,3]
	pmuludq	%xmm2, %xmm1
	pshufd	$237, %xmm1, %xmm1              # xmm1 = xmm1[1,3,2,3]
	punpckldq	%xmm1, %xmm7            # xmm7 = xmm7[0],xmm1[0],xmm7[1],xmm1[1]
	pxor	%xmm1, %xmm1
	pcmpgtd	%xmm6, %xmm1
	pand	%xmm2, %xmm1
	psubd	%xmm1, %xmm7
	movdqa	%xmm7, %xmm1
	psrld	$31, %xmm1
	psrld	$3, %xmm7
	paddd	%xmm1, %xmm7
	pshufd	$245, %xmm7, %xmm1              # xmm1 = xmm7[1,1,3,3]
	pmuludq	%xmm3, %xmm7
	pshufd	$232, %xmm7, %xmm7              # xmm7 = xmm7[0,2,2,3]
	pmuludq	%xmm3, %xmm1
	pshufd	$232, %xmm1, %xmm1              # xmm1 = xmm1[0,2,2,3]
	punpckldq	%xmm1, %xmm7            # xmm7 = xmm7[0],xmm1[0],xmm7[1],xmm1[1]
	psubd	%xmm7, %xmm6
	movdqa	%xmm0, %xmm1
	pmuludq	%xmm2, %xmm1
	pshufd	$237, %xmm1, %xmm1              # xmm1 = xmm1[1,3,2,3]
	pshufd	$245, %xmm0, %xmm7              # xmm7 = xmm0[1,1,3,3]
	pmuludq	%xmm2, %xmm7
	pshufd	$237, %xmm7, %xmm7              # xmm7 = xmm7[1,3,2,3]
	punpckldq	%xmm7, %xmm1            # xmm1 = xmm1[0],xmm7[0],xmm1[1],xmm7[1]
	pxor	%xmm7, %xmm7
	pcmpgtd	%xmm0, %xmm7
	pand	%xmm2, %xmm7
	psubd	%xmm7, %xmm1
	movdqa	%xmm1, %xmm7
	psrld	$31, %xmm7
	psrld	$3, %xmm1
	paddd	%xmm7, %xmm1
	pshufd	$245, %xmm1, %xmm7              # xmm7 = xmm1[1,1,3,3]
	pmuludq	%xmm3, %xmm1
	pshufd	$232, %xmm1, %xmm1              # xmm1 = xmm1[0,2,2,3]
	pmuludq	%xmm3, %xmm7
	pshufd	$232, %xmm7, %xmm7              # xmm7 = xmm7[0,2,2,3]
	punpckldq	%xmm7, %xmm1            # xmm1 = xmm1[0],xmm7[0],xmm1[1],xmm7[1]
	psubd	%xmm1, %xmm0
	movdqa	%xmm5, %xmm1
	pmuludq	%xmm2, %xmm1
	pshufd	$237, %xmm1, %xmm1              # xmm1 = xmm1[1,3,2,3]
	pshufd	$245, %xmm5, %xmm7              # xmm7 = xmm5[1,1,3,3]
	pmuludq	%xmm2, %xmm7
	pshufd	$237, %xmm7, %xmm7              # xmm7 = xmm7[1,3,2,3]
	punpckldq	%xmm7, %xmm1            # xmm1 = xmm1[0],xmm7[0],xmm1[1],xmm7[1]
	pxor	%xmm7, %xmm7
	pcmpgtd	%xmm5, %xmm7
	pand	%xmm2, %xmm7
	psubd	%xmm7, %xmm1
	movdqa	%xmm1, %xmm7
	psrld	$31, %xmm7
	psrld	$3, %xmm1
	paddd	%xmm7, %xmm1
	pshufd	$245, %xmm1, %xmm7              # xmm7 = xmm1[1,1,3,3]
	pmuludq	%xmm3, %xmm1
	pshufd	$232, %xmm1, %xmm1              # xmm1 = xmm1[0,2,2,3]
	pmuludq	%xmm3, %xmm7
	pshufd	$232, %xmm7, %xmm7              # xmm7 = xmm7[0,2,2,3]
	punpckldq	%xmm7, %xmm1            # xmm1 = xmm1[0],xmm7[0],xmm1[1],xmm7[1]
	psubd	%xmm1, %xmm5
	movdqa	%xmm4, %xmm1
	pmuludq	%xmm2, %xmm1
	pshufd	$237, %xmm1, %xmm1              # xmm1 = xmm1[1,3,2,3]
	pshufd	$245, %xmm4, %xmm7              # xmm7 = xmm4[1,1,3,3]
	pmuludq	%xmm2, %xmm7
	pshufd	$237, %xmm7, %xmm7              # xmm7 = xmm7[1,3,2,3]
	punpckldq	%xmm7, %xmm1            # xmm1 = xmm1[0],xmm7[0],xmm1[1],xmm7[1]
	pxor	%xmm7, %xmm7
	pcmpgtd	%xmm4, %xmm7
	pand	%xmm2, %xmm7
	psubd	%xmm7, %xmm1
	movdqa	%xmm1, %xmm7
	psrld	$31, %xmm7
	psrld	$3, %xmm1
	paddd	%xmm7, %xmm1
	pshufd	$245, %xmm1, %xmm7              # xmm7 = xmm1[1,1,3,3]
	pmuludq	%xmm3, %xmm1
	pshufd	$232, %xmm1, %xmm1              # xmm1 = xmm1[0,2,2,3]
	pmuludq	%xmm3, %xmm7
	pshufd	$232, %xmm7, %xmm7              # xmm7 = xmm7[0,2,2,3]
	punpckldq	%xmm7, %xmm1            # xmm1 = xmm1[0],xmm7[0],xmm1[1],xmm7[1]
	psubd	%xmm1, %xmm4
	pand	%xmm10, %xmm4
	pand	%xmm10, %xmm5
	packuswb	%xmm4, %xmm5
	pand	%xmm10, %xmm0
	pand	%xmm10, %xmm6
	packuswb	%xmm0, %xmm6
	packuswb	%xmm5, %xmm6
	paddb	%xmm9, %xmm6
	movdqu	%xmm6, (%rbx,%rsi)
	punpcklbw	%xmm11, %xmm0           # xmm0 = xmm0[0],xmm11[0],xmm0[1],xmm11[1],xmm0[2],xmm11[2],xmm0[3],xmm11[3],xmm0[4],xmm11[4],xmm0[5],xmm11[5],xmm0[6],xmm11[6],xmm0[7],xmm11[7]
	punpcklwd	%xmm0, %xmm7            # xmm7 = xmm7[0],xmm0[0],xmm7[1],xmm0[1],xmm7[2],xmm0[2],xmm7[3],xmm0[3]
	psrad	$24, %xmm7
	punpckhwd	%xmm0, %xmm0            # xmm0 = xmm0[4,4,5,5,6,6,7,7]
	psrad	$24, %xmm0
	punpckhbw	%xmm11, %xmm1           # xmm1 = xmm1[8],xmm11[8],xmm1[9],xmm11[9],xmm1[10],xmm11[10],xmm1[11],xmm11[11],xmm1[12],xmm11[12],xmm1[13],xmm11[13],xmm1[14],xmm11[14],xmm1[15],xmm11[15]
	punpcklwd	%xmm1, %xmm5            # xmm5 = xmm5[0],xmm1[0],xmm5[1],xmm1[1],xmm5[2],xmm1[2],xmm5[3],xmm1[3]
	psrad	$24, %xmm5
	punpckhwd	%xmm1, %xmm4            # xmm4 = xmm4[4],xmm1[4],xmm4[5],xmm1[5],xmm4[6],xmm1[6],xmm4[7],xmm1[7]
	psrad	$24, %xmm4
	paddd	%xmm12, %xmm4
	paddd	%xmm12, %xmm5
	paddd	%xmm12, %xmm0
	paddd	%xmm12, %xmm7
	movdqa	%xmm7, %xmm1
	pmuludq	%xmm2, %xmm1
	pshufd	$237, %xmm1, %xmm1              # xmm1 = xmm1[1,3,2,3]
	pshufd	$245, %xmm7, %xmm6              # xmm6 = xmm7[1,1,3,3]
	pmuludq	%xmm2, %xmm6
	pshufd	$237, %xmm6, %xmm6              # xmm6 = xmm6[1,3,2,3]
	punpckldq	%xmm6, %xmm1            # xmm1 = xmm1[0],xmm6[0],xmm1[1],xmm6[1]
	pxor	%xmm6, %xmm6
	pcmpgtd	%xmm7, %xmm6
	pand	%xmm2, %xmm6
	psubd	%xmm6, %xmm1
	movdqa	%xmm1, %xmm6
	psrld	$31, %xmm6
	psrld	$3, %xmm1
	paddd	%xmm6, %xmm1
	pshufd	$245, %xmm1, %xmm6              # xmm6 = xmm1[1,1,3,3]
	pmuludq	%xmm3, %xmm1
	pshufd	$232, %xmm1, %xmm1              # xmm1 = xmm1[0,2,2,3]
	pmuludq	%xmm3, %xmm6
	pshufd	$232, %xmm6, %xmm6              # xmm6 = xmm6[0,2,2,3]
	punpckldq	%xmm6, %xmm1            # xmm1 = xmm1[0],xmm6[0],xmm1[1],xmm6[1]
	psubd	%xmm1, %xmm7
	movdqa	%xmm0, %xmm1
	pmuludq	%xmm2, %xmm1
	pshufd	$237, %xmm1, %xmm1              # xmm1 = xmm1[1,3,2,3]
	pshufd	$245, %xmm0, %xmm6              # xmm6 = xmm0[1,1,3,3]
	pmuludq	%xmm2, %xmm6
	pshufd	$237, %xmm6, %xmm6              # xmm6 = xmm6[1,3,2,3]
	punpckldq	%xmm6, %xmm1            # xmm1 = xmm1[0],xmm6[0],xmm1[1],xmm6[1]
	pxor	%xmm6, %xmm6
	pcmpgtd	%xmm0, %xmm6
	pand	%xmm2, %xmm6
	psubd	%xmm6, %xmm1
	movdqa	%xmm1, %xmm6
	psrld	$31, %xmm6
	psrld	$3, %xmm1
	paddd	%xmm6, %xmm1
	pshufd	$245, %xmm1, %xmm6              # xmm6 = xmm1[1,1,3,3]
	pmuludq	%xmm3, %xmm1
	pshufd	$232, %xmm1, %xmm1              # xmm1 = xmm1[0,2,2,3]
	pmuludq	%xmm3, %xmm6
	pshufd	$232, %xmm6, %xmm6              # xmm6 = xmm6[0,2,2,3]
	punpckldq	%xmm6, %xmm1            # xmm1 = xmm1[0],xmm6[0],xmm1[1],xmm6[1]
	psubd	%xmm1, %xmm0
	movdqa	%xmm5, %xmm1
	pmuludq	%xmm2, %xmm1
	pshufd	$237, %xmm1, %xmm1              # xmm1 = xmm1[1,3,2,3]
	pshufd	$245, %xmm5, %xmm6              # xmm6 = xmm5[1,1,3,3]
	pmuludq	%xmm2, %xmm6
	pshufd	$237, %xmm6, %xmm6              # xmm6 = xmm6[1,3,2,3]
	punpckldq	%xmm6, %xmm1            # xmm1 = xmm1[0],xmm6[0],xmm1[1],xmm6[1]
	pxor	%xmm6, %xmm6
	pcmpgtd	%xmm5, %xmm6
	pand	%xmm2, %xmm6
	psubd	%xmm6, %xmm1
	movdqa	%xmm1, %xmm6
	psrld	$31, %xmm6
	psrld	$3, %xmm1
	paddd	%xmm6, %xmm1
	pshufd	$245, %xmm1, %xmm6              # xmm6 = xmm1[1,1,3,3]
	pmuludq	%xmm3, %xmm1
	pshufd	$232, %xmm1, %xmm1              # xmm1 = xmm1[0,2,2,3]
	pmuludq	%xmm3, %xmm6
	pshufd	$232, %xmm6, %xmm6              # xmm6 = xmm6[0,2,2,3]
	punpckldq	%xmm6, %xmm1            # xmm1 = xmm1[0],xmm6[0],xmm1[1],xmm6[1]
	psubd	%xmm1, %xmm5
	movdqa	%xmm4, %xmm1
	pmuludq	%xmm2, %xmm1
	pshufd	$237, %xmm1, %xmm1              # xmm1 = xmm1[1,3,2,3]
	pshufd	$245, %xmm4, %xmm6              # xmm6 = xmm4[1,1,3,3]
	pmuludq	%xmm2, %xmm6
	pshufd	$237, %xmm6, %xmm6              # xmm6 = xmm6[1,3,2,3]
	punpckldq	%xmm6, %xmm1            # xmm1 = xmm1[0],xmm6[0],xmm1[1],xmm6[1]
	pxor	%xmm6, %xmm6
	pcmpgtd	%xmm4, %xmm6
	pand	%xmm2, %xmm6
	psubd	%xmm6, %xmm1
	movdqa	%xmm1, %xmm6
	psrld	$31, %xmm6
	psrld	$3, %xmm1
	paddd	%xmm6, %xmm1
	pshufd	$245, %xmm1, %xmm6              # xmm6 = xmm1[1,1,3,3]
	pmuludq	%xmm3, %xmm1
	pshufd	$232, %xmm1, %xmm1              # xmm1 = xmm1[0,2,2,3]
	pmuludq	%xmm3, %xmm6
	pshufd	$232, %xmm6, %xmm6              # xmm6 = xmm6[0,2,2,3]
	punpckldq	%xmm6, %xmm1            # xmm1 = xmm1[0],xmm6[0],xmm1[1],xmm6[1]
	psubd	%xmm1, %xmm4
	pand	%xmm10, %xmm4
	pand	%xmm10, %xmm5
	packuswb	%xmm4, %xmm5
	pand	%xmm10, %xmm0
	pand	%xmm10, %xmm7
	packuswb	%xmm0, %xmm7
	packuswb	%xmm5, %xmm7
	paddb	%xmm9, %xmm7
	movdqu	%xmm7, 16(%rbx,%rsi)
	addq	$32, %rsi
	addq	$-2, %rdi
	jne	.LBB0_9
# %bb.10:
	testb	$1, %bpl
	je	.LBB0_12
.LBB0_11:
	movdqu	(%rbx,%rsi), %xmm0
	punpcklbw	%xmm0, %xmm1            # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1],xmm1[2],xmm0[2],xmm1[3],xmm0[3],xmm1[4],xmm0[4],xmm1[5],xmm0[5],xmm1[6],xmm0[6],xmm1[7],xmm0[7]
	punpcklwd	%xmm1, %xmm2            # xmm2 = xmm2[0],xmm1[0],xmm2[1],xmm1[1],xmm2[2],xmm1[2],xmm2[3],xmm1[3]
	psrad	$24, %xmm2
	punpckhwd	%xmm1, %xmm3            # xmm3 = xmm3[4],xmm1[4],xmm3[5],xmm1[5],xmm3[6],xmm1[6],xmm3[7],xmm1[7]
	psrad	$24, %xmm3
	punpckhbw	%xmm0, %xmm0            # xmm0 = xmm0[8,8,9,9,10,10,11,11,12,12,13,13,14,14,15,15]
	punpcklwd	%xmm0, %xmm4            # xmm4 = xmm4[0],xmm0[0],xmm4[1],xmm0[1],xmm4[2],xmm0[2],xmm4[3],xmm0[3]
	psrad	$24, %xmm4
	punpckhwd	%xmm0, %xmm0            # xmm0 = xmm0[4,4,5,5,6,6,7,7]
	psrad	$24, %xmm0
	paddd	%xmm12, %xmm0
	paddd	%xmm12, %xmm4
	paddd	%xmm12, %xmm3
	paddd	%xmm12, %xmm2
	movdqa	.LCPI0_0(%rip), %xmm1           # xmm1 = [1321528399,1321528399,1321528399,1321528399]
	movdqa	%xmm2, %xmm5
	pmuludq	%xmm1, %xmm5
	pshufd	$237, %xmm5, %xmm7              # xmm7 = xmm5[1,3,2,3]
	pshufd	$245, %xmm2, %xmm5              # xmm5 = xmm2[1,1,3,3]
	pmuludq	%xmm1, %xmm5
	pshufd	$237, %xmm5, %xmm5              # xmm5 = xmm5[1,3,2,3]
	punpckldq	%xmm5, %xmm7            # xmm7 = xmm7[0],xmm5[0],xmm7[1],xmm5[1]
	pxor	%xmm5, %xmm5
	pxor	%xmm6, %xmm6
	pcmpgtd	%xmm2, %xmm6
	pand	%xmm1, %xmm6
	psubd	%xmm6, %xmm7
	movdqa	%xmm7, %xmm6
	psrld	$31, %xmm6
	psrld	$3, %xmm7
	paddd	%xmm6, %xmm7
	movdqa	.LCPI0_1(%rip), %xmm9           # xmm9 = [26,26,26,26]
	pshufd	$245, %xmm7, %xmm6              # xmm6 = xmm7[1,1,3,3]
	pmuludq	%xmm9, %xmm7
	pshufd	$232, %xmm7, %xmm7              # xmm7 = xmm7[0,2,2,3]
	pmuludq	%xmm9, %xmm6
	pshufd	$232, %xmm6, %xmm6              # xmm6 = xmm6[0,2,2,3]
	punpckldq	%xmm6, %xmm7            # xmm7 = xmm7[0],xmm6[0],xmm7[1],xmm6[1]
	psubd	%xmm7, %xmm2
	movdqa	%xmm3, %xmm6
	pmuludq	%xmm1, %xmm6
	pshufd	$237, %xmm6, %xmm6              # xmm6 = xmm6[1,3,2,3]
	pshufd	$245, %xmm3, %xmm7              # xmm7 = xmm3[1,1,3,3]
	pmuludq	%xmm1, %xmm7
	pshufd	$237, %xmm7, %xmm7              # xmm7 = xmm7[1,3,2,3]
	punpckldq	%xmm7, %xmm6            # xmm6 = xmm6[0],xmm7[0],xmm6[1],xmm7[1]
	pxor	%xmm7, %xmm7
	pcmpgtd	%xmm3, %xmm7
	pand	%xmm1, %xmm7
	psubd	%xmm7, %xmm6
	movdqa	%xmm6, %xmm7
	psrld	$31, %xmm7
	psrld	$3, %xmm6
	paddd	%xmm7, %xmm6
	pshufd	$245, %xmm6, %xmm7              # xmm7 = xmm6[1,1,3,3]
	pmuludq	%xmm9, %xmm6
	pshufd	$232, %xmm6, %xmm6              # xmm6 = xmm6[0,2,2,3]
	pmuludq	%xmm9, %xmm7
	pshufd	$232, %xmm7, %xmm7              # xmm7 = xmm7[0,2,2,3]
	punpckldq	%xmm7, %xmm6            # xmm6 = xmm6[0],xmm7[0],xmm6[1],xmm7[1]
	psubd	%xmm6, %xmm3
	movdqa	%xmm4, %xmm6
	pmuludq	%xmm1, %xmm6
	pshufd	$237, %xmm6, %xmm6              # xmm6 = xmm6[1,3,2,3]
	pshufd	$245, %xmm4, %xmm7              # xmm7 = xmm4[1,1,3,3]
	pmuludq	%xmm1, %xmm7
	pshufd	$237, %xmm7, %xmm7              # xmm7 = xmm7[1,3,2,3]
	punpckldq	%xmm7, %xmm6            # xmm6 = xmm6[0],xmm7[0],xmm6[1],xmm7[1]
	pxor	%xmm7, %xmm7
	pcmpgtd	%xmm4, %xmm7
	pand	%xmm1, %xmm7
	psubd	%xmm7, %xmm6
	movdqa	%xmm6, %xmm7
	psrld	$31, %xmm7
	psrld	$3, %xmm6
	paddd	%xmm7, %xmm6
	pshufd	$245, %xmm6, %xmm7              # xmm7 = xmm6[1,1,3,3]
	pmuludq	%xmm9, %xmm6
	pshufd	$232, %xmm6, %xmm6              # xmm6 = xmm6[0,2,2,3]
	pmuludq	%xmm9, %xmm7
	pshufd	$232, %xmm7, %xmm7              # xmm7 = xmm7[0,2,2,3]
	punpckldq	%xmm7, %xmm6            # xmm6 = xmm6[0],xmm7[0],xmm6[1],xmm7[1]
	psubd	%xmm6, %xmm4
	movdqa	%xmm0, %xmm6
	pmuludq	%xmm1, %xmm6
	pshufd	$237, %xmm6, %xmm6              # xmm6 = xmm6[1,3,2,3]
	pshufd	$245, %xmm0, %xmm7              # xmm7 = xmm0[1,1,3,3]
	pmuludq	%xmm1, %xmm7
	pshufd	$237, %xmm7, %xmm7              # xmm7 = xmm7[1,3,2,3]
	punpckldq	%xmm7, %xmm6            # xmm6 = xmm6[0],xmm7[0],xmm6[1],xmm7[1]
	pcmpgtd	%xmm0, %xmm5
	pand	%xmm1, %xmm5
	psubd	%xmm5, %xmm6
	movdqa	%xmm6, %xmm1
	psrld	$31, %xmm1
	psrld	$3, %xmm6
	paddd	%xmm1, %xmm6
	pshufd	$245, %xmm6, %xmm1              # xmm1 = xmm6[1,1,3,3]
	pmuludq	%xmm9, %xmm6
	pshufd	$232, %xmm6, %xmm5              # xmm5 = xmm6[0,2,2,3]
	pmuludq	%xmm9, %xmm1
	pshufd	$232, %xmm1, %xmm1              # xmm1 = xmm1[0,2,2,3]
	punpckldq	%xmm1, %xmm5            # xmm5 = xmm5[0],xmm1[0],xmm5[1],xmm1[1]
	psubd	%xmm5, %xmm0
	movdqa	.LCPI0_2(%rip), %xmm1           # xmm1 = [255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0]
	pand	%xmm1, %xmm0
	pand	%xmm1, %xmm4
	packuswb	%xmm0, %xmm4
	pand	%xmm1, %xmm3
	pand	%xmm1, %xmm2
	packuswb	%xmm3, %xmm2
	packuswb	%xmm4, %xmm2
	paddb	.LCPI0_3(%rip), %xmm2
	movdqu	%xmm2, (%rbx,%rsi)
.LBB0_12:
	cmpq	%rdx, %rax
	je	.LBB0_17
# %bb.13:
	testb	$8, %al
	jne	.LBB0_14
	jmp	.LBB0_3
.LBB0_7:
	xorl	%esi, %esi
	testb	$1, %bpl
	jne	.LBB0_11
	jmp	.LBB0_12
.LBB0_3:
	movsbl	(%rbx,%rdx), %esi
	addl	%ecx, %esi
	movslq	%esi, %rsi
	imulq	$1321528399, %rsi, %rdi         # imm = 0x4EC4EC4F
	movq	%rdi, %rbp
	shrq	$63, %rbp
	sarq	$35, %rdi
	addl	%ebp, %edi
	leal	(%rdi,%rdi,4), %ebp
	leal	(%rbp,%rbp,4), %ebp
	addl	%edi, %ebp
	subl	%ebp, %esi
	addb	$97, %sil
	movb	%sil, (%rbx,%rdx)
	incq	%rdx
.LBB0_16:
	cmpq	%rdx, %rax
	jne	.LBB0_3
.LBB0_17:
	addq	$8, %rsp
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
