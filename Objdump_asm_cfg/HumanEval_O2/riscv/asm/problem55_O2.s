	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	addi	sp, sp, -48
	sd	ra, 40(sp)                      # 8-byte Folded Spill
	sd	s0, 32(sp)                      # 8-byte Folded Spill
	sd	s1, 24(sp)                      # 8-byte Folded Spill
	sd	s2, 16(sp)                      # 8-byte Folded Spill
	sd	s3, 8(sp)                       # 8-byte Folded Spill
	sd	s4, 0(sp)                       # 8-byte Folded Spill
	mv	s2, a1
	mv	s4, a0
	li	a0, -1
	srli	s1, a0, 32
	mv	a0, s4
	call	strlen@plt
	mv	s0, a0
	sext.w	s3, a0
	mv	a0, s2
	call	strlen@plt
	and	a7, a0, s1
	sext.w	t0, a0
	blez	s3, .LBB0_8
# %bb.1:
	li	a3, 0
	and	a6, s0, s1
	li	a2, 1
.LBB0_2:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_4 Depth 2
	blez	t0, .LBB0_18
# %bb.3:                                #   in Loop: Header=BB0_2 Depth=1
	add	a1, s4, a3
	lbu	a5, 0(a1)
	mv	a1, a7
	mv	a4, s2
.LBB0_4:                                #   Parent Loop BB0_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lbu	a0, 0(a4)
	beq	a5, a0, .LBB0_6
# %bb.5:                                #   in Loop: Header=BB0_4 Depth=2
	addi	a1, a1, -1
	addi	a4, a4, 1
	bnez	a1, .LBB0_4
	j	.LBB0_7
.LBB0_6:                                #   in Loop: Header=BB0_2 Depth=1
	addi	a3, a3, 1
	slt	a2, a3, s3
	bne	a3, a6, .LBB0_2
	j	.LBB0_8
.LBB0_7:
	andi	a0, a2, 1
	bnez	a0, .LBB0_17
.LBB0_8:
	blez	t0, .LBB0_15
# %bb.9:
	li	a3, 0
	and	a1, s0, s1
	li	a2, 1
.LBB0_10:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_12 Depth 2
	blez	s3, .LBB0_19
# %bb.11:                               #   in Loop: Header=BB0_10 Depth=1
	add	a0, s2, a3
	lbu	a5, 0(a0)
	mv	a4, a1
	mv	s1, s4
.LBB0_12:                               #   Parent Loop BB0_10 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lbu	a0, 0(s1)
	beq	a5, a0, .LBB0_14
# %bb.13:                               #   in Loop: Header=BB0_12 Depth=2
	addi	a4, a4, -1
	addi	s1, s1, 1
	bnez	a4, .LBB0_12
	j	.LBB0_16
.LBB0_14:                               #   in Loop: Header=BB0_10 Depth=1
	addi	a3, a3, 1
	slt	a2, a3, t0
	bne	a3, a7, .LBB0_10
	j	.LBB0_16
.LBB0_15:
	li	a2, 0
.LBB0_16:
	xori	a1, a2, 1
.LBB0_17:
	andi	a0, a1, 1
	ld	ra, 40(sp)                      # 8-byte Folded Reload
	ld	s0, 32(sp)                      # 8-byte Folded Reload
	ld	s1, 24(sp)                      # 8-byte Folded Reload
	ld	s2, 16(sp)                      # 8-byte Folded Reload
	ld	s3, 8(sp)                       # 8-byte Folded Reload
	ld	s4, 0(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 48
	ret
.LBB0_18:
	li	a1, 0
	j	.LBB0_17
.LBB0_19:
	li	a2, 1
	j	.LBB0_16
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
