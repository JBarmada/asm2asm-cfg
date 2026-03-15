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
	mov	x20, x1
	mov	x19, x0
	add	w8, w1, #1
	sxtw	x0, w8
	mov	w1, #4                          ; =0x4
	bl	_calloc
	cmp	w20, #1
	b.lt	LBB0_3
; %bb.1:
	mov	w8, w20
	mov	w20, #-1                        ; =0xffffffff
LBB0_2:                                 ; =>This Inner Loop Header: Depth=1
	ldrsw	x9, [x19], #4
	ldr	w10, [x0, x9, lsl #2]
	add	w10, w10, #1
	str	w10, [x0, x9, lsl #2]
	cmp	w9, w20
	csel	w11, w9, w20, gt
	cmp	w10, w9
	csel	w20, w20, w11, lt
	subs	x8, x8, #1
	b.ne	LBB0_2
	b	LBB0_4
LBB0_3:
	mov	w20, #-1                        ; =0xffffffff
LBB0_4:
	bl	_free
	mov	x0, x20
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
