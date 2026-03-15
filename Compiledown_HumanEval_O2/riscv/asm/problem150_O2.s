	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	addi	sp, sp, -96
	sd	ra, 88(sp)                      # 8-byte Folded Spill
	sd	s0, 80(sp)                      # 8-byte Folded Spill
	sd	s1, 72(sp)                      # 8-byte Folded Spill
	sd	s2, 64(sp)                      # 8-byte Folded Spill
	sd	s3, 56(sp)                      # 8-byte Folded Spill
	sd	s4, 48(sp)                      # 8-byte Folded Spill
	sd	s5, 40(sp)                      # 8-byte Folded Spill
	sd	s6, 32(sp)                      # 8-byte Folded Spill
	sd	s7, 24(sp)                      # 8-byte Folded Spill
	sd	s8, 16(sp)                      # 8-byte Folded Spill
	sd	s9, 8(sp)                       # 8-byte Folded Spill
	sd	s10, 0(sp)                      # 8-byte Folded Spill
	mv	s2, a0
	sw	zero, 0(a2)
	blez	a1, .LBB0_16
# %bb.1:
	mv	s3, a2
	mv	s0, a1
	li	s4, 0
	mv	s1, s2
	j	.LBB0_3
.LBB0_2:                                #   in Loop: Header=BB0_3 Depth=1
	addi	s0, s0, -1
	addi	s1, s1, 8
	beqz	s0, .LBB0_5
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	ld	s5, 0(s1)
	mv	a0, s5
	call	strlen@plt
	andi	a0, a0, 1
	bnez	a0, .LBB0_2
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=1
	slli	a0, s4, 3
	add	a0, a0, s2
	sd	s5, 0(a0)
	addiw	s4, s4, 1
	sw	s4, 0(s3)
	j	.LBB0_2
.LBB0_5:
	li	a0, 2
	blt	s4, a0, .LBB0_17
# %bb.6:
	li	s5, 0
	addiw	s6, s4, -1
	addi	s7, s2, 8
	mv	s8, s6
	j	.LBB0_8
.LBB0_7:                                #   in Loop: Header=BB0_8 Depth=1
	addiw	s5, s5, 1
	addiw	s8, s8, -1
	bge	s5, s6, .LBB0_17
.LBB0_8:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_12 Depth 2
	not	a0, s5
	addw	a0, s4, a0
	blez	a0, .LBB0_7
# %bb.9:                                #   in Loop: Header=BB0_8 Depth=1
	ld	s3, 0(s2)
	slli	a0, s8, 32
	srli	s0, a0, 32
	mv	s1, s7
	j	.LBB0_12
.LBB0_10:                               #   in Loop: Header=BB0_12 Depth=2
	sd	s9, -8(s1)
	sd	s3, 0(s1)
.LBB0_11:                               #   in Loop: Header=BB0_12 Depth=2
	addi	s0, s0, -1
	addi	s1, s1, 8
	beqz	s0, .LBB0_7
.LBB0_12:                               #   Parent Loop BB0_8 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	mv	a0, s3
	call	strlen@plt
	ld	s9, 0(s1)
	mv	s10, a0
	mv	a0, s9
	call	strlen@plt
	bltu	a0, s10, .LBB0_10
# %bb.13:                               #   in Loop: Header=BB0_12 Depth=2
	bne	s10, a0, .LBB0_15
# %bb.14:                               #   in Loop: Header=BB0_12 Depth=2
	mv	a0, s3
	mv	a1, s9
	call	strcmp@plt
	bgtz	a0, .LBB0_10
.LBB0_15:                               #   in Loop: Header=BB0_12 Depth=2
	mv	s3, s9
	j	.LBB0_11
.LBB0_16:
	li	s4, 0
.LBB0_17:
	slli	s0, s4, 3
	mv	a0, s0
	call	malloc@plt
	mv	s1, a0
	blez	s4, .LBB0_19
# %bb.18:
	mv	a0, s1
	mv	a1, s2
	mv	a2, s0
	call	memcpy@plt
.LBB0_19:
	mv	a0, s1
	ld	ra, 88(sp)                      # 8-byte Folded Reload
	ld	s0, 80(sp)                      # 8-byte Folded Reload
	ld	s1, 72(sp)                      # 8-byte Folded Reload
	ld	s2, 64(sp)                      # 8-byte Folded Reload
	ld	s3, 56(sp)                      # 8-byte Folded Reload
	ld	s4, 48(sp)                      # 8-byte Folded Reload
	ld	s5, 40(sp)                      # 8-byte Folded Reload
	ld	s6, 32(sp)                      # 8-byte Folded Reload
	ld	s7, 24(sp)                      # 8-byte Folded Reload
	ld	s8, 16(sp)                      # 8-byte Folded Reload
	ld	s9, 8(sp)                       # 8-byte Folded Reload
	ld	s10, 0(sp)                      # 8-byte Folded Reload
	addi	sp, sp, 96
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
