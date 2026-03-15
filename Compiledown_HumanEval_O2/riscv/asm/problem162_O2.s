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
	mv	s5, a0
	call	strlen@plt
	mv	s2, a0
	sext.w	s4, a0
	slli	s3, a0, 32
	blez	s4, .LBB0_10
# %bb.1:
	call	__ctype_b_loc@plt
	mv	s6, a0
	li	s7, 0
	srli	s1, s3, 32
	mv	s0, s5
	j	.LBB0_4
.LBB0_2:                                #   in Loop: Header=BB0_4 Depth=1
	addiw	s7, s7, 1
.LBB0_3:                                #   in Loop: Header=BB0_4 Depth=1
	addi	s1, s1, -1
	addi	s0, s0, 1
	beqz	s1, .LBB0_11
.LBB0_4:                                # =>This Inner Loop Header: Depth=1
	lbu	s8, 0(s0)
	ld	a0, 0(s6)
	slli	a1, s8, 1
	add	a0, a0, a1
	lhu	a0, 0(a0)
	andi	a1, a0, 1024
	beqz	a1, .LBB0_2
# %bb.5:                                #   in Loop: Header=BB0_4 Depth=1
	andi	a1, a0, 256
	bnez	a1, .LBB0_8
# %bb.6:                                #   in Loop: Header=BB0_4 Depth=1
	andi	a0, a0, 512
	beqz	a0, .LBB0_3
# %bb.7:                                #   in Loop: Header=BB0_4 Depth=1
	call	__ctype_toupper_loc@plt
	j	.LBB0_9
.LBB0_8:                                #   in Loop: Header=BB0_4 Depth=1
	call	__ctype_tolower_loc@plt
.LBB0_9:                                #   in Loop: Header=BB0_4 Depth=1
	ld	a0, 0(a0)
	slli	a1, s8, 2
	add	a0, a0, a1
	lb	a0, 0(a0)
	sb	a0, 0(s0)
	j	.LBB0_3
.LBB0_10:
	li	s7, 0
.LBB0_11:
	xor	a0, s7, s4
	snez	a0, a0
	slti	a1, s4, 2
	or	a0, a0, a1
	bnez	a0, .LBB0_14
# %bb.12:
	li	a0, -1
	slli	a0, a0, 32
	srliw	a1, s2, 1
	add	a2, s3, a0
	mv	a3, s5
.LBB0_13:                               # =>This Inner Loop Header: Depth=1
	srai	a4, a2, 32
	add	a4, a4, s5
	lb	a5, 0(a4)
	lb	s1, 0(a3)
	sb	a5, 0(a3)
	sb	s1, 0(a4)
	add	a2, a2, a0
	addi	a1, a1, -1
	addi	a3, a3, 1
	bnez	a1, .LBB0_13
.LBB0_14:
	mv	a0, s5
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
