	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	addi	sp, sp, -32
	sd	ra, 24(sp)                      # 8-byte Folded Spill
	sd	s0, 16(sp)                      # 8-byte Folded Spill
	sd	s1, 8(sp)                       # 8-byte Folded Spill
	sd	s2, 0(sp)                       # 8-byte Folded Spill
	mv	s0, a2
	mv	s1, a1
	mv	s2, a0
	bgtz	a1, .LBB0_2
# %bb.1:
	li	a0, 0
	j	.LBB0_3
.LBB0_2:
	slliw	a0, s1, 1
	addiw	a0, a0, -1
.LBB0_3:
	sw	a0, 0(a3)
	slli	a0, a0, 2
	call	malloc@plt
	blez	s1, .LBB0_7
# %bb.4:
	lw	a1, 0(s2)
	li	a2, 1
	sw	a1, 0(a0)
	beq	s1, a2, .LBB0_7
# %bb.5:
	slli	a1, s1, 32
	srli	a2, a1, 32
	addi	a1, s2, 4
	addi	a2, a2, -1
	addi	a3, a0, 8
.LBB0_6:                                # =>This Inner Loop Header: Depth=1
	sw	s0, -4(a3)
	lw	a4, 0(a1)
	sw	a4, 0(a3)
	addi	a1, a1, 4
	addi	a2, a2, -1
	addi	a3, a3, 8
	bnez	a2, .LBB0_6
.LBB0_7:
	ld	ra, 24(sp)                      # 8-byte Folded Reload
	ld	s0, 16(sp)                      # 8-byte Folded Reload
	ld	s1, 8(sp)                       # 8-byte Folded Reload
	ld	s2, 0(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 32
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
