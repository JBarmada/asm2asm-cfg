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
	mov	x22, x2
	str	w1, [x3]
	cbz	w1, LBB0_13
; %bb.1:
	mov	x20, x1
	mov	x21, x0
	sbfiz	x0, x20, #2, #32
	bl	_malloc
	str	x0, [x22]
	cbz	x0, LBB0_15
; %bb.2:
	mov	x19, x0
	subs	w22, w20, #1
	b.lt	LBB0_4
; %bb.3:
	mov	x8, x20
	ubfiz	x2, x8, #2, #32
	mov	x0, x19
	mov	x1, x21
	bl	_memcpy
LBB0_4:
	cmp	w20, #1
	b.le	LBB0_14
; %bb.5:
	mov	x8, #0                          ; =0x0
	ldr	w9, [x21, w22, sxtw #2]
	ldr	w10, [x21]
	add	w9, w9, w10
	and	w9, w9, #0x80000001
	mov	w11, w20
	add	x10, x19, #4
	sub	x11, x11, #1
	b	LBB0_7
LBB0_6:                                 ;   in Loop: Header=BB0_7 Depth=1
	add	x10, x10, #4
	sub	x11, x11, #1
	cmp	x8, x22
	b.eq	LBB0_14
LBB0_7:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_10 Depth 2
	mov	x12, x8
	add	x8, x8, #1
	mov	x13, x11
	mov	x14, x10
	b	LBB0_10
LBB0_8:                                 ;   in Loop: Header=BB0_10 Depth=2
	str	w16, [x19, x12, lsl #2]
	str	w15, [x14]
LBB0_9:                                 ;   in Loop: Header=BB0_10 Depth=2
	add	x14, x14, #4
	subs	x13, x13, #1
	b.eq	LBB0_6
LBB0_10:                                ;   Parent Loop BB0_7 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	w15, [x19, x12, lsl #2]
	ldr	w16, [x14]
	cmp	w9, #1
	b.ne	LBB0_12
; %bb.11:                               ;   in Loop: Header=BB0_10 Depth=2
	cmp	w15, w16
	b.gt	LBB0_8
	b	LBB0_9
LBB0_12:                                ;   in Loop: Header=BB0_10 Depth=2
	cmp	w15, w16
	b.lt	LBB0_8
	b	LBB0_9
LBB0_13:
	str	xzr, [x22]
LBB0_14:
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp], #48             ; 16-byte Folded Reload
	ret
LBB0_15:
	mov	w0, #1                          ; =0x1
	bl	_exit
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
