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
	sd	s4, 0(sp)                       # 8-byte Folded Spill
	blez	a0, .LBB0_7
# %bb.1:
	mv	s2, a0
	li	s1, 2
	li	a0, 1
.LBB0_11:                               # Label of block must be emitted
	auipc	s3, %pcrel_hi(.L.str)
	addi	s3, s3, %pcrel_lo(.LBB0_11)
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
	mv	s0, a0
	li	a0, 0
	li	a1, 0
	mv	a2, s3
	mv	a3, s0
	call	snprintf@plt
	addw	s1, s1, a0
	addiw	a0, s0, 1
	blt	s0, s2, .LBB0_2
# %bb.3:
	mv	a0, s1
	call	malloc@plt
	beqz	a0, .LBB0_9
# %bb.4:
	mv	s3, a0
	sb	zero, 1(a0)
	li	a0, 48
	sb	a0, 0(s3)
	blez	s2, .LBB0_10
# %bb.5:
	addi	s0, s3, 1
	li	a0, 1
.LBB0_12:                               # Label of block must be emitted
	auipc	s4, %pcrel_hi(.L.str)
	addi	s4, s4, %pcrel_lo(.LBB0_12)
.LBB0_6:                                # =>This Inner Loop Header: Depth=1
	mv	s1, a0
	mv	a0, s0
	mv	a1, s4
	mv	a2, s1
	call	sprintf@plt
	add	s0, s0, a0
	addiw	a0, s1, 1
	blt	s1, s2, .LBB0_6
	j	.LBB0_10
.LBB0_7:
	li	a0, 2
	call	malloc@plt
	beqz	a0, .LBB0_9
# %bb.8:
	mv	s3, a0
	sb	zero, 1(a0)
	li	a0, 48
	sb	a0, 0(s3)
	j	.LBB0_10
.LBB0_9:
	li	s3, 0
.LBB0_10:
	mv	a0, s3
	ld	ra, 40(sp)                      # 8-byte Folded Reload
	ld	s0, 32(sp)                      # 8-byte Folded Reload
	ld	s1, 24(sp)                      # 8-byte Folded Reload
	ld	s2, 16(sp)                      # 8-byte Folded Reload
	ld	s3, 8(sp)                       # 8-byte Folded Reload
	ld	s4, 0(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 48
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	" %d"
	.size	.L.str, 4

	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
