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
	sd	s6, 0(sp)                       # 8-byte Folded Spill
	mv	s4, a2
	sw	a1, 0(a3)
	beqz	a1, .LBB0_14
# %bb.1:
	mv	s6, a1
	mv	s2, a0
	slli	s3, a1, 2
	mv	a0, s3
	call	malloc@plt
	sd	a0, 0(s4)
	beqz	a0, .LBB0_16
# %bb.2:
	mv	s5, a0
	blez	s6, .LBB0_4
# %bb.3:
	mv	a0, s5
	mv	a1, s2
	mv	a2, s3
	call	memcpy@plt
.LBB0_4:
	li	a0, 2
	blt	s6, a0, .LBB0_15
# %bb.5:
	lw	a0, 0(s2)
	addiw	a1, s6, -1
	slli	a2, a1, 2
	add	a2, a2, s2
	lw	a2, 0(a2)
	li	a7, 0
	addw	a0, a0, a2
	lui	a2, 524288
	addiw	a2, a2, 1
	and	a0, a0, a2
	slli	a1, a1, 32
	srli	a6, a1, 32
	addi	t0, s5, 4
	li	a4, 1
	li	a5, 1
	j	.LBB0_7
.LBB0_6:                                #   in Loop: Header=BB0_7 Depth=1
	addi	a5, a5, 1
	addi	t0, t0, 4
	beq	a7, a6, .LBB0_15
.LBB0_7:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_11 Depth 2
	mv	a1, a7
	addi	a7, a7, 1
	bge	a7, s6, .LBB0_6
# %bb.8:                                #   in Loop: Header=BB0_7 Depth=1
	slli	a1, a1, 2
	add	s1, s5, a1
	mv	s0, s6
	mv	a3, t0
	j	.LBB0_11
.LBB0_9:                                #   in Loop: Header=BB0_11 Depth=2
	sw	a2, 0(s1)
	sw	a1, 0(a3)
.LBB0_10:                               #   in Loop: Header=BB0_11 Depth=2
	addi	s0, s0, -1
	addi	a3, a3, 4
	beq	a5, s0, .LBB0_6
.LBB0_11:                               #   Parent Loop BB0_7 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lw	a1, 0(s1)
	lw	a2, 0(a3)
	bne	a0, a4, .LBB0_13
# %bb.12:                               #   in Loop: Header=BB0_11 Depth=2
	blt	a2, a1, .LBB0_9
	j	.LBB0_10
.LBB0_13:                               #   in Loop: Header=BB0_11 Depth=2
	blt	a1, a2, .LBB0_9
	j	.LBB0_10
.LBB0_14:
	sd	zero, 0(s4)
.LBB0_15:
	ld	ra, 56(sp)                      # 8-byte Folded Reload
	ld	s0, 48(sp)                      # 8-byte Folded Reload
	ld	s1, 40(sp)                      # 8-byte Folded Reload
	ld	s2, 32(sp)                      # 8-byte Folded Reload
	ld	s3, 24(sp)                      # 8-byte Folded Reload
	ld	s4, 16(sp)                      # 8-byte Folded Reload
	ld	s5, 8(sp)                       # 8-byte Folded Reload
	ld	s6, 0(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 64
	ret
.LBB0_16:
	li	a0, 1
	call	exit@plt
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
