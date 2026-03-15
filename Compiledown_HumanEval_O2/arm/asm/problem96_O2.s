	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 26, 2
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	cbz	w1, LBB0_15
; %bb.1:
	cmp	w1, #1
	b.lt	LBB0_18
; %bb.2:
	stp	x28, x27, [sp, #-96]!           ; 16-byte Folded Spill
	stp	x26, x25, [sp, #16]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #32]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #48]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #64]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #80]             ; 16-byte Folded Spill
	add	x29, sp, #80
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
	.cfi_offset w27, -88
	.cfi_offset w28, -96
	mov	x19, x0
	mov	x21, #0                         ; =0x0
	mov	w26, #0                         ; =0x0
	mov	w22, #0                         ; =0x0
	mov	w23, #0                         ; =0x0
Lloh0:
	adrp	x24, __DefaultRuneLocale@GOTPAGE
Lloh1:
	ldr	x24, [x24, __DefaultRuneLocale@GOTPAGEOFF]
	mov	w25, w1
	b	LBB0_4
LBB0_3:                                 ;   in Loop: Header=BB0_4 Depth=1
	add	x21, x21, #1
	mov	w0, #1                          ; =0x1
	cmp	x21, x25
	cset	w26, hs
	b.eq	LBB0_17
LBB0_4:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_6 Depth 2
	lsl	x8, x21, #4
	ldr	x8, [x19, x8]
	ldrb	w20, [x8]
	cbz	w20, LBB0_3
; %bb.5:                                ;   in Loop: Header=BB0_4 Depth=1
	add	x27, x8, #1
LBB0_6:                                 ;   Parent Loop BB0_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	tbnz	w20, #7, LBB0_9
; %bb.7:                                ;   in Loop: Header=BB0_6 Depth=2
	add	x8, x24, w20, uxtw #2
	ldr	w8, [x8, #60]
	tbz	w8, #8, LBB0_16
; %bb.8:                                ;   in Loop: Header=BB0_6 Depth=2
	tst	w8, #0x8000
	csinc	w22, w22, wzr, eq
	b	LBB0_11
LBB0_9:                                 ;   in Loop: Header=BB0_6 Depth=2
	mov	x0, x20
	mov	w1, #256                        ; =0x100
	bl	___maskrune
	cbz	w0, LBB0_16
; %bb.10:                               ;   in Loop: Header=BB0_6 Depth=2
	mov	x0, x20
	mov	w1, #32768                      ; =0x8000
	bl	___maskrune
	ldurb	w20, [x27, #-1]
	cmp	w0, #0
	csinc	w22, w22, wzr, eq
	tbnz	w20, #7, LBB0_14
LBB0_11:                                ;   in Loop: Header=BB0_6 Depth=2
	add	x8, x24, w20, uxtw #2
	ldr	w8, [x8, #60]
	and	w0, w8, #0x1000
LBB0_12:                                ;   in Loop: Header=BB0_6 Depth=2
	cmp	w0, #0
	csinc	w23, w23, wzr, eq
	add	w8, w23, w22
	cmp	w8, #2
	b.eq	LBB0_16
; %bb.13:                               ;   in Loop: Header=BB0_6 Depth=2
	ldrb	w20, [x27], #1
	cbnz	w20, LBB0_6
	b	LBB0_3
LBB0_14:                                ;   in Loop: Header=BB0_6 Depth=2
	mov	x0, x20
	mov	w1, #4096                       ; =0x1000
	bl	___maskrune
	b	LBB0_12
LBB0_15:
	mov	w0, #0                          ; =0x0
	ret
LBB0_16:
	and	w0, w26, #0x1
LBB0_17:
	ldp	x29, x30, [sp, #80]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #16]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp], #96             ; 16-byte Folded Reload
	ret
LBB0_18:
	mov	w0, #1                          ; =0x1
	ret
	.loh AdrpLdrGot	Lloh0, Lloh1
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
