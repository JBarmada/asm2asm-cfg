	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	srliw	a3, a1, 31
	addw	a3, a3, a1
	li	a4, 2
	sraiw	a6, a3, 1
	blt	a1, a4, .LBB0_4
# %bb.1:
	li	a5, 0
	li	t0, 0
	slli	a3, a6, 32
	srli	a7, a3, 32
	mv	t1, a0
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
	lw	a4, 0(t1)
	not	a3, a5
	addw	a3, a3, a1
	slli	a3, a3, 2
	add	a3, a3, a0
	lw	a3, 0(a3)
	bne	a4, a3, .LBB0_8
# %bb.3:                                #   in Loop: Header=BB0_2 Depth=1
	slliw	a3, a4, 1
	addw	t0, t0, a3
	addi	a5, a5, 1
	addi	t1, t1, 4
	bne	a7, a5, .LBB0_2
	j	.LBB0_5
.LBB0_4:
	li	t0, 0
.LBB0_5:
	lui	a3, 524288
	addiw	a3, a3, 1
	and	a1, a1, a3
	li	a3, 1
	bne	a1, a3, .LBB0_7
# %bb.6:
	slli	a1, a6, 2
	add	a0, a0, a1
	lw	a0, 0(a0)
	addw	t0, a0, t0
.LBB0_7:
	slt	a0, a2, t0
	xori	a0, a0, 1
	ret
.LBB0_8:
	li	a0, 0
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
