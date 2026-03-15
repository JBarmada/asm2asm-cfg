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
	mv	s0, a0
	call	strlen@plt
	li	a1, 10
	bne	a0, a1, .LBB0_11
# %bb.1:
	lbu	a0, 0(s0)
	addiw	a1, a0, -58
	andi	a1, a1, 255
	li	a2, 246
	bltu	a1, a2, .LBB0_11
# %bb.2:
	lbu	a1, 1(s0)
	addiw	a3, a1, -58
	andi	a3, a3, 255
	bltu	a3, a2, .LBB0_11
# %bb.3:
	lbu	a2, 2(s0)
	li	a3, 45
	bne	a2, a3, .LBB0_11
# %bb.4:
	lbu	a2, 3(s0)
	addiw	a3, a2, -58
	andi	a3, a3, 255
	li	a4, 246
	bltu	a3, a4, .LBB0_11
# %bb.5:
	lbu	a3, 4(s0)
	addiw	a5, a3, -58
	andi	a5, a5, 255
	bltu	a5, a4, .LBB0_11
# %bb.6:
	lbu	a4, 5(s0)
	li	a5, 45
	bne	a4, a5, .LBB0_11
# %bb.7:
	lb	a4, 6(s0)
	addiw	a4, a4, -58
	andi	a5, a4, 255
	li	a4, 246
	bltu	a5, a4, .LBB0_11
# %bb.8:
	lb	a5, 7(s0)
	addiw	a5, a5, -58
	andi	a5, a5, 255
	bltu	a5, a4, .LBB0_11
# %bb.9:
	lb	a4, 8(s0)
	addiw	a4, a4, -58
	andi	a5, a4, 255
	li	a4, 246
	bltu	a5, a4, .LBB0_11
# %bb.10:
	lb	a5, 9(s0)
	addiw	a5, a5, -58
	andi	a5, a5, 255
	bgeu	a5, a4, .LBB0_13
.LBB0_11:
	li	a0, 0
.LBB0_12:
	ld	ra, 24(sp)                      # 8-byte Folded Reload
	ld	s0, 16(sp)                      # 8-byte Folded Reload
	addi	sp, sp, 32
	ret
.LBB0_13:
	sb	a0, 13(sp)
	sb	a1, 14(sp)
	sb	zero, 15(sp)
	sb	a2, 10(sp)
	sb	a3, 11(sp)
	sb	zero, 12(sp)
	addi	a0, sp, 13
	li	a2, 10
	li	a1, 0
	call	strtol@plt
	mv	s0, a0
	addi	a0, sp, 10
	li	a2, 10
	li	a1, 0
	call	strtol@plt
	mv	a1, a0
	addiw	a0, s0, -13
	sltiu	a0, a0, -12
	addiw	a2, a1, -32
	sltiu	a2, a2, -31
	or	a2, a2, a0
	li	a0, 0
	bnez	a2, .LBB0_12
# %bb.14:
	sext.w	a1, a1
	andi	a0, s0, -3
	sext.w	a0, a0
	addi	a2, a0, -4
	seqz	a2, a2
	addi	a0, a0, -9
	seqz	a0, a0
	or	a0, a0, a2
	addi	a2, a1, -31
	seqz	a2, a2
	and	a2, a2, a0
	li	a0, 0
	bnez	a2, .LBB0_12
# %bb.15:
	sext.w	a0, s0
	addi	a0, a0, -2
	snez	a0, a0
	sltiu	a1, a1, 30
	or	a0, a0, a1
	j	.LBB0_12
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
