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
	mv	s3, a0
	lbu	s0, 0(a0)
	beqz	s0, .LBB0_5
# %bb.1:
	addi	s1, s3, 1
.LBB0_6:                                # Label of block must be emitted
	auipc	s2, %pcrel_hi(.L.str)
	addi	s2, s2, %pcrel_lo(.LBB0_6)
	j	.LBB0_3
.LBB0_2:                                #   in Loop: Header=BB0_3 Depth=1
	lbu	s0, 0(s1)
	addi	s1, s1, 1
	beqz	s0, .LBB0_5
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	andi	a1, s0, 255
	li	a2, 11
	mv	a0, s2
	call	memchr@plt
	bnez	a0, .LBB0_2
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=1
	addi	a0, s3, 1
	sb	s0, 0(s3)
	mv	s3, a0
	j	.LBB0_2
.LBB0_5:
	sb	zero, 0(s3)
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
	.asciz	"AEIOUaeiou"
	.size	.L.str, 11

	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
