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
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rsi, %r12
	movq	%rdi, %r15
	callq	strlen@PLT
	movq	%rax, %r14
	movq	%r12, %rdi
	callq	strlen@PLT
	testl	%r14d, %r14d
	jle	.LBB0_3
# %bb.1:
	movl	%r14d, %r10d
	movl	%r14d, %r8d
	andl	$1, %r8d
	cmpq	$1, %r10
	jne	.LBB0_4
# %bb.2:
	xorl	%esi, %esi
	movl	$1, %ebp
	xorl	%edi, %edi
	jmp	.LBB0_6
.LBB0_3:
	movl	$1, %ebp
	xorl	%edi, %edi
	jmp	.LBB0_8
.LBB0_4:
	subq	%r8, %r10
	xorl	%r9d, %r9d
	movl	$1, %ebp
	xorl	%esi, %esi
	xorl	%edi, %edi
	.p2align	4, 0x90
.LBB0_5:                                # =>This Inner Loop Header: Depth=1
	movzbl	(%r15,%rsi), %ebx
	movzbl	1(%r15,%rsi), %ecx
	xorl	%edx, %edx
	cmpb	$40, %bl
	sete	%dl
	addl	%edi, %edx
	xorl	%edi, %edi
	cmpb	$41, %bl
	sete	%dil
	subl	%edi, %edx
	xorl	%edi, %edi
	cmpb	$40, %cl
	sete	%dil
	addl	%edx, %edi
	xorl	%ebx, %ebx
	cmpb	$41, %cl
	sete	%bl
	subl	%ebx, %edi
	orl	%edi, %edx
	cmovsl	%r9d, %ebp
	addq	$2, %rsi
	cmpq	%rsi, %r10
	jne	.LBB0_5
.LBB0_6:
	testq	%r8, %r8
	je	.LBB0_8
# %bb.7:
	movzbl	(%r15,%rsi), %ecx
	xorl	%esi, %esi
	cmpb	$40, %cl
	sete	%sil
	addl	%esi, %edi
	xorl	%esi, %esi
	cmpb	$41, %cl
	sete	%sil
	xorl	%ecx, %ecx
	subl	%esi, %edi
	cmovsl	%ecx, %ebp
.LBB0_8:
	testl	%eax, %eax
	jle	.LBB0_17
# %bb.9:
	movl	%eax, %r8d
	movl	%eax, %r10d
	andl	$1, %r10d
	xorl	%r11d, %r11d
	movq	%r8, %r9
	decq	%r9
	je	.LBB0_25
# %bb.10:
	movq	%r8, %r13
	subq	%r10, %r13
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB0_11:                               # =>This Inner Loop Header: Depth=1
	movzbl	(%r12,%rcx), %edx
	movzbl	1(%r12,%rcx), %ebx
	xorl	%esi, %esi
	cmpb	$40, %dl
	sete	%sil
	addl	%edi, %esi
	xorl	%edi, %edi
	cmpb	$41, %dl
	sete	%dil
	subl	%edi, %esi
	xorl	%edi, %edi
	cmpb	$40, %bl
	sete	%dil
	addl	%esi, %edi
	xorl	%edx, %edx
	cmpb	$41, %bl
	sete	%dl
	subl	%edx, %edi
	orl	%edi, %esi
	cmovsl	%r11d, %ebp
	addq	$2, %rcx
	cmpq	%rcx, %r13
	jne	.LBB0_11
# %bb.12:
	testq	%r10, %r10
	je	.LBB0_14
.LBB0_13:
	movzbl	(%r12,%rcx), %ecx
	xorl	%edx, %edx
	cmpb	$40, %cl
	sete	%dl
	addl	%edx, %edi
	xorl	%edx, %edx
	cmpb	$41, %cl
	sete	%dl
	xorl	%ecx, %ecx
	subl	%edx, %edi
	cmovsl	%ecx, %ebp
.LBB0_14:
	testl	%edi, %edi
	jne	.LBB0_20
# %bb.15:
	testl	%ebp, %ebp
	jne	.LBB0_16
.LBB0_20:
	testl	%eax, %eax
	jle	.LBB0_26
# %bb.21:
	andl	$1, %eax
	testq	%r9, %r9
	je	.LBB0_27
