	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 26, 2
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	cmp	w1, #1
	b.lt	LBB0_8
; %bb.1:
	mov	x11, #0                         ; =0x0
	mov	w8, w1
	add	x9, x0, #4
	sub	x10, x8, #1
	b	LBB0_3
LBB0_2:                                 ;   in Loop: Header=BB0_3 Depth=1
	add	x9, x9, #4
	sub	x10, x10, #1
	mov	x11, x12
	cmp	x12, x8
	b.eq	LBB0_8
LBB0_3:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_6 Depth 2
	add	x12, x11, #1
	cmp	x12, x8
	b.hs	LBB0_2
; %bb.4:                                ;   in Loop: Header=BB0_3 Depth=1
	mov	x13, x10
	mov	x14, x9
	b	LBB0_6
LBB0_5:                                 ;   in Loop: Header=BB0_6 Depth=2
	add	x14, x14, #4
	subs	x13, x13, #1
	b.eq	LBB0_2
LBB0_6:                                 ;   Parent Loop BB0_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	s0, [x0, x11, lsl #2]
	ldr	s1, [x14]
	fcmp	s0, s1
	b.le	LBB0_5
; %bb.7:                                ;   in Loop: Header=BB0_6 Depth=2
	str	s1, [x0, x11, lsl #2]
	str	s0, [x14]
	b	LBB0_5
LBB0_8:
	and	w8, w1, #0x80000001
	cmp	w8, #1
	b.ne	LBB0_10
; %bb.9:
	lsr	w8, w1, #1
	ldr	s0, [x0, w8, uxtw #2]
	ret
LBB0_10:
	add	w8, w1, w1, lsr #31
	asr	w8, w8, #1
	add	x8, x0, w8, sxtw #2
	ldp	s1, s0, [x8, #-4]
	fadd	s0, s0, s1
	fmov	s1, #0.50000000
	fmul	s0, s0, s1
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
