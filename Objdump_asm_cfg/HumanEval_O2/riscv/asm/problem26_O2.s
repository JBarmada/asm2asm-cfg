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
	mv	s1, a1
	mv	s0, a0
	li	a0, 256
	call	malloc@plt
	li	a2, 4
	sw	zero, 0(s1)
	li	a1, 0
	bge	s0, a2, .LBB0_4
.LBB0_1:
	sext.w	a2, s0
	li	a3, 1
	bge	a3, a2, .LBB0_3
# %bb.2:
	addiw	a2, a1, 1
	sw	a2, 0(s1)
	sext.w	a1, a1
	slli	a1, a1, 2
	add	a1, a1, a0
	sw	s0, 0(a1)
.LBB0_3:
	ld	ra, 24(sp)                      # 8-byte Folded Reload
	ld	s0, 16(sp)                      # 8-byte Folded Reload
	ld	s1, 8(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 32
	ret
.LBB0_4:
	li	a2, 2
	j	.LBB0_6
.LBB0_5:                                #   in Loop: Header=BB0_6 Depth=1
	addiw	a2, a2, 1
	mulw	a3, a2, a2
	sext.w	a4, s0
	blt	a4, a3, .LBB0_1
.LBB0_6:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_8 Depth 2
	remw	a3, s0, a2
	bnez	a3, .LBB0_5
# %bb.7:                                #   in Loop: Header=BB0_6 Depth=1
	sext.w	a1, a1
	slli	a3, a1, 2
	add	a3, a3, a0
.LBB0_8:                                #   Parent Loop BB0_6 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	divw	s0, s0, a2
	addi	a1, a1, 1
	sw	a2, 0(a3)
	remw	a4, s0, a2
	addi	a3, a3, 4
	beqz	a4, .LBB0_8
# %bb.9:                                #   in Loop: Header=BB0_6 Depth=1
	sw	a1, 0(s1)
	j	.LBB0_5
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
