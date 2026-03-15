	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 26, 2
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	subs	w8, w1, #1
	b.le	LBB0_9
; %bb.1:
	mov	w9, #0                          ; =0x0
	add	x10, x0, #4
	mov	x11, x8
	b	LBB0_3
LBB0_2:                                 ;   in Loop: Header=BB0_3 Depth=1
	add	w9, w9, #1
	sub	w11, w11, #1
	cmp	w9, w8
	b.eq	LBB0_9
LBB0_3:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_7 Depth 2
	mov	w11, w11
	sub	w12, w9, w1
	cmn	w12, #2
	b.gt	LBB0_2
; %bb.4:                                ;   in Loop: Header=BB0_3 Depth=1
	ldr	w12, [x0]
	mov	x13, x11
	mov	x14, x10
	b	LBB0_7
LBB0_5:                                 ;   in Loop: Header=BB0_7 Depth=2
	stp	w15, w12, [x14, #-4]
LBB0_6:                                 ;   in Loop: Header=BB0_7 Depth=2
	add	x14, x14, #4
	subs	x13, x13, #1
	b.eq	LBB0_2
LBB0_7:                                 ;   Parent Loop BB0_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	w15, [x14]
	cmp	w12, w15
	b.gt	LBB0_5
; %bb.8:                                ;   in Loop: Header=BB0_7 Depth=2
	mov	x12, x15
	b	LBB0_6
LBB0_9:
	cmp	w2, #1
	b.lt	LBB0_15
; %bb.10:
	sub	w8, w1, w2
	sxtw	x9, w8
	mov	w8, w2
	cmp	w2, #4
	b.lo	LBB0_12
; %bb.11:
	lsl	x12, x9, #2
	sub	x10, x3, x0
	sub	x10, x10, x12
	cmp	x10, #64
	b.hs	LBB0_16
LBB0_12:
	mov	x10, #0                         ; =0x0
LBB0_13:
	lsl	x11, x10, #2
	add	x9, x11, x9, lsl #2
	add	x9, x0, x9
	add	x11, x3, x11
	sub	x8, x8, x10
LBB0_14:                                ; =>This Inner Loop Header: Depth=1
	ldr	w10, [x9], #4
	str	w10, [x11], #4
	subs	x8, x8, #1
	b.ne	LBB0_14
LBB0_15:
	ret
LBB0_16:
	cmp	w2, #16
	b.hs	LBB0_18
; %bb.17:
	mov	x10, #0                         ; =0x0
	b	LBB0_22
LBB0_18:
	and	x10, x8, #0x7ffffff0
	add	x11, x3, #32
	add	x12, x12, x0
	add	x12, x12, #32
	mov	x13, x10
LBB0_19:                                ; =>This Inner Loop Header: Depth=1
	ldp	q0, q1, [x12, #-32]
	ldp	q2, q3, [x12], #64
	stp	q0, q1, [x11, #-32]
	stp	q2, q3, [x11], #64
	subs	x13, x13, #16
	b.ne	LBB0_19
; %bb.20:
	cmp	x10, x8
	b.eq	LBB0_15
; %bb.21:
	tst	x8, #0xc
	b.eq	LBB0_13
LBB0_22:
	mov	x13, x10
	and	x10, x8, #0x7ffffffc
	lsl	x12, x13, #2
	add	x11, x12, x9, lsl #2
	add	x11, x0, x11
	add	x12, x3, x12
	sub	x13, x13, x10
LBB0_23:                                ; =>This Inner Loop Header: Depth=1
	ldr	q0, [x11], #16
	str	q0, [x12], #16
	adds	x13, x13, #4
	b.ne	LBB0_23
; %bb.24:
	cmp	x10, x8
	b.eq	LBB0_15
	b	LBB0_13
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
