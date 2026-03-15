	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 26, 2
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	subs	w8, w1, #1
	b.le	LBB0_7
; %bb.1:
	mov	x9, #0                          ; =0x0
	mov	w11, w1
	add	x10, x0, #4
	sub	x11, x11, #1
	b	LBB0_3
LBB0_2:                                 ;   in Loop: Header=BB0_3 Depth=1
	add	x10, x10, #4
	sub	x11, x11, #1
	cmp	x9, x8
	b.eq	LBB0_7
LBB0_3:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_5 Depth 2
	mov	x12, x9
	add	x9, x9, #1
	mov	x13, x11
	mov	x14, x10
	b	LBB0_5
LBB0_4:                                 ;   in Loop: Header=BB0_5 Depth=2
	add	x14, x14, #4
	subs	x13, x13, #1
	b.eq	LBB0_2
LBB0_5:                                 ;   Parent Loop BB0_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	w15, [x0, x12, lsl #2]
	ldr	w16, [x14]
	cmp	w15, w16
	b.le	LBB0_4
; %bb.6:                                ;   in Loop: Header=BB0_5 Depth=2
	str	w16, [x0, x12, lsl #2]
	str	w15, [x14]
	b	LBB0_4
LBB0_7:
	cmp	w1, #1
	b.lt	LBB0_13
; %bb.8:
	mov	x9, #0                          ; =0x0
	mov	w10, #0                         ; =0x0
	b	LBB0_11
LBB0_9:                                 ;   in Loop: Header=BB0_11 Depth=1
	add	x12, x2, w10, sxtw #2
	str	w11, [x12]
	ldr	w11, [x0, w8, sxtw #2]
	sub	w8, w8, #1
	add	w10, w10, #2
	str	w11, [x12, #4]
                                        ; kill: def $w8 killed $w8 def $x8
LBB0_10:                                ;   in Loop: Header=BB0_11 Depth=1
	cmp	x9, w8, sxtw
	add	x9, x9, #1
	b.ge	LBB0_13
LBB0_11:                                ; =>This Inner Loop Header: Depth=1
	ldr	w11, [x0, x9, lsl #2]
	cmp	x9, w8, uxtw
	b.ne	LBB0_9
; %bb.12:                               ;   in Loop: Header=BB0_11 Depth=1
	str	w11, [x2, w10, sxtw #2]
	add	w10, w10, #1
	b	LBB0_10
LBB0_13:
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
