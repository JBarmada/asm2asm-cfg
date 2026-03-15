	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	li	a2, 0
	li	a3, 2
	li	a7, 1
	li	a6, 4
	j	.LBB0_3
.LBB0_1:                                #   in Loop: Header=BB0_3 Depth=1
	snez	a3, a3
.LBB0_2:                                #   in Loop: Header=BB0_3 Depth=1
	addw	a2, a2, a3
	addw	a3, a1, a7
	mv	a7, a1
	beq	a2, a0, .LBB0_8
.LBB0_3:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_6 Depth 2
	bge	a2, a0, .LBB0_9
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=1
	mv	a1, a3
	li	a3, 1
	blt	a1, a6, .LBB0_2
# %bb.5:                                #   in Loop: Header=BB0_3 Depth=1
	li	a5, 2
.LBB0_6:                                #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	remw	a3, a1, a5
	beqz	a3, .LBB0_1
# %bb.7:                                #   in Loop: Header=BB0_6 Depth=2
	addiw	a5, a5, 1
	mulw	a4, a5, a5
	bge	a1, a4, .LBB0_6
	j	.LBB0_1
.LBB0_8:
	mv	a0, a1
	ret
.LBB0_9:
	li	a0, 0
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
