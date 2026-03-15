	.text
	.file	"code.c"
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4                               # -- Begin function func0
.LCPI0_0:
	.byte	208                             # 0xd0
	.byte	208                             # 0xd0
	.byte	208                             # 0xd0
	.byte	208                             # 0xd0
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
.LCPI0_1:
	.byte	10                              # 0xa
	.byte	10                              # 0xa
	.byte	10                              # 0xa
	.byte	10                              # 0xa
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
.LCPI0_2:
	.long	1                               # 0x1
	.long	1                               # 0x1
	.long	1                               # 0x1
	.long	1                               # 0x1
.LCPI0_3:
	.byte	46                              # 0x2e
	.byte	46                              # 0x2e
	.byte	46                              # 0x2e
	.byte	46                              # 0x2e
	.zero	1
	.zero	1
	.zero	1
	.zero	1
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
	movq	%rdi, %r15
	callq	strlen@PLT
	movq	%rax, %r14
	leaq	.L.str(%rip), %rbx
	cmpl	$5, %r14d
	jl	.LBB0_14
# %bb.1:
	movzbl	(%r15), %eax
	cmpb	$65, %al
	jl	.LBB0_14
# %bb.2:
	addl	$-91, %eax
	cmpl	$36, %eax
	ja	.LBB0_4
# %bb.3:
	movabsq	$133143986239, %rcx             # imm = 0x1F0000003F
	btq	%rax, %rcx
	jae	.LBB0_4
.LBB0_14:
	movq	%rbx, %rax
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
.LBB0_4:
	.cfi_def_cfa_offset 48
	movl	%r14d, %eax
	leaq	(%r15,%rax), %r12
	addq	$-4, %r12
	leaq	.L.str.1(%rip), %rsi
	movq	%r12, %rdi
	callq	strcmp@PLT
	testl	%eax, %eax
	je	.LBB0_7
# %bb.5:
	leaq	.L.str.2(%rip), %rsi
	movq	%r12, %rdi
	callq	strcmp@PLT
	testl	%eax, %eax
	je	.LBB0_7
# %bb.6:
	leaq	.L.str.3(%rip), %rsi
	movq	%r12, %rdi
	callq	strcmp@PLT
	testl	%eax, %eax
	jne	.LBB0_14
.LBB0_7:
	movl	%r14d, %eax
	cmpq	$8, %rax
	jae	.LBB0_10
# %bb.8:
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	xorl	%edx, %edx
	jmp	.LBB0_9
.LBB0_10:
	andl	$7, %r14d
	movq	%rax, %rcx
	subq	%r14, %rcx
	pxor	%xmm13, %xmm13
	xorl	%edx, %edx
	movdqa	.LCPI0_0(%rip), %xmm8           # xmm8 = <208,208,208,208,u,u,u,u,u,u,u,u,u,u,u,u>
	movdqa	.LCPI0_1(%rip), %xmm9           # xmm9 = <10,10,10,10,u,u,u,u,u,u,u,u,u,u,u,u>
	pcmpeqd	%xmm10, %xmm10
	movdqa	.LCPI0_2(%rip), %xmm12          # xmm12 = [1,1,1,1]
	movdqa	.LCPI0_3(%rip), %xmm11          # xmm11 = <46,46,46,46,u,u,u,u,u,u,u,u,u,u,u,u>
	pxor	%xmm1, %xmm1
	pxor	%xmm2, %xmm2
	pxor	%xmm6, %xmm6
	.p2align	4, 0x90
.LBB0_11:                               # =>This Inner Loop Header: Depth=1
	movd	(%r15,%rdx), %xmm4              # xmm4 = mem[0],zero,zero,zero
	movd	4(%r15,%rdx), %xmm3             # xmm3 = mem[0],zero,zero,zero
	movdqa	%xmm4, %xmm0
	paddb	%xmm8, %xmm0
	movdqa	%xmm3, %xmm5
	paddb	%xmm8, %xmm5
	movdqa	%xmm0, %xmm7
	pmaxub	%xmm9, %xmm7
	pcmpeqb	%xmm0, %xmm7
	pxor	%xmm10, %xmm7
	punpcklbw	%xmm7, %xmm7            # xmm7 = xmm7[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
	punpcklwd	%xmm7, %xmm7            # xmm7 = xmm7[0,0,1,1,2,2,3,3]
	pand	%xmm12, %xmm7
	paddd	%xmm7, %xmm13
	movdqa	%xmm5, %xmm0
	pmaxub	%xmm9, %xmm0
	pcmpeqb	%xmm5, %xmm0
	pxor	%xmm10, %xmm0
	punpcklbw	%xmm0, %xmm0            # xmm0 = xmm0[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
	punpcklwd	%xmm0, %xmm0            # xmm0 = xmm0[0,0,1,1,2,2,3,3]
	pand	%xmm12, %xmm0
	paddd	%xmm0, %xmm1
	pcmpeqb	%xmm11, %xmm4
	punpcklbw	%xmm4, %xmm4            # xmm4 = xmm4[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
	punpcklwd	%xmm4, %xmm4            # xmm4 = xmm4[0,0,1,1,2,2,3,3]
	pand	%xmm12, %xmm4
	paddd	%xmm4, %xmm2
	pcmpeqb	%xmm11, %xmm3
	punpcklbw	%xmm3, %xmm3            # xmm3 = xmm3[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
	punpcklwd	%xmm3, %xmm3            # xmm3 = xmm3[0,0,1,1,2,2,3,3]
	pand	%xmm12, %xmm3
	paddd	%xmm3, %xmm6
	addq	$8, %rdx
	cmpq	%rdx, %rcx
	jne	.LBB0_11
# %bb.12:
	paddd	%xmm2, %xmm6
	pshufd	$238, %xmm6, %xmm0              # xmm0 = xmm6[2,3,2,3]
	paddd	%xmm6, %xmm0
	pshufd	$85, %xmm0, %xmm2               # xmm2 = xmm0[1,1,1,1]
	paddd	%xmm0, %xmm2
	movd	%xmm2, %edx
	paddd	%xmm13, %xmm1
	pshufd	$238, %xmm1, %xmm0              # xmm0 = xmm1[2,3,2,3]
	paddd	%xmm1, %xmm0
	pshufd	$85, %xmm0, %xmm1               # xmm1 = xmm0[1,1,1,1]
	paddd	%xmm0, %xmm1
	movd	%xmm1, %esi
	testq	%r14, %r14
	je	.LBB0_13
	.p2align	4, 0x90
.LBB0_9:                                # =>This Inner Loop Header: Depth=1
	movzbl	(%r15,%rcx), %edi
	leal	-48(%rdi), %ebx
	cmpb	$10, %bl
	adcl	$0, %esi
	xorl	%ebx, %ebx
	cmpb	$46, %dil
	sete	%bl
	addl	%ebx, %edx
	incq	%rcx
	cmpq	%rcx, %rax
	jne	.LBB0_9
.LBB0_13:
	cmpl	$1, %edx
	leaq	.L.str(%rip), %rax
	leaq	.L.str.4(%rip), %rbx
	cmovneq	%rax, %rbx
	cmpl	$4, %esi
	cmovaeq	%rax, %rbx
	jmp	.LBB0_14
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"No"
	.size	.L.str, 3

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	".txt"
	.size	.L.str.1, 5

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	".exe"
	.size	.L.str.2, 5

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	".dll"
	.size	.L.str.3, 5

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"Yes"
	.size	.L.str.4, 4

	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
