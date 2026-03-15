	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	addi	sp, sp, -32
	sd	ra, 24(sp)                      # 8-byte Folded Spill
	sd	s0, 16(sp)                      # 8-byte Folded Spill
	sd	s1, 8(sp)                       # 8-byte Folded Spill
	sd	s2, 0(sp)                       # 8-byte Folded Spill
	lbu	s1, 0(a0)
	beqz	s1, .LBB0_8
# %bb.1:
	mv	s2, a0
	call	__ctype_b_loc@plt
	mv	a1, a0
	li	a0, 0
	li	s0, 0
	ld	t0, 0(a1)
	addi	a2, s2, 1
	li	t1, 1
	li	a6, 63
	lui	a3, 786434
	addiw	a3, a3, 1
	slli	a7, a3, 33
	j	.LBB0_4
.LBB0_2:                                #   in Loop: Header=BB0_4 Depth=1
	li	a3, 1
.LBB0_3:                                #   in Loop: Header=BB0_4 Depth=1
	srli	a1, s1, 13
	lbu	s1, 0(a2)
	snez	a4, s0
	and	a1, a1, a4
	addw	a0, a0, a1
	addi	a2, a2, 1
	mv	s0, a3
	beqz	s1, .LBB0_9
.LBB0_4:                                # =>This Inner Loop Header: Depth=1
	andi	a4, s1, 255
	slli	a3, a4, 1
	add	a3, a3, t0
	lh	s1, 0(a3)
	slli	a3, s1, 50
	srai	a3, a3, 63
	addi	a1, a4, -73
	seqz	a1, a1
	snez	a5, t1
	and	a1, a1, a5
	and	t1, a3, t1
	bnez	a1, .LBB0_2
# %bb.5:                                #   in Loop: Header=BB0_4 Depth=1
	li	a3, 0
	bltu	a6, a4, .LBB0_3
# %bb.6:                                #   in Loop: Header=BB0_4 Depth=1
	srl	a1, a7, a4
	andi	a1, a1, 1
	beqz	a1, .LBB0_3
# %bb.7:                                #   in Loop: Header=BB0_4 Depth=1
	li	a3, 0
	li	t1, 1
	j	.LBB0_3
.LBB0_8:
	li	a0, 0
.LBB0_9:
	ld	ra, 24(sp)                      # 8-byte Folded Reload
	ld	s0, 16(sp)                      # 8-byte Folded Reload
	ld	s1, 8(sp)                       # 8-byte Folded Reload
	ld	s2, 0(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 32
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
