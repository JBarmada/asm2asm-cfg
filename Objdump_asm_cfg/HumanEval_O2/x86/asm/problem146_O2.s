	.text
	.file	"code.c"
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4                               # -- Begin function func0
.LCPI0_0:
	.long	4294967200                      # 0xffffffa0
	.long	4294967200                      # 0xffffffa0
	.long	4294967200                      # 0xffffffa0
	.long	4294967200                      # 0xffffffa0
.LCPI0_1:
	.long	4294967248                      # 0xffffffd0
	.long	4294967248                      # 0xffffffd0
	.long	4294967248                      # 0xffffffd0
	.long	4294967248                      # 0xffffffd0
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
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	%esi, %r14d
	movq	%rdi, %rbx
	movslq	%esi, %r15
	leaq	(,%r15,4), %rdi
	callq	malloc@PLT
	movq	%rax, %rbp
	testl	%r15d, %r15d
	jle	.LBB0_22
# %bb.1:
	movl	%r14d, %r13d
	leaq	12(%rsp), %r12
	xorl	%r15d, %r15d
	jmp	.LBB0_2
	.p2align	4, 0x90
.LBB0_20:                               #   in Loop: Header=BB0_2 Depth=1
	movsbl	12(%rsp), %eax
	movl	%edx, %ecx
	subl	%eax, %ecx
	addl	$48, %ecx
	cmpl	$0, (%rbx,%r15,4)
	leal	-48(%rdx,%rax), %eax
	cmovlel	%ecx, %eax
	movl	%eax, (%rbp,%r15,4)
	incq	%r15
	cmpq	%r13, %r15
	je	.LBB0_5
.LBB0_2:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_14 Depth 2
                                        #     Child Loop BB0_19 Depth 2
	movl	(%rbx,%r15,4), %eax
	movl	%eax, %edx
	negl	%edx
	cmovsl	%eax, %edx
	movq	%r12, %rdi
	leaq	.L.str(%rip), %rsi
	xorl	%eax, %eax
	callq	sprintf@PLT
	movq	%r12, %rdi
	callq	strlen@PLT
	movl	$0, %edx
	cmpl	$2, %eax
	jl	.LBB0_20
# %bb.3:                                #   in Loop: Header=BB0_2 Depth=1
	movl	%eax, %eax
	leaq	-1(%rax), %r8
	cmpq	$8, %r8
	jae	.LBB0_11
# %bb.4:                                #   in Loop: Header=BB0_2 Depth=1
	xorl	%edx, %edx
	movl	$1, %ecx
	jmp	.LBB0_19
	.p2align	4, 0x90
.LBB0_11:                               #   in Loop: Header=BB0_2 Depth=1
	movq	%r8, %rcx
	andq	$-8, %rcx
	leaq	-8(%rcx), %rsi
	movq	%rsi, %rdx
	shrq	$3, %rdx
	incq	%rdx
	testq	%rsi, %rsi
	movdqa	.LCPI0_0(%rip), %xmm4           # xmm4 = [4294967200,4294967200,4294967200,4294967200]
	je	.LBB0_12
# %bb.13:                               #   in Loop: Header=BB0_2 Depth=1
	movq	%rdx, %rsi
	andq	$-2, %rsi
	pxor	%xmm0, %xmm0
	xorl	%edi, %edi
	pxor	%xmm1, %xmm1
	.p2align	4, 0x90
.LBB0_14:                               #   Parent Loop BB0_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movd	13(%rsp,%rdi), %xmm2            # xmm2 = mem[0],zero,zero,zero
	punpcklbw	%xmm2, %xmm2            # xmm2 = xmm2[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
	punpcklwd	%xmm2, %xmm2            # xmm2 = xmm2[0,0,1,1,2,2,3,3]
	movd	17(%rsp,%rdi), %xmm3            # xmm3 = mem[0],zero,zero,zero
	punpcklbw	%xmm3, %xmm3            # xmm3 = xmm3[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
	punpcklwd	%xmm3, %xmm3            # xmm3 = xmm3[0,0,1,1,2,2,3,3]
	psrad	$24, %xmm2
	paddd	%xmm0, %xmm2
	psrad	$24, %xmm3
	paddd	%xmm1, %xmm3
	movd	21(%rsp,%rdi), %xmm0            # xmm0 = mem[0],zero,zero,zero
	punpcklbw	%xmm0, %xmm0            # xmm0 = xmm0[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
	punpcklwd	%xmm0, %xmm0            # xmm0 = xmm0[0,0,1,1,2,2,3,3]
	psrad	$24, %xmm0
	movd	25(%rsp,%rdi), %xmm1            # xmm1 = mem[0],zero,zero,zero
	punpcklbw	%xmm1, %xmm1            # xmm1 = xmm1[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
	punpcklwd	%xmm1, %xmm1            # xmm1 = xmm1[0,0,1,1,2,2,3,3]
	psrad	$24, %xmm1
	paddd	%xmm4, %xmm0
	paddd	%xmm2, %xmm0
	paddd	%xmm4, %xmm1
	paddd	%xmm3, %xmm1
	addq	$16, %rdi
	addq	$-2, %rsi
	jne	.LBB0_14
