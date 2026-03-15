	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	addi	sp, sp, -64
	sd	ra, 56(sp)                      # 8-byte Folded Spill
	sd	s0, 48(sp)                      # 8-byte Folded Spill
	sd	s1, 40(sp)                      # 8-byte Folded Spill
	sd	s2, 32(sp)                      # 8-byte Folded Spill
	sd	s3, 24(sp)                      # 8-byte Folded Spill
	sd	s4, 16(sp)                      # 8-byte Folded Spill
	sd	s5, 8(sp)                       # 8-byte Folded Spill
	mv	s5, a2
	mv	a2, a1
	li	s2, 1
	sw	s2, 0(s5)
	sw	s2, 0(a1)
	beq	a0, s2, .LBB0_7
# %bb.1:
	mv	s1, a0
	li	s3, 10
	lui	a0, 524288
	addiw	s4, a0, 1
	j	.LBB0_3
.LBB0_2:                                #   in Loop: Header=BB0_3 Depth=1
	srliw	a0, s1, 31
	addw	a0, a0, s1
	sraiw	s1, a0, 1
	beq	s1, s2, .LBB0_7
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	and	a0, s1, s4
	sext.w	a0, a0
	bne	a0, s2, .LBB0_2
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=1
	lw	a1, 0(s5)
	blt	a1, s3, .LBB0_6
# %bb.5:                                #   in Loop: Header=BB0_3 Depth=1
	slliw	s3, s3, 1
	slli	a1, s3, 2
	mv	a0, a2
	call	realloc@plt
	lw	a1, 0(s5)
	mv	a2, a0
.LBB0_6:                                #   in Loop: Header=BB0_3 Depth=1
	addiw	a0, a1, 1
	sw	a0, 0(s5)
	slli	a0, a1, 2
	add	a0, a0, a2
	sw	s1, 0(a0)
	slliw	a0, s1, 1
	addw	a0, a0, s1
	addiw	s1, a0, 1
	bne	s1, s2, .LBB0_3
.LBB0_7:
	lw	a0, 0(s5)
	li	a1, 2
	blt	a0, a1, .LBB0_15
# %bb.8:
	li	a6, 0
	li	a0, -1
	srli	a1, a0, 32
	addi	a7, a2, 4
	li	a4, 1
	li	a5, 1
	j	.LBB0_11
.LBB0_9:                                #   in Loop: Header=BB0_11 Depth=1
	addiw	a0, a0, 1
.LBB0_10:                               #   in Loop: Header=BB0_11 Depth=1
	slli	a0, a0, 2
	add	a0, a0, a2
	sw	s1, 0(a0)
	lw	a0, 0(s5)
	addi	a5, a5, 1
	addi	a6, a6, 1
	addi	a7, a7, 4
	bge	a5, a0, .LBB0_15
.LBB0_11:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_12 Depth 2
	slli	a0, a5, 2
	add	a0, a0, a2
	lw	s1, 0(a0)
	mv	a3, a7
	mv	a0, a6
.LBB0_12:                               #   Parent Loop BB0_11 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	add	s0, a1, a0
	addi	s0, s0, 1
	and	s0, s0, a1
	slli	s0, s0, 2
	add	s0, s0, a2
	lw	s0, 0(s0)
	bge	s1, s0, .LBB0_9
# %bb.13:                               #   in Loop: Header=BB0_12 Depth=2
	sw	s0, 0(a3)
	addi	s0, a0, 1
	addi	a0, a0, -1
	addi	a3, a3, -4
	blt	a4, s0, .LBB0_12
# %bb.14:                               #   in Loop: Header=BB0_11 Depth=1
	li	a0, 0
	j	.LBB0_10
.LBB0_15:
	ld	ra, 56(sp)                      # 8-byte Folded Reload
	ld	s0, 48(sp)                      # 8-byte Folded Reload
	ld	s1, 40(sp)                      # 8-byte Folded Reload
	ld	s2, 32(sp)                      # 8-byte Folded Reload
	ld	s3, 24(sp)                      # 8-byte Folded Reload
	ld	s4, 16(sp)                      # 8-byte Folded Reload
	ld	s5, 8(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 64
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
