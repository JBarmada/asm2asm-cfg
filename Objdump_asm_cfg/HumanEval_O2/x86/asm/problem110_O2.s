	.text
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	4, 0x90
	.type	func0,@function
func0:                                  # @func0
	.cfi_startproc
# %bb.0:
	testl	%esi, %esi
	je	.LBB0_1
# %bb.2:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	cmpl	$1, %esi
	jle	.LBB0_3
# %bb.6:
	movl	%esi, %r10d
	movl	(%rdi), %r8d
	leaq	-1(%r10), %r9
	cmpq	$8, %r9
	jae	.LBB0_8
# %bb.7:
	xorl	%ebx, %ebx
	movl	$1, %r11d
	movl	%r8d, %edx
	jmp	.LBB0_12
.LBB0_1:
	.cfi_def_cfa_offset 8
	.cfi_restore %rbx
	movb	$1, %al
	retq
.LBB0_3:
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movl	(%rdi), %r8d
	xorl	%ebx, %ebx
	jmp	.LBB0_4
.LBB0_8:
	movq	%r9, %rcx
	andq	$-8, %rcx
	leaq	1(%rcx), %r11
	movd	%r8d, %xmm0
	pshufd	$0, %xmm0, %xmm2                # xmm2 = xmm0[0,0,0,0]
	pxor	%xmm0, %xmm0
	xorl	%eax, %eax
	pxor	%xmm1, %xmm1
	.p2align	4, 0x90
.LBB0_9:                                # =>This Inner Loop Header: Depth=1
	movups	4(%rdi,%rax,4), %xmm3
	shufps	$3, %xmm3, %xmm2                # xmm2 = xmm2[3,0],xmm3[0,0]
	shufps	$152, %xmm3, %xmm2              # xmm2 = xmm2[0,2],xmm3[1,2]
	pcmpgtd	%xmm3, %xmm2
	psubd	%xmm2, %xmm0
	movups	20(%rdi,%rax,4), %xmm2
	shufps	$3, %xmm2, %xmm3                # xmm3 = xmm3[3,0],xmm2[0,0]
	shufps	$152, %xmm2, %xmm3              # xmm3 = xmm3[0,2],xmm2[1,2]
	pcmpgtd	%xmm2, %xmm3
	psubd	%xmm3, %xmm1
	addq	$8, %rax
	cmpq	%rax, %rcx
	jne	.LBB0_9
# %bb.10:
	paddd	%xmm0, %xmm1
	pshufd	$238, %xmm1, %xmm0              # xmm0 = xmm1[2,3,2,3]
	paddd	%xmm1, %xmm0
	pshufd	$85, %xmm0, %xmm1               # xmm1 = xmm0[1,1,1,1]
	paddd	%xmm0, %xmm1
	movd	%xmm1, %ebx
	cmpq	%rcx, %r9
	je	.LBB0_4
# %bb.11:
	pshufd	$255, %xmm2, %xmm0              # xmm0 = xmm2[3,3,3,3]
	movd	%xmm0, %edx
	.p2align	4, 0x90
.LBB0_12:                               # =>This Inner Loop Header: Depth=1
	movl	(%rdi,%r11,4), %ecx
	xorl	%eax, %eax
	cmpl	%edx, %ecx
	setl	%al
	addl	%eax, %ebx
	incq	%r11
	movl	%ecx, %edx
	cmpq	%r11, %r10
	jne	.LBB0_12
.LBB0_4:
	movslq	%esi, %rcx
	xorl	%edx, %edx
	cmpl	%r8d, -4(%rdi,%rcx,4)
	setg	%dl
	addl	%ebx, %edx
	cmpl	$2, %edx
	setb	%al
	popq	%rbx
	.cfi_def_cfa_offset 8
	.cfi_restore %rbx
	retq
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
