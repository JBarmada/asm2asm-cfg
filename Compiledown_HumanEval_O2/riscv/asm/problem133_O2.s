	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	addi	sp, sp, -16
	sd	ra, 8(sp)                       # 8-byte Folded Spill
	sd	s0, 0(sp)                       # 8-byte Folded Spill
	mv	s0, a0
	call	strlen@plt
	beqz	a0, .LBB0_11
# %bb.1:
	lbu	a1, 0(s0)
	addi	a2, a1, -91
	seqz	a2, a2
	addi	a1, a1, -93
	seqz	a1, a1
	sub	a1, a2, a1
	bgtz	a1, .LBB0_3
# %bb.2:
	li	a1, 0
.LBB0_3:
	li	a4, 1
	mv	a3, a1
	j	.LBB0_5
.LBB0_4:                                #   in Loop: Header=BB0_5 Depth=1
	addiw	a5, a1, -2
	addi	a4, a2, 1
	bge	a5, a3, .LBB0_10
.LBB0_5:                                # =>This Inner Loop Header: Depth=1
	mv	a2, a4
	beq	a0, a4, .LBB0_10
# %bb.6:                                #   in Loop: Header=BB0_5 Depth=1
	add	a4, s0, a2
	lbu	a4, 0(a4)
	addi	a5, a4, -91
	seqz	a5, a5
	addw	a3, a3, a5
	addi	a4, a4, -93
	seqz	a4, a4
	subw	a3, a3, a4
	bgtz	a3, .LBB0_8
# %bb.7:                                #   in Loop: Header=BB0_5 Depth=1
	li	a3, 0
.LBB0_8:                                #   in Loop: Header=BB0_5 Depth=1
	sext.w	a4, a1
	mv	a1, a3
	blt	a4, a3, .LBB0_4
# %bb.9:                                #   in Loop: Header=BB0_5 Depth=1
	mv	a1, a4
	j	.LBB0_4
.LBB0_10:
	sltu	a0, a2, a0
.LBB0_11:
	ld	ra, 8(sp)                       # 8-byte Folded Reload
	ld	s0, 0(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 16
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
