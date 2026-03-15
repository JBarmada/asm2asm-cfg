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
	blez	a1, .LBB0_7
# %bb.1:
	mv	s5, a1
	mv	s1, a0
	li	s0, 0
.LBB0_9:                                # Label of block must be emitted
	auipc	s4, %pcrel_hi(.L.str)
	addi	s4, s4, %pcrel_lo(.LBB0_9)
	li	s3, 0
	j	.LBB0_3
.LBB0_2:                                #   in Loop: Header=BB0_3 Depth=1
	addi	s5, s5, -1
	addi	s1, s1, 8
	mv	s4, s2
	mv	s0, s3
	beqz	s5, .LBB0_8
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	ld	s2, 0(s1)
	mv	a0, s2
	call	strlen@plt
	sext.w	a0, a0
	blt	a0, s0, .LBB0_5
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=1
	mv	s3, a0
.LBB0_5:                                #   in Loop: Header=BB0_3 Depth=1
	blt	s0, a0, .LBB0_2
# %bb.6:                                #   in Loop: Header=BB0_3 Depth=1
	mv	s2, s4
	j	.LBB0_2
.LBB0_7:
.LBB0_10:                               # Label of block must be emitted
	auipc	s2, %pcrel_hi(.L.str)
	addi	s2, s2, %pcrel_lo(.LBB0_10)
.LBB0_8:
	mv	a0, s2
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
	.zero	1
	.size	.L.str, 1

	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
