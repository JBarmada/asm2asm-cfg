	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 26, 2
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	cmp	w1, #1
	b.lt	LBB0_9
; %bb.1:
	mov	x11, #0                         ; =0x0
	add	x8, x0, #8
	mov	w9, #1                          ; =0x1
	mov	w10, #2                         ; =0x2
	mov	w13, #1                         ; =0x1
	mov	w12, w1
LBB0_2:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_5 Depth 2
                                        ;       Child Loop BB0_7 Depth 3
	add	x14, x11, #1
	mov	x16, x10
	mov	x17, x8
	mov	x3, x9
	cmp	x14, x12
	cset	w15, lo
	b.lo	LBB0_5
LBB0_3:                                 ;   in Loop: Header=BB0_2 Depth=1
	add	x9, x9, #1
	add	x8, x8, #4
	add	w10, w10, #1
	mov	x11, x14
	mov	x13, x15
	cmp	x14, x12
	b.ne	LBB0_2
	b	LBB0_9
LBB0_4:                                 ;   in Loop: Header=BB0_5 Depth=2
	add	x17, x17, #4
	add	w16, w16, #1
	mov	x3, x2
	cmp	x2, x12
	b.eq	LBB0_3
LBB0_5:                                 ;   Parent Loop BB0_2 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB0_7 Depth 3
	add	x2, x3, #1
	cmp	w2, w1
	b.ge	LBB0_4
; %bb.6:                                ;   in Loop: Header=BB0_5 Depth=2
	ldr	w4, [x0, x11, lsl #2]
	ldr	w3, [x0, x3, lsl #2]
	add	w3, w3, w4
	mov	x4, x16
	mov	x5, x17
LBB0_7:                                 ;   Parent Loop BB0_2 Depth=1
                                        ;     Parent Loop BB0_5 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	w6, [x5], #4
	cmn	w3, w6
	b.eq	LBB0_10
; %bb.8:                                ;   in Loop: Header=BB0_7 Depth=3
	add	w4, w4, #1
	cmp	w4, w1
	b.lt	LBB0_7
	b	LBB0_4
LBB0_9:
	mov	w13, #0                         ; =0x0
LBB0_10:
	and	w0, w13, #0x1
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
