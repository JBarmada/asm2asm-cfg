	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	blez	a1, .LBB0_17
# %bb.1:
	li	a6, 0
	li	t5, 1
	li	t6, 2
	li	a7, 1
	j	.LBB0_3
.LBB0_2:                                #   in Loop: Header=BB0_3 Depth=1
	addi	a7, a7, 1
	beq	a6, a1, .LBB0_17
.LBB0_3:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_7 Depth 2
                                        #       Child Loop BB0_9 Depth 3
                                        #       Child Loop BB0_13 Depth 3
	mv	a2, a6
	addi	a6, a6, 1
	bgeu	a6, a1, .LBB0_2
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=1
	slli	a2, a2, 2
	add	t0, a0, a2
	mv	t4, a7
	j	.LBB0_7
.LBB0_5:                                #   in Loop: Header=BB0_7 Depth=2
	sw	t3, 0(t0)
	sw	t1, 0(t2)
.LBB0_6:                                #   in Loop: Header=BB0_7 Depth=2
	addi	t4, t4, 1
	beq	t4, a1, .LBB0_2
.LBB0_7:                                #   Parent Loop BB0_3 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_9 Depth 3
                                        #       Child Loop BB0_13 Depth 3
	lw	t1, 0(t0)
	blez	t1, .LBB0_10
# %bb.8:                                #   in Loop: Header=BB0_7 Depth=2
	li	a4, 0
	mv	a5, t1
.LBB0_9:                                #   Parent Loop BB0_3 Depth=1
                                        #     Parent Loop BB0_7 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	mv	a2, a5
	andi	a5, a5, 1
	addw	a4, a4, a5
	srliw	a5, a2, 1
	bgeu	a2, t6, .LBB0_9
	j	.LBB0_11
.LBB0_10:                               #   in Loop: Header=BB0_7 Depth=2
	li	a4, 0
.LBB0_11:                               #   in Loop: Header=BB0_7 Depth=2
	slli	a2, t4, 2
	add	t2, a0, a2
	lw	t3, 0(t2)
	blez	t3, .LBB0_15
# %bb.12:                               #   in Loop: Header=BB0_7 Depth=2
	li	a5, 0
	mv	a3, t3
.LBB0_13:                               #   Parent Loop BB0_3 Depth=1
                                        #     Parent Loop BB0_7 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	mv	a2, a3
	andi	a3, a3, 1
	addw	a5, a5, a3
	srliw	a3, a2, 1
	bltu	t5, a2, .LBB0_13
# %bb.14:                               #   in Loop: Header=BB0_7 Depth=2
	bltu	a5, a4, .LBB0_5
	j	.LBB0_16
.LBB0_15:                               #   in Loop: Header=BB0_7 Depth=2
	li	a5, 0
	bltu	a5, a4, .LBB0_5
.LBB0_16:                               #   in Loop: Header=BB0_7 Depth=2
	xor	a2, a5, a4
	seqz	a2, a2
	slt	a3, t3, t1
	and	a2, a2, a3
	bnez	a2, .LBB0_5
	j	.LBB0_6
.LBB0_17:
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
