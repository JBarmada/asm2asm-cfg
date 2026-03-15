	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	beqz	a1, .LBB0_10
# %bb.1:
	blez	a1, .LBB0_11
# %bb.2:
	li	a2, 0
	li	a3, 1
	j	.LBB0_5
.LBB0_3:                                #   in Loop: Header=BB0_5 Depth=1
	mv	a3, a5
.LBB0_4:                                #   in Loop: Header=BB0_5 Depth=1
	sraiw	a5, a4, 31
	xor	a4, a4, a5
	subw	a4, a4, a5
	addw	a2, a2, a4
	addi	a1, a1, -1
	addi	a0, a0, 4
	beqz	a1, .LBB0_9
.LBB0_5:                                # =>This Inner Loop Header: Depth=1
	lw	a4, 0(a0)
	li	a5, 0
	beqz	a4, .LBB0_7
# %bb.6:                                #   in Loop: Header=BB0_5 Depth=1
	mv	a5, a3
.LBB0_7:                                #   in Loop: Header=BB0_5 Depth=1
	bgez	a4, .LBB0_3
# %bb.8:                                #   in Loop: Header=BB0_5 Depth=1
	negw	a3, a5
	j	.LBB0_4
.LBB0_9:
	mulw	a0, a3, a2
	ret
.LBB0_10:
	lui	a0, 1048568
	ret
.LBB0_11:
	li	a0, 0
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
