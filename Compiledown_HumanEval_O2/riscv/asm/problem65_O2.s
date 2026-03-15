	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	addi	sp, sp, -80
	sd	ra, 72(sp)                      # 8-byte Folded Spill
	sd	s0, 64(sp)                      # 8-byte Folded Spill
	sd	s1, 56(sp)                      # 8-byte Folded Spill
	sd	s2, 48(sp)                      # 8-byte Folded Spill
	sd	s3, 40(sp)                      # 8-byte Folded Spill
	sd	s4, 32(sp)                      # 8-byte Folded Spill
	sd	s5, 24(sp)                      # 8-byte Folded Spill
	sd	s6, 16(sp)                      # 8-byte Folded Spill
	sd	s7, 8(sp)                       # 8-byte Folded Spill
	mv	s2, a0
	call	strlen@plt
	sext.w	s4, a0
	blez	s4, .LBB0_6
# %bb.1:
	mv	s3, a0
	li	s7, 0
	li	a0, -1
	srli	s5, a0, 32
	slli	a0, s3, 32
	srli	s0, a0, 32
.LBB0_8:                                # Label of block must be emitted
	auipc	s6, %pcrel_hi(.L.str)
	addi	s6, s6, %pcrel_lo(.LBB0_8)
	mv	s1, s2
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
	lbu	a1, 0(s1)
	li	a2, 11
	mv	a0, s6
	call	memchr@plt
	snez	a0, a0
	addw	s7, s7, a0
	addi	s0, s0, -1
	addi	s1, s1, 1
	bnez	s0, .LBB0_2
# %bb.3:
	blez	s4, .LBB0_7
# %bb.4:
	add	a0, s3, s5
	and	a0, a0, s5
	add	a0, a0, s2
	lbu	a0, 0(a0)
	ori	a0, a0, 32
	li	a1, 121
	bne	a0, a1, .LBB0_7
# %bb.5:
	addiw	s7, s7, 1
	j	.LBB0_7
.LBB0_6:
	li	s7, 0
.LBB0_7:
	mv	a0, s7
	ld	ra, 72(sp)                      # 8-byte Folded Reload
	ld	s0, 64(sp)                      # 8-byte Folded Reload
	ld	s1, 56(sp)                      # 8-byte Folded Reload
	ld	s2, 48(sp)                      # 8-byte Folded Reload
	ld	s3, 40(sp)                      # 8-byte Folded Reload
	ld	s4, 32(sp)                      # 8-byte Folded Reload
	ld	s5, 24(sp)                      # 8-byte Folded Reload
	ld	s6, 16(sp)                      # 8-byte Folded Reload
	ld	s7, 8(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 80
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"aeiouAEIOU"
	.size	.L.str, 11

	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
