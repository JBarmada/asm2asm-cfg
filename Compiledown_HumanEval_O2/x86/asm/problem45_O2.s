	.text
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	4, 0x90
	.type	func0,@function
func0:                                  # @func0
	.cfi_startproc
# %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rdx, %r10
	testl	%edi, %edi
	jle	.LBB0_15
# %bb.1:
	movl	%edi, %eax
	xorl	%edi, %edi
	.p2align	4, 0x90
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
	cltd
	idivl	%esi
	addb	$48, %dl
	movb	%dl, -48(%rsp,%rdi)
	incq	%rdi
	testl	%eax, %eax
	jg	.LBB0_2
# %bb.3:
	testl	%edi, %edi
	jle	.LBB0_15
# %bb.4:
	movl	%edi, %r8d
	cmpq	$8, %r8
	jae	.LBB0_17
# %bb.5:
	xorl	%eax, %eax
.LBB0_6:
	movq	%r8, %rbx
.LBB0_7:
	movl	%edi, %ecx
	subl	%eax, %ecx
	movq	%rax, %rsi
	notq	%rsi
	addq	%rsi, %r8
	testb	$3, %cl
	je	.LBB0_10
# %bb.8:
	movl	%edi, %ecx
	subb	%al, %cl
	movzbl	%cl, %ecx
	andl	$3, %ecx
	.p2align	4, 0x90
.LBB0_9:                                # =>This Inner Loop Header: Depth=1
	decq	%rbx
	movl	%ebx, %esi
	movzbl	-48(%rsp,%rsi), %edx
	movb	%dl, (%r10,%rax)
	incq	%rax
	decq	%rcx
	jne	.LBB0_9
.LBB0_10:
	cmpq	$3, %r8
	jb	.LBB0_13
# %bb.11:
	movl	$4294967294, %r8d               # imm = 0xFFFFFFFE
	movl	%edi, %esi
	.p2align	4, 0x90
.LBB0_12:                               # =>This Inner Loop Header: Depth=1
	leaq	(%rbx,%r8), %rdx
	leal	1(%rdx), %ecx
	movzbl	-48(%rsp,%rcx), %ecx
	movb	%cl, (%r10,%rax)
	movl	%edx, %ecx
	movzbl	-48(%rsp,%rcx), %ecx
	movb	%cl, 1(%r10,%rax)
	decl	%edx
	movzbl	-48(%rsp,%rdx), %ecx
	movb	%cl, 2(%r10,%rax)
	addq	$-4, %rbx
	movl	%ebx, %ecx
	movzbl	-48(%rsp,%rcx), %ecx
	movb	%cl, 3(%r10,%rax)
	addq	$4, %rax
	cmpq	%rax, %rsi
	jne	.LBB0_12
.LBB0_13:
	movl	%edi, %eax
	jmp	.LBB0_16
.LBB0_15:
	xorl	%eax, %eax
.LBB0_16:
	movb	$0, (%r10,%rax)
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.LBB0_17:
	.cfi_def_cfa_offset 16
	leaq	-1(%r8), %rcx
	leal	-1(%rdi), %edx
	xorl	%eax, %eax
	cmpl	%ecx, %edx
	jb	.LBB0_6
# %bb.18:
	shrq	$32, %rcx
	movq	%r8, %rbx
	jne	.LBB0_7
# %bb.19:
	cmpl	$32, %r8d
	jae	.LBB0_22
# %bb.20:
	xorl	%eax, %eax
	jmp	.LBB0_26
.LBB0_22:
	leaq	-1(%rdi), %r11
	movl	%edi, %r9d
	movl	%edi, %ebx
	andl	$31, %ebx
	movq	%r8, %rax
	subq	%rbx, %rax
	subq	%rbx, %r9
	xorl	%ecx, %ecx
	pxor	%xmm0, %xmm0
	.p2align	4, 0x90
