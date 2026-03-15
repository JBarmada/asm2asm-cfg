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
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
                                        # kill: def $ecx killed $ecx def $rcx
	testl	%esi, %esi
	jle	.LBB0_1
# %bb.2:
	movl	%edx, %r8d
	leal	-1(%rcx), %eax
	movl	%eax, -12(%rsp)                 # 4-byte Spill
	movl	%esi, %r11d
	movl	%edx, %esi
	movl	%esi, %r13d
	andl	$-8, %r13d
	leaq	-8(%r13), %r9
	movq	%r9, -8(%rsp)                   # 8-byte Spill
	shrq	$3, %r9
	incq	%r9
	movl	%r9d, %r14d
	andl	$3, %r14d
	andq	$-4, %r9
	movq	%r14, %r12
	shlq	$5, %r12
	xorl	%ebp, %ebp
	xorl	%r10d, %r10d
	jmp	.LBB0_3
	.p2align	4, 0x90
.LBB0_17:                               #   in Loop: Header=BB0_3 Depth=1
	incq	%rbp
	cmpq	%r11, %rbp
	je	.LBB0_18
.LBB0_3:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_10 Depth 2
                                        #     Child Loop BB0_13 Depth 2
                                        #     Child Loop BB0_6 Depth 2
	testl	%r8d, %r8d
	jle	.LBB0_17
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=1
	movq	(%rdi,%rbp,8), %rdx
	cmpl	$8, %r8d
	jae	.LBB0_7
# %bb.5:                                #   in Loop: Header=BB0_3 Depth=1
	xorl	%ebx, %ebx
	xorl	%eax, %eax
	jmp	.LBB0_6
	.p2align	4, 0x90
.LBB0_7:                                #   in Loop: Header=BB0_3 Depth=1
	cmpq	$24, -8(%rsp)                   # 8-byte Folded Reload
	jae	.LBB0_9
# %bb.8:                                #   in Loop: Header=BB0_3 Depth=1
	pxor	%xmm0, %xmm0
	xorl	%eax, %eax
	pxor	%xmm1, %xmm1
	jmp	.LBB0_11
.LBB0_9:                                #   in Loop: Header=BB0_3 Depth=1
	pxor	%xmm0, %xmm0
	movq	%r9, %r15
	xorl	%eax, %eax
	pxor	%xmm1, %xmm1
	.p2align	4, 0x90
.LBB0_10:                               #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movdqu	(%rdx,%rax,4), %xmm2
	paddd	%xmm0, %xmm2
	movdqu	16(%rdx,%rax,4), %xmm0
	paddd	%xmm1, %xmm0
	movdqu	32(%rdx,%rax,4), %xmm1
	movdqu	48(%rdx,%rax,4), %xmm3
	movdqu	64(%rdx,%rax,4), %xmm4
	paddd	%xmm1, %xmm4
	paddd	%xmm2, %xmm4
	movdqu	80(%rdx,%rax,4), %xmm2
	paddd	%xmm3, %xmm2
	paddd	%xmm0, %xmm2
	movdqu	96(%rdx,%rax,4), %xmm0
	paddd	%xmm4, %xmm0
	movdqu	112(%rdx,%rax,4), %xmm1
	paddd	%xmm2, %xmm1
	addq	$32, %rax
	addq	$-4, %r15
	jne	.LBB0_10
.LBB0_11:                               #   in Loop: Header=BB0_3 Depth=1
	testq	%r14, %r14
	je	.LBB0_14
# %bb.12:                               #   in Loop: Header=BB0_3 Depth=1
	leaq	(%rdx,%rax,4), %rax
	addq	$16, %rax
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB0_13:                               #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movdqu	-16(%rax,%rbx), %xmm2
	paddd	%xmm2, %xmm0
	movdqu	(%rax,%rbx), %xmm2
	paddd	%xmm2, %xmm1
	addq	$32, %rbx
	cmpq	%rbx, %r12
	jne	.LBB0_13
.LBB0_14:                               #   in Loop: Header=BB0_3 Depth=1
	paddd	%xmm1, %xmm0
	pshufd	$238, %xmm0, %xmm1              # xmm1 = xmm0[2,3,2,3]
	paddd	%xmm0, %xmm1
	pshufd	$85, %xmm1, %xmm0               # xmm0 = xmm1[1,1,1,1]
	paddd	%xmm1, %xmm0
	movd	%xmm0, %eax
	movq	%r13, %rbx
	cmpq	%rsi, %r13
	je	.LBB0_15
	.p2align	4, 0x90
.LBB0_6:                                #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	addl	(%rdx,%rbx,4), %eax
	incq	%rbx
	cmpq	%rbx, %rsi
	jne	.LBB0_6
.LBB0_15:                               #   in Loop: Header=BB0_3 Depth=1
	testl	%eax, %eax
	jle	.LBB0_17
# %bb.16:                               #   in Loop: Header=BB0_3 Depth=1
	addl	-12(%rsp), %eax                 # 4-byte Folded Reload
	cltd
	idivl	%ecx
	addl	%eax, %r10d
	jmp	.LBB0_17
.LBB0_1:
	xorl	%r10d, %r10d
.LBB0_18:
	movl	%r10d, %eax
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
	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
