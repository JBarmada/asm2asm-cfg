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
	mv	s0, a1
	mv	s2, a0
	addiw	a0, a1, 1
	li	a1, 4
	call	calloc@plt
	blez	s0, .LBB0_5
# %bb.1:
	li	a1, -1
	j	.LBB0_3
.LBB0_2:                                #   in Loop: Header=BB0_3 Depth=1
	addi	s0, s0, -1
	addi	s2, s2, 4
	mv	a1, s1
	beqz	s0, .LBB0_6
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	lw	s1, 0(s2)
	slli	a2, s1, 2
	add	a2, a2, a0
	lw	a3, 0(a2)
	addiw	a3, a3, 1
	slt	a4, a3, s1
	xori	a4, a4, 1
	slt	a5, a1, s1
	and	a4, a4, a5
	sw	a3, 0(a2)
	bnez	a4, .LBB0_2
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=1
	mv	s1, a1
	j	.LBB0_2
.LBB0_5:
	li	s1, -1
.LBB0_6:
	call	free@plt
	mv	a0, s1
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