.LBB0_23:                               # =>This Inner Loop Header: Depth=1
	movl	%r11d, %esi
	movdqu	-79(%rsp,%rsi), %xmm1
	movdqu	-63(%rsp,%rsi), %xmm2
	movdqa	%xmm2, %xmm3
	punpcklbw	%xmm0, %xmm3            # xmm3 = xmm3[0],xmm0[0],xmm3[1],xmm0[1],xmm3[2],xmm0[2],xmm3[3],xmm0[3],xmm3[4],xmm0[4],xmm3[5],xmm0[5],xmm3[6],xmm0[6],xmm3[7],xmm0[7]
	pshufd	$78, %xmm3, %xmm3               # xmm3 = xmm3[2,3,0,1]
	pshuflw	$27, %xmm3, %xmm3               # xmm3 = xmm3[3,2,1,0,4,5,6,7]
	pshufhw	$27, %xmm3, %xmm3               # xmm3 = xmm3[0,1,2,3,7,6,5,4]
	punpckhbw	%xmm0, %xmm2            # xmm2 = xmm2[8],xmm0[8],xmm2[9],xmm0[9],xmm2[10],xmm0[10],xmm2[11],xmm0[11],xmm2[12],xmm0[12],xmm2[13],xmm0[13],xmm2[14],xmm0[14],xmm2[15],xmm0[15]
	pshufd	$78, %xmm2, %xmm2               # xmm2 = xmm2[2,3,0,1]
	pshuflw	$27, %xmm2, %xmm2               # xmm2 = xmm2[3,2,1,0,4,5,6,7]
	pshufhw	$27, %xmm2, %xmm2               # xmm2 = xmm2[0,1,2,3,7,6,5,4]
	packuswb	%xmm3, %xmm2
	movdqa	%xmm1, %xmm3
	punpcklbw	%xmm0, %xmm3            # xmm3 = xmm3[0],xmm0[0],xmm3[1],xmm0[1],xmm3[2],xmm0[2],xmm3[3],xmm0[3],xmm3[4],xmm0[4],xmm3[5],xmm0[5],xmm3[6],xmm0[6],xmm3[7],xmm0[7]
	pshufd	$78, %xmm3, %xmm3               # xmm3 = xmm3[2,3,0,1]
	pshuflw	$27, %xmm3, %xmm3               # xmm3 = xmm3[3,2,1,0,4,5,6,7]
	pshufhw	$27, %xmm3, %xmm3               # xmm3 = xmm3[0,1,2,3,7,6,5,4]
	punpckhbw	%xmm0, %xmm1            # xmm1 = xmm1[8],xmm0[8],xmm1[9],xmm0[9],xmm1[10],xmm0[10],xmm1[11],xmm0[11],xmm1[12],xmm0[12],xmm1[13],xmm0[13],xmm1[14],xmm0[14],xmm1[15],xmm0[15]
	pshufd	$78, %xmm1, %xmm1               # xmm1 = xmm1[2,3,0,1]
	pshuflw	$27, %xmm1, %xmm1               # xmm1 = xmm1[3,2,1,0,4,5,6,7]
	pshufhw	$27, %xmm1, %xmm1               # xmm1 = xmm1[0,1,2,3,7,6,5,4]
	packuswb	%xmm3, %xmm1
	movdqu	%xmm2, (%r10,%rcx)
	movdqu	%xmm1, 16(%r10,%rcx)
	addq	$32, %rcx
	addq	$-32, %r11
	cmpq	%rcx, %r9
	jne	.LBB0_23
# %bb.24:
	testq	%rbx, %rbx
	je	.LBB0_13
# %bb.25:
	cmpl	$8, %ebx
	jb	.LBB0_7
.LBB0_26:
	movq	%rax, %r11
	movl	%edi, %r9d
	movl	%edi, %ebx
	andl	$7, %ebx
	movq	%r8, %rax
	subq	%rbx, %rax
	movq	%r11, %rcx
	notq	%rcx
	addq	%rdi, %rcx
	subq	%rbx, %r9
	pxor	%xmm0, %xmm0
	.p2align	4, 0x90
.LBB0_27:                               # =>This Inner Loop Header: Depth=1
	movl	%ecx, %esi
	movq	-55(%rsp,%rsi), %xmm1           # xmm1 = mem[0],zero
	punpcklbw	%xmm0, %xmm1            # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1],xmm1[2],xmm0[2],xmm1[3],xmm0[3],xmm1[4],xmm0[4],xmm1[5],xmm0[5],xmm1[6],xmm0[6],xmm1[7],xmm0[7]
	pshufd	$78, %xmm1, %xmm1               # xmm1 = xmm1[2,3,0,1]
	pshuflw	$27, %xmm1, %xmm1               # xmm1 = xmm1[3,2,1,0,4,5,6,7]
	pshufhw	$27, %xmm1, %xmm1               # xmm1 = xmm1[0,1,2,3,7,6,5,4]
	packuswb	%xmm1, %xmm1
	movq	%xmm1, (%r10,%r11)
	addq	$8, %r11
	addq	$-8, %rcx
	cmpq	%r11, %r9
	jne	.LBB0_27
# %bb.28:
	testq	%rbx, %rbx
	jne	.LBB0_7
	jmp	.LBB0_13
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
