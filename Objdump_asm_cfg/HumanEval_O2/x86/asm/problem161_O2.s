	.text
	.file	"code.c"
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4                               # -- Begin function func0
.LCPI0_0:
	.long	0                               # 0x0
	.long	1                               # 0x1
	.long	2                               # 0x2
	.long	3                               # 0x3
.LCPI0_1:
	.long	4                               # 0x4
	.long	4                               # 0x4
	.long	4                               # 0x4
	.long	4                               # 0x4
.LCPI0_2:
	.long	8                               # 0x8
	.long	8                               # 0x8
	.long	8                               # 0x8
	.long	8                               # 0x8
.LCPI0_3:
	.long	12                              # 0xc
	.long	12                              # 0xc
	.long	12                              # 0xc
	.long	12                              # 0xc
.LCPI0_4:
	.long	16                              # 0x10
	.long	16                              # 0x10
	.long	16                              # 0x10
	.long	16                              # 0x10
.LCPI0_5:
	.long	20                              # 0x14
	.long	20                              # 0x14
	.long	20                              # 0x14
	.long	20                              # 0x14
.LCPI0_6:
	.long	24                              # 0x18
	.long	24                              # 0x18
	.long	24                              # 0x18
	.long	24                              # 0x18
.LCPI0_7:
	.long	28                              # 0x1c
	.long	28                              # 0x1c
	.long	28                              # 0x1c
	.long	28                              # 0x1c
.LCPI0_8:
	.long	32                              # 0x20
	.long	32                              # 0x20
	.long	32                              # 0x20
	.long	32                              # 0x20
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
	movl	%ecx, %r14d
	movl	%edx, 4(%rsp)                   # 4-byte Spill
	movq	%rsi, %r12
	movq	%rdi, 8(%rsp)                   # 8-byte Spill
	movslq	%ecx, %rbp
	leaq	(,%rbp,4), %rbx
	movq	%rbx, %rdi
	callq	malloc@PLT
	movq	%rax, %r15
	movq	%rbx, %rdi
	callq	malloc@PLT
	movq	%rax, %rbx
	testl	%ebp, %ebp
	jle	.LBB0_12
# %bb.1:
	movl	%r14d, %ebp
	leaq	(,%rbp,4), %rdx
	movq	%r15, %rdi
	movq	%r12, %rsi
	callq	memcpy@PLT
	cmpl	$8, %r14d
	jae	.LBB0_4
# %bb.2:
	xorl	%eax, %eax
	jmp	.LBB0_3
.LBB0_4:
	movl	%ebp, %eax
	andl	$-8, %eax
	leaq	-8(%rax), %rsi
	movq	%rsi, %rdx
	shrq	$3, %rdx
	incq	%rdx
	movl	%edx, %ecx
	andl	$3, %ecx
	cmpq	$24, %rsi
	jae	.LBB0_6
# %bb.5:
	movdqa	.LCPI0_0(%rip), %xmm0           # xmm0 = [0,1,2,3]
	xorl	%esi, %esi
	jmp	.LBB0_8
.LBB0_6:
	andq	$-4, %rdx
	movdqa	.LCPI0_0(%rip), %xmm0           # xmm0 = [0,1,2,3]
	xorl	%esi, %esi
	movdqa	.LCPI0_1(%rip), %xmm8           # xmm8 = [4,4,4,4]
	movdqa	.LCPI0_2(%rip), %xmm9           # xmm9 = [8,8,8,8]
	movdqa	.LCPI0_3(%rip), %xmm10          # xmm10 = [12,12,12,12]
	movdqa	.LCPI0_4(%rip), %xmm4           # xmm4 = [16,16,16,16]
	movdqa	.LCPI0_5(%rip), %xmm5           # xmm5 = [20,20,20,20]
	movdqa	.LCPI0_6(%rip), %xmm6           # xmm6 = [24,24,24,24]
	movdqa	.LCPI0_7(%rip), %xmm7           # xmm7 = [28,28,28,28]
	movdqa	.LCPI0_8(%rip), %xmm1           # xmm1 = [32,32,32,32]
	.p2align	4, 0x90
