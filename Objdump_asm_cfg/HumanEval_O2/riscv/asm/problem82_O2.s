	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.section	.sdata,"aw",@progbits
	.p2align	3                               # -- Begin function func0
.LCPI0_0:
	.quad	0x400fffcb923a29c7              # double 3.9998999999999998
.LCPI0_1:
	.quad	0x400d99ce075f6fd2              # double 3.7000999999999999
.LCPI0_2:
	.quad	0x400a669ad42c3c9f              # double 3.3001
.LCPI0_3:
	.quad	0x400800346dc5d639              # double 3.0001000000000002
.LCPI0_4:
	.quad	0x400599ce075f6fd2              # double 2.7000999999999999
.LCPI0_5:
	.quad	0x4002669ad42c3c9f              # double 2.3001
.LCPI0_6:
	.quad	0x400000346dc5d639              # double 2.0001000000000002
.LCPI0_7:
	.quad	0x3ffb339c0ebedfa4              # double 1.7000999999999999
.LCPI0_8:
	.quad	0x3ff4cd35a858793e              # double 1.3001
.LCPI0_9:
	.quad	0x3ff00068db8bac71              # double 1.0001
.LCPI0_10:
	.quad	0x3fe667381d7dbf48              # double 0.70009999999999994
.LCPI0_11:
	.quad	0x3f1a36e2eb1c432d              # double 1.0E-4
	.text
	.globl	func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	addi	sp, sp, -32
	sd	ra, 24(sp)                      # 8-byte Folded Spill
	sd	s0, 16(sp)                      # 8-byte Folded Spill
	sd	s1, 8(sp)                       # 8-byte Folded Spill
	sd	s2, 0(sp)                       # 8-byte Folded Spill
	mv	s0, a1
	mv	s1, a0
	slli	a0, a1, 3
	call	malloc@plt
	blez	s0, .LBB0_28
# %bb.1:
.LBB0_29:                               # Label of block must be emitted
	auipc	a1, %pcrel_hi(.LCPI0_0)
	addi	a1, a1, %pcrel_lo(.LBB0_29)
	fld	ft0, 0(a1)
.LBB0_30:                               # Label of block must be emitted
	auipc	a1, %pcrel_hi(.LCPI0_1)
	addi	a1, a1, %pcrel_lo(.LBB0_30)
	fld	ft1, 0(a1)
.LBB0_31:                               # Label of block must be emitted
	auipc	a1, %pcrel_hi(.L.str.1)
	addi	a1, a1, %pcrel_lo(.LBB0_31)
.LBB0_32:                               # Label of block must be emitted
	auipc	a2, %pcrel_hi(.LCPI0_2)
	addi	a2, a2, %pcrel_lo(.LBB0_32)
	fld	ft2, 0(a2)
.LBB0_33:                               # Label of block must be emitted
	auipc	a2, %pcrel_hi(.L.str.2)
	addi	a2, a2, %pcrel_lo(.LBB0_33)
.LBB0_34:                               # Label of block must be emitted
	auipc	a3, %pcrel_hi(.LCPI0_3)
	addi	a3, a3, %pcrel_lo(.LBB0_34)
	fld	ft3, 0(a3)
.LBB0_35:                               # Label of block must be emitted
	auipc	s2, %pcrel_hi(.L.str.3)
	addi	s2, s2, %pcrel_lo(.LBB0_35)
.LBB0_36:                               # Label of block must be emitted
	auipc	a4, %pcrel_hi(.LCPI0_4)
	addi	a4, a4, %pcrel_lo(.LBB0_36)
	fld	ft4, 0(a4)
.LBB0_37:                               # Label of block must be emitted
	auipc	t6, %pcrel_hi(.L.str.4)
	addi	t6, t6, %pcrel_lo(.LBB0_37)
.LBB0_38:                               # Label of block must be emitted
	auipc	a4, %pcrel_hi(.LCPI0_5)
	addi	a4, a4, %pcrel_lo(.LBB0_38)
	fld	ft5, 0(a4)
.LBB0_39:                               # Label of block must be emitted
	auipc	t5, %pcrel_hi(.L.str.5)
	addi	t5, t5, %pcrel_lo(.LBB0_39)
