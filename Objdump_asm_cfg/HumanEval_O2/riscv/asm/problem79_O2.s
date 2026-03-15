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
	mv	s2, a0
	call	strlen@plt
	beqz	a0, .LBB0_3
# %bb.1:
	mv	s1, a0
	li	s0, 0
.LBB0_5:                                # Label of block must be emitted
	auipc	s3, %pcrel_hi(.L.str)
	addi	s3, s3, %pcrel_lo(.LBB0_5)
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
	lbu	a1, 0(s2)
	li	a2, 7
	mv	a0, s3
	call	memchr@plt
	snez	a0, a0
	addw	s0, s0, a0
	addi	s1, s1, -1
	addi	s2, s2, 1
	bnez	s1, .LBB0_2
	j	.LBB0_4
.LBB0_3:
	li	s0, 0
.LBB0_4:
	mv	a0, s0
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
	.asciz	"2357BD"
	.size	.L.str, 7

	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
