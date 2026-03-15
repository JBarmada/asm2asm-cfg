	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	li	a6, 0
	blez	a1, .LBB0_3
# %bb.1:
	mv	a5, a1
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
	lw	a4, 0(a0)
	not	a4, a4
	andi	a4, a4, 1
	addw	a6, a4, a6
	addi	a5, a5, -1
	addi	a0, a0, 4
	bnez	a5, .LBB0_2
.LBB0_3:
	blez	a3, .LBB0_5
.LBB0_4:                                # =>This Inner Loop Header: Depth=1
	lw	a0, 0(a2)
	not	a0, a0
	andi	a0, a0, 1
	addw	a6, a0, a6
	addi	a3, a3, -1
	addi	a2, a2, 4
	bnez	a3, .LBB0_4
.LBB0_5:
	blt	a6, a1, .LBB0_7
# %bb.6:
.LBB0_8:                                # Label of block must be emitted
	auipc	a0, %pcrel_hi(.L.str)
	addi	a0, a0, %pcrel_lo(.LBB0_8)
	ret
.LBB0_7:
.LBB0_9:                                # Label of block must be emitted
	auipc	a0, %pcrel_hi(.L.str.1)
	addi	a0, a0, %pcrel_lo(.LBB0_9)
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"YES"
	.size	.L.str, 4

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"NO"
	.size	.L.str.1, 3

	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
