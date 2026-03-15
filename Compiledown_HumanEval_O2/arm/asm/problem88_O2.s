	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 26, 2
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
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
	mov	x19, x4
	mov	x20, x3
	mov	x21, x2
	mov	x24, x1
	mov	x23, x0
	mov	w0, #800                        ; =0x320
	bl	_malloc
	mov	x22, x0
	cmp	w24, #1
	b.lt	LBB0_8
; %bb.1:
	mov	x26, #0                         ; =0x0
	mov	w25, #0                         ; =0x0
	mov	w24, w24
	b	LBB0_3
LBB0_2:                                 ;   in Loop: Header=BB0_3 Depth=1
	add	x26, x26, #1
	cmp	x26, x24
	b.eq	LBB0_9
LBB0_3:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_6 Depth 2
	ldr	w27, [x21, x26, lsl #2]
	cmp	w27, #1
	b.lt	LBB0_2
; %bb.4:                                ;   in Loop: Header=BB0_3 Depth=1
	ldr	x8, [x23, x26, lsl #3]
	sub	x28, x8, #4
	b	LBB0_6
LBB0_5:                                 ;   in Loop: Header=BB0_6 Depth=2
	sub	x27, x27, #1
	add	x8, x27, #1
	cmp	x8, #1
	b.ls	LBB0_2
LBB0_6:                                 ;   Parent Loop BB0_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	w8, [x28, x27, lsl #2]
	cmp	w8, w20
	b.ne	LBB0_5
; %bb.7:                                ;   in Loop: Header=BB0_6 Depth=2
	mov	w0, #8                          ; =0x8
	bl	_malloc
	str	x0, [x22, w25, sxtw #3]
	sub	w8, w27, #1
	stp	w26, w8, [x0]
	add	w25, w25, #1
	b	LBB0_5
LBB0_8:
	mov	w25, #0                         ; =0x0
LBB0_9:
	str	w25, [x19]
	mov	x0, x22
	ldp	x29, x30, [sp, #80]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #16]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp], #96             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
