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
	sh	zero, 24(sp)
	sd	zero, 16(sp)
	sh	zero, 8(sp)
	sd	zero, 0(sp)
	lbu	s0, 0(a0)
	mv	s2, a1
	beqz	s0, .LBB0_10
# %bb.1:
	mv	s1, a0
	call	__ctype_b_loc@plt
	li	a5, 0
	li	a2, 0
	ld	a0, 0(a0)
	addi	a1, s1, 1
	addi	a6, sp, 16
	mv	a3, sp
	j	.LBB0_4
.LBB0_2:                                #   in Loop: Header=BB0_4 Depth=1
	mv	a2, a4
.LBB0_3:                                #   in Loop: Header=BB0_4 Depth=1
	lbu	s0, 0(a1)
	addi	a1, a1, 1
	mv	a5, s1
	beqz	s0, .LBB0_10
.LBB0_4:                                # =>This Inner Loop Header: Depth=1
	andi	a4, s0, 255
	slli	a4, a4, 1
	add	a4, a4, a0
	lbu	a4, 1(a4)
	andi	a4, a4, 8
	bnez	a4, .LBB0_7
# %bb.5:                                #   in Loop: Header=BB0_4 Depth=1
	li	s1, 0
	seqz	a4, a2
	sgtz	s0, a5
	and	s0, s0, a4
	li	a4, 1
	bnez	s0, .LBB0_2
# %bb.6:                                #   in Loop: Header=BB0_4 Depth=1
	mv	a4, a2
	mv	s1, a5
	j	.LBB0_2
.LBB0_7:                                #   in Loop: Header=BB0_4 Depth=1
	addiw	s1, a5, 1
	beqz	a2, .LBB0_9
# %bb.8:                                #   in Loop: Header=BB0_4 Depth=1
	add	a2, a3, a5
	sb	s0, 0(a2)
	li	a2, 1
	j	.LBB0_3
.LBB0_9:                                #   in Loop: Header=BB0_4 Depth=1
	add	a4, a6, a5
	sb	s0, 0(a4)
	j	.LBB0_3
.LBB0_10:
	addi	a0, sp, 16
	li	a2, 10
	li	a1, 0
	call	strtol@plt
	mv	s1, a0
	mv	a0, sp
	li	a2, 10
	li	a1, 0
	call	strtol@plt
	addw	a0, a0, s1
	subw	a0, s2, a0
	ld	ra, 56(sp)                      # 8-byte Folded Reload
	ld	s0, 48(sp)                      # 8-byte Folded Reload
	ld	s1, 40(sp)                      # 8-byte Folded Reload
	ld	s2, 32(sp)                      # 8-byte Folded Reload
	addi	sp, sp, 64
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
