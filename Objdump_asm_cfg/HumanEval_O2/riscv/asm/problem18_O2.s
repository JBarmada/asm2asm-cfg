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
	sd	a1, 8(sp)                       # 8-byte Folded Spill
	mv	s1, a0
	sb	zero, 22(sp)
	sh	zero, 20(sp)
	call	strlen@plt
	mv	s0, a0
	sext.w	s3, a0
	addiw	a0, a0, 2
	call	malloc@plt
	mv	s2, a0
	mv	a1, s1
	call	strcpy@plt
	mv	a0, s2
	call	strlen@plt
	add	a0, a0, s2
	sb	zero, 1(a0)
	li	s4, 32
	lui	a1, 524288
	addiw	a1, a1, -2
	sb	s4, 0(a0)
	bltu	a1, s3, .LBB0_28
# %bb.1:
	li	s8, 0
	li	s1, 0
	li	s7, 0
	addiw	a0, s0, 1
	slli	a0, a0, 32
	srli	s0, a0, 32
	li	s6, 111
.LBB0_30:                               # Label of block must be emitted
	auipc	s5, %pcrel_hi(.L.str.2)
	addi	s5, s5, %pcrel_lo(.LBB0_30)
	addi	s9, sp, 20
	li	s11, 1
	mv	s3, s2
	j	.LBB0_7
.LBB0_2:                                #   in Loop: Header=BB0_7 Depth=1
	li	s7, 4
.LBB0_3:                                #   in Loop: Header=BB0_7 Depth=1
	slli	a1, s7, 2
	mv	a0, s8
	call	realloc@plt
	mv	s8, a0
.LBB0_4:                                #   in Loop: Header=BB0_7 Depth=1
	slli	a0, s1, 2
	addiw	s1, s1, 1
	add	a0, a0, s8
	sw	s11, 0(a0)
.LBB0_5:                                #   in Loop: Header=BB0_7 Depth=1
	sb	zero, 20(sp)
.LBB0_6:                                #   in Loop: Header=BB0_7 Depth=1
	addi	s0, s0, -1
	addi	s3, s3, 1
	beqz	s0, .LBB0_29
.LBB0_7:                                # =>This Inner Loop Header: Depth=1
	lbu	s10, 0(s3)
	bne	s10, s4, .LBB0_12
# %bb.8:                                #   in Loop: Header=BB0_7 Depth=1
	lhu	a0, 20(sp)
	bne	a0, s6, .LBB0_17
# %bb.9:                                #   in Loop: Header=BB0_7 Depth=1
	bne	s1, s7, .LBB0_16
# %bb.10:                               #   in Loop: Header=BB0_7 Depth=1
	bgtz	s1, .LBB0_14
# %bb.11:                               #   in Loop: Header=BB0_7 Depth=1
	li	s7, 4
	j	.LBB0_15
.LBB0_12:                               #   in Loop: Header=BB0_7 Depth=1
	addi	a0, sp, 20
	call	strlen@plt
	bltu	s11, a0, .LBB0_6
# %bb.13:                               #   in Loop: Header=BB0_7 Depth=1
	add	a0, a0, s9
	sb	s10, 0(a0)
	sb	zero, 1(a0)
	j	.LBB0_6
.LBB0_14:                               #   in Loop: Header=BB0_7 Depth=1
	slliw	s7, s1, 1
.LBB0_15:                               #   in Loop: Header=BB0_7 Depth=1
	slli	a1, s7, 2
	mv	a0, s8
	call	realloc@plt
	mv	s8, a0
.LBB0_16:                               #   in Loop: Header=BB0_7 Depth=1
	slli	a0, s1, 2
	addiw	s1, s1, 1
	add	a0, a0, s8
	li	a1, 4
	sw	a1, 0(a0)
.LBB0_17:                               #   in Loop: Header=BB0_7 Depth=1
	addi	a0, sp, 20
	li	a2, 3
	mv	a1, s5
	call	bcmp@plt
	sext.w	a0, a0
	bnez	a0, .LBB0_24
# %bb.18:                               #   in Loop: Header=BB0_7 Depth=1
	bne	s1, s7, .LBB0_23
# %bb.19:                               #   in Loop: Header=BB0_7 Depth=1
	bgtz	s7, .LBB0_21
# %bb.20:                               #   in Loop: Header=BB0_7 Depth=1
	li	s7, 4
	j	.LBB0_22
.LBB0_21:                               #   in Loop: Header=BB0_7 Depth=1
	slliw	s7, s7, 1
.LBB0_22:                               #   in Loop: Header=BB0_7 Depth=1
	slli	a1, s7, 2
	mv	a0, s8
	call	realloc@plt
	mv	s8, a0
.LBB0_23:                               #   in Loop: Header=BB0_7 Depth=1
	slli	a0, s1, 2
	addiw	s1, s1, 1
	add	a0, a0, s8
	li	a1, 2
	sw	a1, 0(a0)
.LBB0_24:                               #   in Loop: Header=BB0_7 Depth=1
.LBB0_31:                               #   in Loop: Header=BB0_7 Depth=1
                                        # Label of block must be emitted
	auipc	a1, %pcrel_hi(.L.str.3)
	addi	a1, a1, %pcrel_lo(.LBB0_31)
	addi	a0, sp, 20
	li	a2, 3
	call	bcmp@plt
	sext.w	a0, a0
	bnez	a0, .LBB0_5
# %bb.25:                               #   in Loop: Header=BB0_7 Depth=1
	bne	s1, s7, .LBB0_4
# %bb.26:                               #   in Loop: Header=BB0_7 Depth=1
	blez	s7, .LBB0_2
# %bb.27:                               #   in Loop: Header=BB0_7 Depth=1
	slliw	s7, s7, 1
	j	.LBB0_3
.LBB0_28:
	li	s1, 0
	li	s8, 0
.LBB0_29:
	mv	a0, s2
	call	free@plt
	ld	a0, 8(sp)                       # 8-byte Folded Reload
	sw	s1, 0(a0)
	mv	a0, s8
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
	.type	.L.str.1,@object                # @.str.1
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.1:
	.asciz	"o"
	.size	.L.str.1, 2

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"o|"
	.size	.L.str.2, 3

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	".|"
	.size	.L.str.3, 3

	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
