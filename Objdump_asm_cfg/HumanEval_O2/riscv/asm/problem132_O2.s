	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	blez	a0, .LBB0_10
# %bb.1:
	li	t0, 0
	li	a1, 1
	lui	a2, 838861
	addiw	a2, a2, -819
	slli	t1, a2, 32
	li	a6, 10
	li	a7, 9
	j	.LBB0_3
.LBB0_2:                                #   in Loop: Header=BB0_3 Depth=1
	sext.w	a2, a0
	mulw	a1, a3, a1
	mv	a0, a4
	bgeu	a7, a2, .LBB0_7
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	slli	a2, a0, 32
	mulhu	a2, a2, t1
	srli	a4, a2, 35
	mulw	a2, a4, a6
	subw	a5, a0, a2
	andi	a2, a5, 1
	li	a3, 1
	beqz	a2, .LBB0_5
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=1
	mv	a3, a5
.LBB0_5:                                #   in Loop: Header=BB0_3 Depth=1
	beqz	a2, .LBB0_2
# %bb.6:                                #   in Loop: Header=BB0_3 Depth=1
	li	t0, 1
	j	.LBB0_2
.LBB0_7:
	li	a0, 0
	beqz	t0, .LBB0_9
# %bb.8:
	mv	a0, a1
.LBB0_9:
	ret
.LBB0_10:
	li	a0, 0
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
