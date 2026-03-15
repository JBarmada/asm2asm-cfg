	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	addi	sp, sp, -160
	sd	ra, 152(sp)                     # 8-byte Folded Spill
	sd	s0, 144(sp)                     # 8-byte Folded Spill
	sd	s1, 136(sp)                     # 8-byte Folded Spill
	sd	s2, 128(sp)                     # 8-byte Folded Spill
	sd	s3, 120(sp)                     # 8-byte Folded Spill
	sd	s4, 112(sp)                     # 8-byte Folded Spill
	sd	s5, 104(sp)                     # 8-byte Folded Spill
	sd	s6, 96(sp)                      # 8-byte Folded Spill
	sd	s7, 88(sp)                      # 8-byte Folded Spill
	sd	s8, 80(sp)                      # 8-byte Folded Spill
	sd	s9, 72(sp)                      # 8-byte Folded Spill
	sd	s10, 64(sp)                     # 8-byte Folded Spill
	sd	s11, 56(sp)                     # 8-byte Folded Spill
	mv	s4, a0
	call	strlen@plt
	mv	s3, a0
	addiw	a0, a0, 2
	call	malloc@plt
	slli	a1, s3, 32
	mv	s2, a0
	li	s5, 0
	bltz	a1, .LBB0_18
# %bb.1:
	li	s10, 0
	li	s5, 0
	li	s11, 0
	addiw	a0, s3, 1
	slli	a0, a0, 32
	srli	s3, a0, 32
	addi	s6, sp, 6
	li	s7, 32
	li	s8, 2
	addi	s9, sp, 5
	j	.LBB0_4
.LBB0_2:                                #   in Loop: Header=BB0_4 Depth=1
	addiw	a0, s11, 1
	add	a2, s9, s11
	sb	a1, 0(a2)
.LBB0_3:                                #   in Loop: Header=BB0_4 Depth=1
	addi	s10, s10, 1
	mv	s11, a0
	beq	s10, s3, .LBB0_18
.LBB0_4:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_8 Depth 2
                                        #       Child Loop BB0_11 Depth 3
	add	a0, s4, s10
	lbu	a1, 0(a0)
	ori	a0, a1, 32
	bne	a0, s7, .LBB0_2
# %bb.5:                                #   in Loop: Header=BB0_4 Depth=1
	blt	s11, s8, .LBB0_13
# %bb.6:                                #   in Loop: Header=BB0_4 Depth=1
	li	a1, 0
	addiw	a0, s11, -1
	slli	a0, a0, 32
	srli	a6, a0, 32
	li	a2, 1
	mv	s0, s6
	j	.LBB0_8
.LBB0_7:                                #   in Loop: Header=BB0_8 Depth=2
	addi	a2, a2, 1
	addi	s0, s0, 1
	beq	a1, a6, .LBB0_13
.LBB0_8:                                #   Parent Loop BB0_4 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_11 Depth 3
	mv	a3, a1
	addi	a1, a1, 1
	bgeu	a1, s11, .LBB0_7
# %bb.9:                                #   in Loop: Header=BB0_8 Depth=2
	add	a4, s9, a3
	mv	a5, s11
	mv	a3, s0
	j	.LBB0_11
.LBB0_10:                               #   in Loop: Header=BB0_11 Depth=3
	addi	a5, a5, -1
	addi	a3, a3, 1
	beq	a2, a5, .LBB0_7
.LBB0_11:                               #   Parent Loop BB0_4 Depth=1
                                        #     Parent Loop BB0_8 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	lbu	a0, 0(a4)
	lbu	s1, 0(a3)
	bgeu	s1, a0, .LBB0_10
# %bb.12:                               #   in Loop: Header=BB0_11 Depth=3
	sb	s1, 0(a4)
	sb	a0, 0(a3)
	j	.LBB0_10
.LBB0_13:                               #   in Loop: Header=BB0_4 Depth=1
	blez	s5, .LBB0_15
# %bb.14:                               #   in Loop: Header=BB0_4 Depth=1
	add	a0, s2, s5
	addiw	s5, s5, 1
	sb	s7, 0(a0)
.LBB0_15:                               #   in Loop: Header=BB0_4 Depth=1
	bgtz	s11, .LBB0_17
# %bb.16:                               #   in Loop: Header=BB0_4 Depth=1
	li	a0, 0
	j	.LBB0_3
.LBB0_17:                               #   in Loop: Header=BB0_4 Depth=1
	add	a0, s2, s5
	addi	a1, sp, 5
	mv	a2, s11
	call	memcpy@plt
	li	a0, 0
	addw	s5, s5, s11
	j	.LBB0_3
.LBB0_18:
	add	a0, s2, s5
	sb	zero, 0(a0)
	mv	a0, s2
	ld	ra, 152(sp)                     # 8-byte Folded Reload
	ld	s0, 144(sp)                     # 8-byte Folded Reload
	ld	s1, 136(sp)                     # 8-byte Folded Reload
	ld	s2, 128(sp)                     # 8-byte Folded Reload
	ld	s3, 120(sp)                     # 8-byte Folded Reload
	ld	s4, 112(sp)                     # 8-byte Folded Reload
	ld	s5, 104(sp)                     # 8-byte Folded Reload
	ld	s6, 96(sp)                      # 8-byte Folded Reload
	ld	s7, 88(sp)                      # 8-byte Folded Reload
	ld	s8, 80(sp)                      # 8-byte Folded Reload
	ld	s9, 72(sp)                      # 8-byte Folded Reload
	ld	s10, 64(sp)                     # 8-byte Folded Reload
	ld	s11, 56(sp)                     # 8-byte Folded Reload
	addi	sp, sp, 160
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