.LBB0_7:                                # =>This Inner Loop Header: Depth=1
	movdqa	%xmm0, %xmm2
	paddd	%xmm8, %xmm2
	movdqu	%xmm0, (%rbx,%rsi,4)
	movdqu	%xmm2, 16(%rbx,%rsi,4)
	movdqa	%xmm0, %xmm2
	paddd	%xmm9, %xmm2
	movdqa	%xmm0, %xmm3
	paddd	%xmm10, %xmm3
	movdqu	%xmm2, 32(%rbx,%rsi,4)
	movdqu	%xmm3, 48(%rbx,%rsi,4)
	movdqa	%xmm0, %xmm2
	paddd	%xmm4, %xmm2
	movdqa	%xmm0, %xmm3
	paddd	%xmm5, %xmm3
	movdqu	%xmm2, 64(%rbx,%rsi,4)
	movdqu	%xmm3, 80(%rbx,%rsi,4)
	movdqa	%xmm0, %xmm2
	paddd	%xmm6, %xmm2
	movdqa	%xmm0, %xmm3
	paddd	%xmm7, %xmm3
	movdqu	%xmm2, 96(%rbx,%rsi,4)
	movdqu	%xmm3, 112(%rbx,%rsi,4)
	addq	$32, %rsi
	paddd	%xmm1, %xmm0
	addq	$-4, %rdx
	jne	.LBB0_7
.LBB0_8:
	testq	%rcx, %rcx
	je	.LBB0_11
# %bb.9:
	leaq	(%rbx,%rsi,4), %rdx
	addq	$16, %rdx
	shlq	$5, %rcx
	xorl	%esi, %esi
	movdqa	.LCPI0_1(%rip), %xmm1           # xmm1 = [4,4,4,4]
	movdqa	.LCPI0_2(%rip), %xmm2           # xmm2 = [8,8,8,8]
	.p2align	4, 0x90
.LBB0_10:                               # =>This Inner Loop Header: Depth=1
	movdqa	%xmm0, %xmm3
	paddd	%xmm1, %xmm3
	movdqu	%xmm0, -16(%rdx,%rsi)
	movdqu	%xmm3, (%rdx,%rsi)
	paddd	%xmm2, %xmm0
	addq	$32, %rsi
	cmpq	%rsi, %rcx
	jne	.LBB0_10
.LBB0_11:
	cmpq	%rbp, %rax
	je	.LBB0_12
	.p2align	4, 0x90
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	movl	%eax, (%rbx,%rax,4)
	incq	%rax
	cmpq	%rax, %rbp
	jne	.LBB0_3
.LBB0_12:
	movl	4(%rsp), %eax                   # 4-byte Reload
	testl	%eax, %eax
	jle	.LBB0_49
# %bb.13:
	movl	%eax, %r14d
	xorl	%ebp, %ebp
	leaq	.L.str(%rip), %r12
	movq	%r14, 16(%rsp)                  # 8-byte Spill
	jmp	.LBB0_14
	.p2align	4, 0x90
.LBB0_27:                               #   in Loop: Header=BB0_14 Depth=1
	leaq	1(%rbp), %r13
	movslq	%eax, %r12
	xorps	%xmm0, %xmm0
	cvtsi2sdl	(%r15,%r12,4), %xmm0
	xorps	%xmm1, %xmm1
	cvtsi2sdl	(%r15,%rcx,4), %xmm1
	callq	pow@PLT
	cvttsd2si	%xmm0, %eax
	movl	%eax, (%r15,%r12,4)
	movl	%r12d, 4(%rbx,%rbp,4)
	movq	%r13, %rbp
	movq	%r14, %r12
	movq	16(%rsp), %r14                  # 8-byte Reload
.LBB0_28:                               #   in Loop: Header=BB0_14 Depth=1
	cmpq	%r14, %rbp
	je	.LBB0_16
