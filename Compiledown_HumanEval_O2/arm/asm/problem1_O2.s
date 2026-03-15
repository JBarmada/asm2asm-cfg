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
	mov	x12, #0                         ; =0x0
	mov	w8, w1
	add	x9, x0, #4
	sub	x10, x8, #1
	b	LBB0_3
LBB0_2:                                 ;   in Loop: Header=BB0_3 Depth=1
	add	x9, x9, #4
	sub	x10, x10, #1
	mov	x12, x11
	cmp	x11, x8
	b.eq	LBB0_8
LBB0_3:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_5 Depth 2
	add	x11, x12, #1
	cmp	x11, x8
	b.hs	LBB0_2
; %bb.4:                                ;   in Loop: Header=BB0_3 Depth=1
	ldr	s1, [x0, x12, lsl #2]
	mov	x12, x10
	mov	x13, x9
LBB0_5:                                 ;   Parent Loop BB0_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	s2, [x13]
	fabd	s2, s1, s2
	fcmp	s2, s0
	b.mi	LBB0_7
; %bb.6:                                ;   in Loop: Header=BB0_5 Depth=2
	add	x13, x13, #4
	subs	x12, x12, #1
	b.ne	LBB0_5
	b	LBB0_2
LBB0_7:
	mov	w0, #1                          ; =0x1
	ret
LBB0_8:
	mov	w0, #10                         ; =0xa
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
