	.text
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	4, 0x90
	.type	func0,@function
func0:                                  # @func0
	.cfi_startproc
# %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
                                        # kill: def $esi killed $esi def $rsi
	xorl	%eax, %eax
	cmpl	$2, %esi
	jl	.LBB0_14
# %bb.1:
	movl	%esi, %r8d
	shrl	%r8d
	cmpl	$24, %esi
	jae	.LBB0_3
# %bb.2:
	xorl	%r14d, %r14d
.LBB0_8:
	xorl	%eax, %eax
.LBB0_9:
	movq	%r14, %r10
	notq	%r10
	testb	$1, %r8b
	je	.LBB0_11
# %bb.10:
	movl	(%rdi,%r14,4), %r9d
	movl	%r14d, %ecx
	notl	%ecx
	addl	%esi, %ecx
	movslq	%ecx, %r11
	xorl	%ecx, %ecx
	cmpl	(%rdi,%r11,4), %r9d
	setne	%cl
	addl	%ecx, %eax
	orq	$1, %r14
.LBB0_11:
	addq	%r8, %r10
	je	.LBB0_14
# %bb.12:
	movl	%r14d, %ecx
	notl	%ecx
	addl	%esi, %ecx
	.p2align	4, 0x90
.LBB0_13:                               # =>This Inner Loop Header: Depth=1
	movslq	%ecx, %rcx
	movl	(%rdi,%r14,4), %esi
	movl	4(%rdi,%r14,4), %edx
	xorl	%ebx, %ebx
	cmpl	(%rdi,%rcx,4), %esi
	setne	%bl
	addl	%eax, %ebx
	leal	-1(%rcx), %eax
	movslq	%eax, %rsi
	xorl	%eax, %eax
	cmpl	(%rdi,%rsi,4), %edx
	setne	%al
	addl	%ebx, %eax
	addq	$2, %r14
	addl	$-2, %ecx
	cmpq	%r14, %r8
	jne	.LBB0_13
	jmp	.LBB0_14
.LBB0_3:
	leaq	-1(%r8), %r9
	leal	-1(%rsi), %ecx
	movl	%ecx, %eax
	subl	%r9d, %eax
	xorl	%r14d, %r14d
	cmpl	%ecx, %eax
	jg	.LBB0_8
# %bb.4:
	shrq	$32, %r9
	movl	$0, %eax
	jne	.LBB0_9
# %bb.5:
	movl	%r8d, %r14d
	andl	$-8, %r14d
	movl	%esi, %r9d
	andl	$-16, %r9d
	addq	%r9, %r9
	pxor	%xmm0, %xmm0
	xorl	%eax, %eax
	pcmpeqd	%xmm2, %xmm2
	pxor	%xmm1, %xmm1
	.p2align	4, 0x90
.LBB0_6:                                # =>This Inner Loop Header: Depth=1
	movdqu	(%rdi,%rax), %xmm3
	movdqu	16(%rdi,%rax), %xmm4
	movslq	%ecx, %rcx
	movdqu	-28(%rdi,%rcx,4), %xmm5
	movdqu	-12(%rdi,%rcx,4), %xmm6
	pshufd	$27, %xmm6, %xmm6               # xmm6 = xmm6[3,2,1,0]
	pcmpeqd	%xmm3, %xmm6
	paddd	%xmm6, %xmm0
	pshufd	$27, %xmm5, %xmm3               # xmm3 = xmm5[3,2,1,0]
	pcmpeqd	%xmm4, %xmm3
	paddd	%xmm3, %xmm1
	psubd	%xmm2, %xmm0
	psubd	%xmm2, %xmm1
	addq	$32, %rax
	addl	$-8, %ecx
	cmpq	%rax, %r9
	jne	.LBB0_6
# %bb.7:
	paddd	%xmm0, %xmm1
	pshufd	$238, %xmm1, %xmm0              # xmm0 = xmm1[2,3,2,3]
	paddd	%xmm1, %xmm0
	pshufd	$85, %xmm0, %xmm1               # xmm1 = xmm0[1,1,1,1]
	paddd	%xmm0, %xmm1
	movd	%xmm1, %eax
	cmpq	%r8, %r14
	jne	.LBB0_9
.LBB0_14:
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
