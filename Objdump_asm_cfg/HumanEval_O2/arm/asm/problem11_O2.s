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
	mov	x20, x0
	bl	_strlen
	mov	x19, x0
	mov	w8, #1                          ; =0x1
	bfi	w8, w19, #1, #31
	sxtw	x0, w8
	bl	_malloc
	cbz	x0, LBB0_26
; %bb.1:
	subs	w22, w19, #1
	b.lt	LBB0_12
; %bb.2:
	and	x21, x19, #0x7fffffff
	subs	x8, x21, #1
	b.eq	LBB0_9
; %bb.3:
	mov	x9, #0                          ; =0x0
	add	x10, x20, x8
	mov	x11, x20
LBB0_4:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_5 Depth 2
	sub	w12, w19, w9
	add	w12, w12, w12, lsr #31
	asr	w12, w12, #1
	mov	x13, x10
	mov	x14, x11
LBB0_5:                                 ;   Parent Loop BB0_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldrb	w15, [x14], #1
	ldrb	w16, [x13], #-1
	cmp	w15, w16
	b.ne	LBB0_7
; %bb.6:                                ;   in Loop: Header=BB0_5 Depth=2
	subs	x12, x12, #1
	b.ne	LBB0_5
	b	LBB0_8
LBB0_7:                                 ;   in Loop: Header=BB0_4 Depth=1
	add	x9, x9, #1
	add	x11, x11, #1
	cmp	x9, x8
	b.ne	LBB0_4
	b	LBB0_9
LBB0_8:
	mov	x22, x9
LBB0_9:
	mov	x1, x20
	mov	x2, x21
	bl	_strncpy
	cbz	w22, LBB0_24
; %bb.10:
	sxtw	x9, w22
	mov	w8, w22
	cmp	w22, #8
	b.hs	LBB0_13
; %bb.11:
	mov	x10, #0                         ; =0x0
	b	LBB0_22
LBB0_12:
	lsl	w21, w19, #1
	sxtw	x2, w19
	mov	x1, x20
	bl	_strncpy
	sxtw	x8, w21
	b	LBB0_25
LBB0_13:
	cmp	w22, #64
	b.hs	LBB0_15
; %bb.14:
	mov	x10, #0                         ; =0x0
	b	LBB0_19
LBB0_15:
	and	x10, x8, #0xffffffc0
	add	x11, x21, x0
	add	x11, x11, #32
	add	x12, x9, x20
	sub	x12, x12, #32
	mov	x13, x10
LBB0_16:                                ; =>This Inner Loop Header: Depth=1
	ldp	q1, q0, [x12]
	rev64.16b	v0, v0
	ext.16b	v0, v0, v0, #8
	rev64.16b	v1, v1
	ext.16b	v1, v1, v1, #8
	ldp	q3, q2, [x12, #-32]
	rev64.16b	v2, v2
	ext.16b	v2, v2, v2, #8
	rev64.16b	v3, v3
	ext.16b	v3, v3, v3, #8
	stp	q0, q1, [x11, #-32]
	stp	q2, q3, [x11], #64
	sub	x12, x12, #64
	sub	x13, x13, #64
	cbnz	x13, LBB0_16
; %bb.17:
	cmp	x10, x8
	b.eq	LBB0_24
; %bb.18:
	tst	x8, #0x38
	b.eq	LBB0_22
LBB0_19:
	mov	x13, x10
	and	x10, x8, #0xfffffff8
	sub	x11, x9, x13
	add	x11, x11, x20
	sub	x11, x11, #8
	add	x12, x13, x21
	add	x12, x0, x12
	sub	x13, x13, x10
LBB0_20:                                ; =>This Inner Loop Header: Depth=1
	ldr	d0, [x11], #-8
	rev64.8b	v0, v0
	str	d0, [x12], #8
	adds	x13, x13, #8
	b.ne	LBB0_20
; %bb.21:
	cmp	x10, x8
	b.eq	LBB0_24
LBB0_22:
	add	x11, x10, x21
	add	x11, x0, x11
	mvn	x12, x10
	add	x9, x12, x9
	add	x9, x20, x9
	sub	x8, x8, x10
LBB0_23:                                ; =>This Inner Loop Header: Depth=1
	ldrb	w10, [x9], #-1
	strb	w10, [x11], #1
	subs	x8, x8, #1
	b.ne	LBB0_23
LBB0_24:
	add	w8, w22, w19
LBB0_25:
	strb	wzr, [x0, x8]
LBB0_26:
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp], #48             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
