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
	mov	x19, x1
	ldrb	w8, [x0]
	cbz	w8, LBB0_16
; %bb.1:
	mov	x20, x0
	mov	x22, #0                         ; =0x0
	mov	w21, #0                         ; =0x0
	mov	w26, #0                         ; =0x0
	mov	w23, #24415                     ; =0x5f5f
	mov	w24, #95                        ; =0x5f
	mov	w25, #45                        ; =0x2d
	b	LBB0_4
LBB0_2:                                 ;   in Loop: Header=BB0_4 Depth=1
	add	w26, w26, #1
LBB0_3:                                 ;   in Loop: Header=BB0_4 Depth=1
	add	x22, x22, #1
	mov	x0, x20
	bl	_strlen
	cmp	x0, x22
	b.ls	LBB0_13
LBB0_4:                                 ; =>This Inner Loop Header: Depth=1
	ldrb	w8, [x20, x22]
	cmp	w8, #32
	b.eq	LBB0_2
; %bb.5:                                ;   in Loop: Header=BB0_4 Depth=1
	cmp	w26, #2
	b.eq	LBB0_8
; %bb.6:                                ;   in Loop: Header=BB0_4 Depth=1
	cmp	w26, #1
	b.ne	LBB0_9
; %bb.7:                                ;   in Loop: Header=BB0_4 Depth=1
	strb	w24, [x19, w21, sxtw]
	b	LBB0_11
LBB0_8:                                 ;   in Loop: Header=BB0_4 Depth=1
	strh	w23, [x19, w21, sxtw]
	add	w21, w21, #2
	b	LBB0_12
LBB0_9:                                 ;   in Loop: Header=BB0_4 Depth=1
	cmp	w26, #3
	b.lt	LBB0_12
; %bb.10:                               ;   in Loop: Header=BB0_4 Depth=1
	strb	w25, [x19, w21, sxtw]
LBB0_11:                                ;   in Loop: Header=BB0_4 Depth=1
	add	w21, w21, #1
LBB0_12:                                ;   in Loop: Header=BB0_4 Depth=1
	mov	w26, #0                         ; =0x0
	ldrb	w8, [x20, x22]
	strb	w8, [x19, w21, sxtw]
	add	w21, w21, #1
	b	LBB0_3
LBB0_13:
	cmp	w26, #1
	b.eq	LBB0_17
; %bb.14:
	cmp	w26, #2
	b.ne	LBB0_18
; %bb.15:
	mov	w8, #24415                      ; =0x5f5f
	strh	w8, [x19, w21, sxtw]
	add	w21, w21, #2
	b	LBB0_21
LBB0_16:
	mov	w21, #0                         ; =0x0
	b	LBB0_21
LBB0_17:
	mov	w8, #95                         ; =0x5f
	b	LBB0_20
LBB0_18:
	cmp	w26, #3
	b.lt	LBB0_21
; %bb.19:
	mov	w8, #45                         ; =0x2d
LBB0_20:
	strb	w8, [x19, w21, sxtw]
	add	w21, w21, #1
LBB0_21:
	strb	wzr, [x19, w21, sxtw]
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp], #80             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
