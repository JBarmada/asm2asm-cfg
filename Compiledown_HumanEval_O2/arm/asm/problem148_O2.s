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
	mov	x22, x0
	mov	w24, w0
	ubfiz	x0, x22, #2, #32
	bl	_malloc
	mov	x19, x0
	add	w23, w22, #1
	sbfiz	x21, x23, #3, #32
	mov	x0, x21
	bl	_malloc
	mov	x20, x0
	mov	x0, x21
	bl	_malloc
	mov	x21, x0
	mov	x25, #0                         ; =0x0
	ubfiz	x8, x22, #3, #32
	add	x26, x8, #8
LBB0_1:                                 ; =>This Inner Loop Header: Depth=1
	mov	w0, #3                          ; =0x3
	mov	w1, #4                          ; =0x4
	bl	_calloc
	str	x0, [x20, x25]
	mov	w0, #3                          ; =0x3
	mov	w1, #4                          ; =0x4
	bl	_calloc
	str	x0, [x21, x25]
	add	x25, x25, #8
	cmp	x26, x25
	b.ne	LBB0_1
; %bb.2:
	ldr	x8, [x20]
	ldr	x9, [x21]
	str	wzr, [x8, #8]
	movi.2d	v0, #0000000000000000
	str	d0, [x8]
	str	wzr, [x9, #8]
	str	d0, [x9]
	cbz	w22, LBB0_7
; %bb.3:
	mov	x12, #0                         ; =0x0
	add	x9, x20, #8
	mov	w10, #1                         ; =0x1
	mov	w11, #21846                     ; =0x5556
	movk	w11, #21845, lsl #16
LBB0_4:                                 ; =>This Inner Loop Header: Depth=1
	add	x13, x12, #1
	madd	w14, w12, w13, w10
	smull	x15, w14, w11
	lsr	x16, x15, #63
	lsr	x15, x15, #32
	add	w15, w15, w16
	add	w15, w15, w15, lsl #1
	sub	w14, w14, w15
	str	w14, [x19, x12, lsl #2]
	ldr	x15, [x9, x12, lsl #3]
	ldr	w12, [x8]
	str	w12, [x15]
	ldr	w12, [x8, #4]
	str	w12, [x15, #4]
	ldr	w8, [x8, #8]
	str	w8, [x15, #8]
	ldr	w8, [x15, w14, sxtw #2]
	add	w8, w8, #1
	str	w8, [x15, w14, sxtw #2]
	mov	x12, x13
	mov	x8, x15
	cmp	x24, x13
	b.ne	LBB0_4
; %bb.5:
	add	x8, x21, #8
	mov	w9, #21846                      ; =0x5556
	movk	w9, #21845, lsl #16
	mov	x10, x24
	mov	x11, x19
	mov	x12, x20
LBB0_6:                                 ; =>This Inner Loop Header: Depth=1
	ldp	x13, x14, [x8, #-8]
	ldr	w15, [x13]
	str	w15, [x14]
	ldr	w15, [x13, #4]
	str	w15, [x14, #4]
	ldr	w13, [x13, #8]
	ldr	x15, [x12], #8
	str	w13, [x14, #8]
	ldrsw	x13, [x11], #4
	smull	x16, w13, w9
	lsr	x17, x16, #63
	lsr	x16, x16, #32
	ldr	w0, [x15]
	add	w16, w16, w17
	add	w16, w16, w16, lsl #1
	sub	w16, w13, w16
	ldr	w17, [x14, w16, sxtw #2]
	add	w17, w17, w0
	str	w17, [x14, w16, sxtw #2]
	add	w16, w13, #1
	smull	x17, w16, w9
	lsr	x0, x17, #63
	ldr	w1, [x15, #4]
	lsr	x17, x17, #32
	add	w17, w17, w0
	add	w17, w17, w17, lsl #1
	sub	w16, w16, w17
	ldr	w17, [x14, w16, sxtw #2]
	add	w17, w17, w1
	add	w13, w13, #2
	smull	x0, w13, w9
	lsr	x1, x0, #63
	str	w17, [x14, w16, sxtw #2]
	lsr	x16, x0, #32
	add	w16, w16, w1
	add	w16, w16, w16, lsl #1
	sub	w13, w13, w16
	ldr	w16, [x14, w13, sxtw #2]
	ldr	w15, [x15, #8]
	add	w15, w16, w15
	str	w15, [x14, w13, sxtw #2]
	add	x8, x8, #8
	subs	x10, x10, #1
	b.ne	LBB0_6
LBB0_7:
	tbnz	w22, #31, LBB0_17
; %bb.8:
	mov	x8, x23
	mov	x9, x21
	mov	x10, x20
LBB0_9:                                 ; =>This Inner Loop Header: Depth=1
	ldr	x11, [x9], #8
	ldr	x12, [x10], #8
	ldr	w13, [x11]
	str	w13, [x12]
	str	wzr, [x11]
	ldr	w13, [x11, #4]
	str	w13, [x12, #4]
	str	wzr, [x11, #4]
	ldr	w13, [x11, #8]
	str	w13, [x12, #8]
	str	wzr, [x11, #8]
	subs	x8, x8, #1
	b.ne	LBB0_9
; %bb.10:
	cbz	w22, LBB0_13
; %bb.11:
	add	x8, x21, #8
	mov	w9, #21846                      ; =0x5556
	movk	w9, #21845, lsl #16
	mov	x10, x20
	mov	x11, x19
	mov	x12, x24
LBB0_12:                                ; =>This Inner Loop Header: Depth=1
	ldp	x13, x14, [x8, #-8]
	ldr	w15, [x13]
	str	w15, [x14]
	ldr	w15, [x13, #4]
	str	w15, [x14, #4]
	ldr	w13, [x13, #8]
	ldr	x15, [x10], #8
	str	w13, [x14, #8]
	ldrsw	x13, [x11], #4
	smull	x16, w13, w9
	lsr	x17, x16, #63
	lsr	x16, x16, #32
	ldr	w0, [x15]
	add	w16, w16, w17
	add	w16, w16, w16, lsl #1
	sub	w16, w13, w16
	ldr	w17, [x14, w16, sxtw #2]
	add	w17, w17, w0
	str	w17, [x14, w16, sxtw #2]
	add	w16, w13, #1
	smull	x17, w16, w9
	lsr	x0, x17, #63
	ldr	w1, [x15, #4]
	lsr	x17, x17, #32
	add	w17, w17, w0
	add	w17, w17, w17, lsl #1
	sub	w16, w16, w17
	ldr	w17, [x14, w16, sxtw #2]
	add	w17, w17, w1
	add	w13, w13, #2
	smull	x0, w13, w9
	lsr	x1, x0, #63
	str	w17, [x14, w16, sxtw #2]
	lsr	x16, x0, #32
	add	w16, w16, w1
	add	w16, w16, w16, lsl #1
	sub	w13, w13, w16
	ldr	w16, [x14, w13, sxtw #2]
	ldr	w15, [x15, #8]
	add	w15, w16, w15
	str	w15, [x14, w13, sxtw #2]
	add	x8, x8, #8
	subs	x12, x12, #1
	b.ne	LBB0_12
LBB0_13:
	mov	x8, x21
	mov	x9, x20
	mov	x10, x23
LBB0_14:                                ; =>This Inner Loop Header: Depth=1
	ldr	x11, [x8], #8
	ldr	x12, [x9], #8
	ldr	w13, [x11]
	str	w13, [x12]
	str	wzr, [x11]
	ldr	w13, [x11, #4]
	str	w13, [x12, #4]
	str	wzr, [x11, #4]
	ldr	w13, [x11, #8]
	str	w13, [x12, #8]
	str	wzr, [x11, #8]
	subs	x10, x10, #1
	b.ne	LBB0_14
; %bb.15:
	ldr	x8, [x20, x24, lsl #3]
	ldr	w22, [x8]
	mov	x24, x20
	mov	x25, x21
LBB0_16:                                ; =>This Inner Loop Header: Depth=1
	ldr	x0, [x24], #8
	bl	_free
	ldr	x0, [x25], #8
	bl	_free
	subs	x23, x23, #1
	b.ne	LBB0_16
	b	LBB0_18
LBB0_17:
	ldr	x8, [x20, x24, lsl #3]
	ldr	w22, [x8]
LBB0_18:
	mov	x0, x20
	bl	_free
	mov	x0, x21
	bl	_free
	mov	x0, x19
	bl	_free
	mov	x0, x22
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp], #80             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
