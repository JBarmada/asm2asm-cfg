	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 26, 2
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	stp	x26, x25, [sp, #-80]!           ; 16-byte Folded Spill
	stp	x24, x23, [sp, #16]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #32]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #48]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	.cfi_offset w25, -72
	.cfi_offset w26, -80
	mov	x19, x0
	bl	_strlen
	mov	x20, x0
	cmp	w20, #1
	b.lt	LBB0_13
; %bb.1:
	mov	w22, #0                         ; =0x0
	and	x23, x20, #0x7fffffff
Lloh0:
	adrp	x24, __DefaultRuneLocale@GOTPAGE
Lloh1:
	ldr	x24, [x24, __DefaultRuneLocale@GOTPAGEOFF]
	mov	x25, x19
	b	LBB0_4
LBB0_2:                                 ;   in Loop: Header=BB0_4 Depth=1
	add	w22, w22, #1
LBB0_3:                                 ;   in Loop: Header=BB0_4 Depth=1
	add	x25, x25, #1
	subs	x23, x23, #1
	b.eq	LBB0_14
LBB0_4:                                 ; =>This Inner Loop Header: Depth=1
	ldrsb	w8, [x25]
	and	w21, w8, #0xff
	tbnz	w8, #31, LBB0_8
; %bb.5:                                ;   in Loop: Header=BB0_4 Depth=1
	add	x8, x24, w21, uxtw #2
	ldr	w8, [x8, #60]
	tbz	w8, #8, LBB0_2
; %bb.6:                                ;   in Loop: Header=BB0_4 Depth=1
	tbnz	w8, #15, LBB0_10
; %bb.7:                                ;   in Loop: Header=BB0_4 Depth=1
	and	w0, w8, #0x1000
	cbnz	w0, LBB0_12
	b	LBB0_3
LBB0_8:                                 ;   in Loop: Header=BB0_4 Depth=1
	mov	x0, x21
	mov	w1, #256                        ; =0x100
	bl	___maskrune
	cbz	w0, LBB0_2
; %bb.9:                                ;   in Loop: Header=BB0_4 Depth=1
	mov	x0, x21
	mov	w1, #32768                      ; =0x8000
	bl	___maskrune
	cbz	w0, LBB0_11
LBB0_10:                                ;   in Loop: Header=BB0_4 Depth=1
	mov	x0, x21
	bl	___tolower
	strb	w0, [x25]
	b	LBB0_3
LBB0_11:                                ;   in Loop: Header=BB0_4 Depth=1
	mov	x0, x21
	mov	w1, #4096                       ; =0x1000
	bl	___maskrune
	cbz	w0, LBB0_3
LBB0_12:                                ;   in Loop: Header=BB0_4 Depth=1
	mov	x0, x21
	bl	___toupper
	strb	w0, [x25]
	b	LBB0_3
LBB0_13:
	mov	w22, #0                         ; =0x0
LBB0_14:
	cmp	w22, w20
	b.ne	LBB0_23
; %bb.15:
	cmp	w20, #2
	b.lt	LBB0_23
; %bb.16:
	mov	x11, #0                         ; =0x0
	and	x9, x20, #0x7fffffff
	ubfx	x12, x20, #1, #30
	sub	x13, x12, #1
	mov	x8, #-6148914691236517206       ; =0xaaaaaaaaaaaaaaaa
	movk	x8, #43691
	umulh	x8, x13, x8
	lsr	x8, x8, #2
	mov	w10, #6                         ; =0x6
	msub	x8, x8, x10, x13
	add	x10, x8, #1
	cmp	x10, #6
	csinc	x8, xzr, x8, eq
	cmp	x13, #5
	b.lo	LBB0_20
; %bb.17:
	add	x11, x19, x9
	sub	x12, x12, x8
	add	x13, x19, #2
	add	x14, x9, x19
	sub	x15, x14, #3
	mov	w14, #5                         ; =0x5
LBB0_18:                                ; =>This Inner Loop Header: Depth=1
	sub	x16, x14, #5
	ldurb	w17, [x13, #-2]
	ldrb	w0, [x15, #2]
	sturb	w0, [x13, #-2]
	strb	w17, [x15, #2]
	eor	x16, x16, #0xfffffffffffffffe
	ldrb	w17, [x11, x16]
	ldurb	w0, [x13, #-1]
	sturb	w17, [x13, #-1]
	strb	w0, [x11, x16]
	ldrb	w16, [x13]
	ldrb	w17, [x15]
	strb	w17, [x13]
	strb	w16, [x15]
	ldrb	w16, [x13, #1]
	ldurb	w17, [x15, #-1]
	strb	w17, [x13, #1]
	sturb	w16, [x15, #-1]
	ldrb	w16, [x13, #2]
	ldurb	w17, [x15, #-2]
	strb	w17, [x13, #2]
	sturb	w16, [x15, #-2]
	ldrb	w16, [x13, #3]
	ldurb	w17, [x15, #-3]
	strb	w17, [x13, #3]
	sturb	w16, [x15, #-3]
	add	x14, x14, #6
	sub	x15, x15, #6
	add	x13, x13, #6
	sub	x12, x12, #6
	cbnz	x12, LBB0_18
; %bb.19:
	sub	x11, x14, #5
LBB0_20:
	cmp	x10, #6
	b.eq	LBB0_23
; %bb.21:
	mvn	x10, x11
	add	x10, x19, x10
	add	x9, x10, x9
	add	x10, x19, x11
LBB0_22:                                ; =>This Inner Loop Header: Depth=1
	ldrb	w11, [x10]
	ldrb	w12, [x9]
	strb	w12, [x10], #1
	strb	w11, [x9], #-1
	subs	x8, x8, #1
	b.ne	LBB0_22
LBB0_23:
	mov	x0, x19
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp], #80             ; 16-byte Folded Reload
	ret
	.loh AdrpLdrGot	Lloh0, Lloh1
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
