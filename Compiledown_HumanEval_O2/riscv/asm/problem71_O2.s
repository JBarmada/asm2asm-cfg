	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	li	a3, 2
	addiw	a7, a1, -1
	blt	a1, a3, .LBB0_8
# %bb.1:
	li	t0, 0
	slli	a3, a7, 32
	srli	a6, a3, 32
	addi	t1, a0, 4
	li	t2, 1
	j	.LBB0_3
.LBB0_2:                                #   in Loop: Header=BB0_3 Depth=1
	addi	t2, t2, 1
	addi	t1, t1, 4
	beq	t0, a6, .LBB0_8
.LBB0_3:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_6 Depth 2
	mv	a3, t0
	addi	t0, t0, 1
	bgeu	t0, a1, .LBB0_2
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=1
	slli	a3, a3, 2
	add	t3, a0, a3
	mv	a5, a1
	mv	a4, t1
	j	.LBB0_6
.LBB0_5:                                #   in Loop: Header=BB0_6 Depth=2
	addi	a5, a5, -1
	addi	a4, a4, 4
	beq	t2, a5, .LBB0_2
.LBB0_6:                                #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lw	t4, 0(t3)
	lw	a3, 0(a4)
	bge	a3, t4, .LBB0_5
# %bb.7:                                #   in Loop: Header=BB0_6 Depth=2
	sw	a3, 0(t3)
	sw	t4, 0(a4)
	j	.LBB0_5
.LBB0_8:
	blez	a1, .LBB0_13
# %bb.9:
	li	a3, 0
	li	a6, -1
	mv	a4, a0
	j	.LBB0_11
.LBB0_10:                               #   in Loop: Header=BB0_11 Depth=1
	addi	a4, a4, 4
	mv	a3, t0
	bge	a6, a7, .LBB0_13
.LBB0_11:                               # =>This Inner Loop Header: Depth=1
	addi	a6, a6, 1
	slli	a5, a7, 32
	srli	t1, a5, 32
	lw	a5, 0(a4)
	addiw	t0, a3, 1
	slli	a1, a3, 2
	add	a1, a1, a2
	sw	a5, 0(a1)
	beq	a6, t1, .LBB0_10
# %bb.12:                               #   in Loop: Header=BB0_11 Depth=1
	slli	a1, a7, 2
	addiw	a7, a7, -1
	add	a1, a1, a0
	lw	a1, 0(a1)
	slli	a5, t0, 2
	addiw	t0, a3, 2
	add	a3, a2, a5
	sw	a1, 0(a3)
	j	.LBB0_10
.LBB0_13:
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
