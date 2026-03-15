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
	beqz	a0, .LBB0_7
# %bb.1:
	lbu	a1, 0(s0)
	addi	a2, a1, -40
	seqz	a2, a2
	addi	a1, a1, -41
	seqz	a1, a1
	sub	a1, a2, a1
	bltz	a1, .LBB0_8
# %bb.2:
	li	a3, 1
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	mv	a2, a3
	beq	a0, a3, .LBB0_6
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=1
	add	a3, s0, a2
	lbu	a3, 0(a3)
	addi	a4, a3, -40
	seqz	a4, a4
	addw	a1, a1, a4
	addi	a3, a3, -41
	seqz	a3, a3
	subw	a1, a1, a3
	addi	a3, a2, 1
	bgez	a1, .LBB0_3
# %bb.5:
	li	a1, 1
.LBB0_6:
	sltu	a0, a2, a0
	xori	a0, a0, 1
	j	.LBB0_9
.LBB0_7:
	li	a1, 0
	li	a0, 1
	j	.LBB0_9
.LBB0_8:
	li	a0, 0
	li	a1, 1
.LBB0_9:
	sext.w	a1, a1
	seqz	a1, a1
	and	a0, a0, a1
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
