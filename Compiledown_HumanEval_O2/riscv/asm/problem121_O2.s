	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	li	a4, 2
	blt	a1, a4, .LBB0_9
# %bb.1:
	li	t1, 0
	addiw	a7, a1, -1
	addi	a6, a0, 4
	mv	t0, a7
	j	.LBB0_3
.LBB0_2:                                #   in Loop: Header=BB0_3 Depth=1
	addiw	t1, t1, 1
	addiw	t0, t0, -1
	bge	t1, a7, .LBB0_9
.LBB0_3:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_7 Depth 2
	not	a4, t1
	addw	a4, a4, a1
	blez	a4, .LBB0_2
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=1
	lw	t2, 0(a0)
	slli	a4, t0, 32
	srli	a5, a4, 32
	mv	a4, a6
	j	.LBB0_7
.LBB0_5:                                #   in Loop: Header=BB0_7 Depth=2
	sw	t3, -4(a4)
	sw	t2, 0(a4)
.LBB0_6:                                #   in Loop: Header=BB0_7 Depth=2
	addi	a5, a5, -1
	addi	a4, a4, 4
	beqz	a5, .LBB0_2
.LBB0_7:                                #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lw	t3, 0(a4)
	blt	t3, t2, .LBB0_5
# %bb.8:                                #   in Loop: Header=BB0_7 Depth=2
	mv	t2, t3
	j	.LBB0_6
.LBB0_9:
	blez	a2, .LBB0_12
# %bb.10:
	subw	a1, a1, a2
	slli	a1, a1, 2
	add	a0, a0, a1
.LBB0_11:                               # =>This Inner Loop Header: Depth=1
	lw	a1, 0(a0)
	sw	a1, 0(a3)
	addi	a0, a0, 4
	addi	a2, a2, -1
	addi	a3, a3, 4
	bnez	a2, .LBB0_11
.LBB0_12:
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
