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
	sd	s6, 0(sp)                       # 8-byte Folded Spill
	mv	s2, a0
	call	strlen@plt
	addiw	s4, a0, -2
	blez	s4, .LBB0_6
# %bb.1:
	addi	s1, s4, 1
.LBB0_8:                                # Label of block must be emitted
	auipc	s3, %pcrel_hi(.L.str)
	addi	s3, s3, %pcrel_lo(.LBB0_8)
	li	s5, 1
	j	.LBB0_3
.LBB0_2:                                #   in Loop: Header=BB0_3 Depth=1
	addi	s1, s1, -1
	bge	s5, s1, .LBB0_6
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	add	s0, s2, s1
	lbu	s6, -1(s0)
	li	a2, 11
	mv	a0, s3
	mv	a1, s6
	call	memchr@plt
	addiw	s4, s4, -1
	beqz	a0, .LBB0_2
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=1
	lbu	a1, 0(s0)
	li	a2, 11
	mv	a0, s3
	call	memchr@plt
	bnez	a0, .LBB0_2
# %bb.5:                                #   in Loop: Header=BB0_3 Depth=1
	slli	a0, s4, 32
	srli	a0, a0, 32
	add	a0, a0, s2
	lbu	a1, 0(a0)
	li	a2, 11
	mv	a0, s3
	call	memchr@plt
	bnez	a0, .LBB0_2
	j	.LBB0_7
.LBB0_6:
	li	s6, 0
.LBB0_7:
.LBB0_9:                                # Label of block must be emitted
	auipc	a0, %pcrel_hi(func0.out)
	addi	a0, a0, %pcrel_lo(.LBB0_9)
	sb	s6, 0(a0)
	ld	ra, 56(sp)                      # 8-byte Folded Reload
	ld	s0, 48(sp)                      # 8-byte Folded Reload
	ld	s1, 40(sp)                      # 8-byte Folded Reload
	ld	s2, 32(sp)                      # 8-byte Folded Reload
	ld	s3, 24(sp)                      # 8-byte Folded Reload
	ld	s4, 16(sp)                      # 8-byte Folded Reload
	ld	s5, 8(sp)                       # 8-byte Folded Reload
	ld	s6, 0(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 64
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.type	func0.out,@object               # @func0.out
	.section	.sbss,"aw",@nobits
func0.out:
	.zero	2
	.size	func0.out, 2

	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"AEIOUaeiou"
	.size	.L.str, 11

	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym func0.out
