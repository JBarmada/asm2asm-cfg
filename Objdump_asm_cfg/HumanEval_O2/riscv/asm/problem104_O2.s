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
	bge	a1, a0, .LBB0_2
# %bb.1:
.LBB0_5:                                # Label of block must be emitted
	auipc	a0, %pcrel_hi(.L.str)
	addi	a0, a0, %pcrel_lo(.LBB0_5)
	j	.LBB0_4
.LBB0_2:
	addw	s0, a1, a0
	li	a0, 33
	call	malloc@plt
	sb	zero, 0(a0)
	addi	a1, a0, 32
	sb	zero, 32(a0)
	li	a2, 3
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	mv	a3, s0
	srliw	a0, s0, 31
	addw	a0, a0, s0
	sraiw	s0, a0, 1
	srliw	a0, a0, 31
	addw	a0, a0, s0
	andi	a0, a0, 254
	subw	a0, s0, a0
	addiw	a4, a0, 48
	addi	a0, a1, -1
	sb	a4, -1(a1)
	mv	a1, a0
	blt	a2, a3, .LBB0_3
.LBB0_4:
	ld	ra, 8(sp)                       # 8-byte Folded Reload
	ld	s0, 0(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 16
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"-1"
	.size	.L.str, 3

	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
