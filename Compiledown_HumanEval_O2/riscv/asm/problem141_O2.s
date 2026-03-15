	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	addi	sp, sp, -80
	sd	ra, 72(sp)                      # 8-byte Folded Spill
	sd	s0, 64(sp)                      # 8-byte Folded Spill
	sd	s1, 56(sp)                      # 8-byte Folded Spill
	sd	s2, 48(sp)                      # 8-byte Folded Spill
	sd	s3, 40(sp)                      # 8-byte Folded Spill
	sd	s4, 32(sp)                      # 8-byte Folded Spill
	sd	s5, 24(sp)                      # 8-byte Folded Spill
	sd	s6, 16(sp)                      # 8-byte Folded Spill
	sd	s7, 8(sp)                       # 8-byte Folded Spill
	sd	s8, 0(sp)                       # 8-byte Folded Spill
	mv	s3, a0
	lbu	a0, 0(a0)
	mv	s2, a1
	beqz	a0, .LBB0_17
# %bb.1:
	li	s0, 0
	li	s4, 0
	li	s1, 0
	li	s5, 32
	li	s6, 1
	li	s7, 2
	li	s8, 3
	j	.LBB0_4
.LBB0_2:                                #   in Loop: Header=BB0_4 Depth=1
	addiw	s1, s1, 1
.LBB0_3:                                #   in Loop: Header=BB0_4 Depth=1
	addi	s0, s0, 1
	mv	a0, s3
	call	strlen@plt
	bgeu	s0, a0, .LBB0_14
.LBB0_4:                                # =>This Inner Loop Header: Depth=1
	add	a0, s3, s0
	lbu	a1, 0(a0)
	beq	a1, s5, .LBB0_2
# %bb.5:                                #   in Loop: Header=BB0_4 Depth=1
	beq	s1, s6, .LBB0_8
# %bb.6:                                #   in Loop: Header=BB0_4 Depth=1
	bne	s1, s7, .LBB0_9
# %bb.7:                                #   in Loop: Header=BB0_4 Depth=1
	addiw	a2, s4, 1
	add	a3, s2, s4
	li	a1, 95
	sb	a1, 0(a3)
	li	s1, 2
	j	.LBB0_12
.LBB0_8:                                #   in Loop: Header=BB0_4 Depth=1
	li	a1, 95
	j	.LBB0_11
.LBB0_9:                                #   in Loop: Header=BB0_4 Depth=1
	blt	s1, s8, .LBB0_13
# %bb.10:                               #   in Loop: Header=BB0_4 Depth=1
	li	a1, 45
	li	s1, 1
.LBB0_11:                               #   in Loop: Header=BB0_4 Depth=1
	mv	a2, s4
.LBB0_12:                               #   in Loop: Header=BB0_4 Depth=1
	addw	s4, s4, s1
	add	a2, a2, s2
	sb	a1, 0(a2)
.LBB0_13:                               #   in Loop: Header=BB0_4 Depth=1
	lb	a0, 0(a0)
	li	s1, 0
	add	a1, s2, s4
	addiw	s4, s4, 1
	sb	a0, 0(a1)
	j	.LBB0_3
.LBB0_14:
	li	a0, 1
	beq	s1, a0, .LBB0_18
# %bb.15:
	li	a0, 2
	bne	s1, a0, .LBB0_19
# %bb.16:
	addiw	a1, s4, 1
	add	a2, s2, s4
	li	a0, 95
	sb	a0, 0(a2)
	li	s1, 2
	j	.LBB0_22
.LBB0_17:
	li	s4, 0
	j	.LBB0_23
.LBB0_18:
	li	a0, 95
	j	.LBB0_21
.LBB0_19:
	li	a0, 3
	blt	s1, a0, .LBB0_23
# %bb.20:
	li	a0, 45
	li	s1, 1
.LBB0_21:
	mv	a1, s4
.LBB0_22:
	addw	s4, s4, s1
	add	a1, a1, s2
	sb	a0, 0(a1)
.LBB0_23:
	add	a0, s2, s4
	sb	zero, 0(a0)
	ld	ra, 72(sp)                      # 8-byte Folded Reload
	ld	s0, 64(sp)                      # 8-byte Folded Reload
	ld	s1, 56(sp)                      # 8-byte Folded Reload
	ld	s2, 48(sp)                      # 8-byte Folded Reload
	ld	s3, 40(sp)                      # 8-byte Folded Reload
	ld	s4, 32(sp)                      # 8-byte Folded Reload
	ld	s5, 24(sp)                      # 8-byte Folded Reload
	ld	s6, 16(sp)                      # 8-byte Folded Reload
	ld	s7, 8(sp)                       # 8-byte Folded Reload
	ld	s8, 0(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 80
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
