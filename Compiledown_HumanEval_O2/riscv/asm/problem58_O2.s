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
	li	a2, 1
	blt	a1, a3, .LBB0_8
# %bb.1:
	flw	ft0, 0(a0)
	li	a2, 0
	li	a5, 0
	addi	a0, a0, 4
	addi	a1, a1, -1
	j	.LBB0_3
.LBB0_2:                                #   in Loop: Header=BB0_3 Depth=1
	addi	a1, a1, -1
	addi	a0, a0, 4
	fmv.s	ft0, ft1
	mv	a2, a6
	mv	a5, a4
	beqz	a1, .LBB0_7
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	flw	ft1, 0(a0)
	flt.s	a3, ft0, ft1
	li	a6, 1
	li	a4, 1
	bnez	a3, .LBB0_5
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=1
	mv	a4, a5
.LBB0_5:                                #   in Loop: Header=BB0_3 Depth=1
	flt.s	a3, ft1, ft0
	bnez	a3, .LBB0_2
# %bb.6:                                #   in Loop: Header=BB0_3 Depth=1
	mv	a6, a2
	j	.LBB0_2
.LBB0_7:
	addw	a0, a6, a4
	addi	a0, a0, -2
	snez	a2, a0
.LBB0_8:
	mv	a0, a2
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