.LBB0_14:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_24 Depth 2
                                        #     Child Loop BB0_26 Depth 2
	movq	8(%rsp), %rax                   # 8-byte Reload
	movq	(%rax,%rbp,8), %rdi
	movq	%r12, %rsi
	callq	strcmp@PLT
	testl	%eax, %eax
	je	.LBB0_22
# %bb.15:                               #   in Loop: Header=BB0_14 Depth=1
	incq	%rbp
	jmp	.LBB0_28
	.p2align	4, 0x90
.LBB0_22:                               #   in Loop: Header=BB0_14 Depth=1
	movslq	(%rbx,%rbp,4), %rax
	movl	(%rbx,%rax,4), %ecx
	cmpl	%eax, %ecx
	je	.LBB0_23
	.p2align	4, 0x90
.LBB0_24:                               #   Parent Loop BB0_14 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	%ecx, (%rbx,%rbp,4)
	movslq	%ecx, %rdx
	movl	%ecx, %eax
	movl	(%rbx,%rdx,4), %esi
	movl	%esi, %ecx
	cmpl	%edx, %esi
	jne	.LBB0_24
.LBB0_23:                               #   in Loop: Header=BB0_14 Depth=1
	movq	%r12, %r14
	movslq	4(%rbx,%rbp,4), %rcx
	.p2align	4, 0x90
.LBB0_26:                               #   Parent Loop BB0_14 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	(%rbx,%rcx,4), %edx
	cmpl	%ecx, %edx
	je	.LBB0_27
# %bb.25:                               #   in Loop: Header=BB0_26 Depth=2
	movl	%edx, 4(%rbx,%rbp,4)
	movslq	%edx, %rcx
	jmp	.LBB0_26
.LBB0_16:
	cmpl	$0, 4(%rsp)                     # 4-byte Folded Reload
	jle	.LBB0_49
# %bb.17:
	xorl	%ebp, %ebp
	jmp	.LBB0_18
	.p2align	4, 0x90
.LBB0_38:                               #   in Loop: Header=BB0_18 Depth=1
	imull	%esi, %eax
.LBB0_40:                               #   in Loop: Header=BB0_18 Depth=1
	movl	%eax, (%r15,%rcx,4)
	movl	%ecx, 4(%rbx,%rbp,4)
.LBB0_41:                               #   in Loop: Header=BB0_18 Depth=1
	incq	%rbp
	cmpq	%r14, %rbp
	je	.LBB0_29
.LBB0_18:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_34 Depth 2
                                        #     Child Loop BB0_36 Depth 2
	movq	8(%rsp), %rax                   # 8-byte Reload
	movq	(%rax,%rbp,8), %r13
	movq	%r13, %rdi
	leaq	.L.str.1(%rip), %rsi
	callq	strcmp@PLT
	movl	%eax, %r12d
	testl	%eax, %eax
	je	.LBB0_20
# %bb.19:                               #   in Loop: Header=BB0_18 Depth=1
	movq	%r13, %rdi
	leaq	.L.str.2(%rip), %rsi
	callq	strcmp@PLT
	testl	%eax, %eax
	jne	.LBB0_41
.LBB0_20:                               #   in Loop: Header=BB0_18 Depth=1
	movslq	(%rbx,%rbp,4), %rax
	movl	(%rbx,%rax,4), %ecx
	cmpl	%eax, %ecx
	je	.LBB0_21
	.p2align	4, 0x90
.LBB0_34:                               #   Parent Loop BB0_18 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	%ecx, (%rbx,%rbp,4)
	movslq	%ecx, %rdx
	movl	%ecx, %eax
	movl	(%rbx,%rdx,4), %esi
	movl	%esi, %ecx
	cmpl	%edx, %esi
	jne	.LBB0_34
.LBB0_21:                               #   in Loop: Header=BB0_18 Depth=1
	movslq	4(%rbx,%rbp,4), %rcx
	.p2align	4, 0x90
.LBB0_36:                               #   Parent Loop BB0_18 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	(%rbx,%rcx,4), %edx
	cmpl	%ecx, %edx
	je	.LBB0_37