# %bb.15:                               #   in Loop: Header=BB0_2 Depth=1
	testb	$1, %dl
	je	.LBB0_17
.LBB0_16:                               #   in Loop: Header=BB0_2 Depth=1
	orq	$1, %rdi
	movd	12(%rsp,%rdi), %xmm2            # xmm2 = mem[0],zero,zero,zero
	punpcklbw	%xmm2, %xmm2            # xmm2 = xmm2[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
	punpcklwd	%xmm2, %xmm2            # xmm2 = xmm2[0,0,1,1,2,2,3,3]
	movd	16(%rsp,%rdi), %xmm3            # xmm3 = mem[0],zero,zero,zero
	punpcklbw	%xmm3, %xmm3            # xmm3 = xmm3[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
	punpcklwd	%xmm3, %xmm3            # xmm3 = xmm3[0,0,1,1,2,2,3,3]
	psrad	$24, %xmm2
	paddd	%xmm2, %xmm0
	psrad	$24, %xmm3
	paddd	%xmm3, %xmm1
	movdqa	.LCPI0_1(%rip), %xmm2           # xmm2 = [4294967248,4294967248,4294967248,4294967248]
	paddd	%xmm2, %xmm0
	paddd	%xmm2, %xmm1
.LBB0_17:                               #   in Loop: Header=BB0_2 Depth=1
	paddd	%xmm1, %xmm0
	pshufd	$238, %xmm0, %xmm1              # xmm1 = xmm0[2,3,2,3]
	paddd	%xmm0, %xmm1
	pshufd	$85, %xmm1, %xmm0               # xmm0 = xmm1[1,1,1,1]
	paddd	%xmm1, %xmm0
	movd	%xmm0, %edx
	cmpq	%rcx, %r8
	je	.LBB0_20
# %bb.18:                               #   in Loop: Header=BB0_2 Depth=1
	orq	$1, %rcx
	.p2align	4, 0x90
.LBB0_19:                               #   Parent Loop BB0_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movsbl	12(%rsp,%rcx), %esi
	addl	%esi, %edx
	addl	$-48, %edx
	incq	%rcx
	cmpq	%rcx, %rax
	jne	.LBB0_19
	jmp	.LBB0_20
.LBB0_12:                               #   in Loop: Header=BB0_2 Depth=1
	pxor	%xmm0, %xmm0
	xorl	%edi, %edi
	pxor	%xmm1, %xmm1
	testb	$1, %dl
	jne	.LBB0_16
	jmp	.LBB0_17
.LBB0_5:
	testl	%r14d, %r14d
	jle	.LBB0_22
# %bb.6:
	decq	%r13
	xorl	%eax, %eax
	jmp	.LBB0_7
	.p2align	4, 0x90
.LBB0_21:                               #   in Loop: Header=BB0_7 Depth=1
	incl	%eax
	cmpl	%r14d, %eax
	je	.LBB0_22
.LBB0_7:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_9 Depth 2
	cmpl	$1, %r14d
	je	.LBB0_21
# %bb.8:                                #   in Loop: Header=BB0_7 Depth=1
	movl	(%rbp), %ecx
	xorl	%edx, %edx
	jmp	.LBB0_9
	.p2align	4, 0x90
.LBB0_23:                               #   in Loop: Header=BB0_9 Depth=2
	movl	%ecx, 4(%rbp,%rdx,4)
	movl	%esi, (%rbp,%rdx,4)
	movq	(%rbx,%rdx,4), %xmm0            # xmm0 = mem[0],zero
	pshufd	$225, %xmm0, %xmm0              # xmm0 = xmm0[1,0,2,3]
	movq	%xmm0, (%rbx,%rdx,4)
.LBB0_24:                               #   in Loop: Header=BB0_9 Depth=2
	incq	%rdx
	cmpq	%rdx, %r13
	je	.LBB0_21
.LBB0_9:                                #   Parent Loop BB0_7 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	4(%rbp,%rdx,4), %esi
	cmpl	%esi, %ecx
	jg	.LBB0_23
# %bb.10:                               #   in Loop: Header=BB0_9 Depth=2
	movl	%esi, %ecx
	jmp	.LBB0_24
.LBB0_22:
	movq	%rbp, %rdi
	callq	free@PLT
	movq	%rbx, %rax
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
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%d"
	.size	.L.str, 3

	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
