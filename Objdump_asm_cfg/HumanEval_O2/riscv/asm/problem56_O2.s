	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	addi	sp, sp, -2032
	sd	ra, 2024(sp)                    # 8-byte Folded Spill
	sd	s0, 2016(sp)                    # 8-byte Folded Spill
	sd	s1, 2008(sp)                    # 8-byte Folded Spill
	addi	sp, sp, -2000
	mv	s0, a0
	lui	a0, 1
	addiw	a2, a0, -96
	addi	a0, sp, 8
	addi	s1, sp, 8
	li	a1, 0
	call	memset@plt
	li	a0, 1
	li	a1, 2
	sw	a0, 12(sp)
	blt	s0, a1, .LBB0_3
# %bb.1:
	addiw	a1, s0, 1
	slli	a1, a1, 32
	srli	a2, a1, 32
	addi	a1, sp, 16
	addi	a2, a2, -2
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
	lw	a3, -8(a1)
	addw	a0, a0, a3
	sw	a0, 0(a1)
	addi	a2, a2, -1
	addi	a1, a1, 4
	bnez	a2, .LBB0_2
.LBB0_3:
	slli	a0, s0, 2
	add	a0, a0, s1
	lw	a0, 0(a0)
	addi	sp, sp, 2000
	ld	ra, 2024(sp)                    # 8-byte Folded Reload
	ld	s0, 2016(sp)                    # 8-byte Folded Reload
	ld	s1, 2008(sp)                    # 8-byte Folded Reload
	addi	sp, sp, 2032
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
