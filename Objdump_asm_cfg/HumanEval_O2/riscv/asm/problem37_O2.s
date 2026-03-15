	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	blez	a0, .LBB0_6
# %bb.1:
	li	t5, 0
	li	a1, 0
	lui	a2, 762601
	addiw	a6, a2, -1117
	lui	a2, 95325
	addiw	a7, a2, 372
	lui	a2, 806597
	addiw	t0, a2, -315
	lui	a2, 80660
	addiw	t1, a2, -1261
	lui	a2, 838861
	addiw	a2, a2, -819
	slli	a4, a2, 32
	li	t2, 10
	li	t4, 9
	j	.LBB0_3
.LBB0_2:                                #   in Loop: Header=BB0_3 Depth=1
	addiw	t5, t5, 1
	bge	t5, a0, .LBB0_7
.LBB0_3:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_5 Depth 2
	mulw	a2, t5, a6
	sltu	t3, a7, a2
	mulw	a2, t5, t0
	sltu	a2, t1, a2
	and	t3, t3, a2
	seqz	a2, t5
	or	a2, t3, a2
	bnez	a2, .LBB0_2
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=1
	mv	a2, t5
.LBB0_5:                                #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	mv	a3, a2
	slli	a2, a2, 32
	mulhu	a2, a2, a4
	srli	a2, a2, 35
	mulw	a5, a2, t2
	subw	a5, a3, a5
	addi	a5, a5, -7
	seqz	a5, a5
	addw	a1, a1, a5
	bltu	t4, a3, .LBB0_5
	j	.LBB0_2
.LBB0_6:
	li	a1, 0
.LBB0_7:
	mv	a0, a1
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
