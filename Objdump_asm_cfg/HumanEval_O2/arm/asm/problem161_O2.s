	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 26, 2
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4, 0x0                          ; -- Begin function func0
lCPI0_0:
	.long	0                               ; 0x0
	.long	1                               ; 0x1
	.long	2                               ; 0x2
	.long	3                               ; 0x3
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	stp	x26, x25, [sp, #-80]!           ; 16-byte Folded Spill
	stp	x24, x23, [sp, #16]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #32]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #48]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	.cfi_offset w25, -72
	.cfi_offset w26, -80
	mov	x23, x3
	mov	x22, x2
	mov	x24, x1
	mov	x19, x0
	mov	x8, x3
	sbfiz	x21, x8, #2, #32
	mov	x0, x21
	bl	_malloc
	mov	x20, x0
	mov	x0, x21
	bl	_malloc
	mov	x21, x0
	cmp	w23, #1
	b.lt	LBB0_13
; %bb.1:
	ubfiz	x2, x23, #2, #32
	mov	w25, w23
	mov	x0, x20
	mov	x1, x24
	bl	_memcpy
	cmp	w23, #4
	b.hs	LBB0_3
; %bb.2:
	mov	x8, #0                          ; =0x0
	b	LBB0_12
LBB0_3:
	adrp	x9, lCPI0_0@PAGE
	cmp	w23, #16
	b.hs	LBB0_5
; %bb.4:
	mov	x8, #0                          ; =0x0
	b	LBB0_9
LBB0_5:
	and	x8, x25, #0x7ffffff0
	ldr	q0, [x9, lCPI0_0@PAGEOFF]
	add	x10, x21, #32
	movi.4s	v1, #4
	movi.4s	v2, #8
	movi.4s	v3, #12
	movi.4s	v4, #16
	mov	x11, x8
LBB0_6:                                 ; =>This Inner Loop Header: Depth=1
	add.4s	v5, v0, v1
	add.4s	v6, v0, v2
	add.4s	v7, v0, v3
	stp	q0, q5, [x10, #-32]
	stp	q6, q7, [x10], #64
	add.4s	v0, v0, v4
	subs	x11, x11, #16
	b.ne	LBB0_6
; %bb.7:
	cmp	x8, x25
	b.eq	LBB0_13
; %bb.8:
	tst	x25, #0xc
	b.eq	LBB0_12
LBB0_9:
	mov	x10, x8
	dup.4s	v0, w10
	and	x8, x25, #0x7ffffffc
	ldr	q1, [x9, lCPI0_0@PAGEOFF]
	orr.16b	v0, v0, v1
	add	x9, x21, x10, lsl #2
	sub	x10, x10, x8
	movi.4s	v1, #4
LBB0_10:                                ; =>This Inner Loop Header: Depth=1
	str	q0, [x9], #16
	add.4s	v0, v0, v1
	adds	x10, x10, #4
	b.ne	LBB0_10
; %bb.11:
	cmp	x8, x25
	b.eq	LBB0_13
LBB0_12:                                ; =>This Inner Loop Header: Depth=1
	str	w8, [x21, x8, lsl #2]
	add	x8, x8, #1
	cmp	x25, x8
	b.ne	LBB0_12
LBB0_13:
	cmp	w22, #1
	b.lt	LBB0_52
; %bb.14:
	mov	x23, #0                         ; =0x0
	mov	w22, w22
	b	LBB0_17
LBB0_15:                                ;   in Loop: Header=BB0_17 Depth=1
	ldr	s0, [x20, w25, sxtw #2]
	sshll.2d	v0, v0, #0
	scvtf	d0, d0
	ldr	s1, [x20, x8, lsl #2]
	sshll.2d	v1, v1, #0
	scvtf	d1, d1
	bl	_pow
	fcvtzs	w8, d0
	str	w8, [x20, w25, sxtw #2]
	str	w25, [x24, #4]
LBB0_16:                                ;   in Loop: Header=BB0_17 Depth=1
	add	x23, x23, #1
	cmp	x23, x22
	b.eq	LBB0_25
LBB0_17:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_21 Depth 2
                                        ;     Child Loop BB0_23 Depth 2
	ldr	x8, [x19, x23, lsl #3]
	ldrb	w9, [x8]
	cmp	w9, #42
	b.ne	LBB0_16
; %bb.18:                               ;   in Loop: Header=BB0_17 Depth=1
	ldrb	w9, [x8, #1]
	cmp	w9, #42
	b.ne	LBB0_16
; %bb.19:                               ;   in Loop: Header=BB0_17 Depth=1
	ldrb	w8, [x8, #2]
	cbnz	w8, LBB0_16
; %bb.20:                               ;   in Loop: Header=BB0_17 Depth=1
	add	x24, x21, x23, lsl #2
	ldrsw	x25, [x24]
	ldr	w8, [x21, x25, lsl #2]
	cmp	w8, w25
	b.eq	LBB0_22
LBB0_21:                                ;   Parent Loop BB0_17 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	str	w8, [x24]
	ldr	w9, [x21, w8, sxtw #2]
	mov	x25, x8
	cmp	w9, w8
	mov	x8, x9
	b.ne	LBB0_21
LBB0_22:                                ;   in Loop: Header=BB0_17 Depth=1
	ldrsw	x8, [x24, #4]
	ldr	w9, [x21, x8, lsl #2]
	cmp	w9, w8
	b.eq	LBB0_15
LBB0_23:                                ;   Parent Loop BB0_17 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	mov	x8, x9
	str	w9, [x24, #4]
	ldr	w9, [x21, w9, sxtw #2]
	cmp	w9, w8
	b.ne	LBB0_23
; %bb.24:                               ;   in Loop: Header=BB0_17 Depth=1
	sxtw	x8, w8
	b	LBB0_15
LBB0_25:
	mov	x8, #0                          ; =0x0
	b	LBB0_28
LBB0_26:                                ;   in Loop: Header=BB0_28 Depth=1
	ldr	w12, [x20, x12, lsl #2]
	mov	x13, x11
	ldr	w14, [x20, w11, sxtw #2]
	sdiv	w15, w14, w12
	mul	w12, w14, w12
	cmp	w9, #0
	csel	w9, w15, w12, eq
	str	w9, [x20, w13, sxtw #2]
	str	w11, [x10, #4]
LBB0_27:                                ;   in Loop: Header=BB0_28 Depth=1
	add	x8, x8, #1
	cmp	x8, x22
	b.eq	LBB0_39
LBB0_28:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_35 Depth 2
                                        ;     Child Loop BB0_37 Depth 2
	ldr	x9, [x19, x8, lsl #3]
	ldrb	w10, [x9]
	cmp	w10, #47
	b.eq	LBB0_32
; %bb.29:                               ;   in Loop: Header=BB0_28 Depth=1
	cmp	w10, #42
	b.ne	LBB0_27
; %bb.30:                               ;   in Loop: Header=BB0_28 Depth=1
	ldrb	w9, [x9, #1]
	cbnz	w9, LBB0_27
; %bb.31:                               ;   in Loop: Header=BB0_28 Depth=1
	mov	w9, #1                          ; =0x1
	b	LBB0_34
LBB0_32:                                ;   in Loop: Header=BB0_28 Depth=1
	ldrb	w10, [x9, #1]
	cmp	w10, #47
	b.ne	LBB0_27
; %bb.33:                               ;   in Loop: Header=BB0_28 Depth=1
	ldrb	w9, [x9, #2]
	cbnz	w9, LBB0_27
LBB0_34:                                ;   in Loop: Header=BB0_28 Depth=1
	add	x10, x21, x8, lsl #2
	ldrsw	x11, [x10]
	ldr	w12, [x21, x11, lsl #2]
	cmp	w12, w11
	b.eq	LBB0_36
LBB0_35:                                ;   Parent Loop BB0_28 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	str	w12, [x10]
	ldr	w13, [x21, w12, sxtw #2]
	mov	x11, x12
	cmp	w13, w12
	mov	x12, x13
	b.ne	LBB0_35
LBB0_36:                                ;   in Loop: Header=BB0_28 Depth=1
	ldrsw	x12, [x10, #4]
	ldr	w13, [x21, x12, lsl #2]
	cmp	w13, w12
	b.eq	LBB0_26
LBB0_37:                                ;   Parent Loop BB0_28 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	mov	x12, x13
	str	w13, [x10, #4]
	ldr	w13, [x21, w13, sxtw #2]
	cmp	w13, w12
	b.ne	LBB0_37
; %bb.38:                               ;   in Loop: Header=BB0_28 Depth=1
	sxtw	x12, w12
	b	LBB0_26
LBB0_39:
	mov	x8, #0                          ; =0x0
	b	LBB0_42
LBB0_40:                                ;   in Loop: Header=BB0_42 Depth=1
	ldr	w12, [x20, x12, lsl #2]
	ldr	w13, [x20, w11, sxtw #2]
	cmp	w9, #0
	cneg	w9, w12, eq
	add	w9, w13, w9
	str	w9, [x20, w11, sxtw #2]
	str	w11, [x10, #4]
LBB0_41:                                ;   in Loop: Header=BB0_42 Depth=1
	add	x8, x8, #1
	cmp	x8, x22
	b.eq	LBB0_52
LBB0_42:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_48 Depth 2
                                        ;     Child Loop BB0_50 Depth 2
	ldr	x9, [x19, x8, lsl #3]
	ldrb	w10, [x9]
	cmp	w10, #45
	b.eq	LBB0_46
; %bb.43:                               ;   in Loop: Header=BB0_42 Depth=1
	cmp	w10, #43
	b.ne	LBB0_41
; %bb.44:                               ;   in Loop: Header=BB0_42 Depth=1
	ldrb	w9, [x9, #1]
	cbnz	w9, LBB0_41
; %bb.45:                               ;   in Loop: Header=BB0_42 Depth=1
	mov	w9, #1                          ; =0x1
	b	LBB0_47
LBB0_46:                                ;   in Loop: Header=BB0_42 Depth=1
	ldrb	w9, [x9, #1]
	cbnz	w9, LBB0_41
LBB0_47:                                ;   in Loop: Header=BB0_42 Depth=1
	add	x10, x21, x8, lsl #2
	ldrsw	x11, [x10]
	ldr	w12, [x21, x11, lsl #2]
	cmp	w12, w11
	b.eq	LBB0_49
LBB0_48:                                ;   Parent Loop BB0_42 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	str	w12, [x10]
	ldr	w13, [x21, w12, sxtw #2]
	mov	x11, x12
	cmp	w13, w12
	mov	x12, x13
	b.ne	LBB0_48
LBB0_49:                                ;   in Loop: Header=BB0_42 Depth=1
	ldrsw	x12, [x10, #4]
	ldr	w13, [x21, x12, lsl #2]
	cmp	w13, w12
	b.eq	LBB0_40
LBB0_50:                                ;   Parent Loop BB0_42 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	mov	x12, x13
	str	w13, [x10, #4]
	ldr	w13, [x21, w13, sxtw #2]
	cmp	w13, w12
	b.ne	LBB0_50
; %bb.51:                               ;   in Loop: Header=BB0_42 Depth=1
	sxtw	x12, w12
	b	LBB0_40
LBB0_52:
	ldr	w19, [x20]
	mov	x0, x20
	bl	_free
	mov	x0, x21
	bl	_free
	mov	x0, x19
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp], #80             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
