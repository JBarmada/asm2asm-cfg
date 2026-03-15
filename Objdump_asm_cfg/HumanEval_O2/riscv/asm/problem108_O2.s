	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	addi	sp, sp, -32
	sd	ra, 24(sp)                      # 8-byte Folded Spill
	sd	s0, 16(sp)                      # 8-byte Folded Spill
	sd	s1, 8(sp)                       # 8-byte Folded Spill
	sd	s2, 0(sp)                       # 8-byte Folded Spill
	mv	s2, a0
	li	a0, 8
	call	malloc@plt
	sw	zero, 0(a0)
	sw	zero, 4(a0)
	blez	s2, .LBB0_9
# %bb.1:
	li	a6, 0
	li	a7, 0
	li	a1, 1
	li	a3, 10
	lui	a2, 419430
	addiw	a4, a2, 1639
	li	t1, 18
	j	.LBB0_4
.LBB0_2:                                #   in Loop: Header=BB0_4 Depth=1
	addiw	a7, a7, 1
	sw	a7, 4(a0)
.LBB0_3:                                #   in Loop: Header=BB0_4 Depth=1
	addiw	a1, t0, 1
	bge	t0, s2, .LBB0_9
.LBB0_4:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_5 Depth 2
	li	s0, 0
	mv	t0, a1
.LBB0_5:                                #   Parent Loop BB0_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	mulw	s0, s0, a3
	mul	s1, a1, a4
	srli	a2, s1, 63
	srai	s1, s1, 34
	addw	a2, a2, s1
	mulw	s1, a2, a3
	subw	s1, a1, s1
	addiw	a5, a1, 9
	addw	s0, s0, s1
	mv	a1, a2
	bltu	t1, a5, .LBB0_5
# %bb.6:                                #   in Loop: Header=BB0_4 Depth=1
	bne	t0, s0, .LBB0_3
# %bb.7:                                #   in Loop: Header=BB0_4 Depth=1
	andi	a1, t0, 1
	bnez	a1, .LBB0_2
# %bb.8:                                #   in Loop: Header=BB0_4 Depth=1
	addiw	a6, a6, 1
	sw	a6, 0(a0)
	j	.LBB0_3
.LBB0_9:
	ld	ra, 24(sp)                      # 8-byte Folded Reload
	ld	s0, 16(sp)                      # 8-byte Folded Reload
	ld	s1, 8(sp)                       # 8-byte Folded Reload
	ld	s2, 0(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 32
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
