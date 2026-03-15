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
	movq	%rdx, (%rsp)                    # 8-byte Spill
	movq	%rsi, %r15
	movq	%rdi, %r13
	leaq	.L.str(%rip), %rbx
	movq	%rbx, %rdi
	movq	%r13, %rsi
	callq	strcmp@PLT
	xorl	%r12d, %r12d
	negl	%eax
	movl	$0, %r14d
	sbbl	%r14d, %r14d
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	strcmp@PLT
	negl	%eax
	sbbl	%r12d, %r12d
	leaq	.L.str.1(%rip), %rbx
	movq	%rbx, %rdi
	movq	%r13, %rsi
	callq	strcmp@PLT
	testl	%eax, %eax
	movl	$1, %ebp
	cmovel	%ebp, %r14d
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	strcmp@PLT
	testl	%eax, %eax
	cmovel	%ebp, %r12d
	leaq	.L.str.2(%rip), %rbx
	movq	%rbx, %rdi
	movq	%r13, %rsi
	callq	strcmp@PLT
	testl	%eax, %eax
	movl	$2, %ebp
	cmovel	%ebp, %r14d
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	strcmp@PLT
	testl	%eax, %eax
	cmovel	%ebp, %r12d
	leaq	.L.str.3(%rip), %rbx
	movq	%rbx, %rdi
	movq	%r13, %rsi
	callq	strcmp@PLT
	testl	%eax, %eax
	movl	$3, %ebp
	cmovel	%ebp, %r14d
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	strcmp@PLT
	testl	%eax, %eax
	cmovel	%ebp, %r12d
	leaq	.L.str.4(%rip), %rbx
	movq	%rbx, %rdi
	movq	%r13, %rsi
	callq	strcmp@PLT
	testl	%eax, %eax
	movl	$4, %ebp
	cmovel	%ebp, %r14d
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	strcmp@PLT
	testl	%eax, %eax
	cmovel	%ebp, %r12d
	leaq	.L.str.5(%rip), %rbx
	movq	%rbx, %rdi
	movq	%r13, %rsi
	callq	strcmp@PLT
	testl	%eax, %eax
	movl	$5, %ebp
	cmovel	%ebp, %r14d
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	strcmp@PLT
	testl	%eax, %eax
	cmovel	%ebp, %r12d
	leaq	.L.str.6(%rip), %rbx
	movq	%rbx, %rdi
	movq	%r13, %rsi
	callq	strcmp@PLT
	testl	%eax, %eax
	movl	$6, %ebp
	cmovel	%ebp, %r14d
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	strcmp@PLT
	testl	%eax, %eax
	cmovel	%ebp, %r12d
	leaq	.L.str.7(%rip), %rbx
	movq	%rbx, %rdi
	movq	%r13, %rsi
	callq	strcmp@PLT
	testl	%eax, %eax
	movl	$7, %ebp
	cmovel	%ebp, %r14d
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	strcmp@PLT
	movq	(%rsp), %rcx                    # 8-byte Reload
	testl	%eax, %eax
	cmovel	%ebp, %r12d
	cmpl	$-1, %r14d
	je	.LBB0_7
# %bb.1:
	cmpl	$-1, %r12d
	je	.LBB0_7
# %bb.2:
	cmpl	%r12d, %r14d
	je	.LBB0_7
# %bb.3:
	movl	%r12d, %r15d
	cmovgl	%r14d, %r15d
	cmovll	%r14d, %r12d
	movl	%r12d, %eax
	notl	%eax
	addl	%r15d, %eax
	movl	%eax, (%rcx)
	jle	.LBB0_7
# %bb.4:
	movl	%eax, %edi
	shlq	$3, %rdi
	callq	malloc@PLT
	leal	1(%r12), %ecx
	cmpl	%r15d, %ecx
	jae	.LBB0_8
# %bb.5:
	movl	%ecx, %ebx
	movl	%r15d, %ecx
	subl	%r12d, %ecx
	leal	-2(%rcx), %r10d
	cmpl	$5, %r10d
	jb	.LBB0_17
# %bb.9:
	addl	$-2, %ecx
	js	.LBB0_17
# %bb.10:
	incq	%r10
	movq	%r10, %r8
	andq	$-4, %r8
	leaq	-4(%r8), %rcx
	movq	%rcx, %r9
	shrq	$2, %r9
	incq	%r9
	testq	%rcx, %rcx
	je	.LBB0_23
