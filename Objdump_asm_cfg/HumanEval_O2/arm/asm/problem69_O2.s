	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 26, 2
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	cmp	w1, #1
	b.lt	LBB0_11
; %bb.1:
	mov	w10, w1
	and	x8, x10, #0x7
	cmp	w1, #8
	b.hs	LBB0_3
; %bb.2:
	mov	x9, #0                          ; =0x0
	mov	w12, #2147483647                ; =0x7fffffff
	mov	w13, #-1                        ; =0xffffffff
	b	LBB0_5
LBB0_3:
	mov	x9, #0                          ; =0x0
	and	x10, x10, #0x7ffffff8
	add	x11, x0, #16
	mov	w12, #2147483647                ; =0x7fffffff
	mov	w13, #-1                        ; =0xffffffff
LBB0_4:                                 ; =>This Inner Loop Header: Depth=1
	ldp	w14, w15, [x11, #-16]
	cmp	w14, w12
	ccmn	w13, #1, #4, ge
	csel	w16, w14, w12, eq
	csel	w17, w9, w13, eq
	tst	w14, #0x1
	csel	w12, w12, w16, ne
	csel	w13, w13, w17, ne
	cmp	w15, w12
	ccmn	w13, #1, #4, ge
	csel	w14, w15, w12, eq
	csinc	w16, w13, w9, ne
	tst	w15, #0x1
	csel	w12, w12, w14, ne
	csel	w13, w13, w16, ne
	ldp	w14, w15, [x11, #-8]
	cmp	w14, w12
	ccmn	w13, #1, #4, ge
	csel	w16, w14, w12, eq
	add	w17, w9, #2
	csel	w17, w17, w13, eq
	tst	w14, #0x1
	csel	w12, w12, w16, ne
	csel	w13, w13, w17, ne
	cmp	w15, w12
	ccmn	w13, #1, #4, ge
	csel	w14, w15, w12, eq
	add	w16, w9, #3
	csel	w16, w16, w13, eq
	tst	w15, #0x1
	csel	w12, w12, w14, ne
	csel	w13, w13, w16, ne
	ldp	w14, w15, [x11]
	cmp	w14, w12
	ccmn	w13, #1, #4, ge
	csel	w16, w14, w12, eq
	add	w17, w9, #4
	csel	w17, w17, w13, eq
	tst	w14, #0x1
	csel	w12, w12, w16, ne
	csel	w13, w13, w17, ne
	cmp	w15, w12
	ccmn	w13, #1, #4, ge
	csel	w14, w15, w12, eq
	add	w16, w9, #5
	csel	w16, w16, w13, eq
	tst	w15, #0x1
	csel	w12, w12, w14, ne
	csel	w13, w13, w16, ne
	ldp	w14, w15, [x11, #8]
	cmp	w14, w12
	ccmn	w13, #1, #4, ge
	csel	w16, w14, w12, eq
	add	w17, w9, #6
	csel	w17, w17, w13, eq
	tst	w14, #0x1
	csel	w12, w12, w16, ne
	csel	w13, w13, w17, ne
	cmp	w15, w12
	ccmn	w13, #1, #4, ge
	csel	w14, w15, w12, eq
	add	w16, w9, #7
	csel	w16, w16, w13, eq
	tst	w15, #0x1
	csel	w12, w12, w14, ne
	csel	w13, w13, w16, ne
	add	x9, x9, #8
	add	x11, x11, #32
	cmp	x10, x9
	b.ne	LBB0_4
LBB0_5:
	cbnz	x8, LBB0_9
LBB0_6:
	cmn	w13, #1
	b.eq	LBB0_11
; %bb.7:
	stp	w12, w13, [x2]
	mov	x0, x2
	ret
LBB0_8:                                 ;   in Loop: Header=BB0_9 Depth=1
	add	x9, x9, #1
	subs	x8, x8, #1
	b.eq	LBB0_6
LBB0_9:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w10, [x0, x9, lsl #2]
	tbnz	w10, #0, LBB0_8
; %bb.10:                               ;   in Loop: Header=BB0_9 Depth=1
	cmp	w10, w12
	ccmn	w13, #1, #4, ge
	csel	w12, w10, w12, eq
	csel	w13, w9, w13, eq
	b	LBB0_8
LBB0_11:
	mov	x0, #0                          ; =0x0
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
