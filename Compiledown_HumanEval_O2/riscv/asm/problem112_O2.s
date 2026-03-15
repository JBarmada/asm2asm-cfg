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
	mv	s3, a3
	mv	s2, a2
	mv	s1, a1
	mv	s0, a0
	addi	a0, sp, 8
	li	a2, 104
	addi	s4, sp, 8
	li	a1, 0
	call	memset@plt
	li	a0, 0
	li	a1, 32
	j	.LBB0_2
.LBB0_1:                                #   in Loop: Header=BB0_2 Depth=1
	addi	s0, s0, 1
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
	lbu	a2, 0(s0)
	beq	a2, a1, .LBB0_1
# %bb.3:                                #   in Loop: Header=BB0_2 Depth=1
	beqz	a2, .LBB0_6
# %bb.4:                                #   in Loop: Header=BB0_2 Depth=1
	slli	a2, a2, 2
	add	a3, a2, s4
	lw	a4, -388(a3)
	addiw	a2, a4, 1
	sw	a2, -388(a3)
	blt	a4, a0, .LBB0_1
# %bb.5:                                #   in Loop: Header=BB0_2 Depth=1
	mv	a0, a2
	j	.LBB0_1
.LBB0_6:
	li	a1, 0
	li	a3, 0
	addi	a6, sp, 8
	li	a5, 104
	j	.LBB0_8
.LBB0_7:                                #   in Loop: Header=BB0_8 Depth=1
	addi	a1, a1, 4
	addiw	a2, a2, 1
	beq	a1, a5, .LBB0_10
.LBB0_8:                                # =>This Inner Loop Header: Depth=1
	add	s0, a6, a1
	lw	s0, 0(s0)
	add	a4, s1, a1
	sw	s0, 0(a4)
	bne	s0, a0, .LBB0_7
# %bb.9:                                #   in Loop: Header=BB0_8 Depth=1
	addiw	a4, a2, 97
	add	s0, s3, a3
	addiw	a3, a3, 1
	sb	a4, 0(s0)
	j	.LBB0_7
.LBB0_10:
	sw	a0, 0(s2)
	add	a0, s3, a3
	sb	zero, 0(a0)
	ld	ra, 152(sp)                     # 8-byte Folded Reload
	ld	s0, 144(sp)                     # 8-byte Folded Reload
	ld	s1, 136(sp)                     # 8-byte Folded Reload
	ld	s2, 128(sp)                     # 8-byte Folded Reload
	ld	s3, 120(sp)                     # 8-byte Folded Reload
	ld	s4, 112(sp)                     # 8-byte Folded Reload
	addi	sp, sp, 160
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
