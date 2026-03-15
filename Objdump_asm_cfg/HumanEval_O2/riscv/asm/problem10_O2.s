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
	blez	a1, .LBB0_6
# %bb.1:
	mv	s0, a1
	mv	s1, a0
	slli	a0, a1, 2
	call	malloc@plt
	beqz	a0, .LBB0_7
# %bb.2:
	lw	a2, 0(s1)
	li	a1, 0
	j	.LBB0_4
.LBB0_3:                                #   in Loop: Header=BB0_4 Depth=1
	add	a2, a0, a1
	sw	a3, 0(a2)
	addi	s0, s0, -1
	addi	a1, a1, 4
	mv	a2, a3
	beqz	s0, .LBB0_7
.LBB0_4:                                # =>This Inner Loop Header: Depth=1
	add	a3, s1, a1
	lw	a3, 0(a3)
	blt	a2, a3, .LBB0_3
# %bb.5:                                #   in Loop: Header=BB0_4 Depth=1
	mv	a3, a2
	j	.LBB0_3
.LBB0_6:
	li	a0, 0
.LBB0_7:
	ld	ra, 24(sp)                      # 8-byte Folded Reload
	ld	s0, 16(sp)                      # 8-byte Folded Reload
	ld	s1, 8(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 32
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