# %bb.35:                               #   in Loop: Header=BB0_36 Depth=2
	movl	%edx, 4(%rbx,%rbp,4)
	movslq	%edx, %rcx
	jmp	.LBB0_36
	.p2align	4, 0x90
.LBB0_37:                               #   in Loop: Header=BB0_18 Depth=1
	movl	(%r15,%rcx,4), %esi
	movslq	%eax, %rcx
	movl	(%r15,%rcx,4), %eax
	testl	%r12d, %r12d
	je	.LBB0_38
# %bb.39:                               #   in Loop: Header=BB0_18 Depth=1
	cltd
	idivl	%esi
	jmp	.LBB0_40
.LBB0_29:
	cmpl	$0, 4(%rsp)                     # 4-byte Folded Reload
	jle	.LBB0_49
# %bb.30:
	xorl	%r13d, %r13d
	jmp	.LBB0_31
	.p2align	4, 0x90
.LBB0_47:                               #   in Loop: Header=BB0_31 Depth=1
	cltq
	movl	%eax, 4(%rbx,%r13,4)
	incq	%r13
	movl	(%r15,%rcx,4), %ecx
	movl	%ecx, %edx
	negl	%edx
	testl	%ebp, %ebp
	cmovel	%ecx, %edx
	addl	%edx, (%r15,%rax,4)
	cmpq	%r14, %r13
	je	.LBB0_49
.LBB0_31:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_44 Depth 2
                                        #     Child Loop BB0_46 Depth 2
	movq	8(%rsp), %rax                   # 8-byte Reload
	movq	(%rax,%r13,8), %r12
	movq	%r12, %rdi
	leaq	.L.str.3(%rip), %rsi
	callq	strcmp@PLT
	movl	%eax, %ebp
	testl	%eax, %eax
	je	.LBB0_42
# %bb.32:                               #   in Loop: Header=BB0_31 Depth=1
	movq	%r12, %rdi
	leaq	.L.str.4(%rip), %rsi
	callq	strcmp@PLT
	testl	%eax, %eax
	je	.LBB0_42
# %bb.33:                               #   in Loop: Header=BB0_31 Depth=1
	incq	%r13
	cmpq	%r14, %r13
	jne	.LBB0_31
	jmp	.LBB0_49
	.p2align	4, 0x90
.LBB0_42:                               #   in Loop: Header=BB0_31 Depth=1
	movslq	(%rbx,%r13,4), %rax
	movl	(%rbx,%rax,4), %ecx
	cmpl	%eax, %ecx
	je	.LBB0_43
	.p2align	4, 0x90
.LBB0_44:                               #   Parent Loop BB0_31 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	%ecx, (%rbx,%r13,4)
	movslq	%ecx, %rdx
	movl	%ecx, %eax
	movl	(%rbx,%rdx,4), %esi
	movl	%esi, %ecx
	cmpl	%edx, %esi
	jne	.LBB0_44
.LBB0_43:                               #   in Loop: Header=BB0_31 Depth=1
	movslq	4(%rbx,%r13,4), %rcx
	.p2align	4, 0x90
.LBB0_46:                               #   Parent Loop BB0_31 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	(%rbx,%rcx,4), %edx
	cmpl	%ecx, %edx
	je	.LBB0_47
# %bb.45:                               #   in Loop: Header=BB0_46 Depth=2
	movl	%edx, 4(%rbx,%r13,4)
	movslq	%edx, %rcx
	jmp	.LBB0_46
.LBB0_49:
	movl	(%r15), %ebp
	movq	%r15, %rdi
	callq	free@PLT
	movq	%rbx, %rdi
	callq	free@PLT
	movl	%ebp, %eax
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
	.asciz	"**"
	.size	.L.str, 3

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"*"
	.size	.L.str.1, 2

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"//"
	.size	.L.str.2, 3

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"+"
	.size	.L.str.3, 2

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"-"
	.size	.L.str.4, 2

	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
