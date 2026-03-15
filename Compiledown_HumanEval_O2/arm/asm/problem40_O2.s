	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 26, 2
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	mov	w9, #0                          ; =0x0
	mov	w11, #2                         ; =0x2
	mov	w10, #1                         ; =0x1
	b	LBB0_3
LBB0_1:                                 ;   in Loop: Header=BB0_3 Depth=1
	mov	w12, #1                         ; =0x1
LBB0_2:                                 ;   in Loop: Header=BB0_3 Depth=1
	add	w11, w8, w10
	add	w9, w9, w12
	cmp	w9, w0
	mov	x10, x8
	b.eq	LBB0_9
LBB0_3:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_6 Depth 2
	cmp	w9, w0
	b.ge	LBB0_8
; %bb.4:                                ;   in Loop: Header=BB0_3 Depth=1
	mov	x8, x11
	cmp	w11, #4
	b.lt	LBB0_1
; %bb.5:                                ;   in Loop: Header=BB0_3 Depth=1
	mov	w11, #2                         ; =0x2
LBB0_6:                                 ;   Parent Loop BB0_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	udiv	w12, w8, w11
	msub	w12, w12, w11, w8
	cmp	w12, #0
	add	w11, w11, #1
	mul	w13, w11, w11
	ccmp	w13, w8, #0, ne
	b.le	LBB0_6
; %bb.7:                                ;   in Loop: Header=BB0_3 Depth=1
	cmp	w12, #0
	cset	w12, ne
	b	LBB0_2
LBB0_8:
	mov	w0, #0                          ; =0x0
	ret
LBB0_9:
	mov	x0, x8
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
