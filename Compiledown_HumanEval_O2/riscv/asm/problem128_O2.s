	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	blt	a2, a0, .LBB0_2
# %bb.1:
	mv	a0, a2
.LBB0_2:
	blt	a1, a3, .LBB0_4
# %bb.3:
	mv	a1, a3
.LBB0_4:
	subw	a1, a1, a0
	li	a2, 2
.LBB0_12:                               # Label of block must be emitted
	auipc	a0, %pcrel_hi(.L.str)
	addi	a0, a0, %pcrel_lo(.LBB0_12)
	bge	a1, a2, .LBB0_6
.LBB0_5:
	ret
.LBB0_6:
	li	a3, 4
.LBB0_13:                               # Label of block must be emitted
	auipc	a2, %pcrel_hi(.L.str.1)
	addi	a2, a2, %pcrel_lo(.LBB0_13)
	bgeu	a1, a3, .LBB0_8
# %bb.7:
	mv	a0, a2
	ret
.LBB0_8:
	li	a3, 2
.LBB0_9:                                # =>This Inner Loop Header: Depth=1
	remw	a4, a1, a3
	beqz	a4, .LBB0_5
# %bb.10:                               #   in Loop: Header=BB0_9 Depth=1
	addiw	a3, a3, 1
	mulw	a4, a3, a3
	bge	a1, a4, .LBB0_9
# %bb.11:
	mv	a0, a2
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"NO"
	.size	.L.str, 3

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"YES"
	.size	.L.str.1, 4

	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
