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
	mov	x19, x0
	bl	_strlen
	cbz	w0, LBB0_10
; %bb.1:
	lsl	x20, x0, #32
	mov	x8, #-4294967296                ; =0xffffffff00000000
	add	x8, x20, x8
	asr	x8, x8, #32
	ldrsb	x8, [x19, x8]
	tbnz	x8, #63, LBB0_6
; %bb.2:
Lloh0:
	adrp	x9, __DefaultRuneLocale@GOTPAGE
Lloh1:
	ldr	x9, [x9, __DefaultRuneLocale@GOTPAGEOFF]
	add	x8, x9, x8, lsl #2
	ldr	w8, [x8, #60]
	and	w8, w8, #0x100
	cbz	w8, LBB0_7
LBB0_3:
	cmp	w0, #1
	b.eq	LBB0_10
; %bb.4:
	mov	x8, #-8589934592                ; =0xfffffffe00000000
	add	x8, x20, x8
	asr	x8, x8, #32
	ldrsb	x8, [x19, x8]
	tbnz	x8, #63, LBB0_8
; %bb.5:
Lloh2:
	adrp	x9, __DefaultRuneLocale@GOTPAGE
Lloh3:
	ldr	x9, [x9, __DefaultRuneLocale@GOTPAGEOFF]
	add	x8, x9, x8, lsl #2
	ldr	w8, [x8, #60]
	and	w0, w8, #0x100
	b	LBB0_9
LBB0_6:
	mov	x21, x0
	and	w0, w8, #0xff
	mov	w1, #256                        ; =0x100
	bl	___maskrune
	mov	x8, x0
	mov	x0, x21
	cbnz	w8, LBB0_3
LBB0_7:
	mov	w0, #0                          ; =0x0
	b	LBB0_10
LBB0_8:
	and	w0, w8, #0xff
	mov	w1, #256                        ; =0x100
	bl	___maskrune
LBB0_9:
	cmp	w0, #0
	cset	w0, eq
LBB0_10:
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp], #48             ; 16-byte Folded Reload
	ret
	.loh AdrpLdrGot	Lloh0, Lloh1
	.loh AdrpLdrGot	Lloh2, Lloh3
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
