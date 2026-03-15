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
	mv	s4, a0
	lbu	a0, 0(a0)
	beqz	a0, .LBB0_4
# %bb.1:
	mv	a0, s4
	call	strlen@plt
	mv	s2, a0
	li	s0, 0
	li	s5, 0
	li	s1, 1
.LBB0_6:                                # Label of block must be emitted
	auipc	s3, %pcrel_hi(.L.str)
	addi	s3, s3, %pcrel_lo(.LBB0_6)
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
	bgeu	s0, s2, .LBB0_5
# %bb.3:                                #   in Loop: Header=BB0_2 Depth=1
	add	a0, s4, s0
	lbu	a1, 0(a0)
	li	a2, 6
	mv	a0, s3
	call	memchr@plt
	add	a1, s4, s1
	lbu	a1, 0(a1)
	snez	a0, a0
	addw	s5, s5, a0
	addi	s0, s0, 2
	addi	s1, s1, 1
	bnez	a1, .LBB0_2
	j	.LBB0_5
.LBB0_4:
	li	s5, 0
.LBB0_5:
	mv	a0, s5
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
	.asciz	"AEIOU"
	.size	.L.str, 6

	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
