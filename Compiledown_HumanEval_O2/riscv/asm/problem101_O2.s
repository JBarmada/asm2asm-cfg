	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	addi	sp, sp, -16
	sd	ra, 8(sp)                       # 8-byte Folded Spill
	sd	s0, 0(sp)                       # 8-byte Folded Spill
	mv	s0, a0
	slli	a0, a0, 2
	call	malloc@plt
	li	a1, 2
	sw	s0, 0(a0)
	blt	s0, a1, .LBB0_3
# %bb.1:
	lw	a1, 0(a0)
	addi	a2, a0, 4
	addi	a3, s0, -1
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
	addiw	a1, a1, 2
	sw	a1, 0(a2)
	addi	a3, a3, -1
	addi	a2, a2, 4
	bnez	a3, .LBB0_2
.LBB0_3:
	ld	ra, 8(sp)                       # 8-byte Folded Reload
	ld	s0, 0(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 16
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
