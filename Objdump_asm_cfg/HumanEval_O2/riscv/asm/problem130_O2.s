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
	mv	s2, a2
	blez	a1, .LBB0_25
# %bb.1:
	li	a7, 0
	li	a6, 1
                                        # implicit-def: $x5
                                        # implicit-def: $x6
	j	.LBB0_3
.LBB0_2:                                #   in Loop: Header=BB0_3 Depth=1
	addi	a7, a7, 1
	beq	a7, a1, .LBB0_9
.LBB0_3:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_5 Depth 2
	slli	a2, a7, 3
	add	a2, a2, a0
	ld	s0, 0(a2)
	li	s1, 0
	j	.LBB0_5
.LBB0_4:                                #   in Loop: Header=BB0_5 Depth=2
	sext.w	t1, a5
	sext.w	t0, a4
	addi	s1, s1, 1
	addi	s0, s0, 4
	beq	a1, s1, .LBB0_2
.LBB0_5:                                #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lw	a2, 0(s0)
	mv	a5, a7
	beq	a2, a6, .LBB0_7
# %bb.6:                                #   in Loop: Header=BB0_5 Depth=2
	mv	a5, t1
.LBB0_7:                                #   in Loop: Header=BB0_5 Depth=2
	mv	a4, s1
	beq	a2, a6, .LBB0_4
# %bb.8:                                #   in Loop: Header=BB0_5 Depth=2
	mv	a4, t0
	j	.LBB0_4
.LBB0_9:
	mulw	s1, a1, a1
	slli	a5, t0, 2
	blez	t1, .LBB0_13
# %bb.10:
	addiw	a2, t1, -1
	slli	a2, a2, 32
	srli	a2, a2, 29
	add	a2, a2, a0
	ld	a2, 0(a2)
	add	a2, a2, a5
	lw	a2, 0(a2)
	blt	a2, s1, .LBB0_12
# %bb.11:
	mv	a2, s1
.LBB0_12:
	mv	s1, a2
.LBB0_13:
	addiw	a1, a1, -1
	bge	t1, a1, .LBB0_17
# %bb.14:
	addiw	a2, t1, 1
	slli	a2, a2, 3
	add	a2, a2, a0
	ld	a2, 0(a2)
	add	a2, a2, a5
	lw	a2, 0(a2)
	blt	a2, s1, .LBB0_16
# %bb.15:
	mv	a2, s1
.LBB0_16:
	mv	s1, a2
.LBB0_17:
	slli	a4, t1, 3
	blez	t0, .LBB0_21
# %bb.18:
	add	a2, a0, a4
	ld	a2, 0(a2)
	addiw	a5, t0, -1
	slli	a5, a5, 32
	srli	a5, a5, 30
	add	a2, a2, a5
	lw	a2, 0(a2)
	blt	a2, s1, .LBB0_20
# %bb.19:
	mv	a2, s1
.LBB0_20:
	mv	s1, a2
.LBB0_21:
	bge	t0, a1, .LBB0_26
# %bb.22:
	add	a0, a0, a4
	ld	a0, 0(a0)
	addiw	a1, t0, 1
	slli	a1, a1, 2
	add	a0, a0, a1
	lw	a0, 0(a0)
	blt	a0, s1, .LBB0_24
# %bb.23:
	mv	a0, s1
.LBB0_24:
	mv	s1, a0
	j	.LBB0_26
.LBB0_25:
	mulw	s1, a1, a1
.LBB0_26:
	sw	s2, 0(a3)
	slli	a0, s2, 2
	call	malloc@plt
	blez	s2, .LBB0_31
# %bb.27:
	li	a1, 0
	mv	a2, a0
	j	.LBB0_29
.LBB0_28:                               #   in Loop: Header=BB0_29 Depth=1
	sw	a3, 0(a2)
	addi	a1, a1, 1
	addi	a2, a2, 4
	beq	s2, a1, .LBB0_31
.LBB0_29:                               # =>This Inner Loop Header: Depth=1
	andi	a4, a1, 1
	li	a3, 1
	beqz	a4, .LBB0_28
# %bb.30:                               #   in Loop: Header=BB0_29 Depth=1
	mv	a3, s1
	j	.LBB0_28
.LBB0_31:
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
