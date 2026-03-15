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
	movq	%rcx, %r14
	movq	%rdx, %r15
	movq	%rsi, %r13
	movq	%rdi, %rbp
	callq	strlen@PLT
	incl	%eax
	movslq	%eax, %rdi
	callq	malloc@PLT
	movq	%rax, %r12
	movzbl	(%rbp), %edx
	testb	%dl, %dl
	je	.LBB0_1
# %bb.4:
	movzbl	(%r13), %ebx
	incq	%r13
	xorl	%esi, %esi
	xorl	%ecx, %ecx
	jmp	.LBB0_5
	.p2align	4, 0x90
.LBB0_6:                                #   in Loop: Header=BB0_5 Depth=1
	movslq	%ecx, %rax
	incl	%ecx
	movb	%dl, (%r12,%rax)
.LBB0_9:                                #   in Loop: Header=BB0_5 Depth=1
	movzbl	1(%rbp,%rsi), %edx
	incq	%rsi
	testb	%dl, %dl
	je	.LBB0_2
.LBB0_5:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_8 Depth 2
	movq	%r13, %rdi
	movl	%ebx, %eax
	testb	%bl, %bl
	je	.LBB0_6
	.p2align	4, 0x90
.LBB0_8:                                #   Parent Loop BB0_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpb	%al, %dl
	je	.LBB0_9
# %bb.7:                                #   in Loop: Header=BB0_8 Depth=2
	movzbl	(%rdi), %eax
	incq	%rdi
	testb	%al, %al
	jne	.LBB0_8
	jmp	.LBB0_6
.LBB0_1:
	xorl	%ecx, %ecx
.LBB0_2:
	movslq	%ecx, %rax
	movb	$0, (%r12,%rax)
	movq	%r12, %rdi
	callq	strlen@PLT
	leaq	.L.str(%rip), %rbp
	cmpl	$2, %eax
	jl	.LBB0_13
# %bb.3:
	movabsq	$-4294967296, %rcx              # imm = 0xFFFFFFFF00000000
	movl	%eax, %edx
	shrl	%edx
	shlq	$32, %rax
	addq	%rcx, %rax
	xorl	%esi, %esi
	leaq	.L.str.1(%rip), %r8
	.p2align	4, 0x90
.LBB0_11:                               # =>This Inner Loop Header: Depth=1
	movzbl	(%r12,%rsi), %ebx
	movq	%rax, %rdi
	sarq	$32, %rdi
	cmpb	(%r12,%rdi), %bl
	jne	.LBB0_12
# %bb.10:                               #   in Loop: Header=BB0_11 Depth=1
	incq	%rsi
	addq	%rcx, %rax
	cmpq	%rsi, %rdx
	jne	.LBB0_11
	jmp	.LBB0_13
.LBB0_12:
	movq	%r8, %rbp
.LBB0_13:
	movq	%r15, %rdi
	movq	%r12, %rsi
	callq	strcpy@PLT
	movq	%r14, %rdi
	movq	%rbp, %rsi
	callq	strcpy@PLT
	movq	%r12, %rdi
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
	jmp	free@PLT                        # TAILCALL
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"True"
	.size	.L.str, 5

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"False"
	.size	.L.str.1, 6

	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
