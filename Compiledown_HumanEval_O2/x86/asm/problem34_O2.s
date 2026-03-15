	.text
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	4, 0x90
	.type	func0,@function
func0:                                  # @func0
	.cfi_startproc
# %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r13
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r13, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rdx, %r14
	movl	%esi, %r15d
	movq	%rdi, %r12
	movslq	%esi, %rbx
	imulq	$1431655766, %rbx, %rax         # imm = 0x55555556
	movq	%rax, %rcx
	shrq	$63, %rcx
	shrq	$32, %rax
	addl	%ecx, %eax
	cltq
	leaq	4(,%rax,4), %rdi
	callq	malloc@PLT
	testl	%ebx, %ebx
	jle	.LBB0_17
# %bb.1:
	leal	-1(%r15), %esi
	movl	$2863311531, %ecx               # imm = 0xAAAAAAAB
	imulq	%rsi, %rcx
	shrq	$33, %rcx
	leal	1(%rcx), %edx
	cmpl	$23, %esi
	ja	.LBB0_18
# %bb.2:
	xorl	%esi, %esi
	xorl	%r8d, %r8d
	jmp	.LBB0_3
.LBB0_18:
	movl	%edx, %esi
	andl	$7, %esi
	movl	$8, %edi
	cmovneq	%rsi, %rdi
	movq	%rdx, %rsi
	subq	%rdi, %rsi
	leaq	(%rsi,%rsi,2), %r8
	xorl	%edi, %edi
	movq	%r12, %rbx
	.p2align	4, 0x90
.LBB0_19:                               # =>This Inner Loop Header: Depth=1
	movss	36(%rbx), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	movss	24(%rbx), %xmm1                 # xmm1 = mem[0],zero,zero,zero
	unpcklps	%xmm0, %xmm1                    # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1]
	movss	12(%rbx), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	movss	(%rbx), %xmm2                   # xmm2 = mem[0],zero,zero,zero
	unpcklps	%xmm0, %xmm2                    # xmm2 = xmm2[0],xmm0[0],xmm2[1],xmm0[1]
	movlhps	%xmm1, %xmm2                    # xmm2 = xmm2[0],xmm1[0]
	movss	84(%rbx), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	movss	72(%rbx), %xmm1                 # xmm1 = mem[0],zero,zero,zero
	unpcklps	%xmm0, %xmm1                    # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1]
	movss	60(%rbx), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	movss	48(%rbx), %xmm3                 # xmm3 = mem[0],zero,zero,zero
	unpcklps	%xmm0, %xmm3                    # xmm3 = xmm3[0],xmm0[0],xmm3[1],xmm0[1]
	movlhps	%xmm1, %xmm3                    # xmm3 = xmm3[0],xmm1[0]
	movups	%xmm2, (%rax,%rdi,4)
	movups	%xmm3, 16(%rax,%rdi,4)
	addq	$8, %rdi
	addq	$96, %rbx
	cmpq	%rdi, %rsi
	jne	.LBB0_19
.LBB0_3:
	leaq	(%r12,%r8,4), %rdi
	.p2align	4, 0x90
.LBB0_4:                                # =>This Inner Loop Header: Depth=1
	movl	(%rdi), %ebx
	movl	%ebx, (%rax,%rsi,4)
	incq	%rsi
	addq	$12, %rdi
	cmpq	%rsi, %rdx
	jne	.LBB0_4
# %bb.5:
	testl	%ecx, %ecx
	jle	.LBB0_14
# %bb.6:
	movl	%ecx, %r8d
	movq	%r8, %r13
	negq	%r13
	movl	$1, %r11d
	xorl	%r9d, %r9d
	jmp	.LBB0_7
	.p2align	4, 0x90
.LBB0_13:                               #   in Loop: Header=BB0_7 Depth=1
	incq	%r11
	cmpq	%r8, %r9
	je	.LBB0_14
.LBB0_7:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_8 Depth 2
	movq	%r9, %r10
	incq	%r9
	movq	%r11, %rsi
	movl	%r10d, %ecx
	jmp	.LBB0_8
	.p2align	4, 0x90
.LBB0_10:                               #   in Loop: Header=BB0_8 Depth=2
	leaq	(%rsi,%r13), %rdx
	incq	%rdx
	incq	%rsi
	movl	%edi, %ecx
	cmpq	$1, %rdx
	je	.LBB0_11
.LBB0_8:                                #   Parent Loop BB0_7 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	(%rax,%rsi,4), %ebx
	movslq	%ecx, %rdx
	movl	%esi, %edi
	cmpl	(%rax,%rdx,4), %ebx
	jl	.LBB0_10
# %bb.9:                                #   in Loop: Header=BB0_8 Depth=2
	movl	%ecx, %edi
	jmp	.LBB0_10
	.p2align	4, 0x90
.LBB0_11:                               #   in Loop: Header=BB0_7 Depth=1
	movl	%edi, %ecx
	cmpq	%rcx, %r10
	je	.LBB0_13
# %bb.12:                               #   in Loop: Header=BB0_7 Depth=1
	movl	(%rax,%r10,4), %ecx
	movslq	%edi, %rdx
	movl	(%rax,%rdx,4), %esi
	movl	%esi, (%rax,%r10,4)
	movl	%ecx, (%rax,%rdx,4)
	jmp	.LBB0_13
.LBB0_14:
	testl	%r15d, %r15d
	jle	.LBB0_17
# %bb.15:
	movl	%r15d, %ecx
	xorl	%edx, %edx
	movl	$2863311531, %esi               # imm = 0xAAAAAAAB
	.p2align	4, 0x90
.LBB0_16:                               # =>This Inner Loop Header: Depth=1
	movl	%edx, %edi
	imulq	%rsi, %rdi
	shrq	$33, %rdi
	leal	(%rdi,%rdi,2), %ebx
	cmpl	%ebx, %edx
	leaq	(%rax,%rdi,4), %rdi
	cmovneq	%r12, %rdi
	movl	(%rdi), %edi
	movl	%edi, (%r14,%rdx,4)
	incq	%rdx
	addq	$4, %r12
	cmpq	%rdx, %rcx
	jne	.LBB0_16
.LBB0_17:
	movq	%rax, %rdi
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	free@PLT                        # TAILCALL
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
