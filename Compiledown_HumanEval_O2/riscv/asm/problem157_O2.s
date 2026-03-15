	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	addi	sp, sp, -64
	sd	ra, 56(sp)                      # 8-byte Folded Spill
	sd	s0, 48(sp)                      # 8-byte Folded Spill
	sd	s1, 40(sp)                      # 8-byte Folded Spill
	sd	s2, 32(sp)                      # 8-byte Folded Spill
	sd	s3, 24(sp)                      # 8-byte Folded Spill
	sd	s4, 16(sp)                      # 8-byte Folded Spill
	sd	s5, 8(sp)                       # 8-byte Folded Spill
	sd	s6, 0(sp)                       # 8-byte Folded Spill
	sb	zero, 0(a1)
	blez	a0, .LBB0_6
# %bb.1:
	mv	s2, a1
	mv	s1, a0
	li	s3, 0
.LBB0_7:                                # Label of block must be emitted
	auipc	s4, %pcrel_hi(.L__const.func0.num)
	addi	s4, s4, %pcrel_lo(.LBB0_7)
.LBB0_8:                                # Label of block must be emitted
	auipc	s5, %pcrel_hi(.Lreltable.func0)
	addi	s5, s5, %pcrel_lo(.LBB0_8)
	j	.LBB0_3
.LBB0_2:                                #   in Loop: Header=BB0_3 Depth=1
	sext.w	a0, s1
	sgtz	a1, a0
	addw	s3, s3, a1
	blez	a0, .LBB0_6
.LBB0_3:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_5 Depth 2
	slli	a0, s3, 32
	srli	a1, a0, 30
	add	a1, a1, s4
	lw	s0, 0(a1)
	sext.w	a1, s1
	blt	a1, s0, .LBB0_2
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=1
	srli	a0, a0, 32
	slli	a0, a0, 2
	add	a0, a0, s5
	lw	a0, 0(a0)
	add	s6, s5, a0
.LBB0_5:                                #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	mv	a0, s2
	mv	a1, s6
	call	strcat@plt
	subw	s1, s1, s0
	bge	s1, s0, .LBB0_5
	j	.LBB0_2
.LBB0_6:
	ld	ra, 56(sp)                      # 8-byte Folded Reload
	ld	s0, 48(sp)                      # 8-byte Folded Reload
	ld	s1, 40(sp)                      # 8-byte Folded Reload
	ld	s2, 32(sp)                      # 8-byte Folded Reload
	ld	s3, 24(sp)                      # 8-byte Folded Reload
	ld	s4, 16(sp)                      # 8-byte Folded Reload
	ld	s5, 8(sp)                       # 8-byte Folded Reload
	ld	s6, 0(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 64
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"m"
	.size	.L.str, 2

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"cm"
	.size	.L.str.1, 3

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"d"
	.size	.L.str.2, 2

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"cd"
	.size	.L.str.3, 3

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"c"
	.size	.L.str.4, 2

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	"xc"
	.size	.L.str.5, 3

	.type	.L.str.6,@object                # @.str.6
.L.str.6:
	.asciz	"l"
	.size	.L.str.6, 2

	.type	.L.str.7,@object                # @.str.7
.L.str.7:
	.asciz	"xl"
	.size	.L.str.7, 3

	.type	.L.str.8,@object                # @.str.8
.L.str.8:
	.asciz	"x"
	.size	.L.str.8, 2

	.type	.L.str.9,@object                # @.str.9
.L.str.9:
	.asciz	"ix"
	.size	.L.str.9, 3

	.type	.L.str.10,@object               # @.str.10
.L.str.10:
	.asciz	"v"
	.size	.L.str.10, 2

	.type	.L.str.11,@object               # @.str.11
.L.str.11:
	.asciz	"iv"
	.size	.L.str.11, 3

	.type	.L.str.12,@object               # @.str.12
.L.str.12:
	.asciz	"i"
	.size	.L.str.12, 2

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
	.word	.L.str.10-.Lreltable.func0
	.word	.L.str.11-.Lreltable.func0
	.word	.L.str.12-.Lreltable.func0
	.size	.Lreltable.func0, 52

	.type	.L__const.func0.num,@object     # @__const.func0.num
	.p2align	2
.L__const.func0.num:
	.word	1000                            # 0x3e8
	.word	900                             # 0x384
	.word	500                             # 0x1f4
	.word	400                             # 0x190
	.word	100                             # 0x64
	.word	90                              # 0x5a
	.word	50                              # 0x32
	.word	40                              # 0x28
	.word	10                              # 0xa
	.word	9                               # 0x9
	.word	5                               # 0x5
	.word	4                               # 0x4
	.word	1                               # 0x1
	.size	.L__const.func0.num, 52

	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