.LBB0_40:                               # Label of block must be emitted
	auipc	a4, %pcrel_hi(.LCPI0_6)
	addi	a4, a4, %pcrel_lo(.LBB0_40)
	fld	ft6, 0(a4)
.LBB0_41:                               # Label of block must be emitted
	auipc	a6, %pcrel_hi(.L.str.6)
	addi	a6, a6, %pcrel_lo(.LBB0_41)
.LBB0_42:                               # Label of block must be emitted
	auipc	a4, %pcrel_hi(.LCPI0_7)
	addi	a4, a4, %pcrel_lo(.LBB0_42)
	fld	ft7, 0(a4)
.LBB0_43:                               # Label of block must be emitted
	auipc	a7, %pcrel_hi(.L.str.7)
	addi	a7, a7, %pcrel_lo(.LBB0_43)
.LBB0_44:                               # Label of block must be emitted
	auipc	a4, %pcrel_hi(.LCPI0_8)
	addi	a4, a4, %pcrel_lo(.LBB0_44)
	fld	fa0, 0(a4)
.LBB0_45:                               # Label of block must be emitted
	auipc	t0, %pcrel_hi(.L.str.8)
	addi	t0, t0, %pcrel_lo(.LBB0_45)
.LBB0_46:                               # Label of block must be emitted
	auipc	a4, %pcrel_hi(.LCPI0_9)
	addi	a4, a4, %pcrel_lo(.LBB0_46)
	fld	fa1, 0(a4)
.LBB0_47:                               # Label of block must be emitted
	auipc	t1, %pcrel_hi(.L.str.9)
	addi	t1, t1, %pcrel_lo(.LBB0_47)
.LBB0_48:                               # Label of block must be emitted
	auipc	a4, %pcrel_hi(.LCPI0_10)
	addi	a4, a4, %pcrel_lo(.LBB0_48)
	fld	fa2, 0(a4)
.LBB0_49:                               # Label of block must be emitted
	auipc	t2, %pcrel_hi(.L.str.10)
	addi	t2, t2, %pcrel_lo(.LBB0_49)
.LBB0_50:                               # Label of block must be emitted
	auipc	a4, %pcrel_hi(.LCPI0_11)
	addi	a4, a4, %pcrel_lo(.LBB0_50)
	fld	fa3, 0(a4)
.LBB0_51:                               # Label of block must be emitted
	auipc	t3, %pcrel_hi(.L.str.11)
	addi	t3, t3, %pcrel_lo(.LBB0_51)
.LBB0_52:                               # Label of block must be emitted
	auipc	t4, %pcrel_hi(.L.str.12)
	addi	t4, t4, %pcrel_lo(.LBB0_52)
.LBB0_53:                               # Label of block must be emitted
	auipc	a5, %pcrel_hi(.L.str)
	addi	a5, a5, %pcrel_lo(.LBB0_53)
	mv	a4, a0
	j	.LBB0_4
.LBB0_2:                                #   in Loop: Header=BB0_4 Depth=1
	sd	a5, 0(a4)
.LBB0_3:                                #   in Loop: Header=BB0_4 Depth=1
	addi	a4, a4, 8
	addi	s0, s0, -1
	addi	s1, s1, 4
	beqz	s0, .LBB0_28
.LBB0_4:                                # =>This Inner Loop Header: Depth=1
	flw	fa4, 0(s1)
	fcvt.d.s	fa4, fa4
	fle.d	a3, ft0, fa4
	bnez	a3, .LBB0_2
# %bb.5:                                #   in Loop: Header=BB0_4 Depth=1
	flt.d	a3, ft1, fa4
	beqz	a3, .LBB0_7
# %bb.6:                                #   in Loop: Header=BB0_4 Depth=1
	sd	a1, 0(a4)
	j	.LBB0_3
.LBB0_7:                                #   in Loop: Header=BB0_4 Depth=1
	flt.d	a3, ft2, fa4
	beqz	a3, .LBB0_9
# %bb.8:                                #   in Loop: Header=BB0_4 Depth=1
	sd	a2, 0(a4)
	j	.LBB0_3
.LBB0_9:                                #   in Loop: Header=BB0_4 Depth=1
	flt.d	a3, ft3, fa4
	beqz	a3, .LBB0_11
