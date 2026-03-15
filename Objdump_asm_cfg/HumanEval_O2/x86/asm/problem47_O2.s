	.text
	.file	"code.c"
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4                               # -- Begin function func0
.LCPI0_0:
	.long	0                               # 0x0
	.long	0                               # 0x0
	.long	2                               # 0x2
	.long	0                               # 0x0
	.text
	.globl	func0
	.p2align	4, 0x90
	.type	func0,@function
func0:                                  # @func0
	.cfi_startproc
# %bb.0:
	subq	$280, %rsp                      # imm = 0x118
	.cfi_def_cfa_offset 288
                                        # kill: def $edi killed $edi def $rdi
	movaps	.LCPI0_0(%rip), %xmm0           # xmm0 = [0,0,2,0]
	movaps	%xmm0, -128(%rsp)
	cmpl	$4, %edi
	jl	.LBB0_5
# %bb.1:
	leal	1(%rdi), %r8d
	cmpl	$5, %r8d
	jne	.LBB0_6
# %bb.2:
	movl	$4, %ecx
	xorl	%r10d, %r10d
	xorl	%edx, %edx
	jmp	.LBB0_3
.LBB0_6:
	leaq	-4(%r8), %r9
	andq	$-2, %r9
	negq	%r9
	movl	$4, %ecx
	xorl	%esi, %esi
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB0_7:                                # =>This Inner Loop Header: Depth=1
	movl	-136(%rsp,%rcx,4), %eax
	movl	-132(%rsp,%rcx,4), %r10d
	addl	%eax, %edx
	addl	%esi, %edx
	addl	-144(%rsp,%rcx,4), %edx
	movl	%edx, -128(%rsp,%rcx,4)
	addl	%r10d, %edx
	addl	%eax, %edx
	addl	-140(%rsp,%rcx,4), %edx
	movl	%edx, -124(%rsp,%rcx,4)
	leaq	(%r9,%rcx), %rax
	addq	$2, %rax
	addq	$2, %rcx
	movl	%r10d, %esi
	cmpq	$4, %rax
	jne	.LBB0_7
.LBB0_3:
	testb	$1, %r8b
	je	.LBB0_5
# %bb.4:
	addl	-136(%rsp,%rcx,4), %edx
	addl	%r10d, %edx
	addl	-144(%rsp,%rcx,4), %edx
	movl	%edx, -128(%rsp,%rcx,4)
.LBB0_5:
	movslq	%edi, %rax
	movl	-128(%rsp,%rax,4), %eax
	addq	$280, %rsp                      # imm = 0x118
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
