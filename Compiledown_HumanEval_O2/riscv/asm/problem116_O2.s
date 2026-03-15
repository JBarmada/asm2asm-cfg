	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	blez	a1, .LBB0_9
# %bb.1:
	li	t1, 0
	li	t0, 0
	addiw	a6, a3, -1
	slli	a4, a2, 32
	srli	a7, a4, 32
	j	.LBB0_3
.LBB0_2:                                #   in Loop: Header=BB0_3 Depth=1
	addi	t1, t1, 1
	beq	t1, a1, .LBB0_8
.LBB0_3:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_5 Depth 2
	blez	a2, .LBB0_2
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=1
	slli	a4, t1, 3
	add	a4, a4, a0
	ld	t3, 0(a4)
	li	t2, 0
	mv	a5, a7
.LBB0_5:                                #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lw	a4, 0(t3)
	addw	t2, a4, t2
	addi	a5, a5, -1
	addi	t3, t3, 4
	bnez	a5, .LBB0_5
# %bb.6:                                #   in Loop: Header=BB0_3 Depth=1
	blez	t2, .LBB0_2
# %bb.7:                                #   in Loop: Header=BB0_3 Depth=1
	addw	a4, a6, t2
	divw	a4, a4, a3
	addw	t0, a4, t0
	j	.LBB0_2
.LBB0_8:
	mv	a0, t0
	ret
.LBB0_9:
	li	a0, 0
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
