	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	addi	sp, sp, -48
	sd	ra, 40(sp)                      # 8-byte Folded Spill
	sd	s0, 32(sp)                      # 8-byte Folded Spill
	sd	s1, 24(sp)                      # 8-byte Folded Spill
	sd	s2, 16(sp)                      # 8-byte Folded Spill
	sd	s3, 8(sp)                       # 8-byte Folded Spill
	mv	s0, a0
	call	strlen@plt
	mv	s1, a0
	sext.w	a0, a0
	li	a1, 5
.LBB0_12:                               # Label of block must be emitted
	auipc	s2, %pcrel_hi(.L.str)
	addi	s2, s2, %pcrel_lo(.LBB0_12)
	blt	a0, a1, .LBB0_11
# %bb.1:
	lbu	a0, 0(s0)
	li	a1, 65
	bltu	a0, a1, .LBB0_11
# %bb.2:
	addiw	a1, a0, -91
	andi	a1, a1, 255
	sltiu	a1, a1, 6
	sltiu	a0, a0, 123
	xori	a0, a0, 1
	or	a0, a0, a1
	bnez	a0, .LBB0_11
# %bb.3:
	slli	a0, s1, 32
	srli	a0, a0, 32
	add	a0, a0, s0
	addi	s3, a0, -4
.LBB0_13:                               # Label of block must be emitted
	auipc	a1, %pcrel_hi(.L.str.1)
	addi	a1, a1, %pcrel_lo(.LBB0_13)
	mv	a0, s3
	call	strcmp@plt
	beqz	a0, .LBB0_6
# %bb.4:
.LBB0_14:                               # Label of block must be emitted
	auipc	a1, %pcrel_hi(.L.str.2)
	addi	a1, a1, %pcrel_lo(.LBB0_14)
	mv	a0, s3
	call	strcmp@plt
	beqz	a0, .LBB0_6
# %bb.5:
.LBB0_15:                               # Label of block must be emitted
	auipc	a1, %pcrel_hi(.L.str.3)
	addi	a1, a1, %pcrel_lo(.LBB0_15)
	mv	a0, s3
	call	strcmp@plt
	bnez	a0, .LBB0_11
.LBB0_6:
	li	a1, 0
	li	a0, 0
	li	a2, -1
	srli	a2, a2, 32
	and	a2, a2, s1
.LBB0_7:                                # =>This Inner Loop Header: Depth=1
	lbu	a3, 0(s0)
	addiw	a4, a3, -48
	andi	a4, a4, 255
	sltiu	a4, a4, 10
	addw	a1, a1, a4
	addi	a3, a3, -46
	seqz	a3, a3
	addw	a0, a0, a3
	addi	a2, a2, -1
	addi	s0, s0, 1
	bnez	a2, .LBB0_7
# %bb.8:
	sltiu	a1, a1, 4
	xori	a1, a1, 1
	addi	a0, a0, -1
	snez	a0, a0
	or	a0, a0, a1
	bnez	a0, .LBB0_10
# %bb.9:
.LBB0_16:                               # Label of block must be emitted
	auipc	s2, %pcrel_hi(.L.str.4)
	addi	s2, s2, %pcrel_lo(.LBB0_16)
	j	.LBB0_11
.LBB0_10:
.LBB0_17:                               # Label of block must be emitted
	auipc	s2, %pcrel_hi(.L.str)
	addi	s2, s2, %pcrel_lo(.LBB0_17)
.LBB0_11:
	mv	a0, s2
	ld	ra, 40(sp)                      # 8-byte Folded Reload
	ld	s0, 32(sp)                      # 8-byte Folded Reload
	ld	s1, 24(sp)                      # 8-byte Folded Reload
	ld	s2, 16(sp)                      # 8-byte Folded Reload
	ld	s3, 8(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 48
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"No"
	.size	.L.str, 3

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	".txt"
	.size	.L.str.1, 5

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	".exe"
	.size	.L.str.2, 5

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	".dll"
	.size	.L.str.3, 5

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"Yes"
	.size	.L.str.4, 4

	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
