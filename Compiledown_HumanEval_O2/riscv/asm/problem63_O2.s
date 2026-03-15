	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	li	a3, 2
	blt	a1, a3, .LBB0_3
# %bb.1:
	addi	a0, a0, 4
	li	a3, 1
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
	flw	ft0, 0(a0)
	fcvt.s.w	ft1, a3
	fmul.s	ft0, ft0, ft1
	fsw	ft0, 0(a2)
	addi	a3, a3, 1
	addi	a0, a0, 4
	addi	a2, a2, 4
	bne	a1, a3, .LBB0_2
.LBB0_3:
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
