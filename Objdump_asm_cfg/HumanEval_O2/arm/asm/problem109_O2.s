	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 26, 2
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	cmp	w1, #1
	b.lt	LBB0_10
; %bb.1:
	mov	x9, #0                          ; =0x0
	mov	w8, #0                          ; =0x0
	mov	w10, #52429                     ; =0xcccd
	movk	w10, #52428, lsl #16
	mov	w11, #10                        ; =0xa
	mov	w12, w1
	b	LBB0_4
LBB0_2:                                 ;   in Loop: Header=BB0_4 Depth=1
	mov	w13, #1                         ; =0x1
LBB0_3:                                 ;   in Loop: Header=BB0_4 Depth=1
	add	w8, w8, w13
	add	x9, x9, #1
	cmp	x9, x12
	b.eq	LBB0_11
LBB0_4:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_7 Depth 2
	ldr	w14, [x0, x9, lsl #2]
	cmp	w14, #0
	b.gt	LBB0_2
; %bb.5:                                ;   in Loop: Header=BB0_4 Depth=1
	neg	w14, w14
	cmp	w14, #10
	b.lo	LBB0_8
; %bb.6:                                ;   in Loop: Header=BB0_4 Depth=1
	mov	w13, #0                         ; =0x0
LBB0_7:                                 ;   Parent Loop BB0_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	umull	x15, w14, w10
	lsr	x15, x15, #35
	msub	w16, w15, w11, w14
	add	w13, w16, w13
	cmp	w14, #99
	mov	x14, x15
	b.hi	LBB0_7
	b	LBB0_9
LBB0_8:                                 ;   in Loop: Header=BB0_4 Depth=1
	mov	w13, #0                         ; =0x0
	mov	x15, x14
LBB0_9:                                 ;   in Loop: Header=BB0_4 Depth=1
	cmp	w13, w15
	cset	w13, hi
	b	LBB0_3
LBB0_10:
	mov	w8, #0                          ; =0x0
LBB0_11:
	mov	x0, x8
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
