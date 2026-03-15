	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 26, 2
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	cmp	w1, #2
	b.ge	LBB0_3
LBB0_1:
	mov	w0, #1                          ; =0x1
LBB0_2:
	ret
LBB0_3:
	ldp	w9, w8, [x0]
	cmp	w8, w9
	b.ge	LBB0_5
LBB0_4:
	mov	w0, #0                          ; =0x0
	ret
LBB0_5:
	mov	x8, x0
	cmp	w1, #2
	cset	w0, eq
	b.eq	LBB0_2
; %bb.6:
	mov	w9, w1
	add	x8, x8, #8
	sub	x9, x9, #2
	b	LBB0_8
LBB0_7:                                 ;   in Loop: Header=BB0_8 Depth=1
	add	x8, x8, #4
	subs	x9, x9, #1
	b.eq	LBB0_1
LBB0_8:                                 ; =>This Inner Loop Header: Depth=1
	ldp	w11, w10, [x8, #-4]
	cmp	w10, w11
	b.lt	LBB0_4
; %bb.9:                                ;   in Loop: Header=BB0_8 Depth=1
	b.ne	LBB0_7
; %bb.10:                               ;   in Loop: Header=BB0_8 Depth=1
	ldur	w11, [x8, #-8]
	cmp	w10, w11
	b.ne	LBB0_7
	b	LBB0_4
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
