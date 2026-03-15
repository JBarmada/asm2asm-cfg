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
	beqz	a1, .LBB0_13
# %bb.1:
	mv	s4, a1
	li	s3, 1
	blez	a1, .LBB0_14
# %bb.2:
	mv	s2, a0
	li	s6, 0
	li	s7, 0
	li	s0, 0
	li	s5, 2
	j	.LBB0_4
.LBB0_3:                                #   in Loop: Header=BB0_4 Depth=1
	addi	s6, s6, 1
	beq	s6, s4, .LBB0_14
.LBB0_4:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_6 Depth 2
	slli	a0, s6, 4
	add	a0, a0, s2
	ld	s8, 0(a0)
	lbu	s1, 0(s8)
	beqz	s1, .LBB0_3
# %bb.5:                                #   in Loop: Header=BB0_4 Depth=1
	call	__ctype_b_loc@plt
	ld	a0, 0(a0)
	addi	a1, s8, 1
.LBB0_6:                                #   Parent Loop BB0_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	andi	a2, s1, 255
	slli	a2, a2, 1
	add	a2, a2, a0
	lhu	a2, 0(a2)
	andi	a3, a2, 1024
	beqz	a3, .LBB0_13
# %bb.7:                                #   in Loop: Header=BB0_6 Depth=2
	andi	a3, a2, 256
	beqz	a3, .LBB0_10
# %bb.8:                                #   in Loop: Header=BB0_6 Depth=2
	li	s7, 1
	andi	a2, a2, 512
	bnez	a2, .LBB0_11
.LBB0_9:                                #   in Loop: Header=BB0_6 Depth=2
	addw	a2, s7, s0
	bne	a2, s5, .LBB0_12
	j	.LBB0_13
.LBB0_10:                               #   in Loop: Header=BB0_6 Depth=2
	andi	a2, a2, 512
	beqz	a2, .LBB0_9
.LBB0_11:                               #   in Loop: Header=BB0_6 Depth=2
	li	s0, 1
	addw	a2, s7, s0
	beq	a2, s5, .LBB0_13
.LBB0_12:                               #   in Loop: Header=BB0_6 Depth=2
	lbu	s1, 0(a1)
	addi	a1, a1, 1
	bnez	s1, .LBB0_6
	j	.LBB0_3
.LBB0_13:
	li	s3, 0
.LBB0_14:
	mv	a0, s3
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
