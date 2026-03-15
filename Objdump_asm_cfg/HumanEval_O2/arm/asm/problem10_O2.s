	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 26, 2
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	cmp	w1, #1
	b.lt	LBB0_5
; %bb.1:
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
	ubfiz	x0, x20, #2, #32
	bl	_malloc
	cbz	x0, LBB0_4
; %bb.2:
	mov	x8, #0                          ; =0x0
	mov	w10, w20
	ldr	w9, [x19]
	lsl	x10, x10, #2
LBB0_3:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w11, [x19, x8]
	cmp	w11, w9
	csel	w9, w11, w9, gt
	str	w9, [x0, x8]
	add	x8, x8, #4
	cmp	x10, x8
	b.ne	LBB0_3
LBB0_4:
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
LBB0_5:
	mov	x0, #0                          ; =0x0
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
