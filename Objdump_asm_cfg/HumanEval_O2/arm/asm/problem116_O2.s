	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 26, 2
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	cmp	w1, #1
	b.lt	LBB0_19
; %bb.1:
	mov	x9, #0                          ; =0x0
	mov	w8, #0                          ; =0x0
	sub	w10, w3, #1
	mov	w11, w1
	mov	w12, w2
	and	x13, x12, #0x7ffffff0
	and	x14, x12, #0xc
	and	x15, x12, #0x7ffffffc
	neg	x16, x15
	b	LBB0_3
LBB0_2:                                 ;   in Loop: Header=BB0_3 Depth=1
	add	x9, x9, #1
	cmp	x9, x11
	b.eq	LBB0_20
LBB0_3:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_9 Depth 2
                                        ;     Child Loop BB0_13 Depth 2
                                        ;     Child Loop BB0_16 Depth 2
	cmp	w2, #1
	b.lt	LBB0_2
; %bb.4:                                ;   in Loop: Header=BB0_3 Depth=1
	ldr	x17, [x0, x9, lsl #3]
	cmp	w2, #4
	b.hs	LBB0_6
; %bb.5:                                ;   in Loop: Header=BB0_3 Depth=1
	mov	x4, #0                          ; =0x0
	mov	w1, #0                          ; =0x0
	b	LBB0_15
LBB0_6:                                 ;   in Loop: Header=BB0_3 Depth=1
	cmp	w2, #16
	b.hs	LBB0_8
; %bb.7:                                ;   in Loop: Header=BB0_3 Depth=1
	mov	w1, #0                          ; =0x0
	mov	x5, #0                          ; =0x0
	b	LBB0_12
LBB0_8:                                 ;   in Loop: Header=BB0_3 Depth=1
	add	x1, x17, #32
	movi.2d	v0, #0000000000000000
	mov	x4, x13
	movi.2d	v1, #0000000000000000
	movi.2d	v2, #0000000000000000
	movi.2d	v3, #0000000000000000
LBB0_9:                                 ;   Parent Loop BB0_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldp	q4, q5, [x1, #-32]
	ldp	q6, q7, [x1], #64
	add.4s	v0, v4, v0
	add.4s	v1, v5, v1
	add.4s	v2, v6, v2
	add.4s	v3, v7, v3
	subs	x4, x4, #16
	b.ne	LBB0_9
; %bb.10:                               ;   in Loop: Header=BB0_3 Depth=1
	add.4s	v0, v1, v0
	add.4s	v0, v2, v0
	add.4s	v0, v3, v0
	addv.4s	s0, v0
	fmov	w1, s0
	cmp	x13, x12
	b.eq	LBB0_17
; %bb.11:                               ;   in Loop: Header=BB0_3 Depth=1
	mov	x4, x13
	mov	x5, x13
	cbz	x14, LBB0_15
LBB0_12:                                ;   in Loop: Header=BB0_3 Depth=1
	movi.2d	v0, #0000000000000000
	mov.s	v0[0], w1
	add	x1, x17, x5, lsl #2
	add	x4, x16, x5
LBB0_13:                                ;   Parent Loop BB0_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	q1, [x1], #16
	add.4s	v0, v1, v0
	adds	x4, x4, #4
	b.ne	LBB0_13
; %bb.14:                               ;   in Loop: Header=BB0_3 Depth=1
	addv.4s	s0, v0
	fmov	w1, s0
	mov	x4, x15
	cmp	x15, x12
	b.eq	LBB0_17
LBB0_15:                                ;   in Loop: Header=BB0_3 Depth=1
	add	x17, x17, x4, lsl #2
	sub	x4, x12, x4
LBB0_16:                                ;   Parent Loop BB0_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	w5, [x17], #4
	add	w1, w5, w1
	subs	x4, x4, #1
	b.ne	LBB0_16
LBB0_17:                                ;   in Loop: Header=BB0_3 Depth=1
	cmp	w1, #0
	b.le	LBB0_2
; %bb.18:                               ;   in Loop: Header=BB0_3 Depth=1
	add	w17, w10, w1
	sdiv	w17, w17, w3
	add	w8, w17, w8
	b	LBB0_2
LBB0_19:
	mov	w8, #0                          ; =0x0
LBB0_20:
	mov	x0, x8
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
