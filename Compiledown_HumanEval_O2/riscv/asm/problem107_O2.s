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
	blez	s0, .LBB0_5
# %bb.1:
	li	a1, 0
	addiw	a2, s0, 1
	slli	a2, a2, 32
	srli	a6, a2, 32
	li	a3, 1
	mv	a4, a0
	li	s0, 1
	j	.LBB0_3
.LBB0_2:                                #   in Loop: Header=BB0_3 Depth=1
	sw	a5, 0(a4)
	addi	a3, a3, 1
	addi	a4, a4, 4
	beq	a6, a3, .LBB0_5
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	mulw	s0, s0, a3
	andi	a2, a3, 1
	addw	a1, a1, a3
	mv	a5, s0
	beqz	a2, .LBB0_2
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=1
	mv	a5, a1
	j	.LBB0_2
.LBB0_5:
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
