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
	blez	a1, .LBB0_6
# %bb.1:
	mv	s4, a1
	mv	s3, a0
	li	s2, 0
	mv	s0, a1
	mv	s1, a0
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
	ld	a0, 0(s1)
	call	strlen@plt
	addw	s2, s2, a0
	addi	s0, s0, -1
	addi	s1, s1, 8
	bnez	s0, .LBB0_2
# %bb.3:
	addiw	a0, s2, 1
	call	malloc@plt
	beqz	a0, .LBB0_8
# %bb.4:
	mv	s2, a0
	sb	zero, 0(a0)
	blez	s4, .LBB0_9
.LBB0_5:                                # =>This Inner Loop Header: Depth=1
	ld	a1, 0(s3)
	mv	a0, s2
	call	strcat@plt
	addi	s4, s4, -1
	addi	s3, s3, 8
	bnez	s4, .LBB0_5
	j	.LBB0_9
.LBB0_6:
	li	a0, 1
	call	malloc@plt
	beqz	a0, .LBB0_8
# %bb.7:
	mv	s2, a0
	sb	zero, 0(a0)
	j	.LBB0_9
.LBB0_8:
	li	s2, 0
.LBB0_9:
	mv	a0, s2
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
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
