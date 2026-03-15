	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	beqz	a1, .LBB0_8
# %bb.1:
	li	a2, 2
	blt	a1, a2, .LBB0_9
# %bb.2:
	lw	t2, 0(a0)
	lw	a3, 4(a0)
	li	t1, 1
	blt	a3, t2, .LBB0_10
# %bb.3:
	li	a4, 0
	li	a2, -1
	srli	t0, a2, 32
	addi	a5, a0, 8
	addi	a6, a1, -2
	li	a7, 1
	li	t1, 1
.LBB0_4:                                # =>This Inner Loop Header: Depth=1
	mv	t4, a3
	addi	t3, a4, 1
	sltu	a3, a7, t3
	xor	a2, t4, t2
	seqz	a2, a2
	and	a2, a2, a3
	beqz	a2, .LBB0_6
# %bb.5:                                #   in Loop: Header=BB0_4 Depth=1
	add	a2, a4, t0
	and	a2, a2, t0
	slli	a2, a2, 2
	add	a2, a2, a0
	lw	a2, 0(a2)
	beq	t2, a2, .LBB0_10
.LBB0_6:                                #   in Loop: Header=BB0_4 Depth=1
	addi	a2, a4, 2
	sltu	t1, a2, a1
	beq	a6, a4, .LBB0_10
# %bb.7:                                #   in Loop: Header=BB0_4 Depth=1
	lw	a3, 0(a5)
	addi	a5, a5, 4
	mv	a4, t3
	mv	t2, t4
	bge	a3, t4, .LBB0_4
	j	.LBB0_10
.LBB0_8:
	li	a0, 1
	andi	a0, a0, 1
	ret
.LBB0_9:
	li	t1, 0
.LBB0_10:
	xori	a0, t1, 1
	andi	a0, a0, 1
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