# %bb.10:                               #   in Loop: Header=BB0_4 Depth=1
	sd	s2, 0(a4)
	j	.LBB0_3
.LBB0_11:                               #   in Loop: Header=BB0_4 Depth=1
	flt.d	a3, ft4, fa4
	beqz	a3, .LBB0_13
# %bb.12:                               #   in Loop: Header=BB0_4 Depth=1
	sd	t6, 0(a4)
	j	.LBB0_3
.LBB0_13:                               #   in Loop: Header=BB0_4 Depth=1
	flt.d	a3, ft5, fa4
	beqz	a3, .LBB0_15
# %bb.14:                               #   in Loop: Header=BB0_4 Depth=1
	sd	t5, 0(a4)
	j	.LBB0_3
.LBB0_15:                               #   in Loop: Header=BB0_4 Depth=1
	flt.d	a3, ft6, fa4
	beqz	a3, .LBB0_17
# %bb.16:                               #   in Loop: Header=BB0_4 Depth=1
	sd	a6, 0(a4)
	j	.LBB0_3
.LBB0_17:                               #   in Loop: Header=BB0_4 Depth=1
	flt.d	a3, ft7, fa4
	beqz	a3, .LBB0_19
# %bb.18:                               #   in Loop: Header=BB0_4 Depth=1
	sd	a7, 0(a4)
	j	.LBB0_3
.LBB0_19:                               #   in Loop: Header=BB0_4 Depth=1
	flt.d	a3, fa0, fa4
	beqz	a3, .LBB0_21
# %bb.20:                               #   in Loop: Header=BB0_4 Depth=1
	sd	t0, 0(a4)
	j	.LBB0_3
.LBB0_21:                               #   in Loop: Header=BB0_4 Depth=1
	flt.d	a3, fa1, fa4
	beqz	a3, .LBB0_23
# %bb.22:                               #   in Loop: Header=BB0_4 Depth=1
	sd	t1, 0(a4)
	j	.LBB0_3
.LBB0_23:                               #   in Loop: Header=BB0_4 Depth=1
	flt.d	a3, fa2, fa4
	beqz	a3, .LBB0_25
# %bb.24:                               #   in Loop: Header=BB0_4 Depth=1
	sd	t2, 0(a4)
	j	.LBB0_3
.LBB0_25:                               #   in Loop: Header=BB0_4 Depth=1
	flt.d	a3, fa3, fa4
	beqz	a3, .LBB0_27
# %bb.26:                               #   in Loop: Header=BB0_4 Depth=1
	sd	t3, 0(a4)
	j	.LBB0_3
.LBB0_27:                               #   in Loop: Header=BB0_4 Depth=1
	sd	t4, 0(a4)
	j	.LBB0_3
.LBB0_28:
	ld	ra, 24(sp)                      # 8-byte Folded Reload
	ld	s0, 16(sp)                      # 8-byte Folded Reload
	ld	s1, 8(sp)                       # 8-byte Folded Reload
	ld	s2, 0(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 32
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"A+"
	.size	.L.str, 3

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"A"
	.size	.L.str.1, 2

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"A-"
	.size	.L.str.2, 3

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"B+"
	.size	.L.str.3, 3

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"B"
	.size	.L.str.4, 2

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	"B-"
	.size	.L.str.5, 3

	.type	.L.str.6,@object                # @.str.6
.L.str.6:
	.asciz	"C+"
	.size	.L.str.6, 3

	.type	.L.str.7,@object                # @.str.7
.L.str.7:
	.asciz	"C"
	.size	.L.str.7, 2

	.type	.L.str.8,@object                # @.str.8
.L.str.8:
	.asciz	"C-"
	.size	.L.str.8, 3

	.type	.L.str.9,@object                # @.str.9
.L.str.9:
	.asciz	"D+"
	.size	.L.str.9, 3

	.type	.L.str.10,@object               # @.str.10
.L.str.10:
	.asciz	"D"
	.size	.L.str.10, 2

	.type	.L.str.11,@object               # @.str.11
.L.str.11:
	.asciz	"D-"
	.size	.L.str.11, 3

	.type	.L.str.12,@object               # @.str.12
.L.str.12:
	.asciz	"E"
	.size	.L.str.12, 2

	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
