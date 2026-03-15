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
	sd	s3, 24(sp)                      # 8-byte Folded Spill
	sd	s4, 16(sp)                      # 8-byte Folded Spill
	sd	s5, 8(sp)                       # 8-byte Folded Spill
	mv	s5, a1
	mv	s0, a0
	li	a0, -1
	srli	s3, a0, 32
	mv	a0, s0
	call	strlen@plt
	mv	s2, a0
	sext.w	s4, a0
	mv	a0, s5
	call	strlen@plt
	li	a1, 0
	blez	s4, .LBB0_5
# %bb.1:
	and	a3, s2, s3
	li	a5, 1
	mv	a4, s0
	j	.LBB0_3
.LBB0_2:                                #   in Loop: Header=BB0_3 Depth=1
	addi	a3, a3, -1
	addi	a4, a4, 1
	mv	a5, a2
	beqz	a3, .LBB0_6
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	lbu	a2, 0(a4)
	addi	s1, a2, -40
	seqz	s1, s1
	addw	a1, a1, s1
	addi	a2, a2, -41
	seqz	a2, a2
	subw	a1, a1, a2
	li	a2, 0
	bltz	a1, .LBB0_2
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=1
	mv	a2, a5
	j	.LBB0_2
.LBB0_5:
	li	a2, 1
.LBB0_6:
	sext.w	a6, a0
	blez	a6, .LBB0_17
# %bb.7:
	and	a4, a0, s3
	mv	a5, s5
	j	.LBB0_9
.LBB0_8:                                #   in Loop: Header=BB0_9 Depth=1
	addi	a4, a4, -1
	addi	a5, a5, 1
	mv	a2, a3
	beqz	a4, .LBB0_11
.LBB0_9:                                # =>This Inner Loop Header: Depth=1
	lbu	a3, 0(a5)
	addi	s1, a3, -40
	seqz	s1, s1
	addw	a1, a1, s1
	addi	a3, a3, -41
	seqz	a3, a3
	subw	a1, a1, a3
	li	a3, 0
	bltz	a1, .LBB0_8
# %bb.10:                               #   in Loop: Header=BB0_9 Depth=1
	mv	a3, a2
	j	.LBB0_8
.LBB0_11:
	seqz	a1, a1
	snez	a2, a3
	and	a1, a1, a2
	bnez	a1, .LBB0_27
# %bb.12:
	blez	a6, .LBB0_18
# %bb.13:
	li	a1, 0
	and	a2, a0, s3
	li	a3, 1
	j	.LBB0_15
.LBB0_14:                               #   in Loop: Header=BB0_15 Depth=1
	addi	a2, a2, -1
	addi	s5, s5, 1
	mv	a3, a0
	beqz	a2, .LBB0_19
.LBB0_15:                               # =>This Inner Loop Header: Depth=1
	lbu	a0, 0(s5)
	addi	a4, a0, -40
	seqz	a4, a4
	addw	a1, a1, a4
	addi	a0, a0, -41
	seqz	a0, a0
	subw	a1, a1, a0
	li	a0, 0
	bltz	a1, .LBB0_14
# %bb.16:                               #   in Loop: Header=BB0_15 Depth=1
	mv	a0, a3
	j	.LBB0_14
.LBB0_17:
	seqz	a0, a1
	snez	a1, a2
	and	a0, a0, a1
	bnez	a0, .LBB0_27
.LBB0_18:
	li	a1, 0
	li	a0, 1
.LBB0_19:
	blez	s4, .LBB0_24
# %bb.20:
	and	a2, s2, s3
	j	.LBB0_22
.LBB0_21:                               #   in Loop: Header=BB0_22 Depth=1
	addi	a2, a2, -1
	addi	s0, s0, 1
	mv	a0, a3
	beqz	a2, .LBB0_25
.LBB0_22:                               # =>This Inner Loop Header: Depth=1
	lbu	a3, 0(s0)
	addi	a4, a3, -40
	seqz	a4, a4
	addw	a1, a1, a4
	addi	a3, a3, -41
	seqz	a3, a3
	subw	a1, a1, a3
	li	a3, 0
	bltz	a1, .LBB0_21
# %bb.23:                               #   in Loop: Header=BB0_22 Depth=1
	mv	a3, a0
	j	.LBB0_21
.LBB0_24:
	mv	a3, a0
.LBB0_25:
	seqz	a0, a1
	snez	a1, a3
	and	a0, a0, a1
	bnez	a0, .LBB0_27
# %bb.26:
.LBB0_29:                               # Label of block must be emitted
	auipc	a0, %pcrel_hi(.L.str.1)
	addi	a0, a0, %pcrel_lo(.LBB0_29)
	j	.LBB0_28
.LBB0_27:
.LBB0_30:                               # Label of block must be emitted
	auipc	a0, %pcrel_hi(.L.str)
	addi	a0, a0, %pcrel_lo(.LBB0_30)
.LBB0_28:
	ld	ra, 56(sp)                      # 8-byte Folded Reload
	ld	s0, 48(sp)                      # 8-byte Folded Reload
	ld	s1, 40(sp)                      # 8-byte Folded Reload
	ld	s2, 32(sp)                      # 8-byte Folded Reload
	ld	s3, 24(sp)                      # 8-byte Folded Reload
	ld	s4, 16(sp)                      # 8-byte Folded Reload
	ld	s5, 8(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 64
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Yes"
	.size	.L.str, 4

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"No"
	.size	.L.str.1, 3

	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
