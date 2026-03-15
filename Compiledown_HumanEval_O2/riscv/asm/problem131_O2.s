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
	mv	s0, a0
	addiw	s1, a0, 1
	slli	a0, s1, 2
	call	malloc@plt
	li	a1, 1
	sw	a1, 0(a0)
	beqz	s0, .LBB0_2
# %bb.1:
	li	a2, 3
	li	a1, 2
	sw	a2, 4(a0)
	bge	s0, a1, .LBB0_3
.LBB0_2:
	ld	ra, 24(sp)                      # 8-byte Folded Reload
	ld	s0, 16(sp)                      # 8-byte Folded Reload
	ld	s1, 8(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 32
	ret
.LBB0_3:
	slli	a3, s1, 32
	srli	a3, a3, 32
	j	.LBB0_6
.LBB0_4:                                #   in Loop: Header=BB0_6 Depth=1
	add	a5, a4, a0
	lw	a5, -8(a5)
	addi	a1, a1, 1
	srliw	s1, a1, 1
	addw	a2, a2, s1
	addw	a2, a2, a5
	addiw	a2, a2, 1
.LBB0_5:                                #   in Loop: Header=BB0_6 Depth=1
	add	a4, a4, a0
	sw	a2, 0(a4)
	beq	a1, a3, .LBB0_2
.LBB0_6:                                # =>This Inner Loop Header: Depth=1
	andi	a5, a1, 1
	slli	a4, a1, 2
	bnez	a5, .LBB0_4
# %bb.7:                                #   in Loop: Header=BB0_6 Depth=1
	srliw	a2, a1, 1
	addiw	a2, a2, 1
	addi	a1, a1, 1
	j	.LBB0_5
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
