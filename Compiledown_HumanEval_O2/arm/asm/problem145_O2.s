	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 26, 2
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #288
	stp	x24, x23, [sp, #224]            ; 16-byte Folded Spill
	stp	x22, x21, [sp, #240]            ; 16-byte Folded Spill
	stp	x20, x19, [sp, #256]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #272]            ; 16-byte Folded Spill
	add	x29, sp, #272
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	mov	x19, x1
	mov	x21, x0
Lloh0:
	adrp	x8, ___stack_chk_guard@GOTPAGE
Lloh1:
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
Lloh2:
	ldr	x8, [x8]
	stur	x8, [x29, #-56]
	ldrb	w9, [x0]
	cmp	w9, #47
	b.ne	LBB0_2
; %bb.1:
	mov	w22, #0                         ; =0x0
	mov	x8, #0                          ; =0x0
	b	LBB0_5
LBB0_2:
	mov	x8, #0                          ; =0x0
	add	x10, x21, #1
	add	x11, sp, #115
LBB0_3:                                 ; =>This Inner Loop Header: Depth=1
	strb	w9, [x11, x8]
	ldrb	w9, [x10, x8]
	add	x8, x8, #1
	cmp	w9, #47
	b.ne	LBB0_3
; %bb.4:
	mov	x22, x8
LBB0_5:
	add	x9, sp, #115
	strb	wzr, [x9, x8]
	add	x0, sp, #115
	bl	_atoi
	mov	x20, x0
	add	x8, x21, w22, sxtw
	ldrb	w8, [x8, #1]
	cbz	w8, LBB0_9
; %bb.6:
	mov	x9, #0                          ; =0x0
	add	x10, x21, w22, uxtw
	add	x10, x10, #2
	add	x11, sp, #14
LBB0_7:                                 ; =>This Inner Loop Header: Depth=1
	strb	w8, [x11, x9]
	ldrb	w8, [x10, x9]
	add	x9, x9, #1
	cbnz	w8, LBB0_7
; %bb.8:
	mov	w8, w9
	b	LBB0_10
LBB0_9:
	mov	x8, #0                          ; =0x0
LBB0_10:
	add	x9, sp, #14
	strb	wzr, [x9, x8]
	add	x0, sp, #14
	bl	_atoi
	mov	x21, x0
	ldrb	w9, [x19]
	cmp	w9, #47
	b.ne	LBB0_12
; %bb.11:
	mov	w23, #0                         ; =0x0
	mov	x8, #0                          ; =0x0
	b	LBB0_15
LBB0_12:
	mov	x8, #0                          ; =0x0
	add	x10, x19, #1
	add	x11, sp, #115
LBB0_13:                                ; =>This Inner Loop Header: Depth=1
	strb	w9, [x11, x8]
	ldrb	w9, [x10, x8]
	add	x8, x8, #1
	cmp	w9, #47
	b.ne	LBB0_13
; %bb.14:
	mov	x23, x8
LBB0_15:
	add	x9, sp, #115
	strb	wzr, [x9, x8]
	add	x0, sp, #115
	bl	_atoi
	mov	x22, x0
	add	x8, x19, w23, sxtw
	ldrb	w8, [x8, #1]
	cbz	w8, LBB0_19
; %bb.16:
	mov	x9, #0                          ; =0x0
	add	x10, x19, w23, uxtw
	add	x10, x10, #2
	add	x11, sp, #14
LBB0_17:                                ; =>This Inner Loop Header: Depth=1
	strb	w8, [x11, x9]
	ldrb	w8, [x10, x9]
	add	x9, x9, #1
	cbnz	w8, LBB0_17
; %bb.18:
	mov	w8, w9
	b	LBB0_20
LBB0_19:
	mov	x8, #0                          ; =0x0
LBB0_20:
	add	x9, sp, #14
	strb	wzr, [x9, x8]
	add	x0, sp, #14
	bl	_atoi
	mul	w8, w22, w20
	mul	w9, w0, w21
	sdiv	w10, w8, w9
	msub	w8, w10, w9, w8
	cmp	w8, #0
	cset	w0, eq
	ldur	x8, [x29, #-56]
Lloh3:
	adrp	x9, ___stack_chk_guard@GOTPAGE
Lloh4:
	ldr	x9, [x9, ___stack_chk_guard@GOTPAGEOFF]
Lloh5:
	ldr	x9, [x9]
	cmp	x9, x8
	b.ne	LBB0_22
; %bb.21:
	ldp	x29, x30, [sp, #272]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #256]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #240]            ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #224]            ; 16-byte Folded Reload
	add	sp, sp, #288
	ret
LBB0_22:
	bl	___stack_chk_fail
	.loh AdrpLdrGotLdr	Lloh0, Lloh1, Lloh2
	.loh AdrpLdrGotLdr	Lloh3, Lloh4, Lloh5
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
