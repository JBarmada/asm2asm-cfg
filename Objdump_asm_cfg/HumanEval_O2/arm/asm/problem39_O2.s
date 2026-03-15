	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 26, 2
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #112
	stp	x28, x27, [sp, #16]             ; 16-byte Folded Spill
	stp	x26, x25, [sp, #32]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #48]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #64]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #80]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #96]             ; 16-byte Folded Spill
	add	x29, sp, #96
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
	mov	x19, x1
	mov	x20, x0
	bl	_strlen
	mov	x21, x0
	cmp	w21, #1
	b.lt	LBB0_7
; %bb.1:
	add	w8, w21, #2
	mov	w9, #43691                      ; =0xaaab
	movk	w9, #43690, lsl #16
	umull	x8, w8, w9
	lsr	x23, x8, #33
	and	x24, x21, #0x7fffffff
	mov	w25, #3                         ; =0x3
	add	x26, sp, #12
	mov	w27, #3                         ; =0x3
	b	LBB0_4
LBB0_2:                                 ;   in Loop: Header=BB0_4 Depth=1
	ldrb	w9, [sp, #12]
	strb	w8, [sp, #12]
	ldrb	w8, [sp, #14]
	strb	w8, [sp, #13]
	strb	w9, [sp, #14]
LBB0_3:                                 ;   in Loop: Header=BB0_4 Depth=1
	add	x1, sp, #12
	mov	x0, x20
	mov	x2, x22
	bl	_strncpy
	add	x20, x20, #3
	sub	w21, w21, #3
	add	x27, x27, #3
	subs	x23, x23, #1
	b.eq	LBB0_7
LBB0_4:                                 ; =>This Inner Loop Header: Depth=1
	cmp	x27, x24
	csel	w28, w21, w25, hi
	sxtw	x22, w28
	add	x0, sp, #12
	mov	x1, x20
	mov	x2, x22
	mov	w3, #4                          ; =0x4
	bl	___strncpy_chk
	strb	wzr, [x26, x22]
	cmp	w28, #3
	b.ne	LBB0_3
; %bb.5:                                ;   in Loop: Header=BB0_4 Depth=1
	ldrb	w8, [sp, #13]
	cbz	w19, LBB0_2
; %bb.6:                                ;   in Loop: Header=BB0_4 Depth=1
	ldrb	w9, [sp, #14]
	strb	w8, [sp, #14]
	ldrb	w8, [sp, #12]
	strb	w8, [sp, #13]
	strb	w9, [sp, #12]
	b	LBB0_3
LBB0_7:
	ldp	x29, x30, [sp, #96]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #80]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #32]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #112
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
