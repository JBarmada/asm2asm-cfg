	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	li	a1, 4
	bge	a0, a1, .LBB0_2
.LBB0_1:
	sext.w	a0, a0
	ret
.LBB0_2:
	li	a1, 2
	j	.LBB0_4
.LBB0_3:                                #   in Loop: Header=BB0_4 Depth=1
	addiw	a1, a1, 1
	mulw	a2, a1, a1
	sext.w	a3, a0
	blt	a3, a2, .LBB0_1
.LBB0_4:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_5 Depth 2
	remw	a2, a0, a1
	sext.w	a3, a0
	snez	a2, a2
	slt	a3, a1, a3
	xori	a3, a3, 1
	or	a2, a2, a3
	bnez	a2, .LBB0_3
.LBB0_5:                                #   Parent Loop BB0_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	divw	a0, a0, a1
	remw	a2, a0, a1
	seqz	a2, a2
	slt	a3, a1, a0
	and	a2, a2, a3
	bnez	a2, .LBB0_5
	j	.LBB0_3
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
