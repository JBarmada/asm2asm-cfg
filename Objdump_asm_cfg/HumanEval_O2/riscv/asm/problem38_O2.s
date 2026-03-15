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
	mv	s2, a1
	mv	s1, a0
	srliw	a0, a1, 31
	addw	a0, a0, a1
	slli	a0, a0, 1
	andi	a0, a0, -4
	addi	a0, a0, 4
	call	malloc@plt
	blez	s2, .LBB0_10
# %bb.1:
	li	a3, 0
	addiw	a6, s2, -1
	srliw	a7, a6, 1
	slli	a4, a7, 2
	addi	a4, a4, 4
	mv	a5, s1
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
	flw	ft0, 0(a5)
	add	a2, a0, a3
	fsw	ft0, 0(a2)
	addi	a3, a3, 4
	addi	a5, a5, 8
	bne	a4, a3, .LBB0_2
# %bb.3:
	li	a3, 2
	bgeu	a6, a3, .LBB0_11
.LBB0_4:
	blez	s2, .LBB0_10
# %bb.5:
	li	a1, 0
	j	.LBB0_8
.LBB0_6:                                #   in Loop: Header=BB0_8 Depth=1
	mv	a2, s1
.LBB0_7:                                #   in Loop: Header=BB0_8 Depth=1
	flw	ft0, 0(a2)
	fsw	ft0, 0(s0)
	addi	a1, a1, 1
	addi	s0, s0, 4
	addi	s1, s1, 4
	beq	s2, a1, .LBB0_10
.LBB0_8:                                # =>This Inner Loop Header: Depth=1
	andi	a2, a1, 1
	bnez	a2, .LBB0_6
# %bb.9:                                #   in Loop: Header=BB0_8 Depth=1
	srliw	a2, a1, 1
	slli	a2, a2, 2
	add	a2, a2, a0
	j	.LBB0_7
.LBB0_10:
	ld	ra, 24(sp)                      # 8-byte Folded Reload
	ld	s0, 16(sp)                      # 8-byte Folded Reload
	ld	s1, 8(sp)                       # 8-byte Folded Reload
	ld	s2, 0(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 32
	tail	free@plt
.LBB0_11:
	li	a2, 0
	addi	a6, a0, 4
	mv	a4, a7
	j	.LBB0_13
.LBB0_12:                               #   in Loop: Header=BB0_13 Depth=1
	addiw	a2, a2, 1
	addiw	a4, a4, -1
	bgeu	a2, a7, .LBB0_4
.LBB0_13:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_17 Depth 2
	bgeu	a2, a7, .LBB0_12
# %bb.14:                               #   in Loop: Header=BB0_13 Depth=1
	flw	ft0, 0(a0)
	slli	a3, a4, 32
	srli	a5, a3, 32
	mv	a3, a6
	j	.LBB0_17
.LBB0_15:                               #   in Loop: Header=BB0_17 Depth=2
	fsw	ft1, -4(a3)
	fsw	ft0, 0(a3)
.LBB0_16:                               #   in Loop: Header=BB0_17 Depth=2
	addi	a5, a5, -1
	addi	a3, a3, 4
	beqz	a5, .LBB0_12
.LBB0_17:                               #   Parent Loop BB0_13 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	ft1, 0(a3)
	flt.s	a1, ft1, ft0
	bnez	a1, .LBB0_15
# %bb.18:                               #   in Loop: Header=BB0_17 Depth=2
	fmv.s	ft0, ft1
	j	.LBB0_16
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
