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
	mv	s2, a1
	mv	s4, a0
	li	s0, 0
	li	s1, 0
	li	s3, 0
	li	s5, 32
	li	s6, 2
	li	s7, 4
	j	.LBB0_3
.LBB0_1:                                #   in Loop: Header=BB0_3 Depth=1
	add	a0, s2, s3
	sub	a1, a1, s1
	mv	a2, s1
	call	memcpy@plt
	addw	s3, s3, s1
.LBB0_2:                                #   in Loop: Header=BB0_3 Depth=1
	li	s1, 0
	addi	s0, s0, 1
.LBB0_3:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_9 Depth 2
	add	a1, s4, s0
	lbu	a0, 0(a1)
	beq	a0, s5, .LBB0_6
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=1
	beqz	a0, .LBB0_13
# %bb.5:                                #   in Loop: Header=BB0_3 Depth=1
	addiw	s1, s1, 1
	addi	s0, s0, 1
	j	.LBB0_3
.LBB0_6:                                #   in Loop: Header=BB0_3 Depth=1
	blt	s1, s6, .LBB0_2
# %bb.7:                                #   in Loop: Header=BB0_3 Depth=1
	bltu	s1, s7, .LBB0_11
# %bb.8:                                #   in Loop: Header=BB0_3 Depth=1
	li	a0, 2
.LBB0_9:                                #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	remw	a2, s1, a0
	beqz	a2, .LBB0_2
# %bb.10:                               #   in Loop: Header=BB0_9 Depth=2
	addiw	a0, a0, 1
	mulw	a2, a0, a0
	bge	s1, a2, .LBB0_9
.LBB0_11:                               #   in Loop: Header=BB0_3 Depth=1
	blez	s3, .LBB0_1
# %bb.12:                               #   in Loop: Header=BB0_3 Depth=1
	add	a0, s2, s3
	addiw	s3, s3, 1
	sb	s5, 0(a0)
	j	.LBB0_1
.LBB0_13:
	li	a0, 2
	blt	s1, a0, .LBB0_21
# %bb.14:
	li	a0, 4
	bltu	s1, a0, .LBB0_18
# %bb.15:
	li	a0, 2
.LBB0_16:                               # =>This Inner Loop Header: Depth=1
	remw	a2, s1, a0
	beqz	a2, .LBB0_21
# %bb.17:                               #   in Loop: Header=BB0_16 Depth=1
	addiw	a0, a0, 1
	mulw	a2, a0, a0
	bge	s1, a2, .LBB0_16
.LBB0_18:
	blez	s3, .LBB0_20
# %bb.19:
	add	a0, s2, s3
	addiw	s3, s3, 1
	li	a2, 32
	sb	a2, 0(a0)
.LBB0_20:
	add	a0, s2, s3
	sub	a1, a1, s1
	mv	a2, s1
	call	memcpy@plt
	addw	s3, s3, s1
.LBB0_21:
	add	a0, s2, s3
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
	addi	sp, sp, 80
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
