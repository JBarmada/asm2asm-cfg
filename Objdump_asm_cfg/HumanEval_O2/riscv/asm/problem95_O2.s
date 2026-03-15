	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	blez	a1, .LBB0_15
# %bb.1:
	li	a3, 0
	li	t0, 0
	li	a7, 2
	li	a6, 4
	j	.LBB0_4
.LBB0_2:                                #   in Loop: Header=BB0_4 Depth=1
	mv	t0, a2
.LBB0_3:                                #   in Loop: Header=BB0_4 Depth=1
	addi	a3, a3, 1
	beq	a3, a1, .LBB0_11
.LBB0_4:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_7 Depth 2
	slli	a2, a3, 2
	add	a2, a2, a0
	lw	a2, 0(a2)
	blt	a2, a7, .LBB0_3
# %bb.5:                                #   in Loop: Header=BB0_4 Depth=1
	bltu	a2, a6, .LBB0_9
# %bb.6:                                #   in Loop: Header=BB0_4 Depth=1
	li	a4, 2
.LBB0_7:                                #   Parent Loop BB0_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	remw	a5, a2, a4
	beqz	a5, .LBB0_3
# %bb.8:                                #   in Loop: Header=BB0_7 Depth=2
	addiw	a4, a4, 1
	mulw	a5, a4, a4
	bge	a2, a5, .LBB0_7
.LBB0_9:                                #   in Loop: Header=BB0_4 Depth=1
	blt	t0, a2, .LBB0_2
# %bb.10:                               #   in Loop: Header=BB0_4 Depth=1
	mv	a2, t0
	j	.LBB0_2
.LBB0_11:
	li	a0, 0
	blez	t0, .LBB0_14
# %bb.12:
	lui	a1, 838861
	addiw	a1, a1, -819
	slli	a1, a1, 32
	li	a2, 10
	li	a3, 9
.LBB0_13:                               # =>This Inner Loop Header: Depth=1
	mv	a4, t0
	slli	a5, t0, 32
	mulhu	a5, a5, a1
	srli	t0, a5, 35
	mulw	a5, t0, a2
	subw	a5, a4, a5
	addw	a0, a0, a5
	bltu	a3, a4, .LBB0_13
.LBB0_14:
	ret
.LBB0_15:
	li	a0, 0
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
