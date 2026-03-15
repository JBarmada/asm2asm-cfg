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
	cmp	x0, #3
	b.hs	LBB0_3
LBB0_1:
	mov	w0, #0                          ; =0x0
LBB0_2:
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
LBB0_3:
	add	x8, x19, #2
	sub	x9, x0, #2
LBB0_4:                                 ; =>This Inner Loop Header: Depth=1
	ldrb	w10, [x8]
	ldurb	w11, [x8, #-1]
	cmp	w10, w11
	b.eq	LBB0_1
; %bb.5:                                ;   in Loop: Header=BB0_4 Depth=1
	ldurb	w11, [x8, #-2]
	cmp	w10, w11
	b.eq	LBB0_1
; %bb.6:                                ;   in Loop: Header=BB0_4 Depth=1
	add	x8, x8, #1
	subs	x9, x9, #1
	b.ne	LBB0_4
; %bb.7:
	mov	w0, #1                          ; =0x1
	b	LBB0_2
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
