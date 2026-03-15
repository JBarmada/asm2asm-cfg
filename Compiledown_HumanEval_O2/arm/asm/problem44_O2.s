	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 26, 2
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	cmp	w1, #1
	b.lt	LBB0_7
; %bb.1:
	mov	x14, #0                         ; =0x0
	mov	w8, w1
	add	x9, x0, #4
	sub	x10, x8, #1
	mov	w11, #1                         ; =0x1
	b	LBB0_3
LBB0_2:                                 ;   in Loop: Header=BB0_3 Depth=1
	add	x9, x9, #4
	sub	x10, x10, #1
	mov	x14, x12
	mov	x11, x13
	cmp	x12, x8
	b.eq	LBB0_7
LBB0_3:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_5 Depth 2
	add	x12, x14, #1
	cmp	x12, x8
	cset	w13, lo
	b.hs	LBB0_2
; %bb.4:                                ;   in Loop: Header=BB0_3 Depth=1
	ldr	w14, [x0, x14, lsl #2]
	mov	x15, x10
	mov	x16, x9
LBB0_5:                                 ;   Parent Loop BB0_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	w17, [x16], #4
	cmn	w14, w17
	b.eq	LBB0_8
; %bb.6:                                ;   in Loop: Header=BB0_5 Depth=2
	subs	x15, x15, #1
	b.ne	LBB0_5
	b	LBB0_2
LBB0_7:
	mov	w11, #0                         ; =0x0
LBB0_8:
	and	w0, w11, #0x1
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
