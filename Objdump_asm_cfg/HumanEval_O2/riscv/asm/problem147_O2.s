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
	li	t1, 0
	li	a7, 0
	li	a6, 11
	lui	a2, 838861
	addiw	a2, a2, -819
	slli	a5, a2, 32
	li	a4, 99
	j	.LBB0_3
.LBB0_2:                                #   in Loop: Header=BB0_3 Depth=1
	addi	t1, t1, 1
	beq	t1, a1, .LBB0_8
.LBB0_3:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_5 Depth 2
	slli	a2, t1, 2
	add	a2, a2, a0
	lw	t0, 0(a2)
	blt	t0, a6, .LBB0_2
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=1
	mv	a2, t0
.LBB0_5:                                #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	mv	a3, a2
	slli	a2, a2, 32
	mulhu	a2, a2, a5
	srli	a2, a2, 35
	bltu	a4, a3, .LBB0_5
# %bb.6:                                #   in Loop: Header=BB0_3 Depth=1
	and	a2, a2, t0
	andi	a2, a2, 1
	addw	a7, a7, a2
	j	.LBB0_2
.LBB0_7:
	li	a7, 0
.LBB0_8:
	mv	a0, a7
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
