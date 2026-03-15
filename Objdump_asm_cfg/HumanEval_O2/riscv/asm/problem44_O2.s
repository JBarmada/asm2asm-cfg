	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	blez	a1, .LBB0_8
# %bb.1:
	li	a7, 0
	addi	t0, a0, 4
	li	t1, 1
	li	a6, 1
	j	.LBB0_3
.LBB0_2:                                #   in Loop: Header=BB0_3 Depth=1
	sltu	a6, a7, a1
	addi	t1, t1, 1
	addi	t0, t0, 4
	beq	a7, a1, .LBB0_7
.LBB0_3:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_5 Depth 2
	mv	a2, a7
	addi	a7, a7, 1
	bgeu	a7, a1, .LBB0_2
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=1
	slli	a2, a2, 2
	add	a2, a2, a0
	lw	a2, 0(a2)
	mv	a5, a1
	mv	a3, t0
.LBB0_5:                                #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lw	a4, 0(a3)
	negw	a4, a4
	beq	a2, a4, .LBB0_7
# %bb.6:                                #   in Loop: Header=BB0_5 Depth=2
	addi	a5, a5, -1
	addi	a3, a3, 4
	bne	t1, a5, .LBB0_5
	j	.LBB0_2
.LBB0_7:
	andi	a0, a6, 1
	ret
.LBB0_8:
	andi	a0, zero, 1
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
