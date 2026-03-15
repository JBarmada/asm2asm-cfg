	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	li	a1, 2
	bge	a0, a1, .LBB0_2
# %bb.1:
	li	a0, 0
	ret
.LBB0_2:
	li	a1, 4
	bgeu	a0, a1, .LBB0_5
# %bb.3:
	li	a1, 0
.LBB0_4:
	sext.w	a0, a0
	slti	a0, a0, 2
	xori	a0, a0, 1
	addw	a0, a0, a1
	addi	a0, a0, -3
	seqz	a0, a0
	ret
.LBB0_5:
	li	a1, 0
	li	a2, 2
	j	.LBB0_7
.LBB0_6:                                #   in Loop: Header=BB0_7 Depth=1
	addiw	a2, a2, 1
	mulw	a3, a2, a2
	sext.w	a4, a0
	blt	a4, a3, .LBB0_4
.LBB0_7:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_8 Depth 2
	remw	a3, a0, a2
	bnez	a3, .LBB0_6
.LBB0_8:                                #   Parent Loop BB0_7 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	divw	a0, a0, a2
	remw	a3, a0, a2
	addiw	a1, a1, 1
	beqz	a3, .LBB0_8
	j	.LBB0_6
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
