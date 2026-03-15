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
	mv	s5, a3
	mv	s2, a2
	mv	s3, a0
	blez	a1, .LBB0_4
# %bb.1:
	mv	s0, a1
	li	s4, 0
	mv	s1, s3
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
	ld	a0, 0(s1)
	call	strlen@plt
	addw	s4, s4, a0
	addi	s0, s0, -1
	addi	s1, s1, 8
	bnez	s0, .LBB0_2
# %bb.3:
	li	s0, 0
	bgtz	s5, .LBB0_5
	j	.LBB0_7
.LBB0_4:
	li	s4, 0
	li	s0, 0
	blez	s5, .LBB0_7
.LBB0_5:
	mv	s1, s2
.LBB0_6:                                # =>This Inner Loop Header: Depth=1
	ld	a0, 0(s1)
	call	strlen@plt
	addw	s0, s0, a0
	addi	s5, s5, -1
	addi	s1, s1, 8
	bnez	s5, .LBB0_6
.LBB0_7:
	blt	s0, s4, .LBB0_9
# %bb.8:
	mv	s2, s3
.LBB0_9:
	blt	s4, s0, .LBB0_11
# %bb.10:
	mv	s3, s2
.LBB0_11:
	mv	a0, s3
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
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