# %bb.22:
	subq	%rax, %r8
	xorl	%edi, %edi
	movl	$1, %r9d
	xorl	%edx, %edx
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB0_23:                               # =>This Inner Loop Header: Depth=1
	movzbl	(%r12,%rdx), %ebx
	movzbl	1(%r12,%rdx), %ecx
	xorl	%ebp, %ebp
	cmpb	$40, %bl
	sete	%bpl
	addl	%esi, %ebp
	xorl	%esi, %esi
	cmpb	$41, %bl
	sete	%sil
	subl	%esi, %ebp
	xorl	%esi, %esi
	cmpb	$40, %cl
	sete	%sil
	addl	%ebp, %esi
	xorl	%ebx, %ebx
	cmpb	$41, %cl
	sete	%bl
	subl	%ebx, %esi
	orl	%esi, %ebp
	cmovsl	%edi, %r9d
	addq	$2, %rdx
	cmpq	%rdx, %r8
	jne	.LBB0_23
# %bb.24:
	testq	%rax, %rax
	jne	.LBB0_28
	jmp	.LBB0_29
.LBB0_17:
	xorl	%esi, %esi
	movl	$1, %r9d
	testl	%edi, %edi
	jne	.LBB0_29
# %bb.18:
	testl	%ebp, %ebp
	je	.LBB0_29
.LBB0_16:
	leaq	.L.str(%rip), %rax
	jmp	.LBB0_37
.LBB0_25:
	xorl	%ecx, %ecx
	testq	%r10, %r10
	jne	.LBB0_13
	jmp	.LBB0_14
.LBB0_26:
	movl	$1, %r9d
	xorl	%esi, %esi
	jmp	.LBB0_29
.LBB0_27:
	xorl	%edx, %edx
	movl	$1, %r9d
	xorl	%esi, %esi
	testq	%rax, %rax
	je	.LBB0_29
.LBB0_28:
	movzbl	(%r12,%rdx), %eax
	xorl	%edx, %edx
	cmpb	$40, %al
	sete	%dl
	addl	%edx, %esi
	xorl	%edx, %edx
	cmpb	$41, %al
	sete	%dl
	xorl	%eax, %eax
	subl	%edx, %esi
	cmovsl	%eax, %r9d
.LBB0_29:
	testl	%r14d, %r14d
	jle	.LBB0_36
# %bb.30:
	movl	%r14d, %edx
	andl	$1, %r14d
	xorl	%edi, %edi
	cmpq	$1, %rdx
	jne	.LBB0_32
# %bb.31:
	xorl	%eax, %eax
	jmp	.LBB0_34
.LBB0_32:
	subq	%r14, %rdx
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB0_33:                               # =>This Inner Loop Header: Depth=1
	movzbl	(%r15,%rax), %ecx
	movzbl	1(%r15,%rax), %ebx
	xorl	%ebp, %ebp
	cmpb	$40, %cl
	sete	%bpl
	addl	%esi, %ebp
	xorl	%esi, %esi
	cmpb	$41, %cl
	sete	%sil
	subl	%esi, %ebp
	xorl	%esi, %esi
	cmpb	$40, %bl
	sete	%sil
	addl	%ebp, %esi
	xorl	%ecx, %ecx
	cmpb	$41, %bl
	sete	%cl
	subl	%ecx, %esi
	orl	%esi, %ebp
	cmovsl	%edi, %r9d
	addq	$2, %rax
	cmpq	%rax, %rdx
	jne	.LBB0_33
.LBB0_34:
	testq	%r14, %r14
	je	.LBB0_36
# %bb.35:
	movzbl	(%r15,%rax), %eax
	xorl	%ecx, %ecx
	cmpb	$40, %al
	sete	%cl
	addl	%ecx, %esi
	xorl	%ecx, %ecx
	cmpb	$41, %al
	sete	%cl
	xorl	%eax, %eax
	subl	%ecx, %esi
	cmovsl	%eax, %r9d
.LBB0_36:
	testl	%r9d, %r9d
	leaq	.L.str(%rip), %rax
	leaq	.L.str.1(%rip), %rcx
	cmoveq	%rcx, %rax
	testl	%esi, %esi
	cmovneq	%rcx, %rax
.LBB0_37:
	addq	$8, %rsp
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
	.asciz	"Yes"
	.size	.L.str, 4

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"No"
	.size	.L.str.1, 3

	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
