	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	mv	a6, a3
	mv	a7, a0
	blez	a2, .LBB0_9
# %bb.1:
	li	t2, 0
	li	t0, 0
	li	t1, -1000
	j	.LBB0_3
.LBB0_2:                                #   in Loop: Header=BB0_3 Depth=1
	addi	t2, t2, 1
	mv	t1, t3
	mv	t0, a3
	beq	t2, a2, .LBB0_10
.LBB0_3:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_5 Depth 2
	slli	a0, t2, 3
	add	a0, a0, a1
	ld	a3, 0(a0)
	lbu	a4, 0(a3)
	beqz	a4, .LBB0_7
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=1
	li	t3, 0
	addi	a0, a3, 1
.LBB0_5:                                #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	addiw	a5, a4, -65
	andi	a5, a5, 255
	sltiu	a5, a5, 26
	addw	t3, t3, a5
	addiw	a5, a4, -97
	lbu	a4, 0(a0)
	andi	a5, a5, 255
	sltiu	a5, a5, 26
	subw	t3, t3, a5
	addi	a0, a0, 1
	bnez	a4, .LBB0_5
# %bb.6:                                #   in Loop: Header=BB0_3 Depth=1
	blt	t1, t3, .LBB0_2
	j	.LBB0_8
.LBB0_7:                                #   in Loop: Header=BB0_3 Depth=1
	li	t3, 0
	blt	t1, t3, .LBB0_2
.LBB0_8:                                #   in Loop: Header=BB0_3 Depth=1
	mv	a3, t0
	mv	t3, t1
	j	.LBB0_2
.LBB0_9:
	li	a3, 0
.LBB0_10:
.LBB0_11:                               # Label of block must be emitted
	auipc	a1, %pcrel_hi(.L.str)
	addi	a1, a1, %pcrel_lo(.LBB0_11)
	mv	a0, a6
	mv	a2, a7
	tail	sprintf@plt
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%s.%s"
	.size	.L.str, 6

	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
