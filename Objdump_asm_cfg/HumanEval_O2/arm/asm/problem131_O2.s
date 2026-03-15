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
	add	w20, w0, #1
	sbfiz	x0, x20, #2, #32
	bl	_malloc
	mov	w8, #1                          ; =0x1
	str	w8, [x0]
	cbz	w19, LBB0_6
; %bb.1:
	mov	w8, #3                          ; =0x3
	str	w8, [x0, #4]
	cmp	w19, #2
	b.lt	LBB0_6
; %bb.2:
	mov	w8, #2                          ; =0x2
	b	LBB0_4
LBB0_3:                                 ;   in Loop: Header=BB0_4 Depth=1
	lsr	w9, w8, #1
	add	w9, w9, #1
	str	w9, [x0, x8, lsl #2]
	add	x8, x8, #1
	cmp	x8, x20
	b.eq	LBB0_6
LBB0_4:                                 ; =>This Inner Loop Header: Depth=1
	tbz	w8, #0, LBB0_3
; %bb.5:                                ;   in Loop: Header=BB0_4 Depth=1
	add	x9, x0, x8, lsl #2
	ldp	w11, w10, [x9, #-8]
	add	x8, x8, #1
	add	w10, w10, w8, lsr #1
	add	w10, w10, w11
	add	w10, w10, #1
	str	w10, [x9]
	cmp	x8, x20
	b.ne	LBB0_4
LBB0_6:
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
