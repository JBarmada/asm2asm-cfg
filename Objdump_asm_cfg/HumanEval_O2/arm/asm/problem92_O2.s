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
	ldrb	w8, [x0]
	cbz	w8, LBB0_14
; %bb.1:
	mov	x19, x0
	mov	w20, #0                         ; =0x0
	mov	w23, #0                         ; =0x0
	mov	w22, #1                         ; =0x1
Lloh0:
	adrp	x24, __DefaultRuneLocale@GOTPAGE
Lloh1:
	ldr	x24, [x24, __DefaultRuneLocale@GOTPAGEOFF]
	mov	x25, #70377334112256            ; =0x400200000000
	movk	x25, #32768, lsl #48
	mov	w26, #1                         ; =0x1
LBB0_2:                                 ; =>This Inner Loop Header: Depth=1
	sxtb	w0, w8
	tbnz	w8, #7, LBB0_4
; %bb.3:                                ;   in Loop: Header=BB0_2 Depth=1
	add	x9, x24, w0, uxtw #2
	ldr	w9, [x9, #60]
	and	w21, w9, #0x4000
	b	LBB0_5
LBB0_4:                                 ;   in Loop: Header=BB0_2 Depth=1
	mov	w1, #16384                      ; =0x4000
	bl	___maskrune
	mov	x21, x0
	ldrb	w8, [x19]
LBB0_5:                                 ;   in Loop: Header=BB0_2 Depth=1
	cmp	w21, #0
	ccmp	w23, #0, #4, ne
	cinc	w20, w20, ne
	and	w9, w8, #0xff
	cmp	w9, #73
	ccmp	w26, #0, #4, eq
	b.ne	LBB0_8
; %bb.6:                                ;   in Loop: Header=BB0_2 Depth=1
	sxtb	w0, w8
	tbnz	w8, #7, LBB0_11
; %bb.7:                                ;   in Loop: Header=BB0_2 Depth=1
	cmp	w21, #0
	add	x9, x24, w0, uxtw #2
	ldr	w9, [x9, #60]
	and	w9, w9, #0x4000
	ccmp	w9, #0, #4, eq
	csel	w23, wzr, w23, eq
	and	w0, w8, #0xff
	b	LBB0_9
LBB0_8:                                 ;   in Loop: Header=BB0_2 Depth=1
	mov	w0, #73                         ; =0x49
	mov	w23, #1                         ; =0x1
	mov	w8, #73                         ; =0x49
LBB0_9:                                 ;   in Loop: Header=BB0_2 Depth=1
	add	x9, x24, w0, uxtw #2
	ldr	w9, [x9, #60]
	and	w0, w9, #0x4000
LBB0_10:                                ;   in Loop: Header=BB0_2 Depth=1
	cmp	w0, #0
	csel	w9, wzr, w26, eq
	and	w10, w8, #0xff
	and	x8, x8, #0xff
	lsl	x8, x22, x8
	tst	x8, x25
	csel	w8, w22, w9, ne
	cmp	w10, #63
	csel	w26, w9, w8, hi
	ldrb	w8, [x19, #1]!
	cbnz	w8, LBB0_2
	b	LBB0_15
LBB0_11:                                ;   in Loop: Header=BB0_2 Depth=1
	mov	w1, #16384                      ; =0x4000
	bl	___maskrune
	mov	x8, x0
	cmp	w21, #0
	ldrsb	w0, [x19]
	ccmp	w8, #0, #4, eq
	csel	w23, wzr, w23, eq
	tbnz	w0, #31, LBB0_13
; %bb.12:                               ;   in Loop: Header=BB0_2 Depth=1
	mov	x8, x0
	b	LBB0_9
LBB0_13:                                ;   in Loop: Header=BB0_2 Depth=1
	mov	w1, #16384                      ; =0x4000
	bl	___maskrune
	ldrb	w8, [x19]
	b	LBB0_10
LBB0_14:
	mov	w20, #0                         ; =0x0
LBB0_15:
	mov	x0, x20
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
