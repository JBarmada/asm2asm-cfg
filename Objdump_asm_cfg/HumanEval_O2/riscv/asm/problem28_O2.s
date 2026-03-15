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
	mv	s2, a1
	mv	s1, a0
	call	strlen@plt
	sext.w	a1, a0
	blez	a1, .LBB0_7
# %bb.1:
	slli	a0, a0, 32
	srli	a0, a0, 32
	li	a2, 25
	li	a3, 26
	mv	a4, s2
	j	.LBB0_4
.LBB0_2:                                #   in Loop: Header=BB0_4 Depth=1
	addi	a5, a5, -32
.LBB0_3:                                #   in Loop: Header=BB0_4 Depth=1
	sb	a5, 0(a4)
	addi	a4, a4, 1
	addi	a0, a0, -1
	addi	s1, s1, 1
	beqz	a0, .LBB0_7
.LBB0_4:                                # =>This Inner Loop Header: Depth=1
	lbu	a5, 0(s1)
	addiw	s0, a5, -97
	andi	s0, s0, 255
	bgeu	a2, s0, .LBB0_2
# %bb.5:                                #   in Loop: Header=BB0_4 Depth=1
	addiw	s0, a5, -65
	andi	s0, s0, 255
	bgeu	s0, a3, .LBB0_3
# %bb.6:                                #   in Loop: Header=BB0_4 Depth=1
	addi	a5, a5, 32
	j	.LBB0_3
.LBB0_7:
	add	a0, s2, a1
	sb	zero, 0(a0)
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