# %bb.11:
	movq	%r9, %rdi
	andq	$-2, %rdi
	leaq	.L__const.func0.planets(%rip), %rcx
	leaq	(%rcx,%rbx,8), %rdx
	addq	$48, %rdx
	xorl	%ebp, %ebp
	movabsq	$17179869184, %r11              # imm = 0x400000000
	movabsq	$34359738368, %r14              # imm = 0x800000000
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB0_12:                               # =>This Inner Loop Header: Depth=1
	movq	%rbp, %rcx
	sarq	$29, %rcx
	movups	-48(%rdx,%rsi,8), %xmm0
	movups	-32(%rdx,%rsi,8), %xmm1
	movups	-16(%rdx,%rsi,8), %xmm2
	movups	(%rdx,%rsi,8), %xmm3
	movups	%xmm0, (%rax,%rcx)
	movups	%xmm1, 16(%rax,%rcx)
	leaq	(%r11,%rbp), %rcx
	sarq	$29, %rcx
	movups	%xmm2, (%rax,%rcx)
	movups	%xmm3, 16(%rax,%rcx)
	addq	$8, %rsi
	addq	%r14, %rbp
	addq	$-2, %rdi
	jne	.LBB0_12
# %bb.13:
	testb	$1, %r9b
	je	.LBB0_15
.LBB0_14:
	leaq	(%rsi,%rbx), %rcx
	leaq	.L__const.func0.planets(%rip), %rdx
	movups	(%rdx,%rcx,8), %xmm0
	movups	16(%rdx,%rcx,8), %xmm1
	movslq	%esi, %rcx
	movups	%xmm0, (%rax,%rcx,8)
	movups	%xmm1, 16(%rax,%rcx,8)
.LBB0_15:
	cmpq	%r8, %r10
	je	.LBB0_8
# %bb.16:
	addq	%r8, %rbx
	leal	(%r12,%r8), %edx
	jmp	.LBB0_18
.LBB0_7:
	movl	$0, (%rcx)
	xorl	%eax, %eax
.LBB0_8:
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
.LBB0_17:
	.cfi_def_cfa_offset 64
	movl	%r12d, %edx
.LBB0_18:
	movl	%r15d, %esi
	subl	%ebx, %esi
	leal	1(%rbx), %ecx
	testb	$1, %sil
	je	.LBB0_20
# %bb.19:
	leaq	.L__const.func0.planets(%rip), %rsi
	movq	(%rsi,%rbx,8), %rsi
	subl	%r12d, %edx
	movslq	%edx, %rdx
	movq	%rsi, (%rax,%rdx,8)
	movl	%ebx, %edx
	incq	%rbx
.LBB0_20:
	cmpl	%ecx, %r15d
	je	.LBB0_8
# %bb.21:
	movl	%r12d, %esi
	negl	%esi
	leaq	.L__const.func0.planets(%rip), %r8
	movq	%rbx, %rcx
	.p2align	4, 0x90
.LBB0_22:                               # =>This Inner Loop Header: Depth=1
	subl	%r12d, %edx
	movslq	%edx, %rdx
	movq	(%r8,%rbx,8), %rbp
	movq	8(%r8,%rbx,8), %rdi
	movq	%rbp, (%rax,%rdx,8)
	leal	(%rsi,%rbx), %edx
	movslq	%edx, %rdx
	movq	%rdi, (%rax,%rdx,8)
	addq	$2, %rcx
	leal	1(%rbx), %edx
	movq	%rcx, %rbx
	cmpl	%ecx, %r15d
	jne	.LBB0_22
	jmp	.LBB0_8
.LBB0_23:
	xorl	%esi, %esi
	testb	$1, %r9b
	jne	.LBB0_14
	jmp	.LBB0_15
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Mercury"
	.size	.L.str, 8

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"Venus"
	.size	.L.str.1, 6

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"Earth"
	.size	.L.str.2, 6

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"Mars"
	.size	.L.str.3, 5

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"Jupiter"
	.size	.L.str.4, 8

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	"Saturn"
	.size	.L.str.5, 7

	.type	.L.str.6,@object                # @.str.6
.L.str.6:
	.asciz	"Uranus"
	.size	.L.str.6, 7

	.type	.L.str.7,@object                # @.str.7
.L.str.7:
	.asciz	"Neptune"
	.size	.L.str.7, 8

	.type	.L__const.func0.planets,@object # @__const.func0.planets
	.section	.data.rel.ro,"aw",@progbits
	.p2align	4
.L__const.func0.planets:
	.quad	.L.str
	.quad	.L.str.1
	.quad	.L.str.2
	.quad	.L.str.3
	.quad	.L.str.4
	.quad	.L.str.5
	.quad	.L.str.6
	.quad	.L.str.7
	.size	.L__const.func0.planets, 64

	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
