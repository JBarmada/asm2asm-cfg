	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	addi	sp, sp, -128
	sd	ra, 120(sp)                     # 8-byte Folded Spill
	sd	s0, 112(sp)                     # 8-byte Folded Spill
	sd	s1, 104(sp)                     # 8-byte Folded Spill
	sd	s2, 96(sp)                      # 8-byte Folded Spill
	sd	s3, 88(sp)                      # 8-byte Folded Spill
	sd	s4, 80(sp)                      # 8-byte Folded Spill
	sd	s5, 72(sp)                      # 8-byte Folded Spill
	sd	s6, 64(sp)                      # 8-byte Folded Spill
	sd	s7, 56(sp)                      # 8-byte Folded Spill
	sd	s8, 48(sp)                      # 8-byte Folded Spill
	sd	s9, 40(sp)                      # 8-byte Folded Spill
	sd	s10, 32(sp)                     # 8-byte Folded Spill
	sd	s11, 24(sp)                     # 8-byte Folded Spill
	mv	s6, a0
	call	strlen@plt
	mv	s2, a0
	slliw	a0, a0, 1
	sd	a0, 16(sp)                      # 8-byte Folded Spill
	ori	a0, a0, 1
	call	malloc@plt
	mv	s3, a0
	beqz	a0, .LBB0_19
# %bb.1:
	sext.w	s5, s2
	blez	s5, .LBB0_14
# %bb.2:
	li	s0, 0
	li	a0, -1
	slli	s1, a0, 32
	srli	a0, a0, 32
	sd	a0, 0(sp)                       # 8-byte Folded Spill
	slli	a0, s2, 32
	srli	s9, a0, 32
	sd	a0, 8(sp)                       # 8-byte Folded Spill
	add	s10, a0, s1
	add	s11, s3, s5
	li	s7, 2
	mv	s8, s6
	j	.LBB0_5
.LBB0_3:                                #   in Loop: Header=BB0_5 Depth=1
	add	a0, s0, s5
	add	a0, a0, s3
	sb	zero, 0(a0)
	beqz	s4, .LBB0_19
.LBB0_4:                                #   in Loop: Header=BB0_5 Depth=1
	addi	s0, s0, 1
	addi	s8, s8, 1
	beq	s0, s9, .LBB0_15
.LBB0_5:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_7 Depth 2
                                        #     Child Loop BB0_13 Depth 2
	sub	a1, s5, s0
	blt	a1, s7, .LBB0_10
# %bb.6:                                #   in Loop: Header=BB0_5 Depth=1
	li	a0, 0
	srliw	a2, a1, 31
	addw	a1, a1, a2
	sraiw	a1, a1, 1
	slli	a2, a1, 32
	srli	a2, a2, 32
	mv	a3, s10
.LBB0_7:                                #   Parent Loop BB0_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	add	a4, s8, a0
	lbu	a4, 0(a4)
	srai	a5, a3, 32
	add	a5, a5, s6
	lbu	a5, 0(a5)
	bne	a4, a5, .LBB0_4
# %bb.8:                                #   in Loop: Header=BB0_7 Depth=2
	addi	a0, a0, 1
	add	a3, a3, s1
	bne	a2, a0, .LBB0_7
# %bb.9:                                #   in Loop: Header=BB0_5 Depth=1
	slt	s4, a0, a1
	j	.LBB0_11
.LBB0_10:                               #   in Loop: Header=BB0_5 Depth=1
	li	s4, 0
.LBB0_11:                               #   in Loop: Header=BB0_5 Depth=1
	mv	a0, s3
	mv	a1, s6
	mv	a2, s5
	call	strncpy@plt
	beqz	s0, .LBB0_3
# %bb.12:                               #   in Loop: Header=BB0_5 Depth=1
	li	a0, 0
	mv	a1, s11
.LBB0_13:                               #   Parent Loop BB0_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	add	a2, s8, a0
	lb	a2, -1(a2)
	sb	a2, 0(a1)
	addi	a0, a0, -1
	add	a2, s0, a0
	addi	a1, a1, 1
	bnez	a2, .LBB0_13
	j	.LBB0_3
.LBB0_14:
	mv	a0, s3
	mv	a1, s6
	mv	a2, s5
	call	strncpy@plt
	ld	a4, 16(sp)                      # 8-byte Folded Reload
	j	.LBB0_18
.LBB0_15:
	mv	a0, s3
	mv	a1, s6
	mv	a2, s5
	call	strncpy@plt
	ld	a4, 16(sp)                      # 8-byte Folded Reload
	blez	s5, .LBB0_18
# %bb.16:
	ld	a0, 0(sp)                       # 8-byte Folded Reload
	and	a0, s2, a0
	ld	a1, 8(sp)                       # 8-byte Folded Reload
	add	a1, a1, s1
	add	a2, s3, s5
.LBB0_17:                               # =>This Inner Loop Header: Depth=1
	srai	a3, a1, 32
	add	a3, a3, s6
	lb	a3, 0(a3)
	sb	a3, 0(a2)
	add	a1, a1, s1
	addi	a0, a0, -1
	addi	a2, a2, 1
	bnez	a0, .LBB0_17
.LBB0_18:
	add	a0, s3, a4
	sb	zero, 0(a0)
.LBB0_19:
	mv	a0, s3
	ld	ra, 120(sp)                     # 8-byte Folded Reload
	ld	s0, 112(sp)                     # 8-byte Folded Reload
	ld	s1, 104(sp)                     # 8-byte Folded Reload
	ld	s2, 96(sp)                      # 8-byte Folded Reload
	ld	s3, 88(sp)                      # 8-byte Folded Reload
	ld	s4, 80(sp)                      # 8-byte Folded Reload
	ld	s5, 72(sp)                      # 8-byte Folded Reload
	ld	s6, 64(sp)                      # 8-byte Folded Reload
	ld	s7, 56(sp)                      # 8-byte Folded Reload
	ld	s8, 48(sp)                      # 8-byte Folded Reload
	ld	s9, 40(sp)                      # 8-byte Folded Reload
	ld	s10, 32(sp)                     # 8-byte Folded Reload
	ld	s11, 24(sp)                     # 8-byte Folded Reload
	addi	sp, sp, 128
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
