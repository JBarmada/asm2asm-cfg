	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	addi	sp, sp, -1104
	sd	ra, 1096(sp)                    # 8-byte Folded Spill
	sd	s0, 1088(sp)                    # 8-byte Folded Spill
	sd	s1, 1080(sp)                    # 8-byte Folded Spill
	sd	s2, 1072(sp)                    # 8-byte Folded Spill
	sd	s3, 1064(sp)                    # 8-byte Folded Spill
	sd	s4, 1056(sp)                    # 8-byte Folded Spill
	sd	s5, 1048(sp)                    # 8-byte Folded Spill
	sd	s6, 1040(sp)                    # 8-byte Folded Spill
	mv	s2, a0
	addi	a0, sp, 16
	li	a2, 1024
	addi	s3, sp, 16
	li	a1, 0
	call	memset@plt
	lbu	s1, 0(s2)
	beqz	s1, .LBB0_6
# %bb.1:
	call	__ctype_tolower_loc@plt
	ld	s5, 0(a0)
	li	s4, 0
	addi	s0, s2, 1
	li	s2, 1
	j	.LBB0_3
.LBB0_2:                                #   in Loop: Header=BB0_3 Depth=1
	lbu	s1, 0(s0)
	addi	s0, s0, 1
	beqz	s1, .LBB0_7
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	andi	a0, s1, 255
	slli	a0, a0, 2
	add	a0, a0, s5
	lbu	s1, 0(a0)
	slli	a0, s1, 2
	add	s6, s3, a0
	lw	a0, 0(s6)
	bnez	a0, .LBB0_2
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=1
	call	__ctype_b_loc@plt
	ld	a0, 0(a0)
	slli	a1, s1, 1
	add	a0, a0, a1
	lbu	a0, 1(a0)
	andi	a0, a0, 4
	beqz	a0, .LBB0_2
# %bb.5:                                #   in Loop: Header=BB0_3 Depth=1
	sw	s2, 0(s6)
	addiw	s4, s4, 1
	j	.LBB0_2
.LBB0_6:
	li	s4, 0
.LBB0_7:
	mv	a0, s4
	ld	ra, 1096(sp)                    # 8-byte Folded Reload
	ld	s0, 1088(sp)                    # 8-byte Folded Reload
	ld	s1, 1080(sp)                    # 8-byte Folded Reload
	ld	s2, 1072(sp)                    # 8-byte Folded Reload
	ld	s3, 1064(sp)                    # 8-byte Folded Reload
	ld	s4, 1056(sp)                    # 8-byte Folded Reload
	ld	s5, 1048(sp)                    # 8-byte Folded Reload
	ld	s6, 1040(sp)                    # 8-byte Folded Reload
	addi	sp, sp, 1104
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
