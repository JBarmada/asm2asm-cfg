	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.section	.sdata,"aw",@progbits
	.p2align	3                               # -- Begin function func0
.LCPI0_0:
	.quad	4575140898685201                # 0x10411100104111
	.text
	.globl	func0
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
	lbu	s1, 0(a0)
	mv	s3, a1
	beqz	s1, .LBB0_11
# %bb.1:
	mv	s2, a0
	call	__ctype_b_loc@plt
.LBB0_13:                               # Label of block must be emitted
	auipc	a1, %pcrel_hi(.LCPI0_0)
	addi	a1, a1, %pcrel_lo(.LBB0_13)
	ld	s4, 0(a1)
	mv	s6, a0
	li	s0, 0
	addi	s5, s2, 1
	li	s2, 52
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
	ld	a0, 0(s6)
	andi	s7, s1, 255
	slli	a1, s7, 1
	add	a0, a0, a1
	lhu	a0, 0(a0)
	andi	a1, a0, 512
	bnez	a1, .LBB0_5
# %bb.3:                                #   in Loop: Header=BB0_2 Depth=1
	andi	a0, a0, 256
	beqz	a0, .LBB0_7
# %bb.4:                                #   in Loop: Header=BB0_2 Depth=1
	call	__ctype_tolower_loc@plt
	j	.LBB0_6
.LBB0_5:                                #   in Loop: Header=BB0_2 Depth=1
	call	__ctype_toupper_loc@plt
.LBB0_6:                                #   in Loop: Header=BB0_2 Depth=1
	ld	a0, 0(a0)
	slli	a1, s7, 2
	add	a0, a0, a1
	lb	s1, 0(a0)
.LBB0_7:                                #   in Loop: Header=BB0_2 Depth=1
	andi	a0, s1, 255
	addi	a0, a0, -65
	bltu	s2, a0, .LBB0_10
# %bb.8:                                #   in Loop: Header=BB0_2 Depth=1
	srl	a0, s4, a0
	andi	a0, a0, 1
	beqz	a0, .LBB0_10
# %bb.9:                                #   in Loop: Header=BB0_2 Depth=1
	addi	s1, s1, 2
.LBB0_10:                               #   in Loop: Header=BB0_2 Depth=1
	add	a0, s3, s0
	sb	s1, 0(a0)
	add	a0, s5, s0
	lbu	s1, 0(a0)
	addi	a0, s0, 1
	mv	s0, a0
	bnez	s1, .LBB0_2
	j	.LBB0_12
.LBB0_11:
	li	a0, 0
.LBB0_12:
	add	a0, a0, s3
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
