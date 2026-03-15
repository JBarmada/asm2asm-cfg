	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	addi	sp, sp, -16
	sd	s0, 8(sp)                       # 8-byte Folded Spill
	blez	a1, .LBB0_10
# %bb.1:
	li	t3, 0
	addi	t0, a0, 8
	li	t1, 1
	li	t2, 3
	li	a6, 1
	j	.LBB0_3
.LBB0_2:                                #   in Loop: Header=BB0_3 Depth=1
	sltu	a6, t3, a1
	addi	t1, t1, 1
	addi	t0, t0, 4
	addiw	t2, t2, 1
	beq	t3, a1, .LBB0_11
.LBB0_3:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_6 Depth 2
                                        #       Child Loop BB0_8 Depth 3
	mv	a2, t3
	addi	t3, t3, 1
	bgeu	t3, a1, .LBB0_2
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=1
	slli	a2, a2, 2
	add	a7, a0, a2
	mv	t4, t2
	mv	t5, t0
	mv	t6, t1
	j	.LBB0_6
.LBB0_5:                                #   in Loop: Header=BB0_6 Depth=2
	addi	t6, t6, 1
	addi	t5, t5, 4
	addiw	t4, t4, 1
	beq	t6, a1, .LBB0_2
.LBB0_6:                                #   Parent Loop BB0_3 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_8 Depth 3
	addiw	a2, t6, 1
	bge	a2, a1, .LBB0_5
# %bb.7:                                #   in Loop: Header=BB0_6 Depth=2
	lw	a2, 0(a7)
	slli	a3, t6, 2
	add	a3, a3, a0
	lw	a3, 0(a3)
	addw	a2, a2, a3
	mv	a3, t4
	mv	a4, t5
.LBB0_8:                                #   Parent Loop BB0_3 Depth=1
                                        #     Parent Loop BB0_6 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	lw	a5, 0(a4)
	negw	s0, a5
	beq	a2, s0, .LBB0_11
# %bb.9:                                #   in Loop: Header=BB0_8 Depth=3
	mv	a5, a3
	addi	a4, a4, 4
	addiw	a3, a3, 1
	blt	a5, a1, .LBB0_8
	j	.LBB0_5
.LBB0_10:
	li	a6, 0
.LBB0_11:
	andi	a0, a6, 1
	ld	s0, 8(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 16
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
