	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	addi	sp, sp, -48
	sd	ra, 40(sp)                      # 8-byte Folded Spill
	sd	s0, 32(sp)                      # 8-byte Folded Spill
	sd	s1, 24(sp)                      # 8-byte Folded Spill
	sd	s2, 16(sp)                      # 8-byte Folded Spill
	sd	s3, 8(sp)                       # 8-byte Folded Spill
	sd	s4, 0(sp)                       # 8-byte Folded Spill
	mv	s2, a2
	mv	s4, a0
	li	a0, 2
	addiw	a7, a1, -1
	blt	a1, a0, .LBB0_9
# %bb.1:
	li	a2, 0
	addi	a6, s4, 4
	mv	a5, a7
	j	.LBB0_3
.LBB0_2:                                #   in Loop: Header=BB0_3 Depth=1
	addiw	a2, a2, 1
	addiw	a5, a5, -1
	bge	a2, a7, .LBB0_9
.LBB0_3:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_7 Depth 2
	not	a0, a2
	addw	a0, a0, a1
	blez	a0, .LBB0_2
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=1
	lw	a0, 0(s4)
	slli	a4, a5, 32
	srli	s0, a4, 32
	mv	a4, a6
	j	.LBB0_7
.LBB0_5:                                #   in Loop: Header=BB0_7 Depth=2
	sw	s1, -4(a4)
	sw	a0, 0(a4)
.LBB0_6:                                #   in Loop: Header=BB0_7 Depth=2
	addi	s0, s0, -1
	addi	a4, a4, 4
	beqz	s0, .LBB0_2
.LBB0_7:                                #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lw	s1, 0(a4)
	blt	s1, a0, .LBB0_5
# %bb.8:                                #   in Loop: Header=BB0_7 Depth=2
	mv	a0, s1
	j	.LBB0_6
.LBB0_9:
	sw	zero, 0(a3)
	slli	s3, a7, 32
	li	s0, 0
	blez	a1, .LBB0_14
# %bb.10:
	srli	a0, s3, 32
	addi	a0, a0, 1
	srli	a2, s3, 30
	add	a2, a2, s4
	li	a4, 8
	j	.LBB0_12
.LBB0_11:                               #   in Loop: Header=BB0_12 Depth=1
	addi	a0, a0, -1
	addi	a2, a2, -4
	blez	a0, .LBB0_14
.LBB0_12:                               # =>This Inner Loop Header: Depth=1
	lw	a5, 0(a2)
	addiw	a5, a5, -1
	bltu	a4, a5, .LBB0_11
# %bb.13:                               #   in Loop: Header=BB0_12 Depth=1
	addiw	s0, s0, 1
	sw	s0, 0(a3)
	j	.LBB0_11
.LBB0_14:
	sgtz	s1, a1
	slli	a0, s0, 3
	call	malloc@plt
	sgtz	a1, s0
	and	a1, a1, s1
	sd	a0, 0(s2)
	beqz	a1, .LBB0_19
# %bb.15:
	li	a4, 0
	srli	a0, s3, 32
	srli	a1, s3, 30
	add	a1, a1, s4
	li	a6, 8
.LBB0_20:                               # Label of block must be emitted
	auipc	a3, %pcrel_hi(.Lreltable.func0)
	addi	a3, a3, %pcrel_lo(.LBB0_20)
	j	.LBB0_17
.LBB0_16:                               #   in Loop: Header=BB0_17 Depth=1
	sgtz	a2, a0
	slt	a5, a4, s0
	and	a2, a2, a5
	addi	a0, a0, -1
	addi	a1, a1, -4
	beqz	a2, .LBB0_19
.LBB0_17:                               # =>This Inner Loop Header: Depth=1
	lwu	a5, 0(a1)
	addiw	s1, a5, -1
	bltu	a6, s1, .LBB0_16
# %bb.18:                               #   in Loop: Header=BB0_17 Depth=1
	slli	a5, a5, 2
	add	a5, a5, a3
	lw	a5, 0(a5)
	ld	s1, 0(s2)
	add	a5, a5, a3
	slli	a2, a4, 3
	addiw	a4, a4, 1
	add	a2, a2, s1
	sd	a5, 0(a2)
	j	.LBB0_16
.LBB0_19:
	ld	ra, 40(sp)                      # 8-byte Folded Reload
	ld	s0, 32(sp)                      # 8-byte Folded Reload
	ld	s1, 24(sp)                      # 8-byte Folded Reload
	ld	s2, 16(sp)                      # 8-byte Folded Reload
	ld	s3, 8(sp)                       # 8-byte Folded Reload
	ld	s4, 0(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 48
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.zero	1
	.size	.L.str, 1

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"One"
	.size	.L.str.1, 4

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"Two"
	.size	.L.str.2, 4

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"Three"
	.size	.L.str.3, 6

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"Four"
	.size	.L.str.4, 5

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	"Five"
	.size	.L.str.5, 5

	.type	.L.str.6,@object                # @.str.6
.L.str.6:
	.asciz	"Six"
	.size	.L.str.6, 4

	.type	.L.str.7,@object                # @.str.7
.L.str.7:
	.asciz	"Seven"
	.size	.L.str.7, 6

	.type	.L.str.8,@object                # @.str.8
.L.str.8:
	.asciz	"Eight"
	.size	.L.str.8, 6

	.type	.L.str.9,@object                # @.str.9
.L.str.9:
	.asciz	"Nine"
	.size	.L.str.9, 5

	.type	.Lreltable.func0,@object        # @reltable.func0
	.section	.rodata,"a",@progbits
	.p2align	2
.Lreltable.func0:
	.word	.L.str-.Lreltable.func0
	.word	.L.str.1-.Lreltable.func0
	.word	.L.str.2-.Lreltable.func0
	.word	.L.str.3-.Lreltable.func0
	.word	.L.str.4-.Lreltable.func0
	.word	.L.str.5-.Lreltable.func0
	.word	.L.str.6-.Lreltable.func0
	.word	.L.str.7-.Lreltable.func0
	.word	.L.str.8-.Lreltable.func0
	.word	.L.str.9-.Lreltable.func0
	.size	.Lreltable.func0, 40

	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
