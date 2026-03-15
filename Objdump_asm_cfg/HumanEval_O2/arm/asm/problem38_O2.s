	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 26, 2
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	stp	x22, x21, [sp, #-48]!           ; 16-byte Folded Spill
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	mov	x19, x2
	mov	x21, x1
	mov	x20, x0
	add	w8, w1, w1, lsr #31
	asr	w8, w8, #1
	sbfiz	x8, x8, #2, #32
	add	x0, x8, #4
	bl	_malloc
	subs	w11, w21, #1
	b.lt	LBB0_16
; %bb.1:
	lsr	w8, w11, #1
	add	w9, w8, #1
	cmp	w21, #9
	b.hs	LBB0_3
; %bb.2:
	mov	x10, #0                         ; =0x0
	mov	x12, #0                         ; =0x0
	b	LBB0_11
LBB0_3:
	cmp	w21, #33
	b.hs	LBB0_5
; %bb.4:
	mov	x10, #0                         ; =0x0
	b	LBB0_9
LBB0_5:
	ands	x10, x9, #0xf
	mov	w12, #16                        ; =0x10
	csel	x12, x12, x10, eq
	sub	x10, x9, x12
	add	x13, x0, #32
	add	x14, x20, #64
	mov	x15, x9
LBB0_6:                                 ; =>This Inner Loop Header: Depth=1
	sub	x16, x14, #64
	ld2.4s	{ v0, v1 }, [x16]
	sub	x16, x14, #32
	ld2.4s	{ v2, v3 }, [x16]
	mov	x16, x14
	ld2.4s	{ v4, v5 }, [x16], #32
	ld2.4s	{ v6, v7 }, [x16]
	stp	q0, q2, [x13, #-32]
	stp	q4, q6, [x13], #64
	sub	x15, x15, #16
	add	x14, x14, #128
	cmp	x12, x15
	b.ne	LBB0_6
; %bb.7:
	cmp	x12, #4
	b.hi	LBB0_9
; %bb.8:
	lsl	x12, x10, #1
	b	LBB0_11
LBB0_9:
	mov	x15, x10
	ands	x10, x9, #0x3
	mov	w12, #4                         ; =0x4
	csel	x16, x12, x10, eq
	add	x13, x20, x15, lsl #3
	add	x14, x0, x15, lsl #2
	sub	x10, x9, x16
	lsl	x12, x10, #1
	mov	x17, #-1                        ; =0xffffffffffffffff
	eor	x11, x17, x11, lsr #1
	add	x15, x16, x15
	add	x11, x11, x15
LBB0_10:                                ; =>This Inner Loop Header: Depth=1
	ld2.4s	{ v0, v1 }, [x13], #32
	str	q0, [x14], #16
	adds	x11, x11, #4
	b.ne	LBB0_10
LBB0_11:
	add	x11, x20, x12, lsl #2
LBB0_12:                                ; =>This Inner Loop Header: Depth=1
	ldr	s0, [x11], #8
	str	s0, [x0, x10, lsl #2]
	add	x12, x10, #1
	mov	x10, x12
	cmp	x9, x12
	b.ne	LBB0_12
; %bb.13:
	cmp	w21, #3
	b.hs	LBB0_17
LBB0_14:
	mov	x8, #0                          ; =0x0
	mov	w9, w21
LBB0_15:                                ; =>This Inner Loop Header: Depth=1
	ubfx	x10, x8, #1, #31
	add	x10, x0, x10, lsl #2
	tst	x8, #0x1
	csel	x10, x10, x20, eq
	ldr	s0, [x10]
	str	s0, [x19, x8, lsl #2]
	add	x8, x8, #1
	add	x20, x20, #4
	cmp	x9, x8
	b.ne	LBB0_15
LBB0_16:
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp], #48             ; 16-byte Folded Reload
	b	_free
LBB0_17:
	mov	w9, #0                          ; =0x0
	add	x10, x0, #4
	mov	x11, x8
	b	LBB0_19
LBB0_18:                                ;   in Loop: Header=BB0_19 Depth=1
	add	w9, w9, #1
	sub	w11, w11, #1
	cmp	w9, w8
	b.eq	LBB0_14
LBB0_19:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_23 Depth 2
	mov	w11, w11
	cmp	w9, w8
	b.hs	LBB0_18
; %bb.20:                               ;   in Loop: Header=BB0_19 Depth=1
	ldr	s0, [x0]
	mov	x12, x11
	mov	x13, x10
	b	LBB0_23
LBB0_21:                                ;   in Loop: Header=BB0_23 Depth=2
	stp	s1, s0, [x13, #-4]
LBB0_22:                                ;   in Loop: Header=BB0_23 Depth=2
	add	x13, x13, #4
	subs	x12, x12, #1
	b.eq	LBB0_18
LBB0_23:                                ;   Parent Loop BB0_19 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	s1, [x13]
	fcmp	s0, s1
	b.gt	LBB0_21
; %bb.24:                               ;   in Loop: Header=BB0_23 Depth=2
	fmov	s0, s1
	b	LBB0_22
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
