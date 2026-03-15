	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 26, 2
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
	bl	_strlen
	cmp	w0, #2
	b.ge	LBB0_2
; %bb.1:
	mov	w0, #1                          ; =0x1
	b	LBB0_8
LBB0_2:
	ldrb	w8, [x19]
	sub	w9, w0, #1
	ldrb	w9, [x19, w9, sxtw]
	cmp	w8, w9
	b.ne	LBB0_7
; %bb.3:
	ubfx	x8, x0, #1, #30
	mov	x9, #-8589934592                ; =0xfffffffe00000000
	add	x9, x9, x0, lsl #32
	mov	w12, #1                         ; =0x1
	mov	x10, #-4294967296               ; =0xffffffff00000000
LBB0_4:                                 ; =>This Inner Loop Header: Depth=1
	mov	x11, x12
	cmp	x8, x12
	b.eq	LBB0_6
; %bb.5:                                ;   in Loop: Header=BB0_4 Depth=1
	ldrb	w13, [x19, x11]
	asr	x12, x9, #32
	ldrb	w14, [x19, x12]
	add	x9, x9, x10
	add	x12, x11, #1
	cmp	w13, w14
	b.eq	LBB0_4
LBB0_6:
	cmp	x11, x8
	cset	w0, hs
	b	LBB0_8
LBB0_7:
	mov	w0, #0                          ; =0x0
LBB0_8:
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
