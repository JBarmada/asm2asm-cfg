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
	mv	s2, a1
	mv	s1, a0
	slli	a0, a0, 2
	call	malloc@plt
	li	a1, 3
	sw	zero, 0(s2)
	blt	s1, a1, .LBB0_9
# %bb.1:
	li	a1, 0
	li	a2, 2
	j	.LBB0_4
.LBB0_2:                                #   in Loop: Header=BB0_4 Depth=1
	slli	a3, a1, 2
	add	a3, a3, a0
	sw	a2, 0(a3)
	addiw	a1, a1, 1
	sw	a1, 0(s2)
.LBB0_3:                                #   in Loop: Header=BB0_4 Depth=1
	addiw	a2, a2, 1
	bge	a2, s1, .LBB0_9
.LBB0_4:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_6 Depth 2
	blez	a1, .LBB0_2
# %bb.5:                                #   in Loop: Header=BB0_4 Depth=1
	mv	a3, a1
	mv	a4, a0
.LBB0_6:                                #   Parent Loop BB0_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lw	a5, 0(a4)
	mulw	s0, a5, a5
	bltu	a2, s0, .LBB0_2
# %bb.7:                                #   in Loop: Header=BB0_6 Depth=2
	remw	a5, a2, a5
	beqz	a5, .LBB0_3
# %bb.8:                                #   in Loop: Header=BB0_6 Depth=2
	addi	a3, a3, -1
	addi	a4, a4, 4
	bnez	a3, .LBB0_6
	j	.LBB0_2
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
