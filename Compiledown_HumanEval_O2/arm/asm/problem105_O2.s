	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 26, 2
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	stp	x22, x21, [sp, #-48]!           ; 16-byte Folded Spill
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	mov	x19, x3
	mov	x22, x2
	mov	x21, x1
	mov	x20, x0
	sbfiz	x0, x21, #2, #32
	bl	_malloc
	str	x0, [x22]
	str	wzr, [x19]
	cmp	w21, #1
	b.lt	LBB0_18
; %bb.1:
	mov	w8, #0                          ; =0x0
	mov	x9, #0                          ; =0x0
	mov	w10, #52429                     ; =0xcccd
	movk	w10, #52428, lsl #16
	mov	w11, w21
	b	LBB0_3
LBB0_2:                                 ;   in Loop: Header=BB0_3 Depth=1
	add	x9, x9, #1
	cmp	x9, x11
	b.eq	LBB0_9
LBB0_3:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_5 Depth 2
	ldr	w12, [x20, x9, lsl #2]
	cmp	w12, #0
	cset	w13, eq
	cmp	w12, #1
	b.lt	LBB0_7
; %bb.4:                                ;   in Loop: Header=BB0_3 Depth=1
	mov	x14, x12
LBB0_5:                                 ;   Parent Loop BB0_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ands	w15, w14, #0x1
	cset	w13, eq
	cmp	w14, #10
	b.lo	LBB0_7
; %bb.6:                                ;   in Loop: Header=BB0_5 Depth=2
	umull	x14, w14, w10
	lsr	x14, x14, #35
	cbnz	w15, LBB0_5
LBB0_7:                                 ;   in Loop: Header=BB0_3 Depth=1
	tbnz	w13, #0, LBB0_2
; %bb.8:                                ;   in Loop: Header=BB0_3 Depth=1
	str	w12, [x0, w8, sxtw #2]
	add	w8, w8, #1
	str	w8, [x19]
	b	LBB0_2
LBB0_9:
	cmp	w8, #2
	b.lt	LBB0_18
; %bb.10:
	mov	w9, #0                          ; =0x0
	sub	w10, w8, #1
	add	x11, x0, #4
	mov	x12, x10
	b	LBB0_12
LBB0_11:                                ;   in Loop: Header=BB0_12 Depth=1
	add	w9, w9, #1
	sub	w12, w12, #1
	cmp	w9, w10
	b.eq	LBB0_18
LBB0_12:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_16 Depth 2
	mov	w12, w12
	sub	w13, w9, w8
	cmn	w13, #2
	b.gt	LBB0_11
; %bb.13:                               ;   in Loop: Header=BB0_12 Depth=1
	ldr	w13, [x0]
	mov	x14, x12
	mov	x15, x11
	b	LBB0_16
LBB0_14:                                ;   in Loop: Header=BB0_16 Depth=2
	stp	w16, w13, [x15, #-4]
LBB0_15:                                ;   in Loop: Header=BB0_16 Depth=2
	add	x15, x15, #4
	subs	x14, x14, #1
	b.eq	LBB0_11
LBB0_16:                                ;   Parent Loop BB0_12 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	w16, [x15]
	cmp	w13, w16
	b.gt	LBB0_14
; %bb.17:                               ;   in Loop: Header=BB0_16 Depth=2
	mov	x13, x16
	b	LBB0_15
LBB0_18:
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp], #48             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
