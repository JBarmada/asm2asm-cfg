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
	mv	s2, a1
	mv	s1, a0
	li	a2, 0
	li	s6, 0
	li	s3, 0
	li	a0, 0
	li	s5, 40
	li	s4, 41
	j	.LBB0_3
.LBB0_1:                                #   in Loop: Header=BB0_3 Depth=1
	addiw	a1, a2, -1
	beqz	a1, .LBB0_9
.LBB0_2:                                #   in Loop: Header=BB0_3 Depth=1
	addi	s1, s1, 1
	mv	a2, a1
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	lbu	a1, 0(s1)
	beq	a1, s5, .LBB0_7
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=1
	beq	a1, s4, .LBB0_1
# %bb.5:                                #   in Loop: Header=BB0_3 Depth=1
	beqz	a1, .LBB0_10
# %bb.6:                                #   in Loop: Header=BB0_3 Depth=1
	mv	a1, a2
	j	.LBB0_2
.LBB0_7:                                #   in Loop: Header=BB0_3 Depth=1
	addiw	a1, a2, 1
	blt	a2, s6, .LBB0_2
# %bb.8:                                #   in Loop: Header=BB0_3 Depth=1
	mv	s6, a1
	j	.LBB0_2
.LBB0_9:                                #   in Loop: Header=BB0_3 Depth=1
	addiw	s0, s3, 1
	slli	a1, s0, 2
	call	realloc@plt
	li	a1, 0
	slli	a2, s3, 2
	add	a2, a2, a0
	sw	s6, 0(a2)
	mv	s3, s0
	li	s6, 0
	j	.LBB0_2
.LBB0_10:
	sw	s3, 0(s2)
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
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
