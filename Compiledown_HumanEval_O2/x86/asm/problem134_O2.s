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
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	subq	$96, %rsp
	.cfi_def_cfa_offset 144
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	testl	%esi, %esi
	jle	.LBB0_1
# %bb.2:
	movq	%rdi, %r15
	movl	%esi, %r14d
	cmpl	$8, %esi
	jae	.LBB0_4
# %bb.3:
	xorl	%ebx, %ebx
	xorl	%ebp, %ebp
	jmp	.LBB0_7
.LBB0_1:
	xorl	%ebp, %ebp
	jmp	.LBB0_8
.LBB0_4:
	movl	%r14d, %ebx
	andl	$-8, %ebx
	leaq	(,%r14,4), %r12
	andq	$-32, %r12
	pxor	%xmm2, %xmm2
	xorl	%ebp, %ebp
	pxor	%xmm1, %xmm1
	.p2align	4, 0x90
.LBB0_5:                                # =>This Inner Loop Header: Depth=1
	movdqa	%xmm1, 64(%rsp)                 # 16-byte Spill
	movdqa	%xmm2, 80(%rsp)                 # 16-byte Spill
	movups	(%r15,%rbp), %xmm1
	movaps	%xmm1, (%rsp)                   # 16-byte Spill
	movups	16(%r15,%rbp), %xmm0
	movaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	movaps	%xmm1, %xmm0
	shufps	$255, %xmm1, %xmm0              # xmm0 = xmm0[3,3],xmm1[3,3]
	callq	ceilf@PLT
	movaps	%xmm0, 16(%rsp)                 # 16-byte Spill
	movaps	(%rsp), %xmm0                   # 16-byte Reload
	movhlps	%xmm0, %xmm0                    # xmm0 = xmm0[1,1]
	callq	ceilf@PLT
	unpcklps	16(%rsp), %xmm0                 # 16-byte Folded Reload
                                        # xmm0 = xmm0[0],mem[0],xmm0[1],mem[1]
	movaps	%xmm0, 48(%rsp)                 # 16-byte Spill
	movaps	(%rsp), %xmm0                   # 16-byte Reload
	callq	ceilf@PLT
	movaps	%xmm0, 16(%rsp)                 # 16-byte Spill
	movaps	(%rsp), %xmm0                   # 16-byte Reload
	shufps	$85, %xmm0, %xmm0               # xmm0 = xmm0[1,1,1,1]
	callq	ceilf@PLT
	movaps	16(%rsp), %xmm1                 # 16-byte Reload
	unpcklps	%xmm0, %xmm1                    # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1]
	unpcklpd	48(%rsp), %xmm1                 # 16-byte Folded Reload
                                        # xmm1 = xmm1[0],mem[0]
	movaps	%xmm1, 16(%rsp)                 # 16-byte Spill
	movaps	32(%rsp), %xmm0                 # 16-byte Reload
	shufps	$255, %xmm0, %xmm0              # xmm0 = xmm0[3,3,3,3]
	callq	ceilf@PLT
	movaps	%xmm0, (%rsp)                   # 16-byte Spill
	movaps	32(%rsp), %xmm0                 # 16-byte Reload
	movhlps	%xmm0, %xmm0                    # xmm0 = xmm0[1,1]
	callq	ceilf@PLT
	unpcklps	(%rsp), %xmm0                   # 16-byte Folded Reload
                                        # xmm0 = xmm0[0],mem[0],xmm0[1],mem[1]
	movaps	%xmm0, (%rsp)                   # 16-byte Spill
	movaps	32(%rsp), %xmm0                 # 16-byte Reload
	callq	ceilf@PLT
	movaps	%xmm0, 48(%rsp)                 # 16-byte Spill
	movaps	32(%rsp), %xmm0                 # 16-byte Reload
	shufps	$85, %xmm0, %xmm0               # xmm0 = xmm0[1,1,1,1]
	callq	ceilf@PLT
	movaps	48(%rsp), %xmm1                 # 16-byte Reload
	unpcklps	%xmm0, %xmm1                    # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1]
	unpcklpd	(%rsp), %xmm1                   # 16-byte Folded Reload
                                        # xmm1 = xmm1[0],mem[0]
	cvttps2dq	16(%rsp), %xmm0         # 16-byte Folded Reload
	cvttps2dq	%xmm1, %xmm1
	pshufd	$245, %xmm0, %xmm2              # xmm2 = xmm0[1,1,3,3]
	pmuludq	%xmm0, %xmm0
	pshufd	$232, %xmm0, %xmm0              # xmm0 = xmm0[0,2,2,3]
	pmuludq	%xmm2, %xmm2
	pshufd	$232, %xmm2, %xmm2              # xmm2 = xmm2[0,2,2,3]
	punpckldq	%xmm2, %xmm0            # xmm0 = xmm0[0],xmm2[0],xmm0[1],xmm2[1]
	movdqa	80(%rsp), %xmm2                 # 16-byte Reload
	paddd	%xmm0, %xmm2
	pshufd	$245, %xmm1, %xmm0              # xmm0 = xmm1[1,1,3,3]
	pmuludq	%xmm1, %xmm1
	pshufd	$232, %xmm1, %xmm1              # xmm1 = xmm1[0,2,2,3]
	pmuludq	%xmm0, %xmm0
	pshufd	$232, %xmm0, %xmm0              # xmm0 = xmm0[0,2,2,3]
	punpckldq	%xmm0, %xmm1            # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1]
	movdqa	64(%rsp), %xmm0                 # 16-byte Reload
	paddd	%xmm1, %xmm0
	movdqa	%xmm0, 64(%rsp)                 # 16-byte Spill
	movdqa	64(%rsp), %xmm1                 # 16-byte Reload
	addq	$32, %rbp
	cmpq	%rbp, %r12
	jne	.LBB0_5
# %bb.6:
	paddd	%xmm2, %xmm1
	pshufd	$238, %xmm1, %xmm0              # xmm0 = xmm1[2,3,2,3]
	paddd	%xmm1, %xmm0
	pshufd	$85, %xmm0, %xmm1               # xmm1 = xmm0[1,1,1,1]
	paddd	%xmm0, %xmm1
	movd	%xmm1, %ebp
	cmpq	%r14, %rbx
	je	.LBB0_8
	.p2align	4, 0x90
.LBB0_7:                                # =>This Inner Loop Header: Depth=1
	movss	(%r15,%rbx,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	callq	ceilf@PLT
	cvttss2si	%xmm0, %eax
	imull	%eax, %eax
	addl	%eax, %ebp
	incq	%rbx
	cmpq	%rbx, %r14
	jne	.LBB0_7
.LBB0_8:
	movl	%ebp, %eax
	addq	$96, %rsp
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
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
