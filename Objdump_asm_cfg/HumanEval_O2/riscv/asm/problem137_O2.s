	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	blez	a1, .LBB0_11
# %bb.1:
	li	a7, 0
	li	a6, 0
	j	.LBB0_4
.LBB0_2:                                #   in Loop: Header=BB0_4 Depth=1
	mv	a7, a5
.LBB0_3:                                #   in Loop: Header=BB0_4 Depth=1
	addi	a1, a1, -1
	addi	a0, a0, 4
	beqz	a1, .LBB0_12
.LBB0_4:                                # =>This Inner Loop Header: Depth=1
	lw	a5, 0(a0)
	bltz	a5, .LBB0_8
# %bb.5:                                #   in Loop: Header=BB0_4 Depth=1
	beqz	a5, .LBB0_3
# %bb.6:                                #   in Loop: Header=BB0_4 Depth=1
	seqz	a3, a7
	slt	a4, a5, a7
	or	a3, a3, a4
	bnez	a3, .LBB0_2
# %bb.7:                                #   in Loop: Header=BB0_4 Depth=1
	mv	a5, a7
	j	.LBB0_2
.LBB0_8:                                #   in Loop: Header=BB0_4 Depth=1
	seqz	a4, a6
	slt	a3, a6, a5
	or	a3, a3, a4
	bnez	a3, .LBB0_10
# %bb.9:                                #   in Loop: Header=BB0_4 Depth=1
	mv	a5, a6
.LBB0_10:                               #   in Loop: Header=BB0_4 Depth=1
	mv	a6, a5
	j	.LBB0_3
.LBB0_11:
	li	a6, 0
	li	a7, 0
.LBB0_12:
	sw	a6, 0(a2)
	sw	a7, 4(a2)
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
