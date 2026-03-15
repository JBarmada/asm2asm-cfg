	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	blez	a1, .LBB0_7
# %bb.1:
	li	t3, 0
	li	t1, 0
	li	a6, -10
	lui	a2, 838861
	addiw	a2, a2, -819
	slli	t2, a2, 32
	li	a7, 10
	li	t0, 99
	j	.LBB0_4
.LBB0_2:                                #   in Loop: Header=BB0_4 Depth=1
	slt	a2, a4, a2
.LBB0_3:                                #   in Loop: Header=BB0_4 Depth=1
	addi	t3, t3, 1
	addw	t1, t1, a2
	beq	t3, a1, .LBB0_8
.LBB0_4:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_6 Depth 2
	slli	a2, t3, 2
	add	a2, a2, a0
	lw	a5, 0(a2)
	li	a2, 1
	bgtz	a5, .LBB0_3
# %bb.5:                                #   in Loop: Header=BB0_4 Depth=1
	negw	a4, a5
	li	a2, 0
	blt	a6, a5, .LBB0_2
.LBB0_6:                                #   Parent Loop BB0_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	mv	a5, a4
	slli	a4, a4, 32
	mulhu	a4, a4, t2
	srli	a4, a4, 35
	mulw	a3, a4, a7
	subw	a3, a5, a3
	addw	a2, a2, a3
	bltu	t0, a5, .LBB0_6
	j	.LBB0_2
.LBB0_7:
	li	t1, 0
.LBB0_8:
	mv	a0, t1
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
